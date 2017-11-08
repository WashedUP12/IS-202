<%@page language="java" import="java.util.*" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
div.container {
    width: 80%;
    
}

header, footer {
    padding: 1em;
    color: white;
    background-color: brown;
    clear: left;
    text-align: center;
}

nav {
    float: left;
    max-width: 160px;
    margin: 1;
    padding: 1em;}

nav ul {
    list-style-type: none;
    padding: 0;
}
   
nav ul a {
    text-decoration: none;
}

</style>
</head>
<body>

<div class="container">

<header>
   <h1>SLIT</h1>
</header>
  
<%
String type = (String) request.getAttribute("type");    
%>

<% if (type.equals("student")) { %>
    <nav>
      <ul>
        <li><a href="">My blog</a></li>
        <li><a href="modulelist">Modules</a></li>
        <li><a href="index.jsp">Log out</a></li>
      </ul>
    </nav>
<%} else {%>
    <nav>
      <ul>
        <li><a href="studentlist">Students</a></li>
        <li><a href="modulelist">Modules</a></li>
        <li><a href="index.jsp">Log out</a></li>
      </ul>
    </nav>
<%}%>
    
<div class="container">
<% String student = (String) request.getAttribute("student"); %>
<h2><%= student %></h2> 
<h2><a href="moduleregistration.jsp"> Register Module</a></h2>
  
  <div class="panel-group" id="accordion">

<% ListIterator iter;%>      
<% List data=(List)request.getAttribute("data");
for(iter = data.listIterator(); iter.hasNext(); ){
%>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%=iter.nextIndex()%>">Modul <%=iter.next()%></a>
        </h4>
      </div>
      <div id="collapse"class="panel-collapse collapse in">
        <div class="panel-body">
  <article>
  <h2><%=iter.next()%></h2>
  <div> <%=iter.next()%> 
      <h4> Date created: <%=iter.next()%> </h4>

<form method="post" action="UploadFileController" enctype="multipart/form-data">
                <table border="1" width="25%" cellpadding="5">
                    <thead> 
                            <th colspan="3">Deliver Module</th>        
                    </thead>
                    <tbody>
                        <tr>    
                            <td>Title : </td>
                            <td><input type="text" name="title" size="30"></td>
                        </tr>
                        <tr>
                            <td>Choose File : </td>
                            <td><input type="file" name="file_uploaded" /></td>
                        </tr>
                        <tr>
                            <td colspan="3"><center><input type="submit" value="Upload"></center></td>
                        </tr>
                    </tbody>             
                </table>
        </form>
</div>
      </div>
</div>
<%}%>
    </div>
</div>

<footer></footer>

</div>

</body>
</html>