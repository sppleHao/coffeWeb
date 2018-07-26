<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>加入购物车？</title>
<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery.validate.min.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/messages_zh.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery-form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//点击按钮
	$("#addDiv").bind("click", function(e){
    	$("#add").click();
    });
	
	$("#subDiv").bind("click", function(e){
    	$("#sub").click();
    });
	
	$("#addToCartDiv").bind("click", function(e){
    	$("#addToCart").click();
    });
	
	var ajax_option={
			url:'AddFoodToCart',
			success:function(data){
				alert(data);
				if(data=='已加入购物车'){
					//window.location.href='/coffeWeb/Menu/menu.jsp';
					location.reload();
				}
				if (data=='请先登陆') {
					window.location.href='/coffeWeb/User/userLogin.jsp';
				}
			}
	};

  $("#addItemsForm").validate({
	  submitHandler:function(form){
      		$("#addItemsForm").ajaxSubmit(ajax_option);
      },
	  rules:{
		  addFoodNum:{
			  required:true,
			  digits:true
		  }
	  },
	  errorElement: "span",
  	  errorPlacement: function(error, element) {
		$( element )
		.closest( "form" )
			.find("div"+"."+element.attr( "id" ) )
				.html( error );
	  },
	  message:{
		  addFoodNum:{
				required:"加入数量不能为空",
				digits:"加入数量只能为数字"
			}
	  }
  });
	
  //+
  $("button#add").click(function(){
	  var num =$("input#addFoodNum").val();
	  var mount = $('.food-info-mount').text();
	  if (parseInt(num) >= parseInt(mount)) {
		  alert("数量不能超过库存量!");
		  $("input#addFoodNum").val(parseInt(mount));
		}
	  else {
			$("input#addFoodNum").val(parseInt(num)+1);
		}
  });
  
  //-
  $("button#sub").click(function(){
	  var num =$("input#addFoodNum").val();
	  if (parseInt(num) <=1) {
		  alert("数量必须是正数!");
		  $("input#addFoodNum").val(1);
		}
	  else {
		  $("input#addFoodNum").val(parseInt(num)-1);
		}
  });
  
  //修改表单
  $("#addFoodNum").bind('input propertychange',function(){
	  var num =$("input#addFoodNum").val();
	  var mount = $('.food-info-mount').text();
	  if(parseInt(num) >= parseInt(mount)){
		  alert("数量不能超过库存量!");
		  $("input#addFoodNum").val(parseInt(mount));
	  }
	  if (parseInt(num) <1) {
		  alert("数量必须是正数!");
		  $("input#addFoodNum").val(1);
		}
	});
});
</script>
<link href="/coffeWeb/CSS/isAddToCart.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div id="window" class="window" style="width: 800px; height: 600px;">
		<!-- 图片 -->
		<div id="food-img" class="food-img">
			<!-- jstl标签，如果type是drink，则显示drink文件夹的元素,snack同理 -->
			<div>
				<img class="foodImg" alt="${param.addFoodName}">
			</div>
		</div>
		
		<div id="food-title">
			<h1></h1>
		</div>
		
		<!-- 餐品信息 -->
		<div id="food-config" class="food-config">
			<table id="food-info">
				<tbody>
					<tr>
						<th>单价</th>
						<th>库存数量</th>
					</tr>
					<tr>
						<td class='food-info-price'></td>
						<td class='food-info-mount'></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div id="food-op">
		<form id="addItemsForm" name="addItemsForm" method="post">
			<!-- 增减按钮和文本框 -->
			
			<div id="add-and-sub">
				<div id="subDiv">
					<img alt="minus" src="/coffeWeb/Img/minus.png">
				</div>
				<input type="text" value="1" name="addFoodNum" id="addFoodNum">
				<div id="addDiv">
					<img alt="plus" src="/coffeWeb/Img/plus.png">
				</div>
			</div>
			<div class="addFoodNum"></div>
			<input type="text" readonly="readonly" value="" name="addFoodNo" id="addFoodNo">
			<button type="button" id="add">add</button>
			<button type="button" id="sub">sub</button>
				<br>
				
			<div id="submitDiv">
			<!-- 加入购物车按钮 -->
			<div id="addToCartDiv">加入购物车</div>
			<input type="submit" id="addToCart" value="加入购物车">
			</div>
		</form>
		</div>
	</div>
	
	
</body>
</html>