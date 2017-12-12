<!DOCTYPE html>
<html>
<head>
<script src="http://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
<script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script>
<style>
div.container {
    width: 80%;
    margin: auto;
    
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

<nav>
  <ul>
    <li><a href="home">Home</a></li>
    <li><a href="studentlist">Students</a></li>
    <li><a href="modulelist">Modules</a></li>
    <li><a href="index.jsp">Log out</a></li>
  </ul>
</nav>


<form action="moduleregistration" method="post">
            <pre>
            <textarea id="area2" type="varchar" name="beskrivelse" required="required" rows="8" cols="80"></textarea>
            
            <input type=submit name="submit" value="Send" onclick="nicEditors.findEditor('area2').saveContent();">
            </pre>
</form>
</div>
</body>
</html>
