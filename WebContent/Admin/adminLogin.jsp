<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html>
<head>
<link rel="stylesheet" href="/coffeWeb/assets/css/amazeui.min.css" />
<link href="/coffeWeb/CSS/pageFramework.css" type="text/css" rel="stylesheet" />
<link rel="icon" type="image/jpg" href="/coffeWeb/Img/icon.jpg">
<meta http-equiv="Content-Type" content="text/html">
<link rel="stylesheet" href="/coffeWeb/CSS/adminLogin.css">
<title>管理员登陆界面</title>
</head>
<body>
	<div class="admin_login_view">
		<form method="post" name="adminLoginForm">
		<p class="label_info">管理员登陆</p>
		<input type="text" name="adminNo" placeholder="管理员号" value="${param.adminNo}"/><br/>
		<input type="password" name="adminPassword" placeholder="密码" value="${param.adminPassword}"/><br/>
		<input type="submit" value="登陆" onclick="adminLoginForm.action='CheckAdminLogin'" />
		<!-- <input type="submit" value="To Sign In" onclick="loginForm.action='toSignPage'"/>  -->
		</form>
	</div>
	
</body>
</html>