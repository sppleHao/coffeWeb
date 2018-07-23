<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>管理员登陆界面</title>
</head>
<body>
	<!-- 管理员表单(应整个放在功能模块) -->
	<form method="post" name="adminLoginForm">
		管理员登陆:<br/>
		管理员号:<input type="text" name="adminNo" value="${param.adminNo}"/><br/>
		密码:<input type="password" name="adminPassword" value="${param.adminPassword}"/><br/>
		<input type="submit" value="登陆" onclick="adminLoginForm.action='CheckAdminLogin'" />
		<!-- <input type="submit" value="To Sign In" onclick="loginForm.action='toSignPage'"/>  -->
		<!-- 服务器信息提示 -->
		<div id="msg"><span>${msg}</span></div>
	</form>
</body>
</html>