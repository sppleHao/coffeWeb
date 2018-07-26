<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" import="java.util.*,beans.*" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
 <link rel="stylesheet" href="/coffeWeb/assets/css/amazeui.min.css" />
 <link rel="stylesheet" href="/coffeWeb/assets/css/amazeui.datatables.min.css" />
 <link rel="stylesheet" href="/coffeWeb/assets/css/app.css">
 <link href="/coffeWeb/CSS/pageFramework.css" type="text/css" rel="stylesheet">
<link rel="icon" type="image/jpg" href="/coffeWeb/Img/icon.jpg">
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
	
	
}
.unchecked{
	background-image:url(../Img/cbu.png);
	display:inline-block;
	height:30px;
	width:30px;
}
#body1{
	left: auto;
    margin-left: 30%;	
    width: 70%;
    height:100%;
    position: relative;

   /* display: block;*/
}
.body-background{
	
	width:100%;
	height:100%;
	
}
.label{
	box-sizing: content-box;
	position: relative;
	letter-spacing: 0.3px;	
	display:flex;
	font-size: 21px;
	font-weight: 700;
	line-height: 31px;
}
.label img{
	width:34px;
	height:34px;
	margin-top:8px;

}
.label span{
	margin-top:10px;
}
.cart-div{
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
.cart-head{
	margin-top:2%;
	margin-left:45%;
	font-size:xx-large;
}
.foodName,.foodPrice,.foodNum,.multy-price,.final-bar{
	text-align:center;
	
	width:150px;
	height:50px;

}
.cart-submit{
	width:150px;
	margin-left:42%;
	margin-bottom:5px;
}
#foodMount{
	display: none;
}
</style>

</head>
<body>
	<!-- 整个界面 -->
 	<div id="app-view">
	<!-- 侧栏 -->
	<nav id="nav">
       	<!-- 侧顶栏 -->
			<header class="header">
				<!-- 商标 -->
				<img class="icon" src="/coffeWeb/Img/icon.png">
				<!-- 超链接 -->
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
						<img alt="" src="/coffeWeb/Img/menu.png">
						<span>菜单</span>
					</div>
					<!-- 超链接div(可更改) -->
					<div class="bar-menu">
					<ul>
						<!-- 列表列出超链接 -->
						<li><a class="user-login" href="/coffeWeb/Menu/menu.jsp">精品推荐</a></li>
						<li><a class="user-signin" href="/coffeWeb/Menu/menuDrink.jsp">饮品</a></li>
						<li><a class="admin-login" href="/coffeWeb/Menu/menuSnack.jsp">餐点</a></li>
					</ul>
					</div>
				</div>
			</div>
			<!-- 侧底栏购物车图片(超链接) -->
			<footer class="footer">
				<a class="cart" href="/coffeWeb/Cart/cart.jsp">
					<img alt="购物车" src="/coffeWeb/Img/cart.png" height="40" width="40" />
				</a>
			</footer>
	</nav>
	<!-- 页面主体(右侧部分) -->
    <nav id="body1">
    	<!-- 背景(可在样式表更改背景图片) -->
   		<div class="body-background" >
   			<div class="cart-div">
			<!-- 订单页头部 -->
				<p class="cart-head"><span>购物车</span></p>
			<div>
   			<table class="am-table am-table-striped am-table-hover  ">
			<thead >
				<!-- 表头部分 -->
			<tr>
				<th></th>
				<th class="foodName">名称</th>
				<th class="foodPrice">单价</th>
				<th class="foodNum">数量</th>
				<th class="multy-price">总价</th>
				<th></th>
			</tr>
			</thead>
			<tbody>
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
					<input type="text" class="foodNumText" value="<%=cart.getFoodMount()%>">
					<button class="add" type="button">+</button>
					<div id=foodMount><%=food.getFoodMount()%></div>
				</td>
				<td class="multy-price"><%=food.getFoodPrice()*cart.getFoodMount()%></td>
				<td><button class='delete am-btn am-btn-danger' >删除</button></td>
		</tr>
		<%}; %>
		<!-- 循环结束 -->
		
		<!-- 合计部分 -->
		<thead >
				<!-- 表头部分 -->
			<tr>
				<th class="final-bar">全选</th>
				<th class="final-bar"></th>
				<th class="final-bar"></th>
				<th class="final-bar">总数</th>
				<th class="final-bar">总计</th>
				<th class="final-bar"></th>
			</tr>
		</thead>
		<tr>
			<!-- 全选替换图标  -->
			<td><div id="allSelected" class="checked all"></div></td>
			<!-- 总价和总数 -->
			<td></td>
			<td></td>
			<td><div id="sumNum"></div></td>
			<td><div id="sumPrice"></div></td>
			<td><button class="delete-all am-btn am-btn-danger">清空购物车</button></td>
			<!-- 结账按钮 -->
		</tr>
		</tbody>
		</table>
			
			<a class="am-btn am-btn-warning cart-submit" type="button" id="checkOut"  >
				<i class="am-icon-shopping-cart"></i>
				结账
			</a>
       	</div>
		</div>
		</div>
	</nav>
</div>	
	
</body>
</html>