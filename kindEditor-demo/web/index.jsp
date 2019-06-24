<%--
  Created by IntelliJ IDEA.
  User: Mryang
  Date: 2019/6/24
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/kindEditor/themes/default/default.css" />
    <script charset="utf-8" src="${pageContext.request.contextPath}/Resources/kindEditor/kindeditor-all-min.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/Resources/kindEditor/lang/zh-CN.js"></script>


  <%-- 以下是 --%>
    <script>
        //默认模式  注意：下方中的content属性值要与textarea的name属性值相同才可以
        var editor;
        KindEditor.ready(function(K) {
            editor = K.create('textarea[name="content"]', {
                allowFileManager : true,
                uploadJson:'${pageContext.request.contextPath}/kindeditorUploadServlet',
                fileManagerJson:'${pageContext.request.contextPath}/kindeditorFileManagerServlet'
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
  <li>
    <label>文章正文</label>
    <textarea id="entityContent" name="content" style="width:800px;height:400px;visibility:hidden;" data-rule-required="true">
    </textarea>
  </li>
  </body>
</html>
