<%@ page language="java" import="java.util.*,beans.*" contentType="text/html"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>订单</title>
<style type="text/css">
/*.foodNum{
	margin-left:100px ;
	margin-right:50px ;
	margin-top:10px ;
	margin-bottom:10px ;
	text-align:center;
	height:30px;
	width:200px;
	
}
.txt,.foodName,.foodPrice{
	margin-left:50px ;
	margin-right:50px ;
	margin-top:10px ;
	margin-bottom:10px ;
	text-align:center;
	height:30px;
	width:200px;
}*/
.top-bar{
	margin-top:20px;	
	margin-left:35px;
	margin-bottom:15px;
}
.foodName,.foodPrice,.foodNum{
	text-align:center;
	
	width:150px;
	height:50px;

}
.final-div{
	margin-left:65%;
	display: flex;
}
.items{
	display: flex;
	
}
li{
	list-style-type:none;
	margin-top:40px ;
	margin-bottom:40px ;
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
				<!-- 订单号和订单时间 -->
				<div class="top-bar">
				订单号：    <%=request.getParameter("orderNo") %><br><br>
				订单时间: <%=request.getParameter("orderTime")%>
				</div> 
			<table class="am-table am-table-bordered am-table-radius am-table-striped">
				<!-- 列表表头 -->
				
				<thead>
					<tr >
						<th class="foodName">餐品名</th>
						<th class="foodNum">数量</th>
						<th class="foodPrice">单价</th>
					</tr>
				</thead>
				<tbody>
				<!-- 循环输出元素 -->
				<% @SuppressWarnings("unchecked") 
				List<R_Order> orderItems = (List<R_Order>) session.getAttribute("orderItems");
				double sumPrice=0;
				int sumNum=0;
				for(R_Order orderItem :orderItems){ %>
	
				<!-- 订单元素 -->
				<tr >
				<!-- 代码部分 -->
				<%
					@SuppressWarnings("unchecked") 
					Map<String, Food> foodMap = (Map<String, Food>) session.getAttribute("foodMap");
					Food food = (foodMap.get(orderItem.getFoodNo()));
					sumNum += orderItem.getFoodMount();
					sumPrice += food.getFoodPrice()*orderItem.getFoodMount();
				%>
				<!-- 每条记录的餐品名、数量和价格 -->
					<td class="foodName"><%=food.getFoodName()%></td>
					<td class="foodNum"><%=orderItem.getFoodMount()%></td>
					<td class="foodPrice"><%=food.getFoodPrice()%></td>
				</tr>
	
				<%}; %>
				<!-- 循环结束 -->
	
				
			
				</tbody>
			</table>
			<!-- 总计部分 -->
				
					<div class="final-div">
						
						<!-- 总数 -->
						<div class="foodNum">总数：<%=sumNum%>份</div>
						<!-- 总价 -->
						<div class="foodPrice">总计：<%=sumPrice%>元</div>
					</div>
			</div>
		</div>
		</nav>	
	</div>
		
		
</body>
</html>