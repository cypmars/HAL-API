<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
</head>
<body>
    <div class="container" style="margin-top:100px">
        <h1 class="display-5 text-center">For instance you can research articles by <span class="text-warning">keyword</span></h1>
        <br/><br/><br/>
        <div class=" row text-center">
            <c:forEach items="${ values }" var="value">
                <div class="col-lg-4">
                    <div class="card" style="height:auto; margin-bottom:30px">
                        <div class="card-body" style="height:250px">
                            <c:set var="title">${value.title_s['0']}</c:set>
                            <c:set var="formattedText" value="${fn:toUpperCase(fn:substring(title,0,1))}${fn:toLowerCase(fn:substring(title,1,fn:length(title)))}" />
                            <c:choose>
                                <c:when test="${formattedText.length() > 55}">
                                    <c:set var="titleTronc" value="${fn:substring(formattedText, 0, 55)}"/>
                                    <h5 class="card-title"><c:out value="${titleTronc}"/> ...</h5>
                                </c:when>
                                <c:otherwise>
                                    <h5 class="card-title"><c:out value="${formattedText}"/></h5>
                                </c:otherwise>
                            </c:choose>
                            <p class="card-text">
                            <c:choose>
                                <c:when     test="${value.authFirstName_s.size() > 0}">
                                    <c:out value='${value.authFirstName_s["0"]}'/> <c:out value='${value.authLastName_s["0"]}'/> ...
                                </c:when>
                                <c:otherwise>
                                </c:otherwise>
                            </c:choose>
                            </p>
                            <c:choose>
                                <c:when     test="${value.labStructName_s.size() > 0}">
                                    <p>
                                        <c:out value="${value.labStructName_s['0']}"/> ...
                                    </p>
                                </c:when>
                                <c:otherwise>
                                </c:otherwise>
                            </c:choose>
                            <a href="${value.uri_s}" style="position:absolute; width: 100%; left: 0;bottom:10px;">See More !</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>
