/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author Elias Burkan
 */
@WebServlet(urlPatterns = {"/UploadFileController"})
@MultipartConfig(maxFileSize = 16177215)
public class UploadFileController extends HttpServlet {

  @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
   {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
        
                InputStream inputStream = null;
                
                /* Genererer tilfeldig ID*/
                Random rand = new Random();
                int  n = rand.nextInt(9999) + 1;
                String idTemp=(String.valueOf(n));

                
                String title=(request.getParameter("title"));
                Part filePart = request.getPart("file_uploaded");
                
                /* Skriver om filen til inputstream*/
                if (filePart != null) 
                {
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());

                    inputStream = filePart.getInputStream();
                }
                
                try 
                {
                    Class.forName(DBConnection.driver);
                    Connection con = DriverManager.getConnection(DBConnection.con, 
                                    DBConnection.username, DBConnection.password);
                
                    
                    String sql = "INSERT INTO files (id, title, file) values (?, ?, ?)";

                    PreparedStatement statement = con.prepareStatement(sql);
                    statement.setString(1, idTemp);
                    statement.setString(2, title);
             
                    if (inputStream != null) 
                    {
                        statement.setBinaryStream(3, inputStream, (int) filePart.getSize());
                    }
                    
                    int row = statement.executeUpdate();
                    if (row > 0) 
                    {
                        
                        con.close();
                        String modul = "module";
                        request.setAttribute("varselType", modul);
                        RequestDispatcher rd = request.getRequestDispatcher("notificationRegister");
                        rd.forward(request, response);
                    }
                    else
                    {
                        out.println("Couldn't upload your file!!!");
                        
                        con.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("upload_form.jsp");
                        rs.include(request, response);
                    }    

                }catch(Exception e){e.printStackTrace();}     
    }   
}
