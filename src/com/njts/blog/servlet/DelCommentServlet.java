package com.njts.blog.servlet;

import com.njts.blog.service.CommentService;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DelCommentServlet")
public class DelCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 业务操作 获取评论id
        String id = req.getParameter("id");
        // 返回的数据
        JSONObject jo = new JSONObject();
        CommentService commentService = new CommentService();
        boolean b;
        try {
            b = commentService.deleteComment(Integer.parseInt(id));
            if (b) {
                jo.put("msg", "success");
            } else {
                jo.put("msg", "fail");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // 写回ajax
        resp.getWriter().println(jo);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
