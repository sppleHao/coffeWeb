package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FoodDao;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class GetStsc
 */
@WebServlet("/Admin/GetStsc")
public class GetStsc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetStsc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FoodDao fd = new FoodDao();
		try {
			Map<String, Integer> foodNoAndCountMap = fd.selectFood();
			Set<String> foodNos = foodNoAndCountMap.keySet();
			List<String> foodNames = new LinkedList<>();
			List<Integer> foodNums = new LinkedList<>();
			for (String foodNo : foodNos) {
				foodNames.add(fd.selectFood(foodNo).get(0).getFoodName());
				foodNums.add(foodNoAndCountMap.get(foodNo));
			}
			JSONObject object = new JSONObject();
			object.put("foodNames",foodNames);
			object.put("foodNums", foodNums);
			
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			//System.out.println(object.toString());
			out.print(object.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
