package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Cart;
import dao.CartDao;
import dao.OrderDao;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class UpdateCartItems
 */
@WebServlet("/Cart/UpdateCartItems")
public class UpdateCartItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartItems() {
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
			
			
			//购物车不空
			if (array!=null&&array.size()>0) {
				@SuppressWarnings("unchecked")
				List<Cart> cartList = (List<Cart>) JSONArray.toCollection(array, Cart.class);
				
				//更新
				CartDao cd = new CartDao();
				for (Cart cart : cartList) {
					cd.update(cart);
				}
				
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
