
package RTDRestaurant.Controller.Connection;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;

// Kết nối tới DataBase của hệ thống

public class DatabaseConnection {

    private static DatabaseConnection instance;
    private Connection connection;

    public static DatabaseConnection getInstance() {
        if (instance == null) {
            instance = new DatabaseConnection();
        }
        return instance;
    }

    private DatabaseConnection() {

    }
    //Thực hiện kết nối tới Database
    public void connectToDatabase() throws SQLException {
        final String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        final String username = "C##Doan";
        final String password = "123";
        connection = DriverManager.getConnection(url, username, password);
        if(connection!=null)System.out.println("Ket noi db thanh cong");
    }
 
    public Connection getConnection() {
        return connection;
    }
    
    public void setConnection(Connection connection) {
        this.connection = connection;
    }
}

