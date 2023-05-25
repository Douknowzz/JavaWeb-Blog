package com.njts.blog.utils;

import com.njts.blog.bean.Comment;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;

public class CommentUtils {
    public static Comment tidyToCommentBean(HttpServletRequest req) {

        int id = Integer.valueOf(req.getParameter("id"));

        String nickname = req.getParameter("w_nickname");
        String content = req.getParameter("w_content");

        Comment bean = new Comment();
        bean.setArticle_id(id);
        bean.setNickname(nickname);
        bean.setContent(content);
        if (verify(bean)) {
            bean.setDiss(0);
            bean.setStar(0);
            bean.setTime(ArticleUtils.timeOfCreate());
            return bean;
        }

        return null;
    }

    // ÅÐ¶ÏÊÇ·ñ¿Õ
    private static boolean verify(Comment c) {
        boolean result = true;

        if (c.getArticle_id() == 0 || StringUtils.isEmpty(c.getContent())) {
            result = false;
        }
        return result;
    }
}
