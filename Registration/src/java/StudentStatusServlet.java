/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Christoffers
 */
@WebServlet(urlPatterns = {"/studentstatus"})
public class StudentStatusServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");       
        try (PrintWriter out = response.getWriter()) {
           String studentID = request.getParameter("studentID");
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webshop","root","dittPassord");
           String sql = "SELECT name, modul_ID, modStatus "
                   + "FROM modulstatus "
                   + "right join register on modulstatus.userID = register.userID "
                   + "where modulstatus.userID=?";
           PreparedStatement sqlstmt = con.prepareStatement(sql);
           sqlstmt.setString(1, studentID);
           ArrayList list = new ArrayList();
           ResultSet rs = sqlstmt.executeQuery();

            while (rs.next()) {
                list.add(rs.getString("name"));
                list.add(rs.getString("modul_ID"));
                list.add(rs.getString("modStatus"));
            }
            request.setAttribute("data", list);
            request.setAttribute("student", Login.user_name);
            request.setAttribute("type", Login.user_type);
            RequestDispatcher rd = request.getRequestDispatcher("StudentStatus.jsp");
            rd.forward(request, response);
            
        } catch (ClassNotFoundException ex) {
        Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

        @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }
}
