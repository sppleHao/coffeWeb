<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>主页</title> 
<link rel="stylesheet" href="/coffeWeb/assets/css/amazeui.min.css" />
<link rel="icon" type="image/jpg" href="/coffeWeb/Img/icon.jpg">
<link href="/coffeWeb/CSS/pageFramework.css" type="text/css" rel="stylesheet">
<link href="/coffeWeb/CSS/index.css" type="text/css" rel="stylesheet">

</head> 
<body> 
 	<!-- app界面 -->
 	<div id="app-view">
 		<!-- 侧栏 -->
		<div id="nav">
			<!-- 侧顶栏 -->
			<header class="header">
				<!-- 图标 -->
				<img class="icon" src="/coffeWeb/Img/icon.png">
				<!-- 导航超链接 -->
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
						
						<span>惬意人生，咖啡相伴</span>
						<img  alt="" src="/coffeWeb/Img/coffeebar.png">
						
					</div>
				</div>
			</div>
			<!-- 侧底栏(超链接) -->
			<footer class="footer">
				<a class="cart" href="/coffeWeb/Cart/cart.jsp">
					<img alt="购物车" src="/coffeWeb/Img/cart.png" height="40" width="40" />
				</a>
			</footer>
		</div>
		<!-- 页面主体 -->
		<div id="body">
			
			<!-- 轮播框 -->
			<div id="change_show">
				<!--建立一个div标签并使用ID属性标签类进行唯一标示操作-->
				<div id="box">
					<ul>
						<!--ul为无序列表标签,li标签对象用于进行项目列表的定义操作,即在当前项目对象之前添加一个小圆点-->
						<li class="img-li"><img src="/coffeWeb/Img/show1.png"></li>
						<li class="img-li"><img src="/coffeWeb/Img/show2.png"></li>
						<li class="img-li"><img src="/coffeWeb/Img/show3.png"></li>
						<li class="img-li"><img src="/coffeWeb/Img/change_1.jpg"></li>
						<li class="img-li"><img src="/coffeWeb/Img/change_2.jpg"></li>
						<li class="img-li"><img src="/coffeWeb/Img/change_3.jpg"></li>
						
						
					</ul>
					<!--在当前div当中嵌套两个div来作为图片切换的按钮-->		
					<div id="previous" class="img-button">previous</div>
					<div id="next" class="img-button">next</div>
					<!--div盒子模型当中建立两个按钮标签来进行图片的切换结束-->
	
						<!-- 建立轮播图按钮对象开始 -->
			<!--	<ul class="button-ul"><!-- ul为无序列表标签 -->
			<!--		<li class="button-li" id="one"></li>
					<li class="button-li" id="two"></li>
					<li class="button-li" id="three"></li>
					
				</ul>
			 -->
						<!-- 建立轮播图按钮对象结束 -->		
			</div>
		<script type="text/javascript">
			var imgli=document.getElementsByClassName("img-li");/*对图片所在的li无序列表标签对象进行获取操作*/
			/*对图片当中进行图片切换的两个按钮对象进行获取操作*/
			var img_index=0;/*设置一个索引变量,用于记录当前所显示的图片的索引号*/
			/*建立新旧两个指针变量对象用于分别记录当前所显示的图片对象和下一个将要进行显示的图片对象*/
			var oldLi=imgli[0];/*页面一开始所显示的图片为索引值为0的图片*/
			var newLi;/*声明一个新的标签对象列表*/
			var img_timer;/*用于对图片进行自动播放时的计时器进行唯一标示*/
			var box= document.getElementById("box");/*获取整个盒子对象*/
			var next=document.getElementById("next");
			var previous=document.getElementById("previous");
	
			/*对图片下方的四个小圆点按钮对象进行获取操作*/	
			var one=document.getElementById("one");
			var two=document.getElementById("two");
			var three=document.getElementById("three");
			
			/*next.onclick是指当点击next标签对象当中的元素时将会触发的事件函数*/
		 	next.onclick=function nextClick()
			{
				img_index++;
				if(img_index==imgli.length)
					img_index=0;
				oldLi.style.opacity=0;
				newLi=imgli[img_index];
				newLi.style.opacity=1;
				oldLi=newLi;
			}
			previous.onclick=function previousClick()
			{
				img_index--;
				if(img_index<0)
					img_index=imgli.length-1;
				oldLi.style.opacity=0;
				newLi=imgli[img_index];
				newLi.style.opacity=1;
				oldLi=newLi;
			}
		/*建立一个播放函数来实现对imgli标签对象当中的图片的自动播放操作*/	
			function play() 
			{/* setInterval() 方法重复调用一个函数或执行一个代码段，在每次调用之间具有固定的时间延迟。该方法会返回一
		个唯一标示当前计时器方法的ID值*/
	  		  timer= window.setInterval(
	    			function ()
	    			{
	    				next.onclick()
	    			}
	    			,2500)
			}
			play();
 
			/*用于停止图片的自动播放操作*/	
			function stop() {
   		     clearInterval(timer);/*根据计时器的ID值来清除指定的计时器对象，使得当前的图片停止自动播放操作*/
   		 }
			box.onmouseover= stop;/*当鼠标移动到盒子的上方的时候将会进行事件的触发然后调用stop函数来执行自动播放的
		停止操作*/
			box.onmouseout = play;/*当鼠标移出盒子对象的时候将会重新的调用play方法来再次进行图片的轮播操作*/
	
			/*当鼠标点击第一个小圆点对象所在标签时，将会触发该方法，然后改变盒子当中对应图片的透明度*/
			one.onclick=function oneClick()
			{
				oldLi.style.opacity=0;
				newLi=imgli[0];
				newLi.style.opacity=1;
				oldLi=newLi;
			}
			one.onmouseover=one.onclick;
			/*点击第二个小圆点时触发的方法*/
			two.onclick=function twoClick()
			{
				oldLi.style.opacity=0;
				newLi=imgli[1];
				newLi.style.opacity=1;
				oldLi=newLi;
			}
			two.onmouseover=two.onclick;
	
			/*点击第三个小圆点触发方法来进行图片的显示*/
			three.onclick=function threeClick()
			{
				oldLi.style.opacity=0;
				newLi=imgli[2];
				newLi.style.opacity=1;
				oldLi=newLi;
			}
			three.onmouseover=three.onclick;
	
/*-------------------------------采用循环的方式来进行图片的切换操作-----------------------------------------*/	
	/*next.onclick是指当点击next标签对象当中的元素时将会触发的事件函数*/
/* 	next.onclick=function nextClick()
	{
		img_index++;
		if(img_index==imgli.length)
			img_index=0;
		 for(var i=0;i<imgli.length;i++)
		{//将无序列表对象当中的全部内容的透明度设置0，即不透明的
			imgli[i].style.opacity=0;	
		}	
	/*将当前要进行显示的内容设置为不透明的*/	
/* 		imgli[img_index].style.opacity=1; 
	}  */
/* 	previous.onclick=function previousClick()
	{	
/* 在for循环当中将li列表对象当中的全部的li对象的透明度设置为0，然后选择当前所要选中的li对象，将其透明度设置为1，这种方式会增加网站的响应效果，所以对当前代码段进
 *行优化操作。建立两个li列表对象，每次点击按钮事件后，使得旧的li按钮对象透明度边为0，新的按钮的透明度变为1，这样就不用对li列表对象当中的每一个li的透明度都设置为
 *0，减少了对li列表对象的遍历的个数，可以提高响应效率*/
/* 		img_index--;
		if(img_index<0)
			img_index=imgli.length-1;
		for(var i=0;i<imgli.length;i++)
		{
			imgli[i].style.opacity=0;	
		}
		imgli[img_index].style.opacity=1;	
	}  */
/*----------------------------采用循环的方式来对图片进行切换的操作结束----------------------------------*/	
	
	
			</script>
				
			</div>
			
			<!-- 三张推荐图框 -->
			
			<div class="recommend_show">
				<img class="recommend_show_img1" src="/coffeWeb/Img/showlist1.png">
				<img class="recommend_show_img2" src="/coffeWeb/Img/showlist2.png">
				<img class="recommend_show_img3" src="/coffeWeb/Img/showlist3.png">
			</div>
			
			<!-- 门店信息框 -->
			
			<div class="show_shop">
				<img class="show_shop_pic" src="/coffeWeb/Img/shop.jpg">
				<img class="show_shop_logo" src="/coffeWeb/Img/icon.jpg">
				<p class="show_shop_p1">星伍克Coffee</p>
				<p class="show_shop_p2">地址：曾厝垵男子技术学院旁</p>
			</div>
			
			<!-- 版权框 -->
			<div class="copyright">
				<p>CopyRight©星伍克Studio</p>
			</div>
		</div>
	</div>
</body> 
</html> 