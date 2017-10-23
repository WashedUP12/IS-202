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
  
<nav>
  <ul>
   <li><a href="studentlist">Students</a></li>
    <li><a href="modulelist">Modules</a></li>
    <li><a href="index.jsp">Log out</a></li>
  </ul>
</nav>
<div class="container">
<% Iterator itr;%>
<% List data=(List)request.getAttribute("data");
String student = (String) request.getAttribute("student");
for(itr=data.iterator(); itr.hasNext(); ){
%>
<h2><%= student %></h2> 
<h2><a href="moduleregistration.jsp"> Register new module</a></h2>
  
  <div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Modul <%=itr.next()%></a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse in">
        <div class="panel-body">
  <article>
  <h2><%=itr.next()%></h2>
  <div> <%=itr.next()%>
      <h4> <%=itr.next()%> </h4>
<%}%>

<input type="file" id="myFile">



<button onclick="myFunction()">Lever Modul</button>
<script>
function Lever Modul() {
    var x = document.getElementById("myFile");
    x.disabled = true;
}
</script>

<form action="/action_page.php">
  <textarea name="message" rows="10" cols="50">Skriv et blogg innlegg</textarea>
  <br>
  <input type="submit">
</form>
  
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Modul 2</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">
           <article>
  <h2>Modul 2: Klassedefinisjoner</h2>
  <div>
I denne modulen skal du l�re � lese java klassedefinisjoner. Java programmer best�r av klasser, s� du skal egentlig l�re � lese javaprogrammer. Du skal ogs� f� pr�ve � skrive enkle programmer, men akkurat som n�r du skal l�re andre spr�k, m� du l�re � lese f�r du kan begynne � skrive.</div><br>



<strong>L�ringsm�l:</strong>
Du har fullf�rt modulen n�r du kan:

<br>Lese en klassedefinisjon, og kunne fortelle:</br>
<ul>
<li>hva klassen heter.</li>
<li>hvilke felt den har, hva de heter og hvilken type de har</li>
<li>hvilke metoder den har, og hva metodene heter</li>
<li>beskrive parametere (med navn og type) og returverdi for alle metodene</li>
<br>
<li>Kjenner forskjellen p� forskjellige slags metoder (constructors, getters, setters) og vet hva de brukes til</li>
<li>Kan skrive en klassedefinisjon</li>
<li>med felt og metoder i riktig rekkef�lge</li>
<li>med metoder som bruker tilordning, if-setninger og utskrifter</li>
</ul>
</article>
</br>

<input type="file" id="myFile">



<button onclick="myFunction()">Lever Modul</button>
<script>
function Lever Modul() {
    var x = document.getElementById("myFile");
    x.disabled = true;
}
</script>

<form action="/action_page.php">
  <textarea name="message" rows="10" cols="50">Skriv et blogg innlegg</textarea>
  <br>
  <input type="submit">
</form>

      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Modul 3</a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">
        </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">Modul 4</a>
        </h4>
      </div>
      <div id="collapse4" class="panel-collapse collapse">
        <div class="panel-body">
        </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">Modul 5</a
        </h4>
      </div>
      <div id="collapse5" class="panel-collapse collapse">
        <div class="panel-body">
      </div>
    </div>
  </div> 
</div>
    

<footer>Kanskje en copyright?</footer>

</div>

</body>
</html>