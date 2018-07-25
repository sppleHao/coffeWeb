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
	  var mount = '<%=request.getParameter("addFoodMount")%>';
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
	  var mount = '<%=request.getParameter("addFoodMount")%>';
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
<style type="text/css">
img.foodImg{
	height:200px;
	width:300px;
}
#food-img{
	background-image: url(/coffeWeb/Img/pdbg.jpg);
	background-size: 100% 100%;
	width: 100%;
	height: 50%;
	align-items: center;
	display: flex;
	justify-content: center;
	
}
#pd-bg{
	width: 100%;
	height: 100%;
}
#food-title{
	text-align:center;
	color:#f99d25;
	border-bottom: 1px solid #000;
}
#food-config{
	text-align:center;
	display: flex;
	justify-content: space-between;
	border-bottom: 1px solid #000;
	padding: 20px;
}
table{
	width:100%;
}
#food-op{
	padding: 10px;
}
#add-and-sub{
	align-items: center;	
	display: flex;
	justify-content: center;
}
#addDiv img,#subDiv img{
	padding:5px;
	width:50px;
	height: 50px;
}
#addFoodNum{
	text-align:center;
	height: 40px;
	font-size: 30px;
	font-weight: 400;
}
#add,#sub,#addToCart,#addFoodNo{
	display: none;
}
#submitDiv{
	align-items: center;	
	display: flex;
	justify-content: center;
}
#addToCartDiv{
	background: none repeat scroll 0 0 #f99d25;
    border-radius: 3px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
    color: #000;
    cursor: pointer;
    display: inline-block;
    font-size: 18px;
    font-weight:700;
    height: 44px;
    line-height: 44px;
    width: 90%;
    min-width:120px;
    max-width:240px;
    text-align:center;
    overflow: hidden;
    transition: background 0.2s;
	-moz-transition: background 0.2s;
	-webkit-transition: background 0.2s;
	-o-transition: background 0.2s;
}
</style>
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