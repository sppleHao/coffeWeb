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

import beans.Cart;
import beans.Food;
import dao.CartDao;
import dao.FoodDao;

/**
 * 获得购物车里的内容，并将参数传给界面
 */
@WebServlet("/Cart/GetCartItems")
public class GetCartItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCartItems() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			HttpSession session = request.getSession();
			String userNo = (String) session.getAttribute("userNo");
			CartDao cd = new CartDao();
			
			//从数据库中搜索的菜品表的所有菜品
			List<Food> allFoodList;
			FoodDao fd = new FoodDao();
			allFoodList = fd.selectFood("*");
			session.setAttribute("allFoodList", allFoodList);
			
			//得到食物的Map
			Map<String, Food> foodMap = allFoodList.stream().
													collect(Collectors.toMap(Food::getFoodNo,Function.identity()));
			session.setAttribute("foodMap", foodMap);
			
			//从数据库中获得购物车内容
			List<Cart> cartItems = cd.selectCartByUserNo(userNo);
			session.setAttribute("cartItems", cartItems);
			
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
