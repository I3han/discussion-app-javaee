package store;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import static constant.Constants.MYSQL_DB_HOST;
import static constant.Constants.MYSQL_DB_PASSWORD;
import static constant.Constants.MYSQL_DB_USER;

public class DatabaseHandler {

    private String dbUrl = MYSQL_DB_HOST;
    private String dbUser = MYSQL_DB_USER;
    private String dbPassword = MYSQL_DB_PASSWORD;
    protected Connection connection;

    public DatabaseHandler() throws MysqlHandlerException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            System.out.println("Unable to load the class. Terminating the program");
            System.exit(-1);
        }
        // Create database connection
        try {
            validateDBParams(dbUrl, dbUser, dbPassword);
            this.connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
        } catch (SQLException e) {
            throw new MysqlHandlerException(e.getMessage(),  e);
        }
    }

    public Connection connection() {
        return this.connection;
    }

    public void close() throws MysqlHandlerException {
        try {
            this.connection.close();
        } catch (SQLException e) {
            throw new MysqlHandlerException("closing db connection failed", e);
        }
    }

    private static void validateDBParams(String dbUrl, String dbUser, String dbPass) throws MysqlHandlerException {
        if (!(dbUrl != null && !"".equals(dbUrl.trim()) && dbUser != null && !"".equals(dbUser.trim())
                && dbPass != null && !"".equals(dbPass.trim()))) {
            throw new MysqlHandlerException(
                    "database parameters not set, dbUrl:" + dbUrl + ", dbUser:" + dbUser + ", dbPassword:" + dbPass);
        }
    }
}
