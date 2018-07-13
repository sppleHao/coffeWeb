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
 * 进入购物车界面的过滤器
 */
@WebFilter("/Cart/cart.jsp")
public class BeforeToCart implements Filter {

    /**
     * Default constructor. 
     */
    public BeforeToCart() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest requ = (HttpServletRequest) request;
		HttpSession session =requ.getSession();
		//检查是否登陆
		if (session.getAttribute("userNo")==null) {
			requ.getRequestDispatcher("/User/userLogin.jsp").forward(request, response);;
		}
		else {
			//获得购物车内容
			requ.getRequestDispatcher("/Cart/GetCartItems").forward(request, response);
		}		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
