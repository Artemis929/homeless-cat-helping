package org.zuel.test.util;

import java.sql.*;


//单独提取出来，作为一个单独的方法。
public class Dbutil {
    private static String DRIVER_name="com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static String JDBC_url = "jdbc:sqlserver://localhost:1433;DatabaseName=HelpCat";
    private static String JDBC_username = "sa";
    private static String JDBC_password="187367";

    /*
    获取数据库的连接
    */
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Class.forName(DRIVER_name);
        Connection conn= DriverManager.getConnection(JDBC_url,JDBC_username,JDBC_password);
        return conn;
    }

    //释放资源

    public static void release(PreparedStatement pstmt,Connection conn)
    {
        release(null,pstmt,conn);
    }

    //释放资源

    public static void release(ResultSet rs,PreparedStatement pstmt,Connection conn)
    {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
}




