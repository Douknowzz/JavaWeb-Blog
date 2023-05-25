package com.njts.blog.service;

import com.njts.blog.bean.Article;
import com.njts.blog.bean.Tag;
import com.njts.blog.dao.TagDao;
import com.njts.blog.utils.ArticleUtils;
import org.apache.commons.lang.StringUtils;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TagService {

    TagDao tagDao = new TagDao();
    ArticleService articleService = new ArticleService();

    /**
     * 获得所有的标签名称
     * @return
     * @throws SQLException
     */
    public List<Tag> getAllTag() throws SQLException {
        return tagDao.getAllTag();
    }

    /**
     * 用.size()就可以获得个数了
     * @return
     * @throws SQLException
     */
    public int getTagCount() throws SQLException {
        return tagDao.getAllTag().size();
    }

    public Map<String, List<Article>> getTagAndArticle(String tag_name) throws SQLException {
        List<Tag> allTag;

        if (tag_name.equals("all") || StringUtils.isEmpty(tag_name)) {
            // 获取所有不重复的标签
            allTag = tagDao.getAllTag();
        } else {
            // 获取这个标签
            allTag = tagDao.getTagByColumn(tag_name);
        }

        Map<String, List<Article>> map = new HashMap<>();
        // 获取这个标签的所有文章 id
        for (Tag tag : allTag) {
            List<Tag> tagByColumn = tagDao.getTagByColumn(tag.getTag());
            // 查询所有文章 id 放在article_list
            List<Article> articleList = null;
            for (Tag tag_all : tagByColumn) {
                // 这个集合只有一个元素
                List<Article> result = articleService.getArticle(String.valueOf(tag_all.getId()));
                articleList = ArticleUtils.cutTime(result);
            }
            // 返回标签的内容+标签标记的所有文章集合
            map.put(tag.getTag(), articleList);
        }
        return map;
    }

    public List<Tag> getTagById(String id) throws SQLException {
        return tagDao.getTagByColumnOfId(id);
    }
}
