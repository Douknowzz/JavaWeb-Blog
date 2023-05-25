<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>${article.title} | MyBlog</title>
		<!-- Bootstrap core CSS -->
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<!-- 引入本页面的特殊样式 -->
		<link type="text/css" rel="stylesheet" href="../css/article.css" />
		<link type="text/css" rel="stylesheet" href="../css/comment.css" />
	</head>
	<body>
		<div class="head_line"></div>
		<div class="container" id="main">
			<div class="head">
				<div id="title">
					<h2>
						<a href="/index.jsp">MyBlog</a>
					</h2>
				</div>
			</div>

			<div id="article">
				<div id="a_head ">
					<h3>${article.title}</h3><br/>
					<div>
						<h5>
<%--							<span>${article.time}</span> <a href="/Blog/SortServlet?get=${article.sort}">${article.sort}</a>--%>
							<span>${article.time}</span> <a href="/SortServlet?get=${article.sort}">${article.sort}</a>
							${article.author}
						</h5>
					</div>
					<div class="r_div">
						<h5>
							<span class="glyphicon glyphicon-eye-open">&nbsp;${article.visit}&nbsp;</span>
						 	<span class="glyphicon glyphicon-heart" id="love">&nbsp;${article.star}&nbsp;</span>
						 	<span	class="glyphicon glyphicon-comment">&nbsp;${article.comment}&nbsp; </span>
						</h5>
					</div>
					<div id="tag">
						<c:forEach var="t" items="${article_tags}">
<%--							<a href="/Blog/TagsServlet?get=${t.tag}">${t.tag}&nbsp;</a>--%>
							<a href="/TagsServlet?get=${t.tag}">${t.tag}</a>
						</c:forEach>
					</div>
				</div>
			</div>

			<div class="line"></div>

			<div id="a_content">
<%--			<!-- 引入 show.jsp 显示文章内容 ${article.content}-->--%>
				<jsp:include page="/page/show.jsp"/>
			</div>

			<div>
				<div class="f_div">
					<span class="glyphicon glyphicon-chevron-left"></span>
					<c:choose>
						<c:when test="${article_pre!=null}">
<%--							<a href="/Blog/ArticleServlet?id=${article_pre.id}">&nbsp;上一篇:${article_pre.title}</a>--%>
							<a href="/ArticleServlet?id=${article_pre.id}">上一篇:${article_pre.title}</a>
						</c:when>
						<c:otherwise>
							&nbsp;没有更早的文章了
						</c:otherwise>					
					</c:choose>
				</div>				
				<div class="r_div">
					<c:choose>
						<c:when test="${article_next!=null}">
							<a href="/ArticleServlet?id=${article_next.id}">下一篇:&nbsp;${article_next.title}</a>
						</c:when>
						<c:otherwise>
							&nbsp;没有更多的文章了
						</c:otherwise>					
					</c:choose>
					<span class="glyphicon glyphicon-chevron-right"></span>
				</div>
				
				<div><span class="btn btn-default" style="color:#d9534f;"  onclick="likeThisArticle(${article.id})" >点赞</span></div><br/>
			</div>
			
			<div class="line"></div>
			
			<!-- 评论 -->					
			<div class="comment">
				<div class="r_div">
					<a href="#comment"><span class="glyphicon glyphicon-pencil">&nbsp;写评论....</span></a>
				</div>
				<!-- 加载文章评论 -->
				<c:if test="${comment!=null}">
					<c:forEach var="comm" varStatus="status" items="${comment}">
						<div class="row" >
							<div class="f_div">
								<img src="../img/comment.jpg" height="50" width="50"  class="img-circle"/>&nbsp;&nbsp;
								<span style="color: #428bca"> ${comm.nickname}</span>
								<span>&nbsp;&nbsp;${comm.time}</span>
							</div>
							<div id="c_content" class="c_left">
								<pre>${comm.content }</pre>
							</div>
							<div class="r_div">
								<a><span class="glyphicon glyphicon-thumbs-up"  onclick="star(this,${comm.id})">${comm.star}</span></a>&nbsp;
								<a><span class="glyphicon glyphicon-thumbs-down" onclick="diss(this,${comm.id})">${comm.diss}</span></a>&nbsp;
								<!-- admin here -->
								<c:if test="${sessionScope.user!=null}">
									<span class="btn btn-default" style="color:red;" onclick="deleteComment(this,${comm.id})">删除</span>&nbsp;
								</c:if>
							</div>
							<div class="line"></div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<!-- 这里可以扩展子评论 -->
			<!-- 写评论 -->
			<div id="comment">
<%--				<form action="/Blog/NewCommentServlet?id=${article.id}" method="post">--%>
				<form action="/NewCommentServlet?id=${article.id}" method="post">
					<input  style="width:30%" class="form-control" type="text" name="w_nickname" value="热心网友"  >
					<br/>
					<textarea style="resize:none; width:100%; height:180px;" name="w_content"></textarea>
					<br/>
					<br/>
					<input  class="btn btn-default" type="submit" value="评论" onclick="onclick"/>
					<br/>
				</form>
			</div>

			<div class="line"></div>
		</div>

		<div id="footer">
			<a href="/index.jsp">MyBlog首页&nbsp;&nbsp;</a>|
			<a href="#">&nbsp;&nbsp;返回顶部</a>
		</div>

<%--		内部的js--%>
		<script>
			/*
            * 获取ajax处理对象
             * @returns {xmlhttp}
             */
			function getXHR(){
				let xmlhttp;
				if (window.XMLHttpRequest) {
					xmlhttp = new XMLHttpRequest();
				} else {
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				return xmlhttp;
			}
			/**
			 * 点赞这个ariticle
			 * @param article_id
			 */
			function likeThisArticle(article_id){
				let url = "/AriStarServlet?id="+article_id ;
				// 获取ajax
				let xmlhttp = getXHR();
				xmlhttp.onreadystatechange = function() {
					if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
						// 处理服务器收到的请求响应
						var res = xmlhttp.responseText;
						// 解析json对象
						var res = eval('(' + res + ')');
						if (res.msg == "success") {
							//返回 ”success“
							document.getElementById("love").innerHTML= "&nbsp;"+ res.new_star+"&nbsp;";
						}else{
							alert("不要狂点呀...");
						}
					}
				}
				xmlhttp.open("POST", url, true);
				xmlhttp.send();
			}


			/*
             *删除评论
             */
			function deleteComment(component,comment_id){
				let container = component.parentNode.parentNode;
				//alert(container);
				let url = "/DelCommentServlet?id="+comment_id ;
				// 获取ajax
				let xmlhttp = getXHR();
				xmlhttp.onreadystatechange = function() {
					if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
						// 处理服务器收到的请求响应
						var res = xmlhttp.responseText;
						// 解析json对象
						var res = eval('(' + res + ')');
						// alert( res.msg );
						if(res.msg == "success"){
							//删除评论的视图
							let p = container.parentNode;
							p.removeChild(container);
						}
					}
				}
				xmlhttp.open("POST", url, true);
				xmlhttp.send();
			}

			/**
			 * 点击了star
			 */
			function star(component, comment_id) {

				var url = "/StarCommentServlet?id="+comment_id ;
				// 获取ajax
				var xmlhttp = getXHR();
				xmlhttp.onreadystatechange = function() {
					if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
						// 处理服务器收到的请求响应
						var res = xmlhttp.responseText;
						// 解析json对象
						var res = eval('(' + res + ')');
						if (res.msg == "success") {
							//返回 ”success“
							component.innerHTML = res.new_star;
						}else{
							alert("不要狂点呀...");
						}
					}
				}
				xmlhttp.open("POST", url, true);
				xmlhttp.send();
			}

			/**
			 * 点击了diss
			 */
			function diss(component, comment_id) {

				let url = "/DislikeCommentServlet?id="+comment_id ;
				// 获取ajax
				let xmlhttp = getXHR();
				xmlhttp.onreadystatechange = function() {
					if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
						// 处理服务器收到的请求响应
						var res = xmlhttp.responseText;
						// 解析json对象
						var res = eval('(' + res + ')');
						if (res.msg == "success") {
							//返回 ”success“
							component.innerHTML = res.new_diss;
						}else{
							alert("不要狂点呀...");
						}
					}
				}
				xmlhttp.open("POST", url, true);
				xmlhttp.send();
			}

		</script>
	</body>
</html>