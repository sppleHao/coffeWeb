<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>管理员登陆界面</title>
<style type="text/css">
body{
	height: 874.87px;
    background: #f7f7f7;
	display: block;
	line-height: 160%;
	margin: 0;
	font-size: 16px;
	font-weight: 700;
	background-image: url(/coffeWeb/Img/adminbgp.jpg);
	background-size: 100% 100%;
}
.admin_login_view{
	font-size:23px;
	font-weight:700;
	padding: 24px 0;
	box-sizing: border-box;
    margin-top:15%;
    margin-left:37%;
    width: 480px;
    height: 340px;
    overflow: hidden;
    max-width: 480px;
    background-color: rgba(255,255,255,0.3);
}
input[type='text'],input[type='password']{
	font-size:23px;
	font-weight:400;
	margin:25px;
	width: 400px;
    height: 55px;
}
input[type='submit']{
	background:#FFF;
	font-size:23px;
	font-weight:700;
	width:100px;
	height:40px;
	margin-left: 70%;
}
.label_info{
	margin-top:0%;
	height:0px;
	margin-left:37%;
}
</style>
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