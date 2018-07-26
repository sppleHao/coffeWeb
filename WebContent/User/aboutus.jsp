<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>星伍克Studio</title>
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
<link rel="stylesheet" href="/coffeWeb/assets/css/amazeui.min.css" />
<link href="/coffeWeb/CSS/pageFramework.css" type="text/css" rel="stylesheet" />
<link href="/coffeWeb/CSS/aboutus.css" type="text/css" rel="stylesheet" />
<link rel="icon" type="image/jpg" href="/coffeWeb/Img/icon.jpg">

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
				<a href="/coffeWeb/MainPage/index.jsp">主页</a>
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
						<li><a class="about-us" href="/coffeWeb/User/aboutus.jsp" >关于我们</a></li>
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
				
			</div>
		</nav>
	</div>
</body> 
</html> 