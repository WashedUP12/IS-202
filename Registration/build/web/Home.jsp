<!DOCTYPE html>
<html>
<head>
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
    margin: 0;
    padding: 1em;
}

nav ul {
    list-style-type: none;
    padding: 0;
}
   
nav ul a {
    text-decoration: none;
}

article {
    margin-left: 170px;
    border-left: 1px solid gray;
    padding: 1em;
    overflow: hidden;
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

<article>
  <h1> Velkommen </h1>
  <h2> Du er innlogget som <%= type %> </h2>
</article>

        
    
    
<footer></footer>

</div>

</body>
</html>
