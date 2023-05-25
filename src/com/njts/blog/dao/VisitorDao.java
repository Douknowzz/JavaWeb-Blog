package com.njts.blog.dao;

import com.njts.blog.utils.ArticleUtils;
import com.njts.blog.utils.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.commons.lang.time.DateUtils;

import javax.servlet.http.HttpServletRequest;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

public class VisitorDao {
    /**
     * 统计所有访问的次数
     * @return
     * @throws SQLException
     */
    public static int totalVisit() throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "SELECT COUNT(id) FROM t_visitor;";
        Object query = qr.query(sql, new ScalarHandler<>());
        int count = Integer.parseInt(String.valueOf(query));
        return count;
    }

    /**
     * 统计访客的个数，同一ip多次访问算一次
     * @return
     * @throws SQLException
     */
    public static Object totalMember() throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "SELECT COUNT(DISTINCT(ip)) FROM t_visitor;";
        Object query = qr.query(sql, new ScalarHandler<>());
        int count = Integer.parseInt(String.valueOf(query));
        return count;
    }

    public static void visit(HttpServletRequest req) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());

        String remoteAddr = req.getRemoteAddr();// 得到来访者的IP地址
        String localAddr = req.getLocalAddr(); // 获取WEB服务器的IP地址
        String remoteHost = req.getRemoteHost();
        String time = ArticleUtils.timeOfCreate();

        String sql = "insert into t_visitor values(null,?,?,?,?)";
        qr.execute(sql, remoteAddr, time, localAddr, remoteHost);
    }
}
