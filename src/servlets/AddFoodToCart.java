package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Cart;
import dao.CartDao;

/**
 * 菜品弹出子窗口加入购物车
 */
@WebServlet("/Menu/AddFoodToCart")
public class AddFoodToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFoodToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//得到菜单传递的参数
			HttpSession session = request.getSession();
			String userNo =(String) session.getAttribute("userNo"); //用户名
			String addFoodNum =request.getParameter("addFoodNum"); //餐品数量
			String addFoodNo =(String) session.getAttribute("addFoodNo"); //餐品号
			
			CartDao cd = new CartDao();
			
			//得到该用户所有的购物车物品
			List<Cart> cartItems = cd.selectCartByUserNo(userNo);
			
			boolean isHave = false;//是否已有这件餐品
			int num =0;	//如果有的数量
			
			for (Cart cart : cartItems) {
				if (cart.getFoodNo().equals(addFoodNo)) {
					isHave = true;
					num = cart.getFoodMount();
					break;
				}
			}
			
			Cart cart = new Cart();		
			cart.setUserNo(userNo);
			cart.setFoodNo(addFoodNo);
			cart.setFoodMount(Integer.parseInt(addFoodNum)+num);		
			
			//有则更新，无则加入表
			if (isHave) {
				cd.update(cart);
			}
			else {
				cd.add(cart);
			}
			
			
			//request.getRequestDispatcher("menu.jsp").forward(request, response);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//response.getWriter().append("Served at: "+addFoodNo+" "+addFoodNum+" "+userNo).append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
