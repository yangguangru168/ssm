<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="Content-Type" cntent="text/html;charset=UTF-8">
</head>
<title>index.js</title>
<%
    pageContext.setAttribute("APP_PASH",request.getContextPath());
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

<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="updateTile">更新信息</h4>
            </div>
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">标题</label>
                    <p class="form-control-static" id="updata_title"></p>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">描述</label>
                    <div class="col-sm-6">
                        <input type="text" name="description" class="form-control" id="description_update_input" placeholder="请输入描述">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">语言</label>
                    <div class="col-sm-6">
                        <select class="form-control" name="languageId" id="updatelangId">
                        </select>
                        <span class="help-block"></span>
                    </div>
                </div>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_btn">更新</button>
            </div>
        </div>
    </div>
</div>
    <%--新增form--%>
<div class="modal fade" id="filmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加</h4>
            </div>
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">标题</label>
                    <div class="col-sm-6">
                        <input type="text"  name="title" class="form-control" id="title_input" placeholder="请输入标题">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">描述</label>
                    <div class="col-sm-6">
                        <input type="text" name="description" class="form-control" id="description_input" placeholder="请输入描述">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">语言</label>
                    <div class="col-sm-6">
                        <select class="form-control" name="languageId" id="langId">
                        </select>
                        <span class="help-block"></span>
                    </div>
                </div>
            </form>
                    <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="affirm_data">确认</button>
            </div>
        </div>
    </div>
</div>



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
            <button class="btn btn-primary" id="add_film_modal">增加</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--列表--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered" id="film_table">
                <thead>
                    <tr>
                        <th>film_id</th>
                        <th>标题</th>
                        <th>描述</th>
                        <th>语言</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--分页--%>
    <div class="row">
        <%--分页信息--%>
            <div class="col-md-6" id="page_info_area"></div>
        <%--分页导航条--%>
            <div class="col-md-6" id="page_info_nav"></div>
        </div>
    </div>
</div>
</body>
    <script type="text/javascript">

        var totalAll,current;
        /*ajax请求*/
        $(function () {
            to_page(1);
        });
        /*点击按钮跳转数据*/
        function to_page(pn) {
            $.ajax({
                url:"${APP_PASH}/film",
                data:"pn="+pn,
                type:"post",
                success:function (result) {
                    film_table(result);
                    page_info(result);
                    pageInfo_nav(result);
                }
            })
        }
        /*显示列表*/
        function film_table(result) {
            /*创建之前清空*/
            $("#film_table tbody").empty();

            var film_list = result.map.pageInfo.list;
            $.each(film_list,function (index,item) {
                var filmIdTD = $("<td></td>").append(item.filmId);
                var filmTitle = $("<td></td>").append(item.title);
                var filmDescription = $("<td></td>").append(item.description);
                var filmLanguageId = $("<td></td>").append(item.languageyy.languagel);
                var editTD = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑"));
                /*为每一个编辑按钮添加edit_id*/
                editTD.attr("edit_id",item.filmId);
               var deleteTD = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                   .append($("<span></span>").addClass("glyphicon glyphicon-trash").append("删除"));
                var ediDelete = $("<td></td>").append(editTD).append("  ").append(deleteTD);
                $("<tr></tr>").append(filmIdTD).append(filmTitle).append(filmDescription).
                append(filmLanguageId).append(ediDelete).appendTo("#film_table tbody");
            })
        }
        /*分页信息*/
        function page_info(result) {
            $("#page_info_area").empty();
            $("#page_info_area").append
            ("当前"+result.map.pageInfo.pageNum+"页"+","+
                "总共"+result.map.pageInfo.pages+"有页"+","+"有"+result.map.pageInfo.total+"条记录");
             totalAll= result.map.pageInfo.total;
             current=result.map.pageInfo.pageNum;
        }
        /*分页导航栏*/
        function pageInfo_nav(result) {
            $("#page_info_nav").empty();
            var ul = $("<ul></ul>").addClass("pagination");
            var pageFirst = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var lastPage = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
            if(result.map.pageInfo.hasPreviousPage == false){
                pageFirst.addClass("disabled");
                lastPage.addClass("disabled");
            }else {
                pageFirst.click(function () {
                    to_page(1);
                });
                lastPage.click(function () {
                    to_page((result.map.pageInfo.pageNum)-1);
                })
            }
            var pageLast = $("<li></li>").append($("<a></a>").attr("href","#").append("末页"));
            var endPage = $("<li></li>").append($("<a></a>").attr("href","#").append("&raquo;"));
            if(result.map.pageInfo.hasNextPage == false){
                pageLast.addClass("disabled");
                endPage.addClass("disabled");
            }else {
                pageLast.click(function () {
                    to_page(result.map.pageInfo.pages);
                });
                endPage.click(function () {
                    to_page((result.map.pageInfo.pageNum)+1);
                })
            }
            ul.append(pageFirst).append(lastPage);
            $.each(result.map.pageInfo.navigatepageNums,function (index,navList) {
                var pageIndex = $("<li></li>").append($("<a></a>").append(navList).attr("href","#"));
                /*判断当前页面是否等于导航栏的数字，true则添加样式高亮*/
                if( result.map.pageInfo.pageNum == navList){
                    pageIndex.addClass("active");
                }
                /*点击按钮触发ajax重新请求*/
                pageIndex.click(function () {
                    to_page(navList);
                });
                ul.append(pageIndex);
            });
            ul.append(endPage).append(pageLast);
            var nav = $("<nav></nav>").append(ul);
            nav.appendTo("#page_info_nav");
        }

        /*新增弹出form,以及每次打开重置表单*/
        $("#add_film_modal").click(function () {
            clean("#filmModal form");
            getLanguage("#langId");
            $('#filmModal').modal({
                backdrop: "static"
            })
        });
        /*获取language的全部值，并填充到选择列表里面*/
        function getLanguage(ele) {
            $(ele).empty();
            $.ajax({
                url:"${APP_PASH}/language",
                type:"post",
                success:function (result) {
                    /*每次获取之前先清空*/
                    var list = result.map.lge;
                    $.each(list,function (index,item) {
                        var option = $("<option></option>").append(this.languagel).attr("value",this.languageId);
                        option.appendTo(ele);
                    })
                }
            })
        }

        /*校验表单的方法*/
        function show_form_varify(id,status,msg) {
            $(id).parent().removeClass("has-success has-error");
            $(id).next("span").text(" ");
            if("success"==status){
                $(id).parent().addClass("has-success");
                $(id).next("span").text(msg);
            }else {
                $(id).parent().addClass("has-error");
                $(id).next("span").text(msg);
            }
        }
        /*form表单校验*/
        function form_verify(){
            /*title*/
            var titleName = $("#title_input").val();
            var regTilteName =/(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
            if(!regTilteName.test(titleName)){
                show_form_varify("#title_input","error","2-5为中文和3-16字符");
                return false;
            }else {
                show_form_varify("#title_input","success","");
            }
            /*descripton*/
                var dec = $("#description_input").val();
                var regDec = /(^[\u2E80-\u9FFF]{6,100}$)/;
                if(!regDec.test(dec)){
                    show_form_varify("#description_input","error","中文6-100字符");
                    return false;
                }else {
                    show_form_varify("#description_input","success","");
                }
            /*lang*/
            var lg = $("#langId").val();
            if (lg>6){
                return false;
            }else {
                show_form_varify("#langId","success","");
            }
            return true;
        }

        /*点击确认保存数据*/
        $("#affirm_data").click(function () {
            if (!form_verify()){
                return false;
            }
            /*保存之前判断title是否可用，ture则可以保存*/
            if($(this).attr("check_value")=="fail"){
                return false;
            }
            $.ajax({
                url:"${APP_PASH}/add",
                type:"POST",
                data:$("#filmModal form").serialize(),
                success:function (result) {
                    /*后端也校验*/
                    if (result.code==100){
                        $("#filmModal").modal('hide');
                        to_page(totalAll);
                    } else {
                        if(result.map.fieldErrors.title != undefined){
                            show_form_varify("#title_input","error",result.map.fieldErrors.title);
                        }
                        else if (result.map.fieldErrors.description != undefined){
                            show_form_varify("#description_input","error",result.map.fieldErrors.description);
                        }
                    }

                }
            })
        });

        /*验证title是否已经存在*/
        $("#title_input").blur(function () {
            var te = this.value;
            $.ajax({
                url:"${APP_PASH}/checkTitle",
                type:"get",
                data:"name="+te,
                success:function (result) {
                    if(result.code==100){
                        show_form_varify("#title_input","success","title可用");
                        /*如果可用给确认按钮添加属性*/
                        $("#affirm_data").attr("check_value","success");
                    }else {
                        console.log(result.map.check_msg);
                        show_form_varify("#title_input","error",result.map.check_msg);
                        $("#affirm_data").attr("check_value","fail");
                    }
                }
            })
        });

        /*点击新增清除所有样式*/
        function clean(ele) {
            $(ele)[0].reset();
            $(ele).find("*").removeClass("has-success has-error");
            $(ele).find(".help-block").text(" ")
        }
        /*根据id查询film数据*/
        function selcetFilm(id){
            $.ajax({
                url:"${APP_PASH}/edit/"+id,
                type:"GET",
                success:function (result) {
                    $("#updata_title").text(result.map.selectFilm.title);
                    $("#description_update_input").val(result.map.selectFilm.description);
                    $("#updatelangId").val(result.map.selectFilm.languageId)
                }
            })
        }
        /*点击编辑按钮*/
        $(document).on("click",".edit_btn",function () {
            selcetFilm($(this).attr("edit_id"));
            getLanguage("#updatelangId");
            /*添加edit_id添加到按钮*/
            $("#update_btn").attr("edit_id",$(this).attr("edit_id"))
            $('#updateModal').modal({
                backdrop: "static"
            })
        });
        /*点击更新按钮*/
        $("#update_btn").click(function () {
            /*校验*/
            var dec = $("#description_update_input").val();
            var regDec = /(^[\u2E80-\u9FFF]{6,100}$)/;
            if(!regDec.test(dec)){
                show_form_varify("#description_update_input","error","中文6-100字符");
                return false;
            }else {
                show_form_varify("#description_update_input","success","");
            }
            /*ajax请求*/
            $.ajax({
                url:"${APP_PASH}/update/"+$(this).attr("edit_id"),
                type:"PUT",
                data: $("#updateModal form").serialize(),
                success:function (result) {
                    $("#updateModal").modal('hide');
                        to_page(current);
                }
            })
        })

    </script>
</html>
