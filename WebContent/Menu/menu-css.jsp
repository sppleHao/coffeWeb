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

  <!-- <link rel="icon" type="image/png" href="../assets/i/favicon.png"> -->

  <!-- Add to homescreen for Chrome on Android -->
  <meta name="mobile-web-app-capable" content="yes">
  <!-- <link rel="icon" sizes="192x192" href="../assets/i/app-icon72x72@2x.png"> -->

  <!-- Add to homescreen for Safari on iOS -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
  <!-- <link rel="apple-touch-icon-precomposed" href="../assets/i/app-icon72x72@2x.png"> -->

  <!-- Tile icon for Win8 (144x144 + tile color) -->
  <!--  <meta name="msapplication-TileImage" content="../assets/i/app-icon72x72@2x.png">-->
  <meta name="msapplication-TileColor" content="#0e90d2">

  <link rel="stylesheet" href="../assets/css/amazeui.min.css">
  <link rel="stylesheet" href="../assets/css/app.css">
  <link href="/coffeWeb/CSS/pageFramework.css" type="text/css" rel="stylesheet">
  <link rel="icon" type="image/jpg" href="/coffeWeb/Img/icon.jpg">
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
#nav1 {
	position:absolute;
	width: 95%;
	height:100%;
    margin: 3% 3%;
    display: flex;
    float: left;
    flex-wrap: wrap;
   
}

#food div{
	 margin: 20px 20px;
     text-align:center;
     border: 2px solid #ff9e41;
}
#nav ul {
    list-style: none;
    margin-left: -16pxpx;
}
 
li {
	list-style: none;
   margin-left: 16px;
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
.imgshape{
	width:170px;
	height:170px;
	border-radius:100%;
	overflow:hidden;
}
.imgnamecss{
                text-decoration: none;
                font-family: "Adobe Song Std";
                font-size: 25px;
                color: peru;
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
.no-mount img{
	-webkit-filter: grayscale(100%);
    -moz-filter: grayscale(100%);
    -ms-filter: grayscale(100%);
    -o-filter: grayscale(100%);
    
    filter: grayscale(100%);
	
    filter: gray;
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
   	<div  class="body-background" >
   	
        <div style="background-color: #b3a896;height: 41px">
		<!-- <form action="GetMenuItems" style="line-height: 40px;">
   		 关键字: <input type="text" name="selectParam" style="height: 28px"/>
    	<input type="submit" value="查找" style="background-color: peru;height: 30px;width: 80px">
		</form>
		 -->
		 <form action="GetMenuItems"  id="get-items">
				<div class="am-g">
  					<div class="am-u-lg-6" style="left:68%">
   					 <div class="am-input-group" style="width: 300px;">
   					 	<input type="text" name="selectParam" class="am-form-field"  style="top:1px;">
   					   <span class="am-input-group-btn" style="top:1px;" >
     					   <button class="am-btn am-btn-default" type="submit" style="background-color: #fffbd5"><span class="am-icon-search"></span> </button>
     					 </span>
     					 
    					</div>
  					</div>
    			</div>
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
		</div>
	</div>
	</nav>
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