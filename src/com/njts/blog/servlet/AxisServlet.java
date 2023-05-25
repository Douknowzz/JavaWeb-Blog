package com.njts.blog.servlet;

import com.njts.blog.service.ArticleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AxisServlet")
public class AxisServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArticleService articleService = new ArticleService();

        try {
            req.setAttribute("axis_list", articleService.getAxisList());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // ×ª·¢
        req.getRequestDispatcher("/page/axis.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
