// Import required java libraries
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

// Extend HttpServlet class
public class PoengForm extends HttpServlet {

   // Method to handle GET method request.
   public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
      
      // Set response content type
      response.setContentType("text/html");

      PrintWriter out = response.getWriter();
      String title = "Using GET Method to Read Form Data";
      String docType =
         "<!doctype html public \"-//w3c//dtd html 4.0 " +
         "transitional//en\">\n";
         
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Welcome Teacher</title>");            
        out.println("</head>");
        out.println("<body>");
        out.println("<ul>\n" +
                  "  <li><b><h2>Poengsum</h2></b> "
                  + request.getParameter("Poengsum") + "\n" +
                  "  <li><b><h2>Tilbakemelding</h2></b> "
                  + request.getParameter("Tilbakemelding") + "\n" +
               "</ul>\n");          
        out.println("</body>");
        out.println("</html>");
   }

   // Method to handle POST method request.
   public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

      doGet(request, response);
   }
}