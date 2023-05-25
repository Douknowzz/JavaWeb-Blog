package com.njts.blog.dao;

import com.njts.blog.bean.Tag;
import com.njts.blog.utils.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class TagDao {
    /**
     * 从数据库获得所有的不重复标签
     * @return
     * @throws SQLException
     */
    public List<Tag> getAllTag() throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "SELECT DISTINCT(tag) FROM t_tag;";
        return qr.query(sql, new BeanListHandler<>(Tag.class));
    }

    public List<Tag> getTagByColumn(String tag) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "select * from t_tag where tag = ?;";
        return qr.query(sql, new BeanListHandler<>(Tag.class), tag);
    }

    public List<Tag> getTagByColumnOfId(String tag) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "select * from t_tag where id = ?;";
        return qr.query(sql, new BeanListHandler<>(Tag.class), tag);
    }

    public void addTag(int id, String tag) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "insert into t_tag values(?,?)";
        qr.execute(sql, id, tag);
    }

    public void updateTag(String old_tag, String new_tag) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "update t_tag set tag=? where tag=?";
        qr.execute(sql, new_tag, old_tag);
    }

    public void deleteTag(String tag) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "delete from t_tag where tag=?";
        qr.execute(sql, tag);
    }
}
