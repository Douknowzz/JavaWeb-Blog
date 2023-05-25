package com.njts.blog.servlet;

import com.njts.blog.bean.Article;
import com.njts.blog.dao.ArticleDao;
import com.njts.blog.dao.TagDao;
import com.njts.blog.service.ArticleService;
import com.njts.blog.service.CommentService;
import com.njts.blog.service.TagService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/ArticleServlet")
public class ArticleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArticleService articleService = new ArticleService();
        TagService tagService = new TagService();
        CommentService commentService = new CommentService();

        String id = req.getParameter("id");

        try {
            // 文章
            Article article = articleService.getArticle(id).get(0);
            req.setAttribute("article", article);

            // 文章所有的标签
            req.setAttribute("article_tags", tagService.getTagById(id));

            // 上一篇文章
            req.setAttribute("article_pre", ArticleService.getPreviousArticle(article.getTime()));

            // 下一篇文章
            req.setAttribute("article_next", ArticleService.getNextArticle(article.getTime()));

            // 加载评论
            req.setAttribute("comment", commentService.loadComment(article.getId()));

            req.getRequestDispatcher("/page/article.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
