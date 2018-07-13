<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>用户注册</title>
<link href="/coffeWeb/CSS/pageFramework.css" type="text/css" rel="stylesheet">
<style type="text/css">
.body-background{
	background-image: url(/coffeWeb/Img/loginBG.png);
	background-size: 100% 100%;
}
.user-sign-div{
	font-size:23px;
	font-weight:700;
	padding: 24px 0;
	box-sizing: border-box;
    margin-top:10%;
    margin-left:30%;
    width: 480px;
    height: 680px;
    overflow: hidden;
    max-width: 480px;
    background-color: rgba(255,255,255,0.3);
}
input[type='text'],input[type='password']{
	font-size:23px;
	font-weight:400;
	margin:25px;
	width: 313px;
    height: 55px;
}
input[type='submit']{
	background:#FFF;
	font-size:23px;
	font-weight:700;
	width:100px;
	height:40px;
	margin-left: 60%;
}
</style>
</head>
<body>
<!-- app界面 -->
 	<div id="app-view">
 		<!-- 侧栏 -->
		<nav id="nav">
			<!-- 侧顶栏 -->
			<header class="header">
				<!-- 图标 -->
				<img class="icon" src="/coffeWeb/Img/icon.png">
				<!-- 导航超链接 -->
				<a>主页</a>
				<a href="/coffeWeb/User/userConfig.jsp">个人中心</a>
				<a class="" href="/coffeWeb/Menu/menu.jsp">菜单</a>
			</header>
			<!-- 侧主栏 -->
			<div class="body">
				<!-- 导航区域 -->
				<div class="bar">
					<!--标签(更改) -->
					<div class="label">
						<img alt="" src="/coffeWeb/Img/account.png">
						<span>登录或创建一个新账户</span>
					</div>
					<!-- 导航超链接(更改) -->
					<div class="bar-menu">
					<ul>
						<li><a class="user-login" href="/coffeWeb/User/userLogin.jsp">登陆</a></li>
						<li><a class="user-signin" href="/coffeWeb/User/userSignIn.jsp">注册</a></li>
						<li><a class="about-us" >关于我们</a></li>
						<li><a class="admin-login" href="/coffeWeb/Admin/adminLogin.jsp">管理员入口</a></li>
					</ul>
					</div>
				</div>
			</div>
			<!-- 侧底栏(超链接) -->
			<footer class="footer">
				<a class="cart" href="/coffeWeb/Cart/cart.jsp">
					<img alt="购物车" src="/coffeWeb/Img/cart.png" height="40" width="40" />
				</a>
			</footer>
		</nav>
		<!-- 页面主体 -->
		<nav id="body">
			<!-- 背景(更改> -->
			<div class="body-background">
				<!-- 功能模块(更改) -->
				<div class="user-sign-div">
					<form method="post" name="user-signIn-form">
						<input type="text" name="userNo" placeholder="用户名(9位)"/><br/>
						<input type="text" name="userName" placeholder="昵称"/><br/>
						<input type="password" name="password" placeholder="密码"/><br/>
						<input type="text" name="tel" placeholder="电话"/><br/>
						<input type="text" name="email" placeholder="邮箱"/><br/>
						<input type="submit" value="注册" onclick="user-signIn-form.action='CheckUserSignIn'">
					</form>
				</div>
			</div>
		</nav>
	</div>
</body>
</html> 