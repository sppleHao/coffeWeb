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
 * 检查用户是否注册正确
 */
@WebServlet("/User/CheckUserSignIn")
public class CheckUserSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckUserSignIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得参数
		String userNo =request.getParameter("userNo");
		String userName = request.getParameter("userName");
		String password =request.getParameter("password");
		String tel =request.getParameter("tel");
		String eamil =request.getParameter("email");
		try {
			UserDao ud = new UserDao();
			
			List<R_User> users = ud.selectUser(userNo);
			if (users.isEmpty()) {
				//如果不存在，注册成功，将user加入数据库
				R_User user = new R_User();
				user.setUserNo(userNo);
				user.setUserName(userName);
				user.setPassword(password);
				user.setTel(tel);
				user.setEmail(eamil);
				ud.add(user);
				
				HttpSession session = request.getSession();
				session.setAttribute("userConfig",user);
				session.setAttribute("userNo", user.getUserNo());
//				session.setAttribute("userName", userName);
//				session.setAttribute("password", password);
//				session.setAttribute("tel", tel);
//				session.setAttribute("email", eamil);
				
				request.getRequestDispatcher("userConfig.jsp").forward(request, response);
			}
			else {
				//用户存在，注册失败，返回
				request.getRequestDispatcher("userSignIn.jsp").forward(request, response);
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
