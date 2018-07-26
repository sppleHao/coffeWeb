<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>个人信息</title>
<script type="text/javascript" src="/coffeWeb/JS/ajax.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("img.logoff").click(function(){
		window.location.href='UserLogOff';
	});
	
});
</script>

<link rel="stylesheet" href="/coffeWeb/assets/css/amazeui.min.css" />
<link href="/coffeWeb/CSS/pageFramework.css" type="text/css" rel="stylesheet" />
<link href="/coffeWeb/CSS/historyOrder-empty.css" type="text/css" rel="stylesheet" />
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
						<span>欢迎您，${userConfig.userName}</span>
						<a href="/coffeWeb/User/userChange.jsp" title="点击修改个人信息" ><img id="reset" src="/coffeWeb/Img/reset.png"></a>
						<a  title="退出登录"  href="#"><img id="reset2" class="logoff" src="/coffeWeb/Img/quit.png"></a>
					</div>
					</br>
						<span>浓情共享，与君相伴</span>
					
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
			<div class="order-div">
			<!-- 订单页头部 -->
				<p class="order-head"><span>历史订单</span></p>
			<div style="margin-left: 420px;">
				<img src="/coffeWeb/Img/sad.png" height="100" width="100" >
							<p>您还没有历史订单</p>
			</div>	
		</div>
		</div>
		</nav>
	</div>
	
</body>
</html> 