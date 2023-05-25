package com.njts.blog.filter;

import com.njts.blog.service.ArticleService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet Filter implementation class ArticleFilter
 */
@WebFilter(filterName = "ArticleFilter", urlPatterns = { "/article.jsp" })
public class ArticleFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public ArticleFilter() {
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest rq = (HttpServletRequest) request;
		HttpServletResponse rp = (HttpServletResponse) response;
		//
		// String uri=rq.getRequestURI();
		// if(uri.indexOf("ArticleServlet") !=-1){
		// System.out.println(uri);
		// }
		// 点开文章 自动 增加 浏览次数
		String id = rq.getParameter("id");
		ArticleService articleService = new ArticleService();
		try {
			articleService.addVisit(Integer.valueOf(id));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
