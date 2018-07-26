<%@page import="dao.BillDao"%>
<%@ page language="java" import="java.util.*,beans.*" contentType="text/html"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>我的订单</title>
<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".list").click(function(){
		var div =$(this);
		window.location.href="/coffeWeb/Order/order.jsp?orderNo="+div.attr("id");
	});
});
</script>
<style type="text/css">
p{
	margin-left:50px ;
	margin-right:50px ;
	margin-top:20px ;
	margin-bottom:20px ;
	text-align:right;
	height:30px;
	width:200px;
}

li{
	list-style-type:none;
	margin-top:40px ;
	margin-bottom:40px ;
}
#reset{
	margin-left:75px;
	margin-top:7px;
 	width:20px;
 	height:20px;
}
.order-div{
	margin-top: 6%;
    margin-left: 5%;
    width: 90%;
   
    box-sizing: border-box;
    box-shadow: none;
   
    border-width: 5px;
    border-style: solid;
    border-color: rgb(228, 228, 228);
    border-radius: 0px;
}
.order-head{
	margin-top:2%;
	margin-left:37%;
	font-size:xx-large;
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
<link href="/coffeWeb/CSS/pageFramework.css" type="text/css" rel="stylesheet">
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
			<div>
			</div>
			<table class="am-table am-table-striped am-table-hover am-table-compact">
				<!-- 利用ul和li显示列表 -->
			<tbody>
			<!-- 列表表头 class="list"-->
			<thead>
				<tr>
					<th class="orderNo">订单号</th>
					<th class="orderTime">时间</th>
					<th class=orderPrice>总价</th>
				</tr>
			</thead>
			
			<!-- 循环输出订单内元素 -->
			<!-- 代码部分 -->
			<%
			@SuppressWarnings("unchecked")
				Map<String, List<R_Order>> map = (Map<String, List<R_Order>>) session.getAttribute("groupByOrderNoMap");
				Set<String> orderNos = map.keySet();
				BillDao bd = new BillDao();
			%>
			<%for (String orderNo : orderNos) {
				R_Order order = map.get(orderNo).get(0);
				String orderTime =order.getOrderTime().toString();
				Bill bill = bd.select(orderNo);
			%>
			
				<!-- 订单内元素 "-->
				<tr  class="list" id="<%=orderNo%>">
					<!-- 订单名 -->
					<td class="orderNo"><%=orderNo%></td>
					<!-- 时间 -->
					<td class="orderTime"><%=orderTime.substring(0, orderTime.length() - 4) %></td>
					<!-- 总价 -->
					<td class="orderPrice"><%=bill.getTotalPrice() %></td>
				</tr>
			</tbody>
			<%}; %>
			<!-- 循环结束 -->
	
		</table>
		</div>
		</div>
		</nav>
	</div>
		

</body>
</html>