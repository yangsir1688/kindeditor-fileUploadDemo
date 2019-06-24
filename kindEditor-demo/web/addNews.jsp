<%--
  Created by IntelliJ IDEA.
  User: Mryang
  Date: 2019/6/16
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/resource/css/style.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/resource/kindEditor/themes/default/default.css" />
    <script charset="utf-8" src="${pageContext.request.contextPath}/admin/resource/kindEditor/kindeditor-all-min.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/admin/resource/kindEditor/lang/zh-CN.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#saveUpdateForm").validate({debug:false});
        });

        <%--window.KindEditor.ready(function (K) {--%>
            <%--K.create("#entityContent",{--%>
                <%--allowFileManager : true,--%>
                <%--uploadJson:'${pageContext.request.contextPath}/servlet/KindeditorUpload',--%>
                <%--fileManagerJson:'${pageContext.request.contextPath}/servlet/KindeditorFileManager'--%>
            <%--});--%>
        <%--});--%>

        <%--KindEditor.ready(function(K) {--%>
            <%--K.create('#entitycontent', {--%>
                <%--allowFileManager : true,--%>
                <%--uploadJson:'${pageContext.request.contextPath}/servlet/KindeditorUpload',--%>
                <%--fileManagerJson:'${pageContext.request.contextPath}/servlet/KindeditorFileManager'--%>
            <%--});--%>
        <%--});--%>
    </script>
<script>
    //默认模式  注意：下方中的content属性值要与textarea的name属性值相同才可以
    var editor;
    KindEditor.ready(function(K) {
        editor = K.create('textarea[name="content"]', {
            allowFileManager : true,
            uploadJson:'${pageContext.request.contextPath}/kindeditorUploadServlet',
            fileManagerJson:'${pageContext.request.contextPath}/kindeditorFileManager'
        });
        K('input[name=getHtml]').click(function(e) {
            alert(editor.html());
        });
        K('input[name=isEmpty]').click(function(e) {
            alert(editor.isEmpty());
        });
        K('input[name=getText]').click(function(e) {
            alert(editor.text());
        });
        K('input[name=selectedHtml]').click(function(e) {
            alert(editor.selectedHtml());
        });
        K('input[name=setHtml]').click(function(e) {
            editor.html('&lt;h3&gt;Hello KindEditor&lt;/h3&gt;');
        });
        K('input[name=setText]').click(function(e) {
            editor.text('&lt;h3&gt;Hello KindEditor&lt;/h3&gt;');
        });
        K('input[name=insertHtml]').click(function(e) {
            editor.insertHtml('&lt;strong&gt;插入HTML&lt;/strong&gt;');
        });
        K('input[name=appendHtml]').click(function(e) {
            editor.appendHtml('&lt;strong&gt;添加HTML&lt;/strong&gt;');
        });
        K('input[name=clear]').click(function(e) {
            editor.html('');
        });
    });

</script>
</head>
<body>
<div class="formbody">
    <div class="formtitle"><span>新闻信息</span></div>
    <form action="${pageContext.request.contextPath}/newsServlet?op=addNews" method="post">

        <ul class="forminfo">
            <li>
                <label>新闻标题</label>
                <input class="dfinput" type="text" name="title" id="entitytitle"
                       class="dfinput" data-rule-required="true"/>
            </li>
            <li>
                <label>文章简介</label>
                <input class="dfinput" type="text" name="description" id="entitydescription"
                       class="dfinput" data-rule-required="true"/>
            </li>
            <li>
                <label>文章来源</label>
                <input class="dfinput" type="text" name="source" id="entitysource"
                       class="dfinput" data-rule-required="true"/>
            </li>
            <li>
                <label>归属栏目</label>
                <select class="dfinput" name="channel">
                    <c:forEach items="${channels}" var="item">
                        <option value="${item.id}">${item.name}</option>
                    </c:forEach>
                </select>
            </li>
            <li>
                <label>文章作者</label>
                <input class="dfinput" type="text" name="author" id="entityauthor"
                       class="dfinput" data-rule-required="true"/>
            </li>
            <li>
                <label>文章正文</label>
                <%--<input class="dfinput" type="text" name="content" id="entitycontent"--%>
                       <%--class="dfinput" data-rule-required="true"/>--%>
                <textarea id="entityContent" name="content" style="width:800px;height:400px;visibility:hidden;" data-rule-required="true">
                    <%--${entity.content}--%>
                </textarea>
            </li>

            <li>
                <label>点击次数</label>
                <input class="dfinput" type="text" name="click" id="entityclick"
                       class="dfinput" data-rule-required="true"/>
            </li>

            <li><label>&nbsp;</label><input type="submit" class="btn" value="确认保存"/></li>
        </ul>

    </form>
</div>
</body>
</html>
