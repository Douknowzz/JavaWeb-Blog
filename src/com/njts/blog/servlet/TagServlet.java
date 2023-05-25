package com.njts.blog.servlet;

import com.njts.blog.service.TagService;
import com.njts.blog.utils.ArticleUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/TagsServlet")
public class TagServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TagService tagService = new TagService();

        String get = req.getParameter("get");
        try {

            req.setAttribute("id_tag_map", tagService.getTagAndArticle(get));

            req.getRequestDispatcher("/page/tags.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
