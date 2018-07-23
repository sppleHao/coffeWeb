<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html>
<head>

<meta http-equiv="Content-Type" content="text/html">
<meta charset="UTF-8"> 
<title>个人信息</title>
<script type="text/javascript" src="/coffeWeb/JS/ajax.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("div").ready(function(){
		$("div").hide();
	});
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
<title>个人中心</title>
</head>
<body>
	<jsp:include page="../MainPage/guide.jsp"></jsp:include>
	<p>用户信息 <br/>
		用户名: ${userConfig.userNo} <br/>
		昵称: ${userConfig.userName}<br/>
		电话: ${userConfig.tel} <br/>
		邮箱: ${userConfig.email}<br/>
	</p>
	<button class="showHistoryOrder">历史订单(我的订单)</button>
	<button class="updateConfig">修改个人信息</button>
	<button class="updatePassword">修改密码</button>
	<button class="logoff" >退出登陆</button>
	<br>
	<div id="historyOrder"></div>
	<div id="newPassword">
		<form action="">
			新密码：<input type="text" id="updatePass"><br>
			确认新密码：<input type="text" id="confirmPass"><br>
			<input type="button" id="updatePasswordBtn" value="修改">
			<div id="passMess"></div>
		</form>
	</div>
	<div id="newConfig">
		<form action="">
			昵称:<input type="text" id="updateUserName" value="${userName}"><br>
			电话:<input type="text" id="updateTel" value="${tel}"><br>
			邮箱:<input type="text" id="updateEmail" value="${email}"><br>
			<input type="button" id="updateConfigBtn" value="修改">
		</form>
	</div>
	<div id="updatePassword"></div>
</body>
</html>