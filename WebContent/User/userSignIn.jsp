<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>用户注册</title>
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
    $("#user-signIn-form").validate({
    	rules:{
    		userName:{
    			required:true,
    			maxlength:8,
    		},
    		password:{
    			required:true,
    			maxlength:18
    		},
    		confirm_password: {
    	        required: true,
    	        maxlength:18,
    	        equalTo: "#password"
    	    },
    	    email: {
    	        required: true,
    	        email: true
    	    },
    	    tel:{
    	    	required: true,
    	    	digits:true,
    	    	rangelength:[11,11]
     	    }
    		
    	},
    	errorElement: "span",
    	errorPlacement: function(error, element) {
    		$( element )
			.closest( "form" )
				.find("div"+"."+element.attr( "id" ) )
					.html( error );
    	},
    	messages:{
    		userName:{
    			required:"昵称不能为空",
    			maxlength:"昵称长度不能超过8位",
    		},
    		password:{
    			required:"密码不能为空",
    			maxlength:"密码长度不能超过18位",
    		},
    		confirm_password: {
    			required: "请再次输入密码",
    	        equalTo: "两次输入的密码不相同"
    	      },
    	   email:"请输入一个正确的邮箱",
    	   tel:{
    		   required:"请输入长度位11位的个人电话",
    		   digits:"电话中只能含数字",
   	    	   rangelength:"电话号码长度为11位"
    	   }
    	}
    });
});
</script>
<link rel="stylesheet" href="/coffeWeb/assets/css/amazeui.min.css" />
<link href="/coffeWeb/CSS/pageFramework.css" type="text/css" rel="stylesheet" />
<link href="/coffeWeb/CSS/userSignIn.css" type="text/css" rel="stylesheet" />
<link rel="icon" type="image/jpg" href="/coffeWeb/Img/icon.jpg">
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
					<!-- 导航超链接(更改) -->
					<div class="bar-menu">
					<ul>
						<li><a class="user-login" href="/coffeWeb/User/userLogin.jsp">登陆</a></li>
						<li><a class="user-signin" href="/coffeWeb/User/userSignIn.jsp">注册</a></li>
						<li><a class="about-us" href="/coffeWeb/User/aboutus.jsp" >关于我们</a></li>
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
					<form method="post" id="user-signIn-form" name="user-signIn-form" action="CheckUserSignIn">
						<input type="text" id="userName" name="userName" placeholder="昵称"/><br/>
						<div class="userName"></div>
						<input type="password" id="password" name="password" placeholder="密码"/><br/>
						<div class="password"></div>
						<input type="password" id="confirm_password" name="confirm_password"placeholder="确认密码"><br>
						<div class="confirm_password"></div>
						<input type="text" id="tel" name="tel" placeholder="电话"/><br/>
						<div class="tel"></div>
						<input type="text" id="email" name="email" placeholder="邮箱"/><br/>
						<div class="email"></div>
						<input type="submit" value="注册">
					</form>
				</div>
			</div>
		</nav>
	</div>
</body>
</html> 