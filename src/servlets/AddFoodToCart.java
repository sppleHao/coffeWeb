package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Cart;
import dao.CartDao;
import dao.FoodDao;

/**
 * 将菜单中的餐品加入购物车
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			
			
			//得到菜单传递的参数
			HttpSession session = request.getSession();
			String userNo =(String) session.getAttribute("userNo"); //用户名
			String addFoodNo =request.getParameter("addFoodNo"); //餐品号
			String addFoodNum =request.getParameter("addFoodNum"); //餐品数量
			
			if (userNo==null) {
				out.print("请先登陆");
				return;
			}
			
			CartDao cd = new CartDao();
			FoodDao fd = new FoodDao();
			
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
			
			int allMount = fd.selectFood(addFoodNo).get(0).getFoodMount();
			
			//检查是否超过库存
			if(Integer.parseInt(addFoodNum)+num>allMount) {
				//如果购物车总数量添加超过库存
				if (isHave) {
					out.print("添加数量超过库存(购物车内已有"+num+"件)");
				}
				else {
					out.print("添加数量超过库存");
				}
				return;
			}
			
			
			//创建新纪录
			Cart cart = new Cart();
			cart.setUserNo(userNo);
			cart.setFoodNo(addFoodNo);
			cart.setFoodMount(Integer.parseInt(addFoodNum)+num);
					
			//将新纪录添加到购物车
			if (isHave) {
				cd.update(cart);
			}
			else {
				cd.add(cart);
			}
			
			
			out.print("已加入购物车");
			
			
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
