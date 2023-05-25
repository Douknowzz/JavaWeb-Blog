package com.njts.blog.dao;

import com.njts.blog.bean.Comment;
import com.njts.blog.bean.Sort;
import com.njts.blog.utils.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.security.Key;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class CommentDao {
    public List<Comment> getComment(int id) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "SELECT * FROM t_comment WHERE article_id=? ORDER BY TIME;";
        return qr.query(sql, new BeanListHandler<>(Comment.class), id);
    }

    public boolean addComment(Comment comment) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "INSERT INTO t_comment VALUES(null, ?, ?, ?, ?, ?, ?);";
        int result = qr.execute(sql, comment.getArticle_id(), comment.getNickname(),
                comment.getContent(), comment.getTime(), comment.getStar(), comment.getDiss());

        //在相应的文章里把评论数目加一
        String sql2 = "UPDATE t_article SET comment = comment+1  WHERE id= ?;";
        qr.execute(sql2, comment.getArticle_id());

        return result>0;
    }

    public int starOrDiss(int id, int star_or_diss) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql;
        int result = -1;

        //向数据库中添加
        if (star_or_diss == Comment.STAR) {
            sql = "update t_comment set star=star+1 where id = ?;";
        } else if (star_or_diss == Comment.DISS) {
            sql = "update t_comment set diss=diss+1 where id = ?;";
        } else {
            return -1;
        }
        qr.execute(sql, id);

        //得到最新的值
        if (star_or_diss == Comment.STAR) {
            sql = "SELECT star FROM t_comment WHERE id = " + id;
        } else if (star_or_diss == Comment.DISS) {
            sql = "SELECT diss FROM t_comment WHERE id = " + id;
        }
        result = qr.query(sql, new ScalarHandler<Integer>());

        return result;
    }

    public boolean deleteComment(int id) throws SQLException {

        reduceComment(id);

        int result = 0;
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "DELETE FROM t_comment WHERE id= ?";
        result = qr.execute(sql, id);

        return result > 0;
    }

    public void reduceComment(int id) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());

        String sql = "SELECT article_id FROM t_comment WHERE id="+id;
        Integer article_id = qr.query(sql, new ScalarHandler<Integer>());

        String sql3 = "UPDATE t_article SET comment=comment - 1 WHERE id= ?";
        qr.execute(sql3, article_id);
    }
}
