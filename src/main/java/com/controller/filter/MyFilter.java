package com.controller.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.model.*;

/**
 * Servlet Filter implementation class MyFilter
 */
public class MyFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public MyFilter() {
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
		response.setContentType("text/html;charset=UTF-8");
	    HttpServletRequest httpReq = (HttpServletRequest) request;
	    HttpServletResponse httpRes = (HttpServletResponse) response;
	    HttpSession session = httpReq.getSession();
	    UserModel userSession = (UserModel) session.getAttribute("user");
	    String url = httpReq.getRequestURI();
        if (url.startsWith("/TrangTinTuc/admin-")) {
            if (userSession != null) {
                if (userSession.getRoleid() == 1) {
                    chain.doFilter(request, response);
                } else if (userSession.getRoleid() == 2) {
                	httpRes.sendRedirect(httpReq.getContextPath()+"/login?action=login&message=not_permission&alert=danger");
                }
            } else {
            	httpRes.sendRedirect(httpReq.getContextPath()+"/login?action=login&message=not_login&alert=danger");
            }
        } else {
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
