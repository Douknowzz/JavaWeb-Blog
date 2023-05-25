<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>时间轴 | MyBlog</title>
		<!-- Bootstrap core CSS -->
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<!-- 引入页面公共样式 -->
		<link type="text/css" rel="stylesheet" href="../css/public.css" />
		<!-- 引入本页面的特殊样式 -->
		<link type="text/css" rel="stylesheet" href="../css/axis.css" />
	</head>
	<body>
		<div class="head_line"></div>
		<div class="container" id="main">
			<div id="header"></div>
			<div class="row c_center">
				<div class="col-md-3" id="left_content">
					<div id="title">
						<h2>
							<a href="/index.jsp">MyBlog</a>
						</h2>
						<h5 class="text-muted">Love all, trust a few</h5>
					</div>

					<div class="c_center" id="person_info">
						<img src="../img/header.jpg" height="130" width="130" alt="what?" class="img-circle">
						<h5 class="text-muted">do wrong to none.</h5>
					</div>

					<div id="list">
						<table class="table table-hover c_center">
							<tr>
								<td><a href="#"><span class="glyphicon glyphicon-home"></span>&nbsp&nbsp;首页</a></td>
							</tr>
							<tr>
<%--							<td><a href="/Blog/SortServlet?get=all"><span class="glyphicon glyphicon-list"></span>--%>
								<td><a href="/SortServlet?get=all"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;分类</a></td>
							</tr>
							<tr>
<%--							<td><a href="/Blog/TagsServlet?get=all"><span class="glyphicon glyphicon-tags"></span>--%>
								<td><a href="/TagsServlet?get=all"><span class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;标签</a></td>
							</tr>
							<tr>
<%--							<td class="active"><a href="/Blog/AxisServlet"><span class="glyphicon glyphicon-book"></span>--%>
								<td class="active"><a href="/AxisServlet"><span class="glyphicon glyphicon-book"></span>&nbsp;&nbsp;时间轴</a></td>
							</tr>
							<tr>
								<td><a href="../page/about.html"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;关于</a></td>
							</tr>
						</table>
					</div>
					<br />
				</div>
				<div class="col-md-2" id="center_content"></div>
				<div class="col-md-7 " id="axis_div" >
					<!-- 这里初始化时间轴 -->
					<c:forEach var="axis" varStatus="status" items="${axis_list}">
						<c:choose>
							<c:when test="${axis.id==0}">
								<div class="longline_div">
									<div> ${axis.year}</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="line_div">
									<div>
<%--									<a href="/Blog/ArticleServlet?id=${axis.id}">&nbsp;&nbsp;${axis.month}-${axis.day}--%>
										<a href="/ArticleServlet?id=${axis.id}">&nbsp;&nbsp;${axis.month}-${axis.day}&nbsp;&nbsp;&nbsp;&nbsp;${axis.title}</a>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div><!-- 初始化结束 -->
			</div>
					<div class="foot_line"></div>
		</div><!-- container -->

		<div id="footer">
			<a href="#">&nbsp;&nbsp;MyBlog</a>
		</div>
	</body>
</html>