<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>foodOP</title>
<script type="text/javascript" src="/coffeWeb/JS/ajax.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.js"></script>
<script type="text/javascript">
//js代码，不用修改
function updateUI(){
	<%
		String pageNo="1";
		if(request.getParameter("pageNo")!=null){
			pageNo=request.getParameter("pageNo");
		}
	%>
	$.ajax({
		url: 'GetFood',
		type:'POST',
		async:true,
		data:{ 
			foodParam: $("#selectFoodParam").val(),
			pageNo: <%=pageNo%> 
			},
		timeout:5000,
		success:function(data){
			$("#foodOP").html(data);
			$(".info").bind("click",function(){
				var div = $(this);
				var foodNoDiv = div.children(".foodNo");
				var foodNameDiv = div.children(".foodName");
				var foodPriceDiv = div.children(".foodPrice");
				var foodMountDiv = div.children(".foodMount");
				var foodTypeDiv = div.children(".foodType");
							
				var bt=$(this).children(".unchecked");
				var inputBt =bt.siblings("input");
				if(!inputBt.is(':checked')){
					//no checked
					$(".checked").removeClass("checked");
					inputBt.prop("checked",true);
					bt.addClass("checked");
					
					$("#foodNo").val(foodNoDiv.text());
					$("#foodName").val(foodNameDiv.text());
					$("#foodPrice").val(foodPriceDiv.text());
					$("#foodMount").val(foodMountDiv.text());
					$("#foodType").val(foodTypeDiv.text());
				}
				else{
					bt.removeClass("checked");
					inputBt.prop("checked",false);
					$("#foodNo").val("");
					$("#foodName").val("");
					$("#foodPrice").val("");
					$("#foodMount").val("");
					$("#foodType").val("");
				}
			});
		}
	});
};

$(document).ready(function(){
	$("#foodOPBtn").click(function(){
		updateUI();
	});
	$("#insert").click(function(){
		$.ajax({
			url: 'AdminFoodOP',
			type:'POST',
			async:true,
			data:{
				opName: "insert",
				foodNo: $("#foodNo").val(),
				foodName: $("#foodName").val(),
				foodPrice: $("#foodPrice").val(),
				foodMount: $("#foodMount").val(),
				foodType: $("#foodType").val()
			},
			timeout:5000,
			success:function(data){
				alert(data);
				updateUI();
			}
		});
	});
	$("#update").click(function(){
		$.ajax({
			url: 'AdminFoodOP',
			type:'POST',
			async:true,
			data:{
				opName: "update",
				foodNo: $("#foodNo").val(),
				foodName: $("#foodName").val(),
				foodPrice: $("#foodPrice").val(),
				foodMount: $("#foodMount").val(),
				foodType: $("#foodType").val()
			},
			timeout:5000,
			success:function(data){
				alert(data);
				updateUI();
			}
		});
	});
	$("#delete").click(function(){
		$.ajax({
			url: 'AdminFoodOP',
			type:'POST',
			async:true,
			data:{
				opName: "delete",
				foodNo: $("#foodNo").val(),
				foodName: $("#foodName").val(),
				foodPrice: $("#foodPrice").val(),
				foodMount: $("#foodMount").val(),
				foodType: $("#foodType").val()
			},
			timeout:5000,
			success:function(data){
				alert(data);
				updateUI();
			}
		});
	});
	updateUI();
});
</script>
<style type="text/css">
.foodNo,.foodName,.foodPrice,.foodType,.foodMount{
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
input[type="radio"]#select{
	display:none;
}
.unchecked{
	background-image:url(../Img/cbu.png);
	display:inline-block;
	height:30px;
	width:30px;
	margin-left:50px ;
	margin-right:50px ;
	margin-top:20px ;
	margin-bottom:20px ;
}
.checked{
	background-image:url(../Img/cb.png);
	display:inline-block;
}
</style>
</head>
<body>
	<!-- 原导航栏 -->
	<jsp:include page="adminGuide.jsp"></jsp:include>
	
	<button type="button" id="insert">添加</button>
	<button type="button" id="delete">删除</button>
	<button type="button" id="update">修改</button>
	<!-- 搜索栏 -->
	关键字:<input type="text" name="selectFoodParam" id="selectFoodParam">
	<button type="button" id="foodOPBtn">查找菜品</button>
	
	<!-- 功能模块 -->
	
	<!-- 信息输出部分(点击按钮后该div会从服务器获得文本) -->
	<div id="foodOP"></div>
	
	<!-- 底部表单 -->
	<form>
		<br>
		<!-- 文本框输入 -->
		餐品号:<input type="text" name="foodNo" id="foodNo">
		餐品名:<input type="text" name="foodName" id="foodName">
		餐品单价:<input type="text" name="foodPrice" id="foodPrice">
		餐品库存：<input type="text" name="foodMount" id="foodMount">
		餐品类型：<input type="text" name="foodType" id="foodType">
	</form>
</body>
</html>