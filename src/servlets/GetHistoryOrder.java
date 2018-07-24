package servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.R_Order;
import dao.OrderDao;

/**
 * 得到该用户的所有历史订单
 */
@WebServlet("/Order/GetHistoryOrder")
public class GetHistoryOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetHistoryOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			//从session中获得用户名参数
			HttpSession session = request.getSession();
			String userNo =(String) session.getAttribute("userNo");
			
			//实例化订单操作类
			OrderDao od = new OrderDao();
			//得到一个用户的所有订单记录(多个订单）
			List<R_Order> orders = od.selectOrderByUserName(userNo);
			
			//根据记录得到一个由订单号标识的一个订单所有记录形成一个MAP
			//MAP中的链表为一个订单的所有记录
			Map<String, List<R_Order>> groupByOrderNo = 
					orders.stream().collect(Collectors.groupingBy(R_Order::getOrderNo));
			
			//设置map属性
			session.setAttribute("groupByOrderNoMap", groupByOrderNo);
			
			//转到历史订单界面
			request.getRequestDispatcher("historyOrder.jsp").forward(request, response);
		} catch (Exception e) {
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
