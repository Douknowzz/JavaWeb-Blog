package com.njts.blog.filter;

import com.njts.blog.dao.VisitorDao;
import com.njts.blog.utils.ArticleUtils;
import org.apache.commons.lang.time.DateUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

//仅统计首页jsp的访问量
@WebFilter(filterName = "VisitFilter", urlPatterns = { "/main.jsp" })
public class VisitFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest rq = (HttpServletRequest) request;
		HttpServletResponse rp = (HttpServletResponse) response;

		if (rq.getRequestURL().indexOf("index.jsp") != -1) {

			synchronized (this) {
				// System.out.println(rq.getRequestURI());
				Cookie[] cookies = rq.getCookies();
				boolean visited = false;
				if (cookies != null) {
					for (Cookie cookie : cookies) {
						if (cookie.getName().equals("myblog_visitor")) {
							visited = true;
							break;
						}
					}
				}
				if (!visited) {

					Thread t = new Thread(new Runnable() {
						public void run() {
							// 向数据库写入信息
							try {
								VisitorDao.visit(rq);
							} catch (SQLException e) {
								e.printStackTrace();
							}

							// 发送新的cookie
							Cookie c = new Cookie("myblog_visitor", ArticleUtils.timeOfCreate());
							// cookie生命周60分钟
							c.setMaxAge(60 * 60);
							c.setPath("/Blog");
							rp.addCookie(c);
						}
					});
					t.start();
				}
			}
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
