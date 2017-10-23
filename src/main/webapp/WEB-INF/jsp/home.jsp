<%--
  Created by IntelliJ IDEA.
  User: Cyprien
  Date: 27/09/2017
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        <h1 class="display-2 text-warning text-center">Welcome on HAL  Research Engine !</h1>
        <br/>
        <div class="text-center">
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/09/HAL.JPG">
            <br/><br/><br/>
            <div class="d-inline-flex">
                <form method="post" action="/search/articles" style="margin-right: 20px">
                    <input type="text" value="Articles" name="type" hidden>
                    <button type="submit" class="btn btn-warning btn-lg">Search Articles</button>
                </form>
                <form method="post" action="/search/laboratories" style="margin-right: 20px">
                    <input type="text" value="Laboratories" name="type" hidden>
                    <button type="submit" class="btn btn-warning btn-lg">Search Laboratory</button>
                </form>
                <form method="post" action="/search/coAuthors">
                    <input type="text" value="Co-Authors" name="type" hidden>
                    <button type="submit" class="btn btn-warning btn-lg">Search Co-Authors</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>
