<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" import="java.util.*,beans.*" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>购物车</title>
<script type="text/javascript" src="/coffeWeb/JS/ajax.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.js"></script>
<script type="text/javascript">
function computeSum(){
	var sumPrice = 0;
	var sumNum=0;
	$(".checked.one").each(function(){
		var bt= $(this);
		var foodMount = bt.parent().siblings(".foodNum").children("input").val();
		var foodPrice = bt.parent().siblings(".foodPrice").text();
		bt.parent().siblings(".multy-price").text(parseInt(foodMount)*parseFloat(foodPrice));
		//alert(foodMount);
		//alert(foodPrice);
		if(!bt.hasClass('unchecked')){
			sumPrice+=(parseInt(foodMount)*parseFloat(foodPrice));
			sumNum+=parseInt(foodMount);
		}
	});
	$("#sumPrice").html(sumPrice);
	$("#sumNum").html(sumNum);
}
$(document).ready(function(){	
	$(".checked.one").click(function(){
		var bt=$(this);
		if(!bt.hasClass('unchecked')){
			bt.addClass("unchecked");
		}
		else{
			bt.removeClass("unchecked");
		}
		computeSum();
	});
	$(".checked.all").click(function(){
		var bt=$(this);
		if(!bt.hasClass('unchecked')){
			bt.addClass("unchecked");
			$(".checked.one").addClass("unchecked");
		}
		else{
			bt.removeClass("unchecked");
			$(".checked.one").removeClass("unchecked");
		}
		computeSum();
	});
	$("#checkOut").click(function(){
		
		var cartList =  new Array();
		$(".checked.one").each(function(){
			var cart = new Object();
			var bt= $(this);
			var foodMountDiv = bt.parent().siblings(".foodNum");
			if(!bt.hasClass('unchecked')){
				cart.userNo = '<%=(String)session.getAttribute("userNo")%>';
				cart.foodNo = bt.attr("id");
				cart.foodMount= foodMountDiv.children("input").val();
				cartList.push(cart);
			}
		 });
		$.ajax({
			url: 'CreateOrder',
			type:'POST',
			async:true,
			data:{
					list: JSON.stringify(cartList),
					sumPrice: $("#sumPrice").text(),
					sumNum: $("#sumNum").text()
				},
			success:function(data){
				window.location.href='/coffeWeb/Order/GetOrderItems?orderNo='+data;
			}
		})
	});
	$(".foodNumText").bind('input propertychange',function(){
		computeSum();
	});
	
	//+
	$("button.add").click(function(){
		var btn = $(this);
		var input = btn.siblings("input");
		var mount = btn.siblings("#foodMount").text();
		if(parseInt(input.val())<parseInt(mount)){
			input.val(parseInt(input.val())+1);
		}
		else{
			alert("购买数量不能超过库存(当前库存:"+ mount +")");
		}
		computeSum();
	});
	
	//-
	$("button.sub").click(function(){
		var btn = $(this);
		var input = btn.siblings("input");
		if(parseInt(input.val())>1){
			input.val(parseInt(input.val())-1);
		}
		else{
			alert("购买数量不能小于1");
		}
		computeSum();
	});
	
	$(".foodNumText").each(function(){
		var input = $(this);
		input.bind('input propertychange',function(){
			var num = input.val();
			var mount = input.siblings("#foodMount").text();
			  if(parseInt(num) >= parseInt(mount)){
				  alert("数量不能超过库存量!");
				  input.val(parseInt(mount));
			  }
			  if (parseInt(num) <1) {
				  alert("数量必须是正数!");
				  input.val(1);
			  }
			  computeSum();
		});
	});
	
	
	$("button.delete").click(function(){
		var div = $(this).parent().parent();
		var checkIcon = div.find(".checked.one");
		var id = checkIcon.attr("id");
		$.ajax({
			url: 'DeleteCartItems',
			type:'POST',
			async:true,
			data:{
					foodNo:id
				},
			success:function(data){
				alert(data);
			}
		});
		div.remove();
		computeSum();
	});
	$("button.delete-all").click(function(){
		if(confirm("确认清空?")){
			$.ajax({
				url: 'DeleteAllCartItems',
				type:'POST',
				async:true,
				success:function(data){
					alert(data);
					location.reload();
				}
			});
		}
	});
	$("#sumPrice").ready(function(){
		computeSum();
	});
	
	//离开该界面后保存更新
	$(window).bind('beforeunload',function(){
		var cartList =  new Array();
		$(".checked.one").each(function(){
			var cart = new Object();
			var bt= $(this);
			var foodMountDiv = bt.parent().siblings(".foodNum");
			cart.userNo = '<%=(String)session.getAttribute("userNo")%>';
			cart.foodNo = bt.attr("id");
			cart.foodMount= foodMountDiv.children("input").val();
			cartList.push(cart);
		 });
		$.ajax({
			url: 'UpdateCartItems',
			type:'POST',
			async:true,
			data:{
					list: JSON.stringify(cartList),
				},
			success:function(data){
				
			}
		});	
	});
});

</script>
<style type="text/css">
td{
	text-align: center;
}
input[type="checkbox"]{
	display:none;
}
input[type="text"]{
	width:50px;
	text-align:center;
}
input[type="button"]{
	margin-left:200px ;
	height:30px;
	width:50px;
	margin-top:20px ;
	margin-bottom:20px ;
}
.checked{
	background-image:url(../Img/cb.png);
	display:inline-block;
	height:30px;
	width:30px;
	margin-left:50px ;
	margin-right:50px ;
	margin-top:20px ;
	margin-bottom:20px ;
}
.unchecked{
	background-image:url(../Img/cbu.png);
	display:inline-block;
	height:30px;
	width:30px;
}
#foodMount{
	display: none;
}
</style>
</head>
<body>
	<!-- 原导航栏 -->
	<jsp:include page="../MainPage/guide.jsp"></jsp:include>
	购物车
	
	<!-- 利用ul和li显示列表 -->
	<table>
	<tbody>
	<!-- 表头部分 -->
	<tr>
		<th></th>
		<th class="foodName">名称</th>
		<th class="foodPrice">单价</th>
		<th class="foodNum">数量</th>
		<th class="multy-price">总价</th>
		<th></th>
	</tr>
	
	<!-- 用循环列出购物车的列表 -->
	
	<!-- 代码部分 -->
	<% @SuppressWarnings("unchecked") 
	List<Cart> cartItems = (List<Cart>) session.getAttribute("cartItems");
	for(Cart cart:cartItems){ %>
	<!-- 每个物品信息 -->
	<tr>
			<!-- 多选替换图标(模拟多选框)  -->
			<td><div id="<%=cart.getFoodNo() %>"  class="checked one"></div></td>
			<%
			@SuppressWarnings("unchecked") 
				Map<String, Food> foodMap = (Map<String, Food>) session.getAttribute("foodMap");
				Food food = (foodMap.get(cart.getFoodNo()));
			%>
			
			<!-- 餐品名、餐品价格、餐品数量区以及加减按钮  -->
			<td class="foodName"><%=food.getFoodName()%></td>
			<td class="foodPrice"><%=food.getFoodPrice()%></td>
			<td class="foodNum">
				<button class="sub" type="button">-</button>
				<input  type="text" class="foodNumText" value="<%=cart.getFoodMount()%>">
				<button class="add" type="button">+</button>
				<div id="foodMount"><%=food.getFoodMount()%></div>
			</td>
			<td class="multy-price"><%=food.getFoodPrice()*cart.getFoodMount()%></td>
			<td><button class='delete'>删除</button></td>
	</tr>
	<%}; %>
	<!-- 循环结束 -->
	
	<!-- 合计部分 -->
	<tr>
		<th>全选</th>
		<th></th>
		<th></th>
		<th>总数</th>
		<th>合计</th>
		<th></th>
	</tr>
	<tr>
			<!-- 全选替换图标  -->
			<td><div id="allSelected" class="checked all"></div></td>
			<!-- 总价和总数 -->
			<td></td>
			<td></td>
			<td><div id="sumNum"></div></td>
			<td><div id="sumPrice"></div></td>
			<td><button class="delete-all">清空购物车</button></td>
			<!-- 结账按钮 -->
	</tr>
	</tbody>
	</table>
	<input type="button" id="checkOut" value="结账">
</body>
</html>