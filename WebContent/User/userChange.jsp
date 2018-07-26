<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8"> 
<title>个人信息修改</title>
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
							<form id="config-form">
									昵称：<input type="text" name="userName" id="userName" value="${sessionScope.userConfig.userName}"><br>
									邮箱：<input type="text" name="email" id="email" value="${sessionScope.userConfig.email}"><br>
									电话：<input type="text" name="tel" id="tel" value="${sessionScope.userConfig.tel}"><br>
									<input type="submit" value="修改信息" id="submit-config-form">
									<div id='config-msg'></div>
							</form>
						</div>
						<div id="user-pass">
							<form id="pass-form">
								原密码:<input type="password" name="old_pass" id="old_pass">	<br>			
								新密码:<input type="password" name="new_pass" id="new_pass"><br>
								确认新密码:<input type="password" name="confirm_new_pass" id="confirm_new_pass"><br>
								<input type="submit" value="修改密码" id="submit-pass-form">
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