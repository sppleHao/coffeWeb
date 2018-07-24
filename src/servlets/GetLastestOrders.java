package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.SortedBag;

import beans.Bill;
import beans.R_Order;
import dao.BillDao;
import dao.OrderDao;

/**
 * Servlet implementation class GetLastestOrders
 */
@WebServlet("/User/GetLastestOrders")
public class GetLastestOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int List = 0;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetLastestOrders() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//设置传输格式
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			int num=3;
			
			//从session中获得用户名参数
			HttpSession session = request.getSession();
			String userNo =(String) session.getAttribute("userNo");
			
			//实例化订单操作类
			OrderDao od = new OrderDao();
			//得到一个用户的所有订单记录(多个订单）
			List<R_Order> orders = od.selectOrderByUserName(userNo);
			
			
			Map<String, List<R_Order>> groupByOrderNoSorteByDate = 
					orders.stream()
					.collect(Collectors.groupingBy(R_Order::getOrderNo,TreeMap::new,Collectors.toList()));
			
			BillDao bd = new BillDao();
			
			
			Set<String> orderNoSet = groupByOrderNoSorteByDate.keySet();
			
			List<String> orderNos = new ArrayList<>();
			
			for (String orderNo : orderNoSet) {
				orderNos.add(orderNo);
			}
			
			Collections.reverse(orderNos);
			
			if (!orders.isEmpty()) {
				out.println("<table>");
				out.println("<tbody>");
				int loopTime = num;
				for(String orderNo :orderNos) {
					out.println("<tr>");
					R_Order orderItemFirst = groupByOrderNoSorteByDate.get(orderNo).get(0);
					String orderTime =orderItemFirst.getOrderTime().toString();
					Bill bill = bd.select(orderNo);
					out.println("<td class='orderNo'>"+orderNo+"</td>");
					out.println("<td class='orderPrice'>"+bill.getTotalPrice()+"</td>");
					out.println("<td class='orderTime'>"+orderTime+"</td>");
					out.println("</tr>");
					if (--loopTime==0) {
						break;
					}
				}
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
