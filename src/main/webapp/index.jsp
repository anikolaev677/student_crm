<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="resources/css/bootstrap/bootstrap.min-4.3.1.css">
    <link rel="shortcut icon" type="image/x-icon"
          href="${pageContext.request.contextPath}/resources/images/image/crm.ico"/>
    <script type="text/javascript" src="resources/js/jquery-3.4.1.slim.min.js"></script>
    <link rel="text/plane" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css.map">
    <script type="text/javascript" src="resources/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="resources/js/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="resources/js/popper.min.js"></script>
    <script type="text/javascript" src="resources/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/function.js"></script>
    <link rel="stylesheet" href="resources/css/common.css">

    <title>Главная страница</title>
</head>
<body>
<div class="container pt-2 pt-md-5 mb-4">
    <header>
        <div class="row justify-content-end">
            <div id="titleHeader" class="col-sm-12 col-lg-8">
                <div id="innerHeader" class="form-group"><h3>Система управления студентами и их успеваемостью</h3></div>
            </div>
            <div class="col-6 col-md-3 col-lg-2 mt-md-2 mt-lg-0 form-group">
                <a id="logout" class="col-auto btn btn-link btn-sm btn-block" href="logout"
                   tabindex="">Выйти, ${username}</a>
            </div>
        </div>
    </header>

    <%@ include file="/WEB-INF/jsp/home.jsp" %>

    <c:set var="currentYear" value="<%=new GregorianCalendar().get(Calendar.YEAR)%>"/>

    <div class="end"></div>
</div>
<footer class="flex-shrink-0">
    <div class="col-auto font-size-12px-xs pl-2 pt-sm-2 font-italic p-td-th-xs p-td-th-md">
        &copy; 2020-<c:out value="${currentYear}"/> Алексей Николаев, адрес почты: <a
            href="mailto:nikolaev1972.72@mail.ru">nikolaev1972.72@mail.ru</a>;
        GitHub: <a href="https://github.com/anikolaev677/student_crm">https://github.com/anikolaev677/student_crm</a>
    </div>
</footer>
</body>
</html>