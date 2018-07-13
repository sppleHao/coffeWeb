package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import beans.R_User;
import dao.UserDao;

/**
 * Servlet implementation class UserOP
 */
@WebServlet("/Admin/AdminUserOP")
public class AdminUserOP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUserOP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opName = request.getParameter("opName");
		String userNo = request.getParameter("userNo");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		try {
			R_User user = new R_User();
			user.setUserNo(userNo);
			user.setUserName(userName);
			user.setEmail(email);
			user.setTel(tel);
			user.setPassword(password);
			UserDao userDao = new UserDao();
			if(opName.equals("delete")) {
				userDao.delete(user);
			}
			if (opName.equals("update")) {
				userDao.update(user);
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
