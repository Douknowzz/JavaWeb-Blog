<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>新的文章 | MyBlog</title>
		<!-- Bootstrap core CSS -->
		<link	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link type="text/css" rel="stylesheet" href="../css/add.css" />

		<%--<link rel="stylesheet" href="../editormd/css/style.css" />--%>
		<%--<link rel="stylesheet" href="../editormd/js/editormd.js" />--%>

		<link rel="stylesheet" type="text/css" href="../editor.md/css/editormd.min.css" />
		<script src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../editor.md/editormd.min.js" type="text/javascript" charset="utf-8"></script>

		<%--<script src="../editormd/js/zepto.min.js"></script>--%>
		<%--<script src="../editormd/js/editormd.js"></script>--%>

		<script src="../js/add.js"></script>
	</head>
	<body>
		<div class="head_line"></div>
		<div class="container" id="main">
			<div id="title">
				<h2><a href="">MyBlog</a></h2>
			</div>
			<form action="/newArticleServlet" method="post">
		   		<div class="info" >
		   			<!-- title -->
		   			<span class="help">标题</span>
		   			<input type="text" class="form-control" name="title" >
		   			<!-- time -->
		   			<span class="help">时间</span>
		   			<input type="text"  class="form-control" name="time" value="${time}" >
		   			<!-- author-->
		   			<span class="help">作者</span>
		   			<input type="text" class="form-control" name="author" >
		   			<!-- sort -->
		   			<span class="help">分类</span><br/>
 					<c:forEach var="s"  items="${sort_count}">
 						<input class="btn btn-default" type="button" value="${s.key}" onclick="sort_click(this)"> &nbsp;
 					</c:forEach>
 					<input type="text" class="form-control"  id="sort" name="sort">
					<!-- tag -->
		   			<span class="help">标签</span><br/>
		   			<c:forEach var="tag" items="${all_tag}">
		   				<input class="btn btn-default" type="button" value="${tag.tag}" onclick="tags_click(this)">&nbsp;
		   			</c:forEach>
		   			<input type="text" class="form-control" id="tags"  name="tags">
		   		</div>
		   		<div class="foot_line"></div>
				<!-- content -->
				<div class="editormd" id="test-editor">
                    <textarea name="content"></textarea>
                </div>
                <br/>
                <input class="btn btn-default" type="submit" value="提交" />
            </form>
			<div class="foot_line"></div>
		</div>
		<div id="footer"><a href="#">&nbsp;&nbsp;MyBlog</a></div> <!-- footer -->
		
		<script type="text/javascript">
			$(function() {
				var editor = editormd("test-editor", {
					width: "50%",	//编辑器的宽度
					height: "500",	//编辑器的高度
					path: "../editor.md/lib/",//这里是一个路径，指向editor.md所需要的依赖文件位置，如果指向不对，那么将会出现文章开头第二章图的效果。,
					saveHTMLToTextarea : true
				});
			});
    	</script>
	</body>
</html>