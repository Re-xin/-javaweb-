package util;


import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidPooledConnection;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class MyDateSource {
    /**
     * 最大连接源
     */
    private static int MAX_ACTIVE = 50;
    /**
     * 最大等待时间
     */
    private static int MAX_WAIT = 3000;
    /**
     * 初始化连接数量
     */
    private static int INITIALSIZE = 5;
    /**
     * 数据源
     */
    private static DruidDataSource dataSource;
    /**
     * 数据库连接池
     */
    private static DruidPooledConnection pool;
    /**
     * Statement 对象
     */
    private static PreparedStatement preparedStatement;

    // 初始化数据源
    static {
        Properties prop = new Properties();
        InputStream in = null;
        //    in = ReadFileUtil.getInputSteam("classpath:db.properties");
        String url = null;
        String driverClassName = null;
        String username = null;
        String password = null;
        try {
      //      prop.load(in);
            url ="jdbc:mysql://127.0.0.1:3306/final";
            driverClassName = "com.mysql.jdbc.Driver";
            username = "root";
            password = "123456";
            // 配置初始化属性
            dataSource = new DruidDataSource();
            dataSource.setDriverClassName(driverClassName);
            dataSource.setUsername(username);
            dataSource.setPassword(password);
            dataSource.setUrl(url);
            dataSource.setMaxActive(MAX_ACTIVE);
            dataSource.setMaxWait(MAX_WAIT);
            dataSource.setInitialSize(INITIALSIZE);
            pool = dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("不能读取属性文件. " + "请确保db.properties在CLASSPATH指定的路径中");
        }
    }

    /**
     * 获取连接池里面的数据源
     *
     * @return
     * @author hkl
     */
    public static Connection getConnection() {
        return pool.getConnection();
    }

    /**
     * 返回PreparedStatement
     * @param sql 传入的sql
     * @return
     */
    public static PreparedStatement getPreparedStatement(String sql) {
        try (PreparedStatement preparedStatement = getConnection().prepareStatement(sql)) {
            return preparedStatement;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return preparedStatement;
    }

    /**
     * 关闭资源
     *
     * @param conn
     * @author hkl
     */
    public static void closeConnection(Connection conn) {
        // 空对象直接返回
        if (conn == null) {
            return;
        }
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
