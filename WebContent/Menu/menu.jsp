<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>菜单</title>
<style type="text/css">

* {
    margin: 0;
    border: 0;
    padding: 0;
    font-size: 13pt;
}
 
#nav {
     display: flex;
     flex-wrap: wrap;
     margin-top: 20px;
     margin-left:50px;
}
#food div{
	margin-left:50px ;
	margin-right:50px ;
	margin-top:20px ;
	margin-bottom:20px ;
	text-align:center;
}
#nav ul {
    list-style: none;
    margin-left: -16pxpx;
}
 
li {
   margin-left: -16pxpx;
   display: list-item;
   text-align:center;
}
 
#food strong {
	text-align:center;
}

img.foodImg{
	height:170px;
	width:170px;
}

</style>
</head>
<body>
	<jsp:include page="../MainPage/guide.jsp"></jsp:include>
	<form action="GetMenuItems">
		关键字:<input type="text" name="selectParam"/>
		<input type="submit" value="查找">
	</form>	 
	<div>
	<!-- 通过ul和li的样式设置排列方式 -->
	<ul>
	<li>
	<div id="nav">
	<!-- jstl循环输出餐品 -->
	<c:forEach items="${sessionScope.selectFood}" var="food" varStatus="status">
		<!-- 每一个餐品的div -->
		<div id="food">
		<!-- 超链接，指向isAddToCartWindow.jsp页面 -->
		<a href="isAddToCartWindow.jsp?addFoodNo=${food.foodNo}
		&addFoodName=${food.foodName}&addFoodPrice=${food.foodPrice}
		&addFoodMount=${food.foodMount}&addFoodType=${food.foodType}" id="${food.foodNo}">
			<!-- 显示图片和信息的div -->
			<div>
			<!-- jstl标签，通过类型foodType选择显示的图片的文件夹，img元素显示图片 -->
			<c:if test="${food.foodType=='drink'}">
				<img class="foodImg" alt="${food.foodName}" src="/coffeWeb/Img/drink/${food.foodName}.png">
			</c:if>
			<c:if test="${food.foodType=='snack'}">
				<img class="foodImg" alt="${food.foodName}" src="/coffeWeb/Img/snack/${food.foodName}.png">
			</c:if>
			</div>
			<!-- 显示食物名 -->
			${food.foodName}
		</a>
		<!-- 价格和库存 -->
		<br>￥：${food.foodPrice}
		<br>库存：${food.foodMount}
		</div>
	</c:forEach>
	<!-- 循环结束 -->
	</div>
	</li>
	</ul>
	</div>
</body>
</html>