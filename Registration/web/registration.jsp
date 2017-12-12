<!DOCTYPE html>
<html>
    <head>
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

            <%-- Meny --%>
            <nav>
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="studentlist">Students</a></li>
                    <li><a href="modulelist">Modules</a></li>
                    <li><a href="index.jsp">Log out</a></li>
                </ul>
            </nav>

            <%-- Form input for registering. Directer videre til Registration.java --%>
            <form action="Registration" method="post">
                <pre>
            <input type="varchar" name="user" required="required" placeholder="user name">
                
            <input type="varchar" name="password" required="required" placeholder="password">
            
            <input type="varchar" name="email" required="required" placeholder="email">
            
            <input type="submit" value="Register">
                </pre>
            </form>

            <footer></footer>

        </div>

    </body>
</html>
