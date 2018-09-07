<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/part_list">Parts-list</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/part_list">Главная</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/create">Добавить деталь</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" action="/part_list">
            <input class="form-control mr-sm-2" type="search" placeholder="По названию детали" name="searchName" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Поиск</button>
        </form>
    </div>
</nav>