package auth;

import dao.User;
import store.DatabaseHandler;
import store.MysqlHandlerException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        // read form fields
        String username = request.getParameter("name");

        AuthDBHandler authDBHandler = new AuthDBHandler();
        try {
            authDBHandler.registerUser(username, request.getParameter("password"), request.getParameter("fname"),
                    request.getParameter("lname"), request.getParameter("email"), Integer.parseInt(request.getParameter("phone")));
        } catch (MysqlHandlerException e) {
            e.printStackTrace();
        }catch (NumberFormatException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        // get response writer
        PrintWriter writer = response.getWriter();

        // build HTML code
        String htmlRespone = "<html>";
        htmlRespone += "<h2>"+ username + " you have Registered Succefully</h2></br>";
        htmlRespone += "<a href=\"/index.jsp\">Home</a>";
        htmlRespone += "</html>";

        // return response
        writer.println(htmlRespone);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
