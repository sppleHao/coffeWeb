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
 * 管理员操作
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
		//操作名
		String opName = request.getParameter("opName");
		PrintWriter out = response.getWriter();
		R_User user = new R_User();
		UserDao ud = new UserDao();
		//用户信息
		String userNo = request.getParameter("userNo");
		String userName = request.getParameter("userName");
		
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		
		try {
			
			UserDao userDao = new UserDao();
			if(opName.equals("delete")) {
				//删除
				user.setUserNo(userNo);
				userDao.delete(user);
			}
			if (opName.equals("update")) {
				//更新除密码外的用户操作
				String password = ud.selectUser(userNo).get(0).getPassword();
				user.setUserNo(userNo);
				user.setUserName(userName);
				user.setEmail(email);
				user.setPassword(password);
				user.setTel(tel);
				userDao.update(user);
			}
			if (opName.equals("insert")) {
				//插入一个用户，初始密码为6位
				user.setUserNo(userNo);
				user.setUserName(userName);
				user.setEmail(email);
				user.setTel(tel);
				user.setPassword("123456");
				userDao.add(user);
			}
			
			out.print("ok");
		
		} catch (Exception e) {
			e.printStackTrace();
			out.println(e.getMessage());
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
