package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Admin;
import dao.AdminDao;

/**
 * 检查管理员登陆是否正确，正确则转到管理员操作界面
 */
@WebServlet("/Admin/CheckAdminLogin")
public class CheckAdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckAdminLogin() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Admin admin = new Admin();
		admin.setAdminNo(request.getParameter("adminNo"));
		admin.setPassword(request.getParameter("adminPassword"));
		
		try {
			//管理员操作工具
			AdminDao ad = new AdminDao();
			//得到该管理员名的list
			List<Admin> admins = ad.selectAdmin(admin.getAdminNo());
			if (admins.isEmpty()) {
				//list为空，用户名无效,回到注册界面
				request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
			}
			else if (!admins.get(0).getPassword().equals(admin.getPassword())) {
				//密码错误 TODO
				request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
			}
			else {
				admin = admins.get(0);
				//正确登陆，设置属性，转到用户信息界面
				HttpSession session = request.getSession();
				session.setAttribute("AdminConfig", admin);
				request.getRequestDispatcher("adminConfig.jsp").forward(request, response);
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
