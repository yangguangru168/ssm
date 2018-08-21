<%@ page languagel="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="Content-Type" cntent="text/html;charset=UTF-8">
</head>
<title>index.js</title>
<%
    pageContext.setAttribute("APP_PASH",request.getContextPath());
    System.out.println("地址地址"+request.getContextPath());
%>
<script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PASH}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PASH}/static/bootstrap/js/bootstrap.min.js"></script>
<link href="${APP_PASH}/static/css/index.css" type="text/css" rel="stylesheet">
<body>
<%--导航--%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a href="#" class="navbar-brand">Project-name</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse" >
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">Concat</a></li>
                <li><a href="#">ss</a></li>

            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1 class="ak">jiayoujiayou</h1>
        </div>
    </div>
        <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">增加</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
        <%--列表--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered">
                <tr>
                    <th>film_id</th>
                    <th>title</th>
                    <th>description</th>
                    <th>languageId</th>
                    <th>操作</th>
                </tr>
                <%--遍历后端获取集合数据封装在Page里面，然后取出来--%>
                <c:forEach items="${pageInfo.list }" var="fm">
                <tr>
                    <th>${fm.filmId}</th>
                    <th>${fm.title}</th>
                    <th>${fm.description}</th>
                    <th>${fm.languageId}</th>
                    <th>
                        <button class="btn btn-primary btn-sm">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            编辑
                        </button>
                        <button class="btn btn-danger btn-sm">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                            删除
                        </button>
                    </th>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
        <%--分页--%>
    <div class="row">
        <%--分页信息--%>
        <div class="col-md-6">
            当前第${pageInfo.getPageNum()}页,总共有${pageInfo.getPages()}页,有${pageInfo.getTotal()}条记录
        </div>
        <%--分页条--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PASH}/film?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li><a href="${APP_PASH}/film?pn=${pageInfo.getPageNum()-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span></a>
                        </li>
                    </c:if>
                    <%--连续页码数--%>
                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageInfo.getPageNum()}">
                            <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.getPageNum()}">
                            <li ><a href="${APP_PASH}/film?pn=${page_Num}">${page_Num}</a></li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${pageInfo.hasNextPage}">
                        <li><a href="${APP_PASH}/film?pn=${pageInfo.getPageNum()+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span></a>
                        </li>
                    </c:if>
                    <li><a href="${APP_PASH}/film?pn=${pageInfo.getPages()}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>

</body>

</html>
