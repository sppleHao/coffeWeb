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
	$("button.showHistoryOrder").click(function(){
		window.location.href='/coffeWeb/Order/historyOrder.jsp';
	});
	$.ajax({
		url:'GetLastestOrders',
		type:'POST',
		async:true,
		success:function(data){
			$("#show-order").html(data);
			$("tr").each(function(){
				var tr =$(this);
				var orderNo = tr.find(".orderNo").text();
				tr.bind('click',function(){
					window.location.href='/coffeWeb/Order/order.jsp?orderNo='+orderNo;
				});
			});
		},
		error:function(){
			alert("error");
		}
	});
});
</script>

<style type="text/css">
.body-background{
	background-color: rgba(242, 242, 242, 1);
	background-size: 100% 100%;
}
.user-config-div{
	font-size:23px;
	font-weight:400;
	padding: 24px 0;
	box-sizing: border-box;
    margin-top:5%;
    margin-left:5%;
    width: 90%;
    height: 15%;
    max-height:150px;
    overflow: hidden;
    max-width: 1100px;
    background-color: #FFF;
    padding:5px;
    display: flex;
    justify-content: space-around;
}


.head-icon{
	margin-top:35%;
	margin-left:0;
	width: 70px;
	height: 70px;
	
}
.user-config{
	margin-left: 20px;
}
.user-config-info{
	
	margin-left:0;
}
.user-config-info p{
	margin-top: 18px;
	margin-left:0;
	font-size: medium;
}
.user-config p{
	margin: 18px;
	font-size: medium;
}
.lastest-order{
	position: absolute;
    left:5%;
    top: 23%;
    width: 90%;
    height:50%;
    background-color: #FFF;
   	box-sizing: border-box;
    box-shadow: none;
    background: inherit inherit inherit inherit inherit inherit inherit inherit inherit;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(228, 228, 228);
    border-radius: 0px;
}
.lastest-order p{
	display:inline-block;
	position:relative;
	top:13px;
	left:5.5%;
}
.showHistoryOrder{
	display: inline-block;
	position: absolute;
	top:15px;
	right:5%;
}

.hori-line img{
	position: absolute;
	left:5%;
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
#reset{
	margin-left:45px;
	
 	width:20px;
 	height:20px;
}
#reset2{
	margin-left:2px;
	
 	width:20px;
 	height:20px;
}

.orderNo{
	text-align:center;
	width:200px;
	height:50px;
}
.orderTime, .orderPrice{
	text-align:center;
	width:150px;
	height:50px;
}

table{
	
	margin-top:3%;
}
</style>
<link rel="stylesheet" href="/coffeWeb/assets/css/amazeui.min.css" />
<link href="/coffeWeb/CSS/pageFramework.css" type="text/css" rel="stylesheet" />
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
				<div class="user-config-div">
					<div class="user-config-info" >
						<a href="/coffeWeb/User/userChange.jsp" title="点击修改个人信息" ><img class="head-icon " alt="head-icon" src="/coffeWeb/Img/icon.jpg"  ></a>
						
						<!--
							电话: ${userConfig.tel} <br/>
							邮箱: ${userConfig.email}<br/>
						  -->
					</div>
					<div class="user-config-info">
						<p >ID:${userConfig.userNo}</p>
						<p >昵称:${userConfig.userName}</p>
						
					</div>
					<div class="user-config">
						<p>我的优惠券</p>
						<p style="color:#FF0000;">0个</p>
					</div>
					<div class="user-config">
						<p>我的星币</p>
						<p style="color:#33CC33;">666个</p>
					</div>
					<div class="user-config">
						<p>我的余额</p>
						<p style="color:#FF9900;">999元</p>
					</div>
				</div>
				<!-- <div class="user-buttons">
					<button class="showHistoryOrder">历史订单(我的订单)</button>
					<button class="updateConfig">修改个人信息</button>
					<button class="updatePassword">修改密码</button>
					<button class="logoff" >退出登陆</button>
				</div>
				 -->
				<div class="lastest-order">
					<header id="lastest-order">
						
						<p><span>最近订单</span></p>
						<button class="showHistoryOrder" style="border:none;background:#fff;display:block">更多>></button>
						
						
					</header>
					<!-- 水平线 -->
						<div class="hori-line">
							<img  src="/coffeWeb/Img/user/u414.png">
							<img  src="/coffeWeb/Img/user/u415.png">
						</div>
					<div id="show-order">
						
					</div>
				</div>
			</div>
		</nav>
	</div>
</body>
</html> 