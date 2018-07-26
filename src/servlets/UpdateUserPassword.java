package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.R_User;
import dao.UserDao;

/**
 * 用户修改用户的密码
 */
@WebServlet("/User/UpdateUserPassword")
public class UpdateUserPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserPassword() {
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
			//获得新密码
			HttpSession session = request.getSession();
			String userNo = (String) session.getAttribute("userNo");
			String oldPass = request.getParameter("old_pass");
			String newPass = request.getParameter("new_pass");
			
			UserDao ud = new UserDao();
			R_User user = ud.selectUser(userNo).get(0);
			if (user.getPassword().equals(oldPass)) {
				//原密码正确,修改
				user.setPassword(newPass);
				ud.update(user);
				out.print("update_success");
			}
			else {
				out.print("old_pass_error");
			}
			
		} catch (Exception e) {
			out.print(e.getMessage());
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
