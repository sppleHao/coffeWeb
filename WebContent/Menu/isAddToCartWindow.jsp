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
	var ajax_option={
			url:'AddFoodToCart',
			success:function(data){
				alert(data);
				if(data=='已加入购物车'){
					window.location.href='/coffeWeb/Menu/menu.jsp';
				}
			}
	};

  $("#addItemsForm").validate({
	  submitHandler:function(form){
      	if(confirm("确认")){
      		$("#addItemsForm").ajaxSubmit(ajax_option);
      	}
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
	height:170px;
	width:170px;
}
</style>
</head>
<body>
	<div id="window" class="window" style="width: 650px; height: 400px;">
		<!-- 食物名标题 -->
		<div class="title">
			<h1>${param.addFoodName}</h1>
		</div>
		
		<!-- 图片 -->
		<div id="food-img" class="food-img">
			<!-- jstl标签，如果type是drink，则显示drink文件夹的元素,snack同理 -->
			<c:if test="${param.addFoodType=='drink'}">
				<img class="foodImg" alt="${param.addFoodName}" src="/coffeWeb/Img/drink/${param.addFoodName}.png">
			</c:if>
			<c:if test="${param.addFoodType=='snack'}">
				<img class="foodImg" alt="${param.addFoodName}" src="/coffeWeb/Img/snack/${param.addFoodName}.png">
			</c:if>
		</div>
		
		<!-- 餐品信息 -->
		<div id="food-config" class="food-config">
			餐品名:${param.addFoodName}<br>
			餐品单价:${param.addFoodPrice}<br>
			餐品库存数量:${param.addFoodMount}<br>
		</div>
		
		<form id="addItemsForm" name="addItemsForm" method="post">
			<!-- 增减按钮和文本框 -->
			<button type="button" id="add">add</button>
				<input type="text" value="${param.addFoodNo}" name="addFoodNo" id="addFoodNo">
				<input type="text" value="1" name="addFoodNum" id="addFoodNum">
				<button type="button" id="sub">sub</button>
				<br>
			<!-- 加入购物车按钮 -->
			<input type="submit" id="addTocart" value="加入购物车">
		</form>
	</div>
	
	
</body>
</html>