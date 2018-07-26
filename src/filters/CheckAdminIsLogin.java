package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class CheckAdminIsLogin
 */
@WebFilter({"/Admin/adminConfig.jsp","/Admin/FoodOP.jsp","/Admin/UserOP.jsp","/Admin/stcs.jsp"})
public class CheckAdminIsLogin implements Filter {

    /**
     * Default constructor. 
     */
    public CheckAdminIsLogin() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest requ = (HttpServletRequest) request;
		//HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = requ.getSession();
		if (session.getAttribute("AdminConfig")==null) {
			request.getRequestDispatcher("/Admin/adminLogin.jsp").forward(request, response);
		}
		else {
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
