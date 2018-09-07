<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <%@include file="section/head.jsp"%>
    </head>
    <body>
        <%@include file="section/navbar.jsp"%>
        <div class="container">
            <c:if test="${!empty searchPart}">
                <div class="buty_header">
                    <p>Результат поиска</p>
                </div>
                <div class="sort_button">
                    <a href="/part_list">На главную страницу</a>
                </div>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Наименование</th>
                        <th scope="col">Необходимость</th>
                        <th scope="col">Количество</th>
                        <th scope="col">Изменить</th>
                        <th scope="col">Удалить</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="part" items="${searchPart}">
                            <tr>
                                <th>${part.id}</th>
                                <td>${part.name}</td>
                                <td>${part.needed == true ? "Да" : "Нет"}</td>
                                <td>${part.amount}</td>
                                <td><a href="/edit/${part.id}">Изменить</a></td>
                                <td><a href="/remove/${part.id}">Удалить</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${!empty partList}">
                <div class="buty_header">
                    <p>Список деталей</p>
                </div>
                <div class="sort_button">
                    <a href="?sort=name&pageNumber=${pageNumber}">По имени</a> <a href="?sort=needed&pageNumber=${pageNumber}">По необходимости</a> <a href="?sort=cont&pageNumber=${pageNumber}">По Количеству</a>
                </div>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Наименование</th>
                            <th scope="col">Необходимость</th>
                            <th scope="col">Количество</th>
                            <th scope="col">Изменить</th>
                            <th scope="col">Удалить</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="part" items="${partList}">
                            <tr>
                                <th>${part.id}</th>
                                <td>${part.name}</td>
                                <td>${part.needed == true ? "Да" : "Нет"}</td>
                                <td>${part.amount}</td>
                                <td><a href="/edit/${part.id}">Изменить</a></td>
                                <td><a href="/remove/${part.id}">Удалить</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <c:if test="${pageCount > 1}">
                    <table>
                        <tr>
                            <c:forEach var="i" begin="1" end="${pageCount}">
                                <th><a href="/part_list?pageNumber=${i}<c:if test="${!empty sort}">&sort=${sort}</c:if>">${i}</a></th>
                            </c:forEach>
                        </tr>
                    </table>
                </c:if>
                <p> Всего можно собрать ${minCount} Компьтеров!</p>
            </c:if>
        </div>
    <%@include file="section/scripts.jsp"%>
    </body>
</html>
