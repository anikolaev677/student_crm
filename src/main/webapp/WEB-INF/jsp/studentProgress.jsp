<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<nav>
    <div class="row justify-content-start">
        <div class="col-xs-2 px-3 mt-3 mt-md-3 mt-lg-3 mb-2">
            <a href="/" class="btn btn-outline-secondary btn-sm font-size-lg">На главную</a>
        </div>
        <div class="col-xs-2 mt-3 mt-md-3 mt-lg-3 mb-2">
            <a href="students" class="btn btn-outline-secondary btn-sm font-size-lg">Назад</a>
        </div>
    </div>
</nav>
<section>
    <div class="row">
        <div class="col-lg-2"></div>
        <div class="justify-content-start"><h5 class="text-color-table pl-3 mb-n1 mt-2">Отображена успеваемость для
            следущего студента:</h5></div>
    </div>
    <div class="row justify-content-center">
        <div class="overflow-auto col-sm-12 col-lg-8 mt-2">
            <table class="table table-bordered table-hover text-color-table">
                <thead>
                <tr class="text-center text-color-table p-td-th-xs">
                    <th>Фамилия</th>
                    <th>Имя</th>
                    <th>Группа</th>
                    <th class="text-nowrap">Дата поступления</th>
                </tr>
                </thead>
                <tbody>
                <tr class="text-color-table">
                    <c:if test="${data.student.name ne null}">
                        <td class="text-left text-nowrap">${data.student.surname}</td>
                        <td class="text-left text-nowrap">${data.student.name}</td>
                        <td class="text-left text-nowrap">${data.student.group}</td>
                        <td class="text-center"><fmt:formatDate pattern="dd/MM/yyyy"
                                                                value="${data.student.date_receipt}"/></td>
                    </c:if>
                    <c:if test="${data.student.name == null}">
                        <td class="text-center text-nowrap" colspan="4">< нет записей ></td>
                    </c:if>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
<section>
    <div class="row justify-content-sm-center">
        <div class="col-auto col-lg-8">
            <div class="row justify-content-md-center">
                <div class="col-sm-6 col-md-7 overflow-auto">
                    <table class="table table-bordered table-hover text-color-table d-lg-table">
                        <thead>
                        <tr class="text-center text-color-table p-td-th-xs">
                            <th>Дисциплина</th>
                            <th>Оценка</th>
                            <c:if test="${role eq 3}">
                                <th class="p-td-th-xs">
                                    <img class="iconCheck"
                                         src="../../resources/images/icons-1.0.0-alpha2/icons/check-circle.svg"/>
                                </th>
                            </c:if>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${data.disciplines}" var="d" varStatus="i">
                            <tr class="text-color-table">
                                <td class="text-left text-nowrap">${d.discipline}</td>
                                <c:choose>
                                    <c:when test="${d.mark == 0}">
                                        <td class="text-center">&lt;пусто&gt;</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td class="text-center">${d.mark}</td>
                                    </c:otherwise>
                                </c:choose>
                                <c:if test="${role eq 3}">
                                    <td class="font-size-lg p-td-th-xs p-td-th-md p-td-th-lg">
                                        <select class="select not-border" name="setGrades"
                                                form="setGradeForm">
                                            <option value="0" selected>Выбрать</option>
                                            <option value="5">5</option>
                                            <option value="4">4</option>
                                            <option value="3">3</option>
                                            <option value="2">2</option>
                                        </select>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        <c:if test="${data.disciplines[0] == null}">
                            <tr>
                                <c:choose>
                                    <c:when test="${role ne 2}">
                                        <td colspan="3" class="text-center text-color-table">< нет записей ></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td colspan="2" class="text-center text-color-table">< нет записей ></td>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-6 col-md-5">
                    <div class="row justify-content-start justify-content-md-between">
                        <div class="col-sm-4 col-md-5">
                            <h6><b class="text-color-table">Выбрать семестр:</b></h6>
                        </div>
                        <div class="col-sm-7 col-md-7">
                            <form action="student-progress" method="get">
                                <label>
                                    <select type="text" class="form-control select font-size-lg mr-4" name="termId">
                                        <c:forEach items="${terms}" var="t">
                                            <c:choose>
                                                <c:when test="${t.id eq termId}">
                                                    <option value="${t.id}" selected>${t.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${t.id}">${t.name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${terms[0].name == null}">
                                            <tr>
                                                <option>< нет записей ></option>
                                            </tr>
                                        </c:if>
                                    </select>
                                </label>
                                <button type="submit"
                                        class="btn btn-sm btn-outline-secondary font-size-lg ml-2 ml-sm-0 ml-md-0">
                                    Выбрать
                                </button>
                                <input type="hidden" name="idProgressStudent" value="${data.student.id}">
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <%-- <c:set value="0" var="s"/>
                             <c:forEach items="${data.marks}" var="dm" varStatus="i">
                                 <c:set var="sum" value="${s = s + dm}"/>
                                 <c:set var="count" value="${i.count}"/>
                             </c:forEach>--%>
                            <h5 class="text-color-table">Средняя оценка за семестр:
                                <b class="color-header">
                                    ${averageMark}
                                    <%--                                    <c:out value="${Math.ceil((sum div count * 100)) div 100.0}"/>--%>
                                </b>
                                балла.
                            </h5>
                        </div>
                    </div>
                    <c:if test="${role eq 3}">
                        <div class="row justify-content-md-between pt-2">
                            <div class="col-sm-5 col-md-5">
                                <h6 class="text-color-table"><b>Выставление оценок:</b></h6>
                            </div>
                            <div class="col-sm-6 col-md-7">
                                <form id="setGradeForm" action="student-progress" method="get">
                                    <button type="submit"
                                            class="btn btn-sm  btn-outline-secondary font-size-md font-size-lg">
                                        Выставить оценки
                                    </button>
                                    <input type="hidden" name="idProgressStudent" value="${data.student.id}">
                                    <input type="hidden" name="termId" value="${termId}">
                                </form>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="col-md-2"></div>
