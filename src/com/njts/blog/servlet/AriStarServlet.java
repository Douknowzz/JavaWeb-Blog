package com.njts.blog.servlet;

import com.njts.blog.service.ArticleService;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AriStarServlet")
public class AriStarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 业务操作 获取评论id
        String id = req.getParameter("id");
        // 返回的数据
        JSONObject jo = new JSONObject();
        boolean repeat = false;
        // 写一个cookie防止重复提交
        Cookie[] cookies = req.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("star_arti" + id)) {
                // 重复提交了数据
                jo.put("msg", "failed");
                repeat = true;
                break;
            }
        }
        if (!repeat) {

            ArticleService articleService = new ArticleService();
            int new_star = 0;
            try {
                new_star = articleService.starArticle(Integer.parseInt(id));
            } catch (SQLException e) {
                e.printStackTrace();
            }

            jo.put("msg", "success");
            jo.put("new_star", new_star);
            // 发送新的cookie
            Cookie cookie = new Cookie("star_arti" + id, System.currentTimeMillis() + "");
            // 设置有效期 15分钟
            cookie.setMaxAge(15 * 60);
            // 设置有效目录
            cookie.setPath("/");
            // 写会浏览器
            resp.addCookie(cookie);
        }
        // 写回ajax
        resp.getWriter().println(jo);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
