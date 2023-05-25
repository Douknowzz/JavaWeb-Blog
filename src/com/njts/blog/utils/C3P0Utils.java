package com.njts.blog.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;

/**
 * C3P0连接池工具类
 * @author weidong
 */
public class C3P0Utils {
    private static ComboPooledDataSource ds;

    static {
        ds = new ComboPooledDataSource("myApp");
    }

    /**
     * 获取数据源
     * @return 连接池
     */
    public static DataSource getDataSource() {
        return ds;
    }
}
