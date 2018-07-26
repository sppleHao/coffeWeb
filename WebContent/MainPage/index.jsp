<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>主页</title> 
<link rel="stylesheet" href="/coffeWeb/assets/css/amazeui.min.css" />
<link rel="icon" type="image/jpg" href="/coffeWeb/Img/icon.jpg">
<link href="/coffeWeb/CSS/pageFramework.css" type="text/css" rel="stylesheet">
<style type="text/css">
/* 对全部标签对象进行初始化操作 */	
		*::selection
		{/*即点击全部的任何标签插件时都不会有背景颜色，因为默认的标签对象当中当进行多次点击操作时会出现背景色*/
			background: none;
		}
		body,ul,li
		{
			margin: 0px;
			padding: 0px;/*设置内边距为0*/
			list-style: none;/*设置标签对象当中的其它默认属性为无*/
		}/*将页面标签和序列标签对象当中的内外边距都设置为0，默认情况下是有内外边距的.margin:边距*/
/*全部标签对象初始化完毕*/
 
 
/*对盒子的样式进行设置操作*/		
		#box
		{
			position:absolute;/*对当前的div标签对象进行相对定位操作*/ 
			width: 100%;
			height: 520px;
			
			
			background: #663366;
			
			overflow:hidden;/*overflow是指当标签对象当中的内容超出边框的范围之时就会对超出容器部分的内容进行隐藏操作*/
		}
/*盒子的样式设置完毕*/	
 
 
 
/*对图片所在的无序列表li标签对象进行样式设置操作*/	
	.img-li
	{/*对无序列表标签对象当中样式进行设置操作*/
		width: 100%;/*对无序列表标签当中的数据的宽高都设置为100%即和box当中的长宽是相互吻合的*/
		height: 100%;	
		position:absolute;/*对无序标签对象当中的元素进行绝对定位使得所有的图片都叠加到了一个固定的位置中去了*/
	/*将所有的图片都设置为透明的*/	
		opacity: 0;/*opacity 属性设置元素的不透明级别,级别为0-1之间,此时li标签对象当中的图片都为透明的不会进行显示*/
		transition:2s;/*用于设置每一张图片相互之间的渐变时间的切换，当前每两个页面之间的时间的切换过程为3秒*/ */
	}
/*对图片所在的无序列表li标签对象当中的样式设置完毕*/	
 .img-li img{
		position: absolute;
		height: 100%;
		width:100%;
}
 
 
/*对img-li标签对象的第一个子节点表标签对象开始进行样式设置*/
	.img-li:FIRST-CHILD 
	{/*将无序列表项当中的第一个子节点对象当中的图片的内容设置为不透明的*/
		opacity:1;
	}
/*对img-li标签对象的第一个子节点表标签对象结束样式设置*/	
 
 
 
/*对图片当中的两个切换图片的按钮开始样式设置*/
	.img-button
	{/*对button类当中的样式格式内容进行设置操作*/
		width: 80px;
		height:30px;
		background: rgba(0,0,0,0.7);/*设置button样式类当中的背景颜色*/
		color: #fff;
		position: absolute;/*设置button样式类型当中的位置为绝对定位操作*/
		top:140px;/*设置当前的按钮到盒子顶部的像素为135*/
		text-align: center;/*设置button样式类当中的字体的位置为正中间*/
		line-height: 30px;/*设置行高，即距离当前样式框顶部的像素*/
		cursor: pointer;/*cursor(光标)*,即当光标移动到了设置了button样式的标签对象当中之后将会变为手形的光标*/
	}
/*对图片当中的两个切换图片的按钮结束样式设置*/
 
 
/*对图片右边的按钮进行样式的设置*/
	#next
	{
		right: 0px;/*设置next标签对象距离当前盒子的右边距离为0像素*/
	}
/*对图片右边的按钮完成样式的设置*/
 
 
 

	.img-button
	{
		display: none;
	}

 

/*-----------------当前样式设置完毕--------------------*/	
 
/*对小圆点按钮对象当中的ul标签对象进行样式的设置*/
.button-ul
		{/*设置ul无序列表标签对象的高度和宽度,以及ul标签对象当中的背景颜色*/
			height: 22px;
			width: 60px;
			/*ul标签对象当中进行存放内容的区域依然为一个长方形采用border属性值可以将之修改为一个圆角矩形*/
			/*background: #000;*/
			background-color: rgba(0,0,0,0.8);/*对ul标签对象的背景颜色进行设置操作，前三个参数为rgb所对应的颜色参数最后一个0.5则是用于设置当前颜色的透明度*/
			padding:5px 25px;/*对ul标签对象进行内边距的设置操作，将上下设置为5px，左右为25px*/
			border-radius: 15px;/*设置圆角的半径*/
			position: absolute;/*将ul标签对象设置为绝对定位的方式，为了让ul标签可以移动到盒子当中所显示的图片的指定的位置当中去*/
			bottom:5%;
			left:45%;
		}
/*------------------当前样式设置完毕------------------------------*/
 
 
/*对按钮无序列表对象当中的li子标签对象当中的样式进行设置操作*/
.button-ul li
		{/*为li标签对象进行长宽和边界颜色进行设置，注意此时的四个li标签对象是竖直程线性进行排列的，要想使得当前的四个标签对象程现为水平状态进行排列操作则要将之设置为float浮动型的*/

			width: 10px;
			height: 10px;
			/*注此时在li标签当中进行内容添加的区域为一个10*10的正方形区域*/
			border: 2px solid #fff;
			float: left;
			color: #fff;/*设置ul标签对象当中的字体颜色为白色*/
			list-style-type: none;/*用于去除li标签对象当中小实心圆点样式*/
			margin-right: 5px;/*设置li标签对象右方的外边距为3像素*/
			border-radius: 5px;/*进行边框半径的设置操作，将当前li标签对象当中进行内容输入的正方形区域设置为一个半径为5的圆形区域,即将li标签对象的内容输入区域的边框设置为圆脚区域*/  
			cursor: pointer;/*cursor(光标)*,即当光标移动到了设置了button样式的标签对象当中之后将会变为手形的光标*/
		}
/*---------------------当前样式设置完毕-------------------------------*/		
 
 
/*对圆点按钮对象进行悬浮样式设置，即当鼠标移动到圆点按钮上时所触发的样式事件*/
.button-li:HOVER 
	{/*对img-button样式当中的悬浮样式进行设置操作，即当鼠标移动到设置了button样式表的标签当中时所会触发的样式*/
		background:	#fff;/*当鼠标移动到设置了button样式的标签当中时，其背景颜色将会发生变化*/
	}
/*---------------------当前样式设置完毕--------------------------------*/

 
 .label{
	box-sizing: content-box;
	position: relative;
	letter-spacing: 0.4px;	
	display:flex;
	font-size: 24px;
	font-weight: 700;
	line-height: 45px;
}
.label img{
	width:45px;
	height:45px;
	margin-left: 30px;
}
#change_show{
	margin-top:0%;
	position: absolute;
	width:100%;
	height:450px;
}
.recommend_show{
	margin-top:49%;
	position:absolute;
	width:100%;
	height:210px;
	background-color: rgba(242, 242, 242, 1);
}
.recommend_show_img1{
	position:absolute;
	width:28%;
	height:85%;
	margin-top:1.5%;
	margin-left:6%;
}
.recommend_show_img2{
	position:absolute;
	width:28%;
	height:85%;
	margin-top:1.5%;
	margin-left:37%;
}
.recommend_show_img3{
	position:absolute;
	width:28%;
	height:85%;
	margin-top:1.5%;
	margin-left:68%;
}
.show_shop{
	
	position: absolute;
	margin-top:68%;
	width:100%;
	height:150px;
	background-color: rgba(255, 255, 255, 1);
}
.show_shop_pic{
	position:absolute;
	margin-top:1%;
	width:22%;
	height:120px;
	margin-left:20%;
}
.show_shop_logo{
	position:absolute;
	margin-top:3%;
	width:7%;
	height:70px;
	margin-left:48%;
}
.show_shop_p1{
	position:absolute;
	margin-top:3.5%;
	margin-left: 58%;
}
.show_shop_p2{
	position:absolute;
	margin-top:6.5%;
	margin-left: 58%;
}
.copyright{
	position: absolute;
	margin-top:85%;
	width:100%;
	height:50px;
}
.copyright p{
	margin: 0 auto;
	width:280px;
}
	</style>

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