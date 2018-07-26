package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Food;
import dao.FoodDao;
import util.GetSrc;

/**
 * 菜单界面得到所有菜品并显示给用户
 */
@WebServlet("/Menu/GetMenuItems")
public class GetMenuItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetMenuItems() {
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
			FoodDao fd = new FoodDao();
			
			
			//餐品列表
			List<Food> allFoodList = fd.selectFood("*");
				//列表不为空则查找所有有关的菜品
				if (!allFoodList.isEmpty()) {
					List<Food> selectFoodList = new LinkedList<Food>();
					//查找关键字
					String selectParam = request.getParameter("selectParam");
					//关键字不为空
					if (selectParam!=null&&!selectParam.isEmpty()) {
						for (Food food : allFoodList) {
							if (food.getFoodNo().equals(selectParam)||
									food.getFoodName().toLowerCase().contains(selectParam.toLowerCase())||
									food.getFoodType().equals(selectParam)
									) {
								selectFoodList.add(food);
							}
						}
					}
					else {//关键字为空，所有菜品
						selectFoodList = allFoodList;
					}				
					
					//查找结束
					if (!selectFoodList.isEmpty()) {//不为空，设置属性
//						session.setAttribute("selectFood", selectFoodList);
//						request.getRequestDispatcher("menu.jsp").forward(request, response);
						for (Food food : selectFoodList) {
							out.println("<div class='food-item' id='"+food.getFoodNo()+"'>");
							if (food.getFoodMount()>0) {
								out.println("<div class='food-item-img'>");
							}
							else {
								out.println("<div class='food-item-img no-mount'>");
							}
//							out.println("<img class='food-item-img-info' alt='' src='/coffeWeb/Img/"
//							+food.getFoodType()+"/"+food.getFoodName()+".png'>");
							out.println("<img class='food-item-img-info' alt='' src='/savePath/"+GetSrc.getFoodSrc(food.getFoodType(), food.getFoodNo())+"?temp="+Math.random()+"'>");
							out.print("</div>");
							out.print("<div class='food-item-info'>");
							out.println("<div class='food-item-info-foodName'>"+food.getFoodName()+"</div>");
							out.println("<div class='food-item-info-foodPrice'>￥"+food.getFoodPrice()+"</div>");
							out.println("剩余数量:<div class='food-item-info-foodMount'>"+food.getFoodMount()+"</div>");
							out.print("</div>");
							out.print("</div>");
							
						}
					}
					else {//为空，显示查找不到菜品
						out.print("<p>查找不到该菜品</p>");
//						session.setAttribute("selectFood", selectFoodList);
//						request.getRequestDispatcher("menu.jsp").forward(request, response);
					}
				}
				else {//列表没有菜品
					//TODO no food in database
				}
			
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
