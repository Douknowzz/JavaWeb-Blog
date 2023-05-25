<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>管理 | MyBlog</title>
		<!-- Bootstrap core CSS -->
		<link	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link type="text/css" rel="stylesheet" href="../css/public.css" />
		<link type="text/css" rel="stylesheet" href="../css/admin.css" />

	</head>
	<body>
		<div class="head_line"></div>
		<div class="container" id="main">
			<div id="header">
				<div>
<%--					<h2><a href="/Blog/login.html">MyBlog-管理</a></h2>--%>
					<h2><a href="#">MyBlog-管理</a></h2>
				</div>
			</div>
				 
			<div class="admin_div">
				<h4 class="btn btn-default">统计</h4>
				<h5> 被访问了 ${visited } 次</h5>
				<h5> 一共有 ${member}个访问者</h5>
			</div>

			<div class="admin_div">
				<h4 class="btn btn-default">管理日志</h4>
				<c:forEach var="a" items="${articles}">
					<div class="list-group-item">
						<span>${a.title}</span>
						<div class="r_div">
							<span>${a.time}</span>
<%--							<a href="/Blog/AdminDataServlet?op=edit_article&&article_id=${a.id}">--%>
							<a href="/AdminArticleServlet?op=edit_article&&article_id=${a.id}">
								<button class="btn btn-default">&nbsp;<span class="glyphicon glyphicon-pencil" style="color:#5bc0de" >编辑</span>&nbsp;</button>
						 	</a>
						 	<button class="btn btn-default" onclick="delete_article(this,'${a.id}')">&nbsp;
						 		<span class="glyphicon glyphicon-trash" style="color:#d9534f" > 删除</span>&nbsp;
							</button>
						</div>
					</div>
				</c:forEach>					
			</div>
				
			<div class="admin_div">
				<h4 class="btn btn-default">管理分类</h4>
				<h5 style="color:#d9534f" >删除分类会删除所有的文章</h5>
				<c:forEach var="s" items="${sort}">				
					<div class="list-group-item">
						<input type="text"  class="sort" value="${s}"   disabled="disabled" style="border:0px;"  >
						<div class="r_div">
							<button class="btn btn-default">&nbsp;<span class="glyphicon glyphicon-pencil" style="color:#5bc0de" onclick="edit_sort(this,'${s}')">编辑</span>&nbsp;</button>
							<button class="btn btn-default">&nbsp;<span class="glyphicon glyphicon-trash" style="color:#d9534f" onclick="delete_sort(this,'${s}')">删除</span>&nbsp;</button>
						</div>
					</div>
				</c:forEach>
			</div>
				
			<div class="admin_div">
				<h4 class="btn btn-default">管理标签</h4>
				<c:forEach var="t" items="${tags}">				
					<div class="list-group-item">
						<input type="text" class="tags"  value="${t.tag}"  disabled="disabled"  style="border:0px">
						<div class="r_div">
							<button class="btn btn-default">&nbsp;<span class="glyphicon glyphicon-pencil" style="color:#5bc0de" onclick="edit_tag(this,'${t.tag}')" >编辑</span>&nbsp;</button>
							<button class="btn btn-default">&nbsp;<span class="glyphicon glyphicon-trash" style="color:#d9534f" onclick="delete_tag(this,'${t.tag}')">删除</span>&nbsp;</button>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="foot_line"></div>
		</div><!-- container -->		
		
		<div id="footer">
			<a href="#">&nbsp;&nbsp;MyBlog</a>
		</div>

<%--		实在受不了了把admin.js的全放在这里了，不放在这里老是请求到奇奇怪怪的路径上，有空问老师吧--%>

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
			/*
             *发送给服务器
             */
			function sendURL(url){
				// 获取ajax
				let xmlhttp = getXHR();
				xmlhttp.onreadystatechange = function() {
//		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
//			//这里可以写 服务器返回解结果后的处理
//		}
				}
				xmlhttp.open("POST", url, true);
				xmlhttp.send();
			}
			/**
			 * 在某个分类中找到指定的一个input
			 * @param class_name
			 * @param name
			 * @returns
			 */
			function findInputInClass(class_name , name){
				//获取class_name类的 input 所有输入框数组
				let inputs = document.getElementsByClassName(class_name);
				let input;
				//找到值等于 name 的输入框
				for(let i=0 ;i<inputs.length;i++){
					if(inputs[i].value == name){
						input = inputs[i];
						break;
					}
				}
				return input;
			}

			///**
			// * 编辑文章
			// * @param article_id
			// */
			//function edit_article(article_id){
			//	//send
			//	var url = "/Blog/AdminDataServlet?op=edit_article"+"&&article_id="+article_id;
			//	sendURL(url);
			//}

			/**
			 * 删除文章
			 * @param article_id
			 */
			function delete_article(hod , article_id){
				if (confirm(" 是否删除")){
					// var input = findInputInClass( "sort" , sort) ;

					//去掉页面该文章的那一块
					let recorder = hod.parentNode.parentNode;
					let recorder_parent = recorder.parentNode;
					recorder_parent.removeChild(recorder);

					// send
					let url = "/AdminArticleServlet?op=delete_article"+"&&article_id="+article_id;
					sendURL(url);
				}
			}

			/**
			 * 删除sort
			 * @param hod
			 * @param sort
			 */
			function delete_sort(hod,sort){
				if (confirm(" 是否删除")){
					let input = findInputInClass("sort",sort);

					//remove 视图
					let recorder = input.parentNode;
					let recorder_parent = recorder.parentNode;
					recorder_parent.removeChild(recorder);
					//后台删除
					let url = "/AdminArticleServlet?op=sort_delete"+"&&sort="+sort;
					sendURL(url);
					// location.href = "http://localhost:8080/deleteSortServlet?sort="+sort ;
				}
			}

			/**
			 * hod 点击的span参数
			 * sort 分类名字
			 * @param hod
			 * @param sort
			 */

			let input; //保存input
			let temp;//保存input的上一个值
			function edit_sort(hod,sort){
				if(hod.innerHTML == "编辑"){

					input = findInputInClass("sort",sort);
					//保存input的原始值
					temp = input.value;
					//允许input可以进行编辑
					input.removeAttribute("disabled");

					//实现input的光标定位
					input.value="";
					input.focus();
					input.value=temp;
					//修改hod内容为保存
					hod.innerHTML="保存";
				}else{
					//点击了保存
					hod.innerHTML="编辑";
					input.setAttribute("disabled","disabled");

					//提交修改请求
					let url = "/AdminArticleServlet?op=sort_update"+"&&old_sort="+temp+"&&new_sort="+input.value ;
					sendURL(url);
					// location.href = "http://localhost:8080/updateSortServlet?old_sort="+temp+"&new_sort="+input.value ;
				}
			}

			/**
			 * 删除tag
			 * @param hod
			 * @param tag
			 */
			function delete_tag(hod,tag){
				let input = findInputInClass("tags",tag);
				//remove 视图
				let recorder = input.parentNode;
				let recorder_parent = recorder.parentNode;
				recorder_parent.removeChild(recorder);

				//后台删除
				let url = "/AdminArticleServlet?op=tag_delete"+"&&tag="+tag;
				sendURL(url)
				// location.href = "http://localhost:8080/deleteTagServlet?tag="+tag;
			}

			/**
			 * hod 点击的span参数
			 * tag  标签名字
			 * @param hod
			 * @param sort
			 */

			let input_t; //保存input
			let temp_t;//保存input的上一个值
			function edit_tag(hod,tag){
				if(hod.innerHTML == "编辑"){

					input_t = findInputInClass("tags",tag);
					//保存input的原始值
					temp_t = input_t.value;
					//允许input可以进行编辑
					input_t.removeAttribute("disabled");

					//实现input的光标定位
					input_t.value="";
					input_t.focus();
					input_t.value=temp_t;
					//修改hod内容为保存
					hod.innerHTML="保存";
				}else{
					//点击了保存
					hod.innerHTML="编辑";
					input_t.setAttribute("disabled","disabled");

					//提交修改请求
					let url = "/AdminArticleServlet?op=tag_update"+"&&old_tag="+temp_t+"&&new_tag="+input_t.value ;
					sendURL(url);
					// location.href = "http://localhost:8080/updateTagServlet?old_tag="+temp_t+"&new_tag="+input_t.value ;
				}
			}
		</script>
	</body>
</html>