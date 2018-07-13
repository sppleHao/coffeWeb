<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>加入购物车？</title>
<script type="text/javascript" src="/coffeWeb/JS/ajax.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.js"></script>
<script type="text/javascript">
function addToCart(){
	var url = "AddFoodToCart";
    var param="addFoodNum="+addFoodNum.value;
    sendRequest(url,param,'POST' ,function() {
        if (xmlHttpRequest.readyState==4) {
            if (xmlHttpRequest.status==200) {
                alert("已加入购物车！");
                window.location.href='/coffeWeb/Menu/menu.jsp';
            }
        }
    });
}

$(document).ready(function(){
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
	餐品<br>
	<div>
		<!-- jstl标签，如果type是drink，则显示drink文件夹的元素,snack同理 -->
		<c:if test="${param.addFoodType=='drink'}">
			<img class="foodImg" alt="${param.addFoodName}" src="/coffeWeb/Img/drink/${param.addFoodName}.png">
		</c:if>
		<c:if test="${param.addFoodType=='snack'}">
			<img class="foodImg" alt="${param.addFoodName}" src="/coffeWeb/Img/snack/${param.addFoodName}.png">
		</c:if>
	</div><br>
	<!-- 输出餐品信息 -->
	餐品号:${param.addFoodNo}<br>
	餐品名:${param.addFoodName}<br>
	餐品单价:${param.addFoodPrice}<br>
	餐品库存数量:${param.addFoodMount}<br>
	
	<!-- 设置参数(不用考虑，照抄就行) -->
	<c:set value="${param.addFoodNo}" var="addFoodNo" scope="session"></c:set>
	
	<!-- 增减按钮和文本框 -->
	<button type="button" id="add">add</button>
		<input type="text" value="1" name="addFoodNum" id="addFoodNum">
		<button type="button" id="sub">sub</button>
		<br>
	<!-- 加入购物车按钮 -->
	<button  onclick="addToCart()">加入购物车</button>
	
	
</body>
</html>