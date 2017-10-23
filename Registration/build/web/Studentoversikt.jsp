<%@page language="java" import="java.util.*" %>
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

table {
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
   <p1>Studenter</p1>
</header>
  
<nav>
  <ul>
     <li><a href="studentlist">Students</a></li>
    <li><a href="modulelist">Modules</a></li>
    <li><a href="index.jsp">Log out</a></li>
  </ul>
</nav>
<h2><a href="registration.jsp"> Register new student</a></h2>
<table>
  <tr>
    <th>Bruker ID</th>
    <th>Elev</th>
    <th>Rolle</th>
    <th>E-post</th>
    <th>Modul</th>
  </tr>
<% Iterator itr;%>
<% List data=(List)request.getAttribute("data");
for(itr=data.iterator(); itr.hasNext(); ){
%>
  <tr>
    <td><%=itr.next()%></td>
    <td><%=itr.next()%> &ensp;</td>
    <td>Student &ensp;</td>
    <td><%=itr.next()%></td>
    <td>
		<a href="StudentSelection.html">
			<div style="height:100%;width:100%">
				&#8680;
			</div>
		</a>
	</td>
  </tr>
<%}%>
</table>

<footer>Kanskje en copyright?</footer>

</div>

</body>
</html>