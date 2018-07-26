<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>菜单</title> 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Set render engine for 360 browser -->
  <meta name="renderer" content="webkit">

  <!-- No Baidu Siteapp-->
  <meta http-equiv="Cache-Control" content="no-siteapp"/>

  <link rel="icon" type="image/png" href="../assets/i/favicon.png">

  <!-- Add to homescreen for Chrome on Android -->
  <meta name="mobile-web-app-capable" content="yes">
  <link rel="icon" sizes="192x192" href="../assets/i/app-icon72x72@2x.png">

  <!-- Add to homescreen for Safari on iOS -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
  <link rel="apple-touch-icon-precomposed" href="../assets/i/app-icon72x72@2x.png">

  <!-- Tile icon for Win8 (144x144 + tile color) -->
  <meta name="msapplication-TileImage" content="../assets/i/app-icon72x72@2x.png">
  <meta name="msapplication-TileColor" content="#0e90d2">

  <link rel="stylesheet" href="../assets/css/amazeui.min.css">
  <link rel="stylesheet" href="../assets/css/app.css">
 <style type="text/css">
#show-menu{
     display: flex;
     flex-wrap: wrap;
     margin-top: 20px;
     margin-left:50px;
}
.food-item{
	margin-left:50px ;
	margin-right:50px ;
	margin-top:20px ;
	margin-bottom:20px ;
	text-align:center;
} 
p{
	text-align:center;
}

.food-item-img-info{
	height:170px;
	width:170px;
}
 </style>
</head>
<body>
<form id="get-items" >
		关键字:<input type="text" name="selectParam"/>
		<input type="submit" value="查找">
</form>

<div id='show-menu'></div>

<div class="am-modal am-modal-no-btn" tabindex="-1" id="modal" >
  		<div class="am-modal-dialog" style="width: 880px; height: 630px;">
    		<div class="am-modal-hd">
      			<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
    		</div>
    		<!-- 模态内容 -->
   			 <div class="am-modal-bd">
   			 	<jsp:include page="isAddToCartWindow.jsp"></jsp:include>
    		</div>
  		</div>
</div>


<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery.validate.min.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/messages_zh.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery-form.js"></script>
<!--[if (gte IE 9)|!(IE)]><!-->
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="../assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="../assets/js/amazeui.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	var ajax_option={
			url:"GetMenuItems",
			success:function(data){
				$("#show-menu").html(data);
				$(".food-item-img-info").bind("click",function(){
					 var foodImg = $(this);
					 var foodItem = $(this).parent().parent();
					 var foodInfo = foodItem.children(".food-item-info");
	        		 var $modal = $('#modal');
	     		   	 $modal.modal();
	     		   	 
	     		   	 var foodItemSrc =foodImg.attr('src');
	     		   	 $(".foodImg").attr('src',foodItemSrc);
	     		   	 
	     		   	 var foodNo = foodItem.attr('id');
	     		   	 $("#addFoodNo").val(foodNo);
	     		   	 
	     		   	 var foodName = foodInfo.children(".food-item-info-foodName").text();
	     		   	 var foodPrice = foodInfo.children(".food-item-info-foodPrice").text();
	     		     var foodMount = foodInfo.children(".food-item-info-foodMount").text();
	        		 //alert(foodName);
	        		 //alert(foodPrice);
	        		 //alert(foodMount);
	        		 $("#food-title h1").text(foodName);
	        		 $("td.food-info-price").text(foodPrice);
	        		 $("td.food-info-mount").text(foodMount);
				});
			}
		};
	
	//ajax提交表单
	$("#get-items").validate({
        submitHandler:function(form){
        	 $("#get-items").ajaxSubmit(ajax_option);
        }
	});
	
	 $("#get-items").ajaxSubmit(ajax_option);
});
</script>
</body>
</html> 