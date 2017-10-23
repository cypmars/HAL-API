<%--
  Created by IntelliJ IDEA.
  User: Cyprien
  Date: 27/09/2017
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
</head>
<body>
    <div class="container" style="margin-top:100px">
        <%
            String type = request.getParameter("type");
            if (type.equals("Articles"))
            {
        %>
                <h1 class="display-5 text-center">For instance you can research Articles by <span class="text-warning">keyword</span></h1>
        <%
            }
            else if (type.equals("Laboratories"))
            {
        %>
                <h1 class="display-5 text-center">For instance you can research Laboratories by <span class="text-warning">name or acronym</span></h1>
        <%
            }
            else if (type.equals("Universities"))
            {
        %>
                <h1 class="display-5 text-center">For instance you can research Universities by <span class="text-warning">name or acronym</span></h1>
        <%
            }
            else
            {
        %>
                <h1 class="display-5 text-center">For instance you can research Co-Authors by <span class="text-warning">Last Name and First Name</span></h1>
        <%
            }
        %>
        <br/><br/><br/>
        <div class=" row text-center">
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
                <form method="post" action="/halArticles">
                    <input type="text" name="value" class="form-control">
                    <br/>
                    <a class="" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">Advance</a>
                    <div class="collapse" id="collapseExample">
                        <div class="form-check form-check-inline">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" id="inlineRadio1" name="checkbox" value="keyword"> Document
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" id="inlineRadio2" name="checkbox" value="labo"> Laboratory
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" id="inlineRadio3" name="checkbox" value="coauth"> Co-Author
                            </label>
                        </div>
                    </div>
                    <br/>
                    <button type="submit" class="btn btn-warning btn-lg">TRY !</button>
                </form>
            </div>
            <div class="col-lg-4"></div>
        </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>
