package com.njts.blog.servlet;

import com.njts.blog.bean.User;
import com.njts.blog.dao.LoginDao;
import com.njts.blog.dao.VisitorDao;
import com.njts.blog.service.ArticleService;
import com.njts.blog.service.TagService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //
        LoginDao loginDao = new LoginDao();
        ArticleService aritcleService = new ArticleService();
        TagService tagService = new TagService();

        //获取从前端输入框当中的值
        String username = req.getParameter("username");
        String password = req.getParameter("password");


        try {
            // 调用LoginDao的方法，获取user对象
            User user = loginDao.queryUserByNameAndPassword(username, password);

            //判断用户user是否为空 空代表数据库没有这个用户 不空代表数据库当中有这个值
            if (user != null) {

                // 写入session，是为了传递用户名
                req.getSession().setAttribute("user",user);

                // 传递分类的名称和各个分类下的文章数
                req.setAttribute("sort_count_map", aritcleService.getSortAndCount());
                // 传递所有的文章，初始化在主页面上
                req.setAttribute("article_list", aritcleService.getAllArticle());
                // 获取所有的标签，并且初始化在主页面上
                req.setAttribute("tag_list", tagService.getAllTag());
                // 初始化侧边栏 日志、分类、标签的个数
                req.setAttribute("article_number", aritcleService.getArticleCount());
                req.setAttribute("sort_number", aritcleService.getSortCount());
                req.setAttribute("tags_number", tagService.getTagCount());
                // 初始化阅读排行的文章
                req.setAttribute("visit_rank", aritcleService.getVisitRank());
                // 初始化网站的访问次数和访问者
                req.setAttribute("visited", VisitorDao.totalVisit());
                req.setAttribute("member", VisitorDao.totalMember());

                // 定位到主界面
                req.getRequestDispatcher("/page/main.jsp").forward(req,resp);
            } else {
                //错误返回到登录页面
                req.getRequestDispatcher("/login.html").forward(req,resp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
