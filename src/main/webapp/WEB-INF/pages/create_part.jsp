<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="section/head.jsp"%>
</head>
<body>
    <%@include file="section/navbar.jsp"%>
    <div class="container">
        <c:if test="${empty part}">
            <div class="buty_header">
                <p>Добавить деталь</p>
            </div>
            <c:url var="addPart" value="/addPart" />
            <form action="${addPart}" method="POST">
                <div class="form-group row">
                    <label for="inputNameDetail" class="col-sm-2 col-form-label">Название детали</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" id="inputNameDetail" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputCount" class="col-sm-2 col-form-label">Количество</label>
                    <div class="col-sm-10">
                        <input type="text" name="count" class="form-control" id="inputCount" required>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-2">Выбрать:</div>
                    <div class="col-sm-10">
                        <div class="form-check">
                            <input class="form-check-input" name="needed" type="checkbox" id="checkNeed">
                            <label class="form-check-label" for="checkNeed">
                                Необходима деталь для компьютера?
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-primary">Добавить</button>
                    </div>
                </div>
            </form>
        </c:if>
        <c:if test="${!empty part}">
            <div class="buty_header">
                <p>Редактировать деталь</p>
            </div>
            <c:url var="editPart" value="/editPart" />
            <form action="${editPart}" method="POST">
                <div class="form-group row">
                    <label for="inputNameDetail1" class="col-sm-2 col-form-label">Название детали</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" id="inputNameDetail1" value="${part.name}" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputCount1" class="col-sm-2 col-form-label">Количество</label>
                    <div class="col-sm-10">
                        <input type="text" name="count" class="form-control" id="inputCount1" value="${part.amount}" required>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-2">Выбрать:</div>
                    <div class="col-sm-10">
                        <div class="form-check">
                            <c:if test="${part.needed==true}"><input class="form-check-input" name="needed" type="checkbox" checked id="checkNeed1"></c:if>
                            <c:if test="${part.needed==false}"><input class="form-check-input" name="needed" type="checkbox" id="checkNeed1"></c:if>
                            <label class="form-check-label" for="checkNeed1">
                                Необходима деталь для компьютера?
                            </label>
                            <input hidden name="id" value="${part.id}">
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-primary">Редактировать</button>
                    </div>
                </div>
            </form>
        </c:if>
    </div>
</body>
</html>
