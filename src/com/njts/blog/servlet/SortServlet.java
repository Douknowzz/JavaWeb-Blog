package com.njts.blog.servlet;

import com.njts.blog.service.ArticleService;
import com.njts.blog.utils.ArticleUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/SortServlet")
public class SortServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArticleService articleService = new ArticleService();
        // 判断获取的是所有分类 还是一个分类的文章
        String get = req.getParameter("get");

        try {
            req.setAttribute("sort_article_map", articleService.getSortAndArticle(get));

            req.getRequestDispatcher("/page/sort.jsp").forward(req,resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
