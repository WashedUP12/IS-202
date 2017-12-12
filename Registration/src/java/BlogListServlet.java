/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
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
@WebServlet(urlPatterns = {"/BlogListServlet"})
public class BlogListServlet extends HttpServlet {

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
            Class.forName(DBConnection.driver);
            Connection con = DriverManager.getConnection(DBConnection.con, 
                   DBConnection.username, DBConnection.password);
            String sql = "SELECT entry_id, data, created, userID, name "
                    + "FROM blog "
                    + "left join register using (userID)"
                    + "where userID=?";
            
            PreparedStatement sqlstmt = con.prepareStatement(sql);
            if (request.getParameter("studentID") != null) {
                int userNumber = Integer.parseInt(request.getParameter("studentID"));
                sqlstmt.setInt(1, userNumber);
            } else {
                sqlstmt.setInt(1, Login.user_ID);
            }
            ArrayList list = new ArrayList();
            String userName = "";
            ResultSet rs = sqlstmt.executeQuery();

            /* Henter resultatene fra spørring og behandler de */            
            while (rs.next()) {
                list.add(rs.getString("entry_id"));
                
                /* Konverterer type blob til String */
                Blob blob = rs.getBlob("data");
                byte[] bdata = blob.getBytes(1, (int) blob.length());
                String fileContent = new String(bdata);
                list.add(fileContent);
                
                list.add(rs.getString("created"));
                list.add(rs.getString("userID"));
                userName = rs.getString("name");
                
            }
            /* sender data som attributter gjennom request-objekt,
            *  og dirigerer videre til jsp.
            */
            request.setAttribute("data", list);
            request.setAttribute("student", userName);
            request.setAttribute("type", Login.user_type);
            RequestDispatcher rd = request.getRequestDispatcher("add_data.jsp");
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
