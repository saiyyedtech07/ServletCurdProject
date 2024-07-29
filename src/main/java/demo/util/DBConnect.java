package demo.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

    public static Connection getConnection(){
         String url = "jdbc:mysql://localhost:3306/ziyadb";
         String userName = "root";
         String passWord = "admin@123";
        Connection con=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con= DriverManager.getConnection(url, userName, passWord);
            System.out.println(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }


}
