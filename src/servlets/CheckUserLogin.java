package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.R_User;
import dao.UserDao;

/**
 * Servlet implementation class CheckUserLogin
 */
@WebServlet("/User/CheckUserLogin")
public class CheckUserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckUserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//从登陆界面得到用户名和密码
			String userNo =request.getParameter("userNo");
			String password =request.getParameter("password");
				
			R_User user = new R_User();
			user.setUserNo(userNo);
			user.setPassword(password);
			//通过用户名密码查找数据库
			try {
				UserDao ud = new UserDao();
				List<R_User> users;
				users = ud.selectUser(userNo);
				if (users.isEmpty()) {
					//list为空，用户名无效
					request.getSession().setAttribute("uMsg","用户名无效");
					request.getRequestDispatcher("userLogin.jsp").forward(request, response);
				}
				else if (!users.get(0).getPassword().equals(user.getPassword())) {
					//密码错误
					request.getSession().setAttribute("uMsg","密码错误");
					request.getRequestDispatcher("userLogin.jsp").forward(request, response);
				}
				else {
					//正确
					user = users.get(0);
						
					//设置属性
					HttpSession session = request.getSession();
					session.setAttribute("userConfig",user);
					session.setAttribute("userNo", user.getUserNo());
					//转到用户信息界面
					request.getRequestDispatcher("userConfig.jsp").forward(request, response);;
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
