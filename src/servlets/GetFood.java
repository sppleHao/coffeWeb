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

/**
 * 管理员在所有餐品中查找相应的餐品，并将信息返回到界面
 */
@WebServlet("/Admin/GetFood")
public class GetFood extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int pageSize =5;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetFood() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//设置传输格式
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			int pageNo=1;
			if (request.getParameter("pageNo")!=null) {
				pageNo= Integer.parseInt(request.getParameter("pageNo"));
			}
			
			//从数据库中搜索的菜品表的所有菜品
			List<Food> allFoodList;
			FoodDao fd = new FoodDao();
			allFoodList = fd.selectFood("*");
			
			if (allFoodList.isEmpty()) {
				//TODO 如果菜品表没有元素
				out.println("没有任何用户!");
				return;
			}
			
			//查找返回的餐品元素
			List<Food> selectFoodList = new LinkedList<Food>();
			
			//得到关键字
			String foodParam = request.getParameter("foodParam");
			
			//关键字为空，查找元素为整个餐品，关键字不为空，查找关键字包含的元素
			if (foodParam.isEmpty()) {
				selectFoodList = allFoodList;
			}
			else {
				for (Food food : allFoodList) {
					if (food.getFoodNo().equals(foodParam)||
							food.getFoodName().equals(foodParam)||
							food.getFoodType().equals(foodParam)) {
						selectFoodList.add(food);
					}
				}
			}
			
			
			
			//查找元素设置会话属性
			//HttpSession session = request.getSession();
			//session.setAttribute("selectFoodList", selectFoodList);
			
			
			//输出
			if (!selectFoodList.isEmpty()) {
				Integer allPages = (selectFoodList.size()-1)/pageSize + 1;
				out.println("共"+selectFoodList.size()+"条记录");
				out.println("共"+allPages+"页");
				if (pageNo>1) {
					out.println("<a href='/coffeWeb/Admin/FoodOP.jsp?pageNo=1'>首页</a>");
					out.println("<a href='/coffeWeb/Admin/FoodOP.jsp?pageNo="+(pageNo-1)+"'>上一页</a>");
				}
				out.println("这是第"+pageNo+"页");
				if (pageNo<allPages) {
					out.println("<a href='/coffeWeb/Admin/FoodOP.jsp?pageNo="+(pageNo+1)+"'>下一页</a>");
					out.println("<a href='/coffeWeb/Admin/FoodOP.jsp?pageNo="+allPages+"'>尾页</a>");
				}			
				out.println("<ul>");
				out.println("<li>");
				out.println("<div class='items'>");
				out.println("<div class='foodNo'>餐品号</div>");
				out.println("<div class='foodName'>餐品名</div>");
				out.println("<div class='foodPrice'>餐品单价</div>");
				out.println("<div class='foodMount'>餐品库存</div>");
				out.println("<div class='foodType'>餐品类型</div>");
				out.println("</div>");
				out.println("</li>");
				for (int i=(pageNo-1)*pageSize;i<((pageNo*pageSize) < (selectFoodList.size())?(pageNo*pageSize):(selectFoodList.size()));i++) {
					Food food = selectFoodList.get(i);
					out.println("<li>");
					out.println("<div class='items'>");
					out.println("<div class='unchecked'></div>");
					out.println("<input type='radio' name='select' id='select'>");
					out.println("<div class='foodNo'>"+food.getFoodNo()+"</div>");
					out.println("<div class='foodName'>"+food.getFoodName()+"</div>");
					out.println("<div class='foodPrice'>"+food.getFoodPrice()+"</div>");
					out.println("<div class='foodMount'>"+food.getFoodMount()+"</div>");
					out.println("<div class='foodType'>"+food.getFoodType()+"</div>");
					out.println("</div>");
					out.println("</li>");
				}
				out.println("</ul>");
			}
			else {
				out.println("查找不到该食物!");
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
