package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Food;
import dao.FoodDao;

/**
 * Servlet implementation class FoodOP
 */
@WebServlet("/Admin/AdminFoodOP")
public class AdminFoodOP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFoodOP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String opName = request.getParameter("opName");
			String foodNo = request.getParameter("foodNo");
			String foodName = request.getParameter("foodName");
			int foodPrice = Integer.parseInt(request.getParameter("foodPrice"));
			String foodType = request.getParameter("foodType");
			int foodMount = Integer.parseInt(request.getParameter("foodMount"));
			Food food = new Food();
			food.setFoodNo(foodNo);
			food.setFoodName(foodName);
			food.setFoodPrice(foodPrice);
			food.setFoodType(foodType);
			food.setFoodMount(foodMount);
			FoodDao fd = new FoodDao();
			if (opName.equals("delete")) {
				fd.delete(food);
			}
			if (opName.equals("update")) {
				fd.update(food);
			}
			PrintWriter out = response.getWriter();
			out.print("ok");
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
