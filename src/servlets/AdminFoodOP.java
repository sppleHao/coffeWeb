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
 * 管理员对菜单的操作(删除、修改)
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
		PrintWriter out = response.getWriter();
		try {
			
			//操作名
			String opName = request.getParameter("opName");
			
			//操作的参数
			String foodNo = request.getParameter("foodNo");
			String foodName = request.getParameter("foodName");
			int foodPrice = Integer.parseInt(request.getParameter("foodPrice"));
			String foodType = request.getParameter("foodType");
			int foodMount = Integer.parseInt(request.getParameter("foodMount"));
			
			//设置POJO
			Food food = new Food();
			food.setFoodNo(foodNo);
			food.setFoodName(foodName);
			food.setFoodPrice(foodPrice);
			food.setFoodType(foodType);
			food.setFoodMount(foodMount);
			
			//操作
			FoodDao fd = new FoodDao();
			if (opName.equals("delete")) {
				//删除:删除食物
				fd.delete(food);
			}
			if (opName.equals("update")) {
				//修改：修改食物
				fd.update(food);
			}		
			out.print("操作成功！");
		} catch (Exception e) {
			e.printStackTrace();
			out.print(e.getMessage());
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
