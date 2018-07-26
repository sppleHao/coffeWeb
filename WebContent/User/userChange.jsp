<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8"> 
<title>个人信息修改</title>
<link rel="stylesheet" href="/coffeWeb/assets/css/amazeui.min.css" />
<link href="/coffeWeb/CSS/pageFramework.css" type="text/css" rel="stylesheet" />
<link href="/coffeWeb/CSS/userChange.css" type="text/css" rel="stylesheet" />
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
				<div class="user-info">
				<!-- 基本信息区，不可修改 -->
				<div class="user-config-div">
					<div class="user-config-info" >
						<img class="head-icon " alt="head-icon" src="/coffeWeb/Img/icon.jpg"  >
					</div>	
					<div class="user-config-info-p" >		
						<p >ID:${userConfig.userNo}</p>		
					</div>
					<div class="user-config-info-tip">
						<p>快完善个人信息</br>	加入星伍克大家庭吧~</p>
					</div>
				</div>
				 <!-- 水平线 -->
				<div class="hori-line">
					<img  src="/coffeWeb/Img/user/u414.png">
				</div>
				<!-- 信息修改区 -->
				<div class="change-info">
					<div class="input-area">
						<div id="user-config">
							<p>基本信息</p>
							<form id="config-form">
									昵称：<input type="text" name="userName" id="userName" value="${sessionScope.userConfig.userName}"><br>
									邮箱：<input type="text" name="email" id="email" value="${sessionScope.userConfig.email}"><br>
									电话：<input type="text" name="tel" id="tel" value="${sessionScope.userConfig.tel}"><br>
									<input type="submit" value="修改信息" id="submit-config-form" class="am-btn am-btn-success am-radius"
									>
									<div id='config-msg'></div>
							</form>
						</div>
						<!-- 水平线 -->
						<div class="hori-line">
							<img  src="/coffeWeb/Img/user/u414.png">
							
						</div>
						<div id="user-pass">
							<p>密码</p>
							<form id="pass-form">
								原密码:<input type="password" name="old_pass" id="old_pass">	<br>			
								新密码:<input type="password" name="new_pass" id="new_pass"><br>
								确认新密码:<input type="password" name="confirm_new_pass" id="confirm_new_pass"><br>
								<input type="submit" value="修改密码" id="submit-pass-form" class="am-btn am-btn-success am-radius"
								>
								<div id="pass-msg"></div>
							</form>
						</div>
					</div>
					
				</div>
				</div>
			</div>
		</nav>
	</div>
	
<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery.validate.min.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/messages_zh.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery-form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("img.logoff").click(function(){
		window.location.href='UserLogOff';
	});
	
	var pass_ajax_option={
			url:"UpdateUserPassword",
			success:function(data){
				if(data=="update_success"){
					alert("修改成功");
					location.reload();
				}
				else if(data=="old_pass_error"){
					$("#pass-msg").text("原密码错误");
				}
				else{
					alert(data);
				}
			}
		};
	
	var config_ajax_option={
			url:"UpdateUserConfig",
			success:function(data){
				if(data=="update_success"){
					alert("修改成功");
					location.reload();
				}
				else{
					$("#config-msg").text("邮箱重复!");
				}
			}
		};
	
	
	//ajax提交表单
	$("#config-form").validate({
        submitHandler:function(form){
        	if(confirm("确认修改？")){
        		 $("#config-form").ajaxSubmit(config_ajax_option);
        	}
        },
        rules:{
        	userName:{
    			required:true,
    			maxlength:8,
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
    	messages:{
    		userName:{
    			required:"昵称不能为空",
    			maxlength:"昵称长度不能超过8位",
    		},
    		email:"请输入一个正确的邮箱",
     	   	tel:{
     		   required:"请输入长度位11位的个人电话",
     		   digits:"电话中只能含数字",
    	    	   rangelength:"电话号码长度为11位"
     	   	}
    	}
	});
	
	$("#pass-form").validate({
        submitHandler:function(form){
        	if(confirm("确认修改？")){
        		 $("#pass-form").ajaxSubmit(pass_ajax_option);
        	}
        },
        rules:{
    		old_pass:{
    			required:true,
    			maxlength:18
    		},
    		new_pass:{
    			required:true,
    			maxlength:18,
    		},
    		confirm_new_pass: {
    	        required: true,
    	        maxlength:18,
    	        equalTo: "#new_pass"
    	    }
        },
        errorElement: "span",
    	messages:{
    		old_pass:{
    			required:"密码不能为空",
    			maxlength:"密码长度不能超过18位",
    		},
    		new_pass:{
    			required:"新密码不能为空",
    			maxlength:"新密码长度不能超过18位",
    		},
    		confirm_new_pass: {
    			required: "请再次输入新密码",
    	        equalTo: "两次输入的新密码不相同"
    	      }
    	}
	});
});
</script>
</body>
</html>