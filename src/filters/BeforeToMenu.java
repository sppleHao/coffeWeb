package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * 更新菜单物品（再查找一次)
 */
@WebFilter("/Menu/menu.jsp")
public class BeforeToMenu implements Filter {

    /**
     * Default constructor. 
     */
    public BeforeToMenu() {
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
//		HttpServletRequest requ = (HttpServletRequest) request;
//		//HttpServletResponse resp = (HttpServletResponse) response;
//		HttpSession session = requ.getSession();
//		if (session.getAttribute("selectFood")==null) {
//			requ.getRequestDispatcher("/Menu/GetMenuItems").forward(request, response);
//		}
//		else {
//			chain.doFilter(request, response);
//		}
		
		request.getRequestDispatcher("/Menu/GetMenuItems").forward(request, response);
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
