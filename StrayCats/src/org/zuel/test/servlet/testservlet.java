package org.zuel.test.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckDatabaseConnection")
public class testservlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String jdbcUrl = "jdbc:sqlserver://localhost:1433;databaseName=HelpCat"; // 替换为你的数据库URL
        String username = "sa"; // 替换为你的数据库用户名
        String password = "187367"; // 替换为你的数据库密码

        try {
            // 加载SQL Server JDBC驱动（确保已经添加到项目的类路径中）
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            // 建立数据库连接
            Connection connection = DriverManager.getConnection(jdbcUrl, username, password);

            // 创建一个Statement对象
            Statement statement = connection.createStatement();

            // 执行查询
            ResultSet resultSet = statement.executeQuery("SELECT * FROM CAT"); // SQL Server 使用 TOP 而不是 LIMIT

            // 处理查询结果
            if (resultSet.next()) {
                // 假设some_table有一个名为column_name的列
                String columnValue = resultSet.getString("CatName");
                out.println("Database connection is working. Value from column_name: " + columnValue);
            } else {
                out.println("Database connection is working, but no rows found.");
            }

            // 关闭资源
            resultSet.close();
            statement.close();
            connection.close();

        } catch (ClassNotFoundException e) {
            out.println("JDBC Driver not found: " + e.getMessage());
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("Error while connecting to the database: " + e.getMessage());
            e.printStackTrace();
        }
    }
}