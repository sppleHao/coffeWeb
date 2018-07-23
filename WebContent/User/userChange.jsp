<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8"> 
<title>个人信息修改</title>
<script type="text/javascript" src="/coffeWeb/JS/ajax.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("button.logoff").click(function(){
		window.location.href='UserLogOff';
	});
	$("button.showHistoryOrder").click(function(){
		window.location.href='/coffeWeb/Order/historyOrder.jsp';
	});
	$("button.updatePassword").click(function(){
		$("#newPassword").toggle();
	});
	$("button.updateConfig").click(function(){
		$("#newConfig").toggle();
	});
	$("#updatePasswordBtn").click(function(){
		var updatePassText= $("#updatePass").val();
		var confirmPassText = $("#confirmPass").val();
		if (updatePassText==confirmPassText) {
			var url="UpdateUserPassword";
			var param="newPassword="+updatePassText;
			sendRequest(url,param,'POST' ,function() {
		        if (xmlHttpRequest.readyState==4) {
		            if (xmlHttpRequest.status==200) {
		            	alert("修改成功！");
		            	window.location.href='userConfig.jsp';
		            }
		        }
		    });
		}
		else{
			var info= "两次输入的密码必须相等";
			alert(info);
			//$("#passMess").innerText = info;
		}
	});
	$("#updateConfigBtn").click(function(){
		var url="UpdateUserConfig";
		var param = "userName="+$("#updateUserName").val()+"&"+
					"tel="+$("#updateTel").val()+"&"+
					"email="+$("#updateEmail").val();
		sendRequest(url,param,'POST' ,function() {
	        if (xmlHttpRequest.readyState==4) {
	            if (xmlHttpRequest.status==200) {
	            	alert("修改成功！");
	            	window.location.href='userConfig.jsp';
	            }
	        }
	    });
	});
});
</script>
<link href="/coffeWeb/CSS/pageFramework.css" type="text/css" rel="stylesheet">
<style type="text/css">
.body-background{
	background-color: rgba(242, 242, 242, 1);
	background-size: 100% 100%;
}
.user-info{
	margin-top:2%;
    margin-left:5%;
    width: 90%;
    height: 75%;
	box-sizing: border-box;
    box-shadow: none;
    background: inherit inherit inherit inherit inherit inherit inherit inherit inherit;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(228, 228, 228);
    border-radius: 0px;
}
.user-config-div{
	font-size:23px;
	font-weight:400;
	
	box-sizing: border-box;
   
    margin-left:5%;
    width: 90%;
    height: 20%;
    max-height:150px;
    overflow: hidden;
    max-width: 1100px;
    background-color: #FFF;
    padding:5px;
    display: flex;
   
}


.head-icon{
	margin-top:35%;
	margin-left:45%;
	width: 70px;
	height: 70px;
	
}
.user-config{
	margin-left: 20px;
}
.user-config-info{
	
	margin-left:0;
}
.user-config-info-p{
	margin-top: 4%;
	margin-left:10%;
	font-size: medium;
}
.user-config-info-tip
{
	margin-top: 3%;
	margin-left:55%;
	font-size: medium;
}
.hori-line img{
	position: absolute;
	left:9.5%;
}
.change-info{
	
	box-sizing: border-box;
   
    margin-left:5%;
    width: 90%;
    height: 80%;
   
    overflow: hidden;
    max-width: 1100px;
    background-color: #FFF;
    padding:5px;
    
}
.input-area{
	margin-left:35%;
	
	height:30%
}
.input-text{
	margin-top:3%;
	
}
.change-pw{
	margin-left:35%;
	
}
.save-change{
	margin-left:20%;
	margin-top:30%;
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
				<div class="user-info">
				<!-- 基本信息区，不可修改 -->
				<div class="user-config-div">
					<div class="user-config-info" >
						<img class="head-icon " alt="head-icon" src="/coffeWeb/Img/icon.jpg"  >
						
						<!--
							电话: ${userConfig.tel} <br/>
							邮箱: ${userConfig.email}<br/>
							<p >昵称:${userConfig.userName}</p>
						  -->	
					</div>	
					<div class="user-config-info-p" >		
						<p >ID:${userConfig.userNo}</p>
						
					</div>
					<div class="user-config-info-tip">
						<p>快完善个人信息</br>	加入星伍克大家庭吧~</p>
					</div>
				</div>
				<!-- <div class="user-buttons">
					<button class="showHistoryOrder">历史订单(我的订单)</button>
					<button class="updateConfig">修改个人信息</button>
					<button class="updatePassword">修改密码</button>
					<button class="logoff" >退出登陆</button>
				</div>
				 -->
				 <!-- 水平线 -->
				<div class="hori-line">
					<img  src="/coffeWeb/Img/user/u414.png">
				</div>
				<!-- 信息修改区 -->
				<div class="change-info">
					<div class="input-area">
					<form>
						<div class="input-text">
							昵称：<input type="text" name="userName" id="userName">
						</div>
						<div class="input-text">
							邮箱：<input type="text" name="email" id="email">
						</div>
						<div class="input-text">
							电话：<input type="text" name="tel" id="tel">
						</div>
						
					</form>
					</div>
					<div class="change-pw">
						<button>修改密码</button>
					</div>
					<div class="save-change">
						<button>保存修改</button>
					</div>
					
					
				</div>
				</div>
			</div>
		</nav>
	</div>
</body>
</html>