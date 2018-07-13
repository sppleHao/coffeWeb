<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>UserOP</title>
<script type="text/javascript" src="/coffeWeb/JS/ajax.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.js"></script>
<script type="text/javascript">
function updateUI(){
	<%
	String pageNo="1";
	if(request.getParameter("pageNo")!=null){
		pageNo=request.getParameter("pageNo");
	}
	%>
	$.ajax({
		url: 'GetUsers',
		type:'POST',
		async:true,
		data:{ 
				userParam: $("#selectUserParam").val(),
				pageNo: <%=pageNo%> 
			},
		timeout:5000,
		success:function(data){
			$("#userOP").html(data);
			$(".items").bind("click",function(){
				var div = $(this);
				var userNoDiv = div.children(".userNo");
				var userNameDiv = div.children(".userName");
				var passwordDiv = div.children(".password");
				var telDiv = div.children(".tel");
				var emailDiv = div.children(".email");
				
				
				var bt=$(this).children(".unchecked");
				var inputBt =bt.siblings("input");
				if(!inputBt.is(':checked')){
					//no checked
					$(".checked").removeClass("checked");
					inputBt.prop("checked",true);
					bt.addClass("checked");
					
					$("#userNo").val(userNoDiv.text());
					$("#userName").val(userNameDiv.text());
					$("#password").val(passwordDiv.text());
					$("#tel").val(telDiv.text());
					$("#email").val(emailDiv.text());
				}
				else{
					bt.removeClass("checked");
					inputBt.prop("checked",false);
					
					$("#userNo").val("");
					$("#userName").val("");
					$("#password").val("");
					$("#tel").val("");
					$("#email").val("");
				}
			});
		}
	});
};
$(document).ready(function(){
	$("#userOPBtn").click(function(){
		updateUI();
	});
	$("#submit").click(function(){
		$.ajax({
			url: 'AdminUserOP',
			type:'POST',
			async:true,
			data:{
				opName: $("input[name='userOP']:checked").attr("id"),
				userNo: $("#userNo").val(),
				userName: $("#userName").val(),
				password: $("#password").val(),
				tel: $("#tel").val(),
				email: $("#email").val()
			},
			timeout:5000,
			success:function(data){
				alert(data);
				updateUI();
			}
		});
	});
	updateUI();
});
</script>
<style type="text/css">
.userNo,.userName,.password,.tel,.email{
	margin-left:50px ;
	margin-right:50px ;
	margin-top:20px ;
	margin-bottom:20px ;
	text-align:right;
	height:30px;
	width:200px;
}
.items{
	display: flex;
	margin-top: 20px;
    margin-left:50px;
}
li{
	list-style-type:none;
	margin-top:40px ;
	margin-bottom:40px ;
}
input[type="radio"]#select{
	display:none;
}
.unchecked{
	background-image:url(../Img/cbu.png);
	display:inline-block;
	height:30px;
	width:30px;
	margin-left:50px ;
	margin-right:50px ;
	margin-top:20px ;
	margin-bottom:20px ;
}
.checked{
	background-image:url(../Img/cb.png);
	display:inline-block;
}
</style>
</head>
<body>
	<!-- 原导航栏 -->
	<jsp:include page="adminGuide.jsp"></jsp:include>
	
	<!-- 搜索栏 -->
	关键字:<input type="text" name="selectUserParam" id="selectUserParam">
	<input type="button" value="查找用户" id="userOPBtn"><br>
	
	<!-- 功能模块 -->
	
	<!-- 信息输出部分(点击按钮后该div会从服务器获得文本) -->
	<div id="userOP"></div>
	
	<!-- 底部表单 -->
	<form>
		<input type="radio" name="userOP" id="update" checked="checked">修改
		<input type="radio" name="userOP" id="delete">删除
		<br>
		用户名:<input type="text" name="userNo" id="userNo">
		昵称:<input type="text" name="userName" id="userName">
		密码:<input type="text" name="password" id="password">
		电话：<input type="text" name="tel" id="tel">
		邮箱：<input type="text" name="email" id="email">
		<button type="button" id="submit">提交</button>
	</form>
</body>
</html>