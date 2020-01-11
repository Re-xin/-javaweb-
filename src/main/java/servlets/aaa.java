package servlets;

import util.JDBCUtils;

import java.sql.Connection;
import java.sql.SQLException;

public class aaa {
    public static void main(String[] args) {
        Connection connection = null;
        try {
            connection = JDBCUtils.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(connection);
    }
}
