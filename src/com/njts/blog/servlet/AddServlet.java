package com.njts.blog.servlet;

import com.njts.blog.service.ArticleService;
import com.njts.blog.service.TagService;
import com.njts.blog.utils.ArticleUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArticleService articleService = new ArticleService();
        TagService tagService = new TagService();

        try {
        // 初始化时间
        req.setAttribute("time", ArticleUtils.timeOfCreate());
        // 获取分类
        req.setAttribute("sort_count", articleService.getSortAndCount());
        // 获取标签
        req.setAttribute("all_tag", tagService.getAllTag());
        // 转发
        req.getRequestDispatcher("/admin/add.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
