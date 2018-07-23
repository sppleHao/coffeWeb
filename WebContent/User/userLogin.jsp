<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>登陆</title>
<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery.validate.min.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/messages_zh.js"></script>
<script type="text/javascript">
$.validator.setDefaults({
    submitHandler: function() {
    	form.submit();
    	//$(form).ajaxSubmit();     
    }
});
$(document).ready(function() {
    $("#login-form").validate({
    	rules:{
    		userNo:{
    			required:true,
    			digits:true,
    			rangelength:[9,9]
    		},
    		password:"required"
    	},
    	errorElement: "span",
    	messages:{
    		userNo:{
    			required:"用户名不能为空",
    			digits:"用户名不能含有除数字外的其他字符",
    			rangelength:"用户名必须为长度为9位的数字"
    		},	
    		password:"密码不能为空"
    	}
    });
});
</script>
<link href="/coffeWeb/CSS/pageFramework.css" type="text/css" rel="stylesheet">
<style type="text/css">
.body-background{
	background-image: url(/coffeWeb/Img/loginBG.png);
	background-size: 100% 100%;
}
.user-login-div{
	font-size:23px;
	font-weight:700;
	padding: 24px 0;
	box-sizing: border-box;
    margin-top:20%;
    margin-left:30%;
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
	<!-- 用户登陆界面 -->
	<!-- 记得在顶部加上外部样式表 <link href="/coffeWeb/CSS/pageFramework.css" type="text/css" rel="stylesheet">  -->
	
	
	<!-- 整个界面 -->
 	<div id="app-view">
 		<!-- 侧栏 -->
		<nav id="nav">
			<!-- 侧顶栏 -->
			<header class="header">
				<!-- 商标 -->
				<img class="icon" src="/coffeWeb/Img/icon.png">
				<!-- 超链接 -->
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
					<!-- 超链接div(可更改) -->
					<div class="bar-menu">
					<ul>
						<!-- 列表列出超链接 -->
						<li><a class="user-login" href="/coffeWeb/User/userLogin.jsp">登陆</a></li>
						<li><a class="user-signin" href="/coffeWeb/User/userSignIn.jsp">注册</a></li>
						<li><a class="about-us" >关于我们</a></li>
						<li><a class="admin-login" href="/coffeWeb/Admin/adminLogin.jsp">管理员入口</a></li>
					</ul>
					</div>
				</div>
			</div>
			<!-- 侧底栏购物车图片(超链接) -->
			<footer class="footer">
				<a class="cart" href="/coffeWeb/Cart/cart.jsp">
					<img alt="购物车" src="/coffeWeb/Img/cart.png" height="40" width="40" />
				</a>
			</footer>
		</nav>
		<!-- 页面主体(右侧部分) -->
		<nav id="body">
			<!-- 背景(可在样式表更改背景图片) -->
			<div class="body-background">
				<!-- 功能模块(更改) -->
				<div class="user-login-div">
					<!-- 表单 -->
					<form method="post" id="login-form" name="login-form" action="/coffeWeb/User/CheckUserLogin">
					<!-- 输入文本框 -->
					<input type="text" id="userNo" name="userNo" placeholder="用户名/邮箱/手机" value="${param.userNo}"/><br/>
					<input type="password" id="password" name="password" placeholder="密码" value="${param.password}"/><br/>
					<!-- 登陆按钮 -->
					<input type="submit" value="登陆" />
					<!-- 服务器信息提示 -->
					<div id="uMsg"><span>${uMsg}</span></div>
					</form>
				</div>
			</div>
		</nav>
	</div>
</body> 
</html> 