package com.njts.blog.dao;

import com.njts.blog.bean.User;
import com.njts.blog.utils.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class LoginDao {
    /**
     *  根据用户名和密码查找表中的用户（之后验证登录时，如果user为空则说明用户名或者密码不对）
     */
    public User queryUserByNameAndPassword(String name, String password) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "SELECT * FROM t_user WHERE user_name = ? AND user_password = ?; ";
        User user = qr.query(sql, new BeanHandler<>(User.class),name,password);
        return user;
    }
}
