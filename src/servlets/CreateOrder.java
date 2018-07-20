package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Bill;
import beans.Cart;
import dao.BillDao;
import dao.OrderDao;
import net.sf.json.JSONArray;

/**
 * 由购物车餐品生成订单
 */
@WebServlet("/Cart/CreateOrder")
public class CreateOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		try {
			
			//将cart传递过来的JSON string转换成list对象
			String stringOfList = request.getParameter("list");
			JSONArray array = JSONArray.fromObject(stringOfList);
			
			//总数与总价
			Integer sumPrice = Integer.parseInt(request.getParameter("sumPrice"));
			Integer sumNum = Integer.parseInt(request.getParameter("sumNum"));
			
			//购物车不空
			if (array!=null&&array.size()>0) {
				@SuppressWarnings("unchecked")
				List<Cart> cartList = (List<Cart>) JSONArray.toCollection(array, Cart.class);
				//通过list对象建立订单
				OrderDao od = new OrderDao();
				String orderNo = od.add(cartList, new Date());
				
				//传回参数订单
				PrintWriter out = response.getWriter();
				out.print(orderNo);
				
				//将订单的总数和总价加入bill表
				Bill bill = new Bill();
				bill.setCount(sumNum);
				bill.setTotalPrice(sumPrice);
				bill.setOrderNo(orderNo);
				
				BillDao bd = new BillDao();
				bd.insert(bill);
			}
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
