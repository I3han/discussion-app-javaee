package auth;

import dao.User;
import store.DatabaseHandler;
import store.MysqlHandlerException;

import java.sql.*;

public class AuthDBHandler {

    DatabaseHandler dbController;
    Connection conn = null;
    PreparedStatement stmt = null;

    public void registerUser(String userName, String password, String firstName, String secondName,
                             String email, int phoneNumber) throws MysqlHandlerException, SQLException {
        dbController = new DatabaseHandler();
        conn = dbController.connection();

        System.out.println("Inserting records into the table...");

        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT COUNT(*) AS rowcount FROM `users`");
        rs.next();
        int rowcount = rs.getInt("rowcount");

        String sql = "INSERT INTO `users` (userID, userName, password, firstName,secondName,email,phoneNumber) " +
                "VALUES (?,?,?,?,?,?,?)";

        stmt=conn.prepareStatement(sql);
        stmt.setInt(1,rowcount+1);
        stmt.setString(2,userName);
        stmt.setString(3,password);
        stmt.setString(4,firstName);
        stmt.setString(5,secondName);
        stmt.setString(6,email);
        stmt.setInt(7,phoneNumber);

        int i=stmt.executeUpdate();
        System.out.println("Inserted records into the table...");

        dbController.close();
    }

}
