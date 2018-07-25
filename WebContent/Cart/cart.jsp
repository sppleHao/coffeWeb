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
		var inputBt =bt.siblings("input");;
		var foodMount = bt.siblings("div.foodNum").children("input").val();
		var foodPrice = bt.siblings("div.foodPrice").text();
		if(inputBt.is(':checked')){
			sumPrice+=(parseInt(foodMount)*parseFloat(foodPrice));
			sumNum+=parseInt(foodMount);
		}
	});
	$("div#sumPrice").html(sumPrice);
	$("div#sumNum").html(sumNum);
}
$(document).ready(function(){	
	$(".checked.one").click(function(){
		var bt=$(this);
		var inputBt =bt.siblings("input");
		if(inputBt.is(':checked')){
			inputBt.prop("checked",false);
			bt.addClass("unchecked");
		}
		else{
			inputBt.prop("checked",true);
			bt.removeClass("unchecked");
		}
		computeSum();
	});
	$(".checked.all").click(function(){
		var bt=$(this);
		var btCheckBox =bt.siblings("input");
		if(btCheckBox.is(':checked')){
			$(":checkbox").prop("checked",false);
			bt.addClass("unchecked");
			$(".checked.one").addClass("unchecked");
		}
		else{
			$(":checkbox").prop("checked",true);
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
			var foodMountDiv = bt.siblings("div.foodNum");
			var btCheckBox =bt.siblings("input");
			if(btCheckBox.is(':checked')){
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
	$("button.add").click(function(){
		var btn = $(this);
		var input = btn.siblings("input");
		input.val(parseInt(input.val())+1);
		computeSum();
	});
	$("button.sub").click(function(){
		var btn = $(this);
		var input = btn.siblings("input");
		input.val(parseInt(input.val())-1);
		computeSum();
	});
	$("button.delete").click(function(){
		var div = $(this).parent();
		div.remove();
	});
	$("div#sumPrice").ready(function(){
		computeSum();
	});
});
</script>
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
p{
	
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

</style>
</head>
<body>
	<!-- 原导航栏 -->
	<jsp:include page="../MainPage/guide.jsp"></jsp:include>
	购物车
	
	<!-- 利用ul和li显示列表 -->
	<ul>
	<!-- 表头部分 -->
	<li>
		<div class="items">
			<!-- 替换图标  -->
			<div style="width:30px;
			margin-left:50px ;
			margin-right:50px ;"></div>
			<div class="foodName">名称</div>
			<div class="foodPrice">单价</div>
			<div class="foodNum">数量</div>
		</div>
	</li>
	
	<!-- 用循环列出购物车的列表 -->
	
	<!-- 代码部分 -->
	<% @SuppressWarnings("unchecked") 
	List<Cart> cartItems = (List<Cart>) session.getAttribute("cartItems");
	for(Cart cart:cartItems){ %>
	<!-- 每个物品信息 -->
	<li>
		<div class="items">
			<!-- 多选替换图标(模拟多选框)  -->
			<div id="<%=cart.getFoodNo() %>"  class="checked one"></div>
			<!-- 多选框(被隐藏) -->
			<input type="checkbox" checked="checked" id="food">
			<%
			@SuppressWarnings("unchecked") 
				Map<String, Food> foodMap = (Map<String, Food>) session.getAttribute("foodMap");
				Food food = (foodMap.get(cart.getFoodNo()));
			%>
			<!-- 餐品名、餐品价格、餐品数量区以及加减按钮  -->
			<div class="foodName"><%=food.getFoodName()%></div>
			<div class="foodPrice"><%=food.getFoodPrice()%></div>
			<div class="foodNum">
				<button class="sub" type="button">-</button>
				<input type="text" class="foodNumText" value="<%=cart.getFoodMount()%>">
				<button class="add" type="button">+</button>
			</div>
			<button class='delete'>删除</button>
		</div>
	</li>
	<%}; %>
	<!-- 循环结束 -->
	
	<!-- 合计部分 -->
		<li>
		<div class="items">
			<!-- 全选替换图标  -->
			<div id="allSelected" class="checked all">
			</div>
			<!-- 全选按钮(被隐藏) -->
			<input type="checkbox" checked="checked" id="food">
			<!-- 为了对其的空白(可不要) -->
			<div class="txt"></div>
			<!-- 总价和总数 -->
			<div class="txt" id="sumPrice"></div>
			<div class="txt" id="sumNum"></div>
			<!-- 结账按钮 -->
			<input type="button" id="checkOut" value="结账">
		</div>
	</li>
	<li>

	</li>
	</ul>
</body>
</html>