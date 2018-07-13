package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.R_User;
import dao.UserDao;

/**
 * 用户修改用户的信息
 */
@WebServlet("/User/UpdateUserConfig")
public class UpdateUserConfig extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserConfig() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//获得新参数
			HttpSession session = request.getSession();
			String userNo = (String) session.getAttribute("userNo");
			String userName = request.getParameter("userName");
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
			UserDao ud = new UserDao();
			R_User userConfig = ud.selectUser(userNo).get(0);
			//修改
			userConfig.setUserName(userName);
			userConfig.setTel(tel);
			userConfig.setEmail(email);
			ud.update(userConfig);
		} catch (Exception e) {
			//TODO:元素重复异常
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
