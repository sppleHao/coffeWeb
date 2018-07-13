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
 * Servlet Filter implementation class BeforeToHO
 */
@WebFilter("/Order/historyOrder.jsp")
public class BeforeToHO implements Filter {

    /**
     * Default constructor. 
     */
    public BeforeToHO() {
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
		HttpSession session = requ.getSession();
		if (session.getAttribute("userNo")==null) {
			request.getRequestDispatcher("/User/userLogin.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/Order/GetHistoryOrder").forward(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
