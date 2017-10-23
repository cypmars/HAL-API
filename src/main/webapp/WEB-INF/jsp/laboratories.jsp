<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.springframework.web.client.RestTemplate" %>
<%@ page import="com.polytech.dataAPI.HALRequest" %>
<%@ page import="com.polytech.dataAPI.HALValue" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Cyprien
  Date: 27/09/2017
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
</head>
<body>
    <div class="container" style="margin-top:100px">
        <h1 class="display-5 text-center">For instance you can research documents by <span class="text-warning">Laboratory or University</span></h1>
        <br/><br/><br/>
        <div class="text-center">
            <table class="table table-striped table-responsive" id="myTable">
                <thead class="thead-inverse">
                <tr>
                    <th class="text-warning" style="font-size:1.5em">Laboratories AND Universities</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ values }" var="value" varStatus="status">
                    <c:choose>
                        <c:when     test="${status.count%2 > 0}">
                            <tr>
                                <td><span style="float:left;"><c:out value="${value}"/></span> <form method="get" action="/halLaboratories"><input type="text" value="${value}" name="lab" hidden><span style="float: right;"><button class="btn btn-warning btn-sm" type="submit">see Articles</button></span></form></td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

    <script>
        $(document).ready(function(){
            $('#myTable').DataTable({
                paging:false
            });
        });
    </script>
</body>
</html>
