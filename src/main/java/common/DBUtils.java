package common;

import store.DatabaseHandler;
import store.MysqlHandlerException;

import java.sql.*;

public class DBUtils {

    DatabaseHandler dbController;
    Connection conn = null;
    PreparedStatement stmt = null;

    public int getTableRowCount(String tableName) throws MysqlHandlerException, SQLException {

        dbController = new DatabaseHandler();
        conn = dbController.connection();

        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT COUNT(*) AS rowcount FROM "+tableName);
        rs.next();
        return rs.getInt("rowcount");
    }
}
