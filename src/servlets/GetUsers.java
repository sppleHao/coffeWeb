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

import beans.R_User;
import dao.UserDao;
import net.sf.json.JSONArray;

/**
 * 管理员在所有用户中查找相应的用户，并将信息返回到界面
 */
@WebServlet("/Admin/GetUsers")
public class GetUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int pageSize =5;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUsers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			int pageNo=1;
			if (request.getParameter("pageNo")!=null) {
				pageNo= Integer.parseInt(request.getParameter("pageNo"));
			}
			
			List<R_User> allUsers;
			UserDao ud = new UserDao();
			allUsers = ud.selectUser("*");
			
			if (allUsers.isEmpty()) {
				out.println("没有任何用户!");
				return;
			}
			
			
			//查找的用户
			List<R_User> selectUers = new LinkedList<R_User>();
			
			//关键字
			String userParam = request.getParameter("userParam");
			
			//关键字为空，查找元素为整个用户，关键字不为空，查找关键字包含的元素
			if (userParam.isEmpty()) {
				selectUers = allUsers;
			}
			else {
				for (R_User user : allUsers) {
					if (user.getUserNo().equals(userParam)||
							user.getUserName().equals(userParam)||
							user.getEmail().equals(userParam)||
							user.getTel().equals(userParam)
							) {
						selectUers.add(user);
					}
				}
			}
			
			
			if(!selectUers.isEmpty()) {
				//所有页面
				Integer allPages = (selectUers.size()-1)/pageSize + 1;
//				JSONArray jsonArray = JSONArray.fromObject(selectUers);
//				out.println(jsonArray);
				
				out.println("<table>");
				out.println("<tbody>");
				out.println("<tr>");
				out.print("<td/>");
				out.println("<td class='userNo'>用户名</td>");
				out.println("<td class='userName'>昵称</td>");
//				out.println("<td class='password'>密码</td>");
				out.println("<td class='tel'>电话</td>");
				out.println("<td class='email'>邮箱</td>");
				out.println("</tr>");

				for (int i=(pageNo-1)*pageSize;i<((pageNo*pageSize) < (selectUers.size())?(pageNo*pageSize):(selectUers.size()));i++) {
					R_User user = selectUers.get(i);
					out.println("<tr class='info'>");
					out.println("<td class='unchecked'></div>");
					out.println("<input type='radio' name='select' id='select'>");
					out.println("<td class='userNo'>"+user.getUserNo()+"</td>");
					out.println("<td class='userName'>"+user.getUserName()+"</td>");
//					out.println("<td class='password'>"+user.getPassword()+"</td>");
					out.println("<td class='tel'>"+user.getTel()+"</td>");
					out.println("<td class='email'>"+user.getEmail()+"</td>");
					out.println("</tr>");
				}
				out.println("</tbody>");
				out.println("</table>");
				
				out.println("共"+selectUers.size()+"条记录");
				out.println("共"+allPages+"页");
				if (pageNo>1) {
					out.println("<a href='/coffeWeb/Admin/UserOP.jsp?pageNo=1'>首页</a>");
					out.println("<a href='/coffeWeb/Admin/UserOP.jsp?pageNo="+(pageNo-1)+"'>上一页</a>");
				}
				out.println("这是第"+pageNo+"页");
				if (pageNo<allPages) {
					out.println("<a href='/coffeWeb/Admin/UserOP.jsp?pageNo="+(pageNo+1)+"'>下一页</a>");
					out.println("<a href='/coffeWeb/Admin/UserOP.jsp?pageNo="+allPages+"'>尾页</a>");
				}
			}
			else {
				out.println("查找不到该用户!");
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
