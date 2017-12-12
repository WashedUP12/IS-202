/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.sql.rowset.serial.SerialBlob;
/**
 *
 * @author Christoffers
 */
@WebServlet(urlPatterns = {"/writeBlog"})
@MultipartConfig(maxFileSize = 16177215)
public class WriteBlogServlet extends HttpServlet {

  @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
   {
                response.setContentType("text/html;charset=UTF-8");
                File file = new File("textfile.txt");
                PrintWriter out = response.getWriter();
                
                
                String text = request.getParameter("beskrivelse");
                try (PrintWriter writer = new PrintWriter(file)) {
                    writer.println(text);
                    writer.close();
                    
                    
                    
                    BufferedReader in = new BufferedReader(new FileReader(file));
                    String line;
                    while((line = in.readLine()) != null)
                    {
                        out.println(line);
                    }
                    in.close();
                }
                

                // Lager en byte array av filen
                byte[] fileContent = new byte[(int) file.length()];
                FileInputStream inputStream = null;
                try {
                        // Oppretter en inputstream av filen
                        inputStream = new FileInputStream(file);
                        // Skriver innholdet i filen over til inputstream
                        inputStream.read(fileContent);
                } catch (IOException e) {
                        throw new IOException("Unable to convert file to byte array. " + e.getMessage());
                } finally {
                        // lukker stream
                        if (inputStream != null) {
                                inputStream.close();
                        }
                }

                try {
                    String sql ="insert into blog (data, userID) values (?, ?)";
                    Class.forName(DBConnection.driver);
                    Connection con = DriverManager.getConnection(DBConnection.con, 
                                DBConnection.username, DBConnection.password);
                    PreparedStatement ps = con.prepareStatement(sql);
                    Blob blob = new SerialBlob(fileContent);
                    ps.setBlob(1, blob);
                    ps.setInt(2, Login.user_ID);
                    ps.execute();
                    ps.close();
                    String modul = "blog";
                    request.setAttribute("varselType", modul);
                    RequestDispatcher rd = request.getRequestDispatcher("notificationRegister");
                    rd.forward(request, response);
                    
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
                    Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    }   
}
