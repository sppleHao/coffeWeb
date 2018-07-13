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
.list{
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
	<!-- 历史订单界面 -->
	<div>
	<!-- 原导航栏，需替换 -->
	<jsp:include page="../MainPage/guide.jsp"></jsp:include>
	
	<!-- 利用ul和li显示列表 -->
		<ul>
			<!-- 列表表头 -->
			<li>
				<div class="list">
					<p>订单号</p>
					<p>时间</p>
					<p>总价<p>
				</div>
			</li>
			
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
			<li>
				<!-- 订单内元素 -->
				<div class="list" id="<%=orderNo%>">
					<!-- 订单名 -->
					<p><%=orderNo%></p>
					<!-- 时间 -->
					<p><%=orderTime.substring(0, orderTime.length() - 4) %></p>
					<!-- 总价 -->
					<p><%=bill.getTotalPrice() %><p>
				</div>
			</li>
			<%}; %>
			<!-- 循环结束 -->
		</ul>
	</div>
</body>
</html>