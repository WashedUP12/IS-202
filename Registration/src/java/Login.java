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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author eriky
 */
public class Login extends HttpServlet {
    
    public static int user_ID;
    public static String user_name;
    public static String user_type;
    public static boolean isAdmin;
    public static String jspTest = "test";
    
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
            /* Setter opp databasetilkobling og sql-spørring */
           String name = request.getParameter("user");
           String password = request.getParameter("password");
           String dbName = null;
           String dbPassword = null;
           String sql ="select * from register where name=? and password=?";
           Class.forName(DBConnection.driver);
           Connection con = DriverManager.getConnection(DBConnection.con, 
                   DBConnection.username, DBConnection.password);
           PreparedStatement ps = con.prepareStatement(sql);
           ps.setString(1, name);
           ps.setString(2, password);
           ResultSet rs = ps.executeQuery();
           
           /* Henter resultatene fra spørring og behandler de */ 
           while(rs.next()){
               dbName = rs.getString("name");
               dbPassword = rs.getString("password");
               user_ID = rs.getInt("userID");
               user_name = rs.getString("name");
               user_type = rs.getString("userType");
               
               if (rs.getString("isAdmin") == "yes") {
                   isAdmin = true;
               }
               else {
                   isAdmin = false;
               }
           }
           
           /* Sjekker om login stemmer med databasen, og
            * sender data som attributter gjennom request-objekt,
            *  og dirigerer videre til jsp.
            */
           if (name.equals (dbName)&&password.equals(dbPassword)){
               request.setAttribute("type", user_type);
               request.setAttribute("student", Login.user_name);
               request.setAttribute("driver", DBConnection.driver);
               request.setAttribute("con", DBConnection.con);
               request.setAttribute("username", DBConnection.username);
               request.setAttribute("password", DBConnection.password);
               RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
               rd.forward(request, response);
           }
           else{
               response.sendRedirect("index.jsp");
               RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
               rd.include (request, response);
           }
           
           
           
           
           
           
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
