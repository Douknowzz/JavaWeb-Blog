package com.njts.blog.service;

import com.njts.blog.bean.Article;
import com.njts.blog.dao.ArticleDao;
import com.njts.blog.dao.TagDao;
import com.njts.blog.utils.ArticleUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

public class AdminService {

    ArticleDao articleDao = new ArticleDao();
    TagDao tagDao = new TagDao();

    /**
     * *************添加新的文章，
     * @param req
     * @return
     * @throws UnsupportedEncodingException
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     * @throws SQLException
     */
    public Article addArticle(HttpServletRequest req) throws UnsupportedEncodingException, InvocationTargetException, IllegalAccessException, SQLException {
        req.setCharacterEncoding("utf-8");

//        ArticleDao articleDao = new ArticleDao();
//        TagDao tagDao = new TagDao();

        System.out.println(req.getParameter("tags"));
        System.out.println(req.getParameter("tags").trim());

        // 获得输入框的数据存储到article中***
        Article article = ArticleUtils.tidyToArticleBean(req);
        if (article == null) {
            return null;
        }

        // 存入数据库中，并返回这篇文章
        Article latestArticle = articleDao.addArticle(article);
        if (latestArticle == null) {
            return null;
        }

        // 增加标签
        String str = req.getParameter("tags").trim();
        String[] tags = str.split(" ");
        for (String tag : tags) {
            tagDao.addTag(latestArticle.getId(), tag);
        }

        return latestArticle;
    }

    public Article updateArticle(HttpServletRequest req) throws SQLException, UnsupportedEncodingException, InvocationTargetException, IllegalAccessException {
        // 获取文章id
        String id = req.getParameter("id");
        System.out.println("id:"+id);
        // 根据id删除文章
        this.deleteArticle(id);
        return this.addArticle(req);
    }

    public void deleteArticle(String id) throws SQLException {
//        ArticleDao articleDao = new ArticleDao();
        articleDao.deleteArticle(id);
    }

    /**
     * *******根据id获取文章
     * @param articleIdForEdit
     * @return
     * @throws SQLException
     */
    public Article getArticle(String articleIdForEdit) throws SQLException {
//        ArticleDao articleDao = new ArticleDao();
        List<Article> articleList = articleDao.getArticleByColumnOfId(articleIdForEdit);
        if (articleList.size() != 0) {
            return articleList.get(0);
        }
        return null;
    }

    public void updateSort(String old_sort, String new_sort) throws SQLException {
//        ArticleDao articleDao = new ArticleDao();
        articleDao.updateSort(old_sort, new_sort);
    }

    public void deleteSort(String sort) throws SQLException {
        // 获取要删除的分类下所有文章
        List<Article> toDeleteArticleList = articleDao.getToDeleteArticleBySort(sort);

        // 将删除的文章先添加到article_delete表中
        if (toDeleteArticleList.size() > 0) {
            for (Article article : toDeleteArticleList) {
                articleDao.addArticleOfDeleted(article);
            }
        }
        // 真正删除操作
        articleDao.deleteSort(sort);
    }

    public void updateTag(String old_tag, String new_tag) throws SQLException {
        tagDao.updateTag(old_tag, new_tag);
    }

    public void deleteTag(String tag) throws SQLException {
        tagDao.deleteTag(tag);
    }
}
