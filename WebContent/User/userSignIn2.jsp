<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>用户注册</title>
</head>
<body>
<form method="post" name="userSignInForm">
	<jsp:include page="../MainPage/guide.jsp"></jsp:include>
	用户注册:<br/>
	用户名:<input type="text" name="userNo" value="000000003"/><br/>
	昵称:<input type="text" name="userName" value="deng"/><br/>
	密码:<input type="password" name="password" value="qwe123"/><br/>
	电话:<input type="text" name="tel" value="13086006808"/><br/>
	邮箱:<input type="text" name="email" value="534408633@qq.com"/><br/>
	<input type="submit" value="注册" onclick="userSignInForm.action='CheckUserSignIn'">
	<input type="submit" value="去登陆" onclick="userSignInForm.action='GotoLoginPage'">
</form>
</body>
</html>