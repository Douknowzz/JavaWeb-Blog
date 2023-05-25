package com.njts.blog.servlet;

import com.njts.blog.bean.Comment;
import com.njts.blog.service.CommentService;
import com.njts.blog.utils.ArticleUtils;
import com.njts.blog.utils.CommentUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/NewCommentServlet")
public class NewCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 又乱码，，，，，，一个修改文章的时候乱码，一个评论的时候乱码，，，，，，，
        // 可以多次评论文章，搞个cookie限制有点不符合我的理解
            // 获取对象
            Comment comment = CommentUtils.tidyToCommentBean(req);
            CommentService commentService = new CommentService();
            try {
                commentService.addComment(comment);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        req.getRequestDispatcher("/ArticleServlet").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
