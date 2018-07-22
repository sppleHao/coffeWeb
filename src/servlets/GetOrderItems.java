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

import beans.Food;
import beans.R_Order;
import dao.FoodDao;
import dao.OrderDao;

/**
 * 获得订单的详细信息
 */
@WebServlet("/Order/GetOrderItems")
public class GetOrderItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetOrderItems() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//得到订单号
			HttpSession session = request.getSession();
			String orderNo =request.getParameter("orderNo");
			
			//查询订单的所有餐品
			OrderDao od = new OrderDao();
			List<R_Order> orderItems = od.selectOrder(orderNo);
			session.setAttribute("orderItems", orderItems);
			
			List<Food> allFoodList;
			FoodDao fd = new FoodDao();
			allFoodList = fd.selectFood("*");
			session.setAttribute("allFoodList", allFoodList);
			
			Map<String, Food> foodMap = allFoodList.stream().
													collect(Collectors.toMap(Food::getFoodNo,Function.identity()));
			session.setAttribute("foodMap", foodMap);
			
			request.getRequestDispatcher("/Order/order.jsp?orderNo="+orderNo+
					"&orderTime="+orderItems.get(0).getOrderTime().toString())
			.forward(request, response);
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
