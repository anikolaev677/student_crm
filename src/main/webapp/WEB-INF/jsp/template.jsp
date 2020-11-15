<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="../../resources/css/bootstrap/bootstrap.min-4.3.1.css">
    <link rel="shortcut icon" type="image/x-icon" href="../../resources/images/image/crm.ico"/>
    <script type="text/javascript" src="../../resources/js/jquery-3.4.1.slim.min.js"></script>
    <link rel="text/plane" href="../../resources/css/bootstrap/bootstrap.min.css.map">
    <script type="text/javascript" src="../../resources/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="../../resources/js/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="../../resources/js/popper.min.js"></script>
    <script type="text/javascript" src="../../resources/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="../../resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../resources/js/function.js"></script>
    <link rel="stylesheet" href="../../resources/css/common.css">

    <title>${titlePage}</title>
</head>
<body>
<div class="modal fade" tabindex="-1" role="dialog" id="modalTerm">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-danger">Внимание!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-primary">
                <p>Убедитесь, что создан семестр!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" tabindex="-1" role="dialog" id="modalDiscipline">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-danger">Внимание!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-primary">
                <p>Убедитесь, что создана дисциплина!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
            </div>
        </div>
    </div>
</div>
<div class="container flex-grow-1 pt-2 pt-md-5 mb-4">
    <header>
        <div class="row justify-content-end <c:if test="${currentPage eq '/WEB-INF/jsp/login.jsp' }">justify-content-center</c:if>">
            <div id="titleHeader" class="col-sm-12 col-lg-8">
                <div id="innerHeader"><h3>Система управления студентами и их
                    успеваемостью</h3></div>
            </div>
            <c:if test="${currentPage ne '/WEB-INF/jsp/login.jsp' }">
                <div class="col-6 col-sm-4 col-md-3 col-lg-2 mt-2 mt-md-2 mt-lg-0">
                    <a id="logout" class="col-auto btn btn-link btn-sm btn-block"
                       href="logout"
                       tabindex="">Выйти, ${username}</a>
                </div>
            </c:if>
        </div>
    </header>

    <jsp:include page="${currentPage}" flush="true"/>

    <c:set var="currentYear" value="<%=new GregorianCalendar().get(Calendar.YEAR)%>"/>
    <div class="end"></div>
</div>
<footer class="flex-shrink-0">
    <div class="col-auto font-size-12px-xs pl-2 pt-sm-2 font-italic p-td-th-xs p-td-th-md">
        &copy; 2020-<c:out value="${currentYear}"/> Алексей Николаев, почта: <a
            href="mailto:nikolaev1972.72@mail.ru">nikolaev1972.72@mail.ru</a>; GitHub:
        <a href="https://github.com/anikolaev677/student_crm">student_crm</a>;
    </div>
</footer>
</body>
</html>
