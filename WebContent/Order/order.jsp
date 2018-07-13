<%@ page language="java" import="java.util.*,beans.*" contentType="text/html"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>订单</title>
<style type="text/css">
.foodNum{
	margin-left:100px ;
	margin-right:50px ;
	margin-top:20px ;
	margin-bottom:20px ;
	text-align:center;
	height:30px;
	width:200px;
	display: flex;
}
.txt,.foodName,.foodPrice{
	margin-left:50px ;
	margin-right:50px ;
	margin-top:20px ;
	margin-bottom:20px ;
	text-align:right;
	height:30px;
	width:200px;
}
.items{
	display: flex;
	margin-top: 20px;
    margin-left:50px;
}
li{
	list-style-type:none;
	margin-top:40px ;
	margin-bottom:40px ;
}
</style>
</head>
<body>
	<!-- 详细订单界面 -->
	
	<!-- 原导航栏 -->
	<jsp:include page="../MainPage/guide.jsp"></jsp:include>
	
	<!-- 订单号和订单时间 -->
	订单号：<%=request.getParameter("orderNo") %><br>
	订单时间:<%=request.getParameter("orderTime")%>
	
	<!-- 利用ul和li显示列表 -->
	<ul>
	<!-- 列表表头 -->
	<li>
		<div class="items">
			<div class="foodName">餐品名</div>
			<div class="foodNum">数量</div>
			<div class="foodPrice">单价</div>
		</div>
	</li>
	
	<!-- 循环输出元素 -->
	<% @SuppressWarnings("unchecked") 
	List<R_Order> orderItems = (List<R_Order>) session.getAttribute("orderItems");
	double sumPrice=0;
	int sumNum=0;
	for(R_Order orderItem :orderItems){ %>
	<li>
		<!-- 订单元素 -->
		<div class="items">
			<!-- 代码部分 -->
			<%
			@SuppressWarnings("unchecked") 
				Map<String, Food> foodMap = (Map<String, Food>) session.getAttribute("foodMap");
				Food food = (foodMap.get(orderItem.getFoodNo()));
				sumNum += orderItem.getFoodMount();
				sumPrice += food.getFoodPrice()*orderItem.getFoodMount();
			%>
			<!-- 每条记录的餐品名、数量和价格 -->
			<div class="foodName"><%=food.getFoodName()%></div>
			<div class="foodNum"><%=orderItem.getFoodMount()%></div>
			<div class="foodPrice"><%=food.getFoodPrice()%></div>
		</div>
	</li>
	<%}; %>
	<!-- 循环结束 -->
	
	<!-- 总计部分 -->
	<li>
		<div class="items">
			<div class="foodName">总和</div>
			<!-- 总数 -->
			<div class="foodNum"><%=sumNum%></div>
			<!-- 总价 -->
			<div class="foodPrice"><%=sumPrice%></div>
		</div>
	</li>
	</ul>
</body>
</html>