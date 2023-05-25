package com.njts.blog.service;

import com.njts.blog.bean.Comment;
import com.njts.blog.dao.CommentDao;

import java.sql.SQLException;
import java.util.List;

public class CommentService {

    CommentDao commentDao = new CommentDao();

    public List<Comment> loadComment(int id) throws SQLException {
        return commentDao.getComment(id);
    }

    public boolean addComment(Comment comment) throws SQLException {
        return commentDao.addComment(comment);
    }

    public int starOrDiss(int id, int star_or_diss) throws SQLException {
        return commentDao.starOrDiss(id, star_or_diss);
    }

    public boolean deleteComment(int id) throws SQLException {
        return commentDao.deleteComment(id);
    }
}
