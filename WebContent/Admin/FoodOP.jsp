<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>菜品操作</title>
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
				var tr = $(this);
				//tr内元素
				var foodNoTd = tr.children(".foodNo");
				var foodNameTd = tr.children(".foodName");
				var foodPriceTd = tr.children(".foodPrice");
				var foodMountTd = tr.children(".foodMount");
				var foodTypeTd = tr.children(".foodType");
				
				//按钮图标
				var bt=$(this).children(".unchecked");
				
				
				if(!bt.hasClass('checked')){
					//no checked
					$(".checked").removeClass("checked");
					bt.addClass("checked");
					
					$("#foodNo").val(foodNoTd.text());
					$("#foodName").val(foodNameTd.text());
					$("#foodPrice").val(foodPriceTd.text());
					$("#foodMount").val(foodMountTd.text());
					$("#foodType").val(foodTypeTd.text());
				}
				else{
					bt.removeClass("checked");
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
	$(".filePicker").bind("click", function(e){
    	$("#fileImage").click();
    });
	$("#foodOPBtn").click(function(){
		updateUI();
	});
	$("#insert").click(function() {
		var isHaveChecked = false;

		$(".unchecked").each(function(){
			var bt= $(this);
			if(bt.hasClass('checked')){
				//是否有东西被选中
				isHaveChecked = true;
			}
		});
		
		if(isHaveChecked){
			/*
			$("#foodNoInput").val($("#foodNo").val());
			$("#foodNameInput").val($("#foodName").val());
			$("#foodPriceInput").val($("#foodPrice").val());
			$("#foodMountInput").val($("#foodMount").val());
			$("#foodTypeInput").val($("#foodType").val());
			*/
		    var $modal = $('#your-modal');
		    $modal.modal();	    
		}
		else{
			alert("请先选中一栏");
		}
		
	 });
	$("#update").click(function(){
		
		var isHaveChecked = false;

		$(".unchecked").each(function(){
			var bt= $(this);
			if(bt.hasClass('checked')){
				//是否有东西被选中
				isHaveChecked = true;
			}
		});
		
		if(isHaveChecked){
			if(confirm("确认修改")){
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
			}
		}
		else{
			alert("请先选中一栏");
		}
		
	});
	$("#delete").click(function(){
		
		var isHaveChecked = false;

		$(".unchecked").each(function(){
			var bt= $(this);
			if(bt.hasClass('checked')){
				//是否有东西被选中
				isHaveChecked = true;
			}
		});
		
		if(isHaveChecked){
			if(confirm("确认删除")){
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
			}
		}
		else{
			alert("请先选中一栏");
		}
	});
	updateUI();
});
</script>
<style type="text/css">
.foodNo,.foodName,.foodPrice,.foodType,.foodMount{
	text-align:right;
	
}
#foodNo,#foodName,#foodPrice,#foodType,#foodMount{
	text-align:right;
	width:150px;
	height:30px;
	color:red;
}
.page_info{
	display:inline-block;
	margin-left:3%
	text-align:left;
}
.page_show{
	display:inline-block;
	margin-left:70%;
	text-align:right;
}
input[type="radio"]#select{
	display:none;
}
.unchecked{
	background-image:url(../Img/cbu.png);
	background-size:100% 100%;
	width:32px;
	
}
.checked{
	background-image:url(../Img/cb.png);
	background-size:100% 100%;
	
}
</style>
<!-- 美化页面配置 -->
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="">
    <link rel="apple-touch-icon-precomposed" href="/coffeWeb/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <script src="/coffeWeb/assets/js/echarts.min.js"></script>
    <link rel="stylesheet" href="/coffeWeb/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="/coffeWeb/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="/coffeWeb/assets/css/app.css">
    <script src="/coffeWeb/assets/js/jquery.min.js"></script>

    <style type="text/css">
		.coffee_Logo{
			width:32px;
			height:32px;
		}
	</style>
</head>
<body data-type="widgets">
	
	

	<!-- 新 -->
	<script src="/coffeWeb/assets/js/theme.js"></script>
    <div class="am-g tpl-g">
        <!-- 头部 -->
        <header>
            <!-- logo -->
            <div class="am-fl tpl-header-logo">
                <a href="javascript:;"><img class="coffee_Logo" src="/coffeWeb/Img/icon.jpg" alt=""></a>
            </div>
            <!-- 右侧内容 -->
            <div class="tpl-header-fluid">
                <!-- 侧边切换 -->
                <div class="am-fl tpl-header-switch-button am-icon-list">
                    <span>

                </span>
                </div>
                <!-- 搜索 -->
                <div class="am-fl tpl-header-search">
                    
                </div>
                <!-- 其它功能-->
                <div class="am-fr tpl-header-navbar">
                    <ul>
                        <!-- 欢迎语 -->
                        <li class="am-text-sm tpl-header-navbar-welcome">
                            <a href="javascript:;">欢迎你, <span>管理员：${AdminConfig.adminName}</span> </a>
                        </li>

                        <!-- 新邮件 -->
                        <li class="am-dropdown tpl-dropdown" data-am-dropdown>
                            <a href="javascript:;" class="am-dropdown-toggle tpl-dropdown-toggle" data-am-dropdown-toggle>
                                <i class="am-icon-envelope"></i>
                                <span class="am-badge am-badge-success am-round item-feed-badge">4</span>
                            </a>
                            <!-- 弹出列表 -->
                            <ul class="am-dropdown-content tpl-dropdown-content">
                                <li class="tpl-dropdown-menu-messages">
                                    <a href="javascript:;" class="tpl-dropdown-menu-messages-item am-cf">
                                        <div class="menu-messages-ico">
                                            <img src="/coffeWeb/assets/img/user04.png" alt="">
                                        </div>
                                        <div class="menu-messages-time">
                                            3小时前
                                        </div>
                                        <div class="menu-messages-content">
                                            <div class="menu-messages-content-title">
                                                <i class="am-icon-circle-o am-text-success"></i>
                                                <span>人事部-韩蕾</span>
                                            </div>
                                            <div class="am-text-truncate"> 恭喜星伍克studio成功在香港敲钟！ </div>
                                            <div class="menu-messages-content-time">2018-07-11 下午 16:40</div>
                                        </div>
                                    </a>
                                </li>

                                <li class="tpl-dropdown-menu-messages">
                                    <a href="javascript:;" class="tpl-dropdown-menu-messages-item am-cf">
                                        <div class="menu-messages-ico">
                                            <img src="/coffeWeb/assets/img/user02.png" alt="">
                                        </div>
                                        <div class="menu-messages-time">
                                            5天前
                                        </div>
                                        <div class="menu-messages-content">
                                            <div class="menu-messages-content-title">
                                                <i class="am-icon-circle-o am-text-warning"></i>
                                                <span>小张</span>
                                            </div>
                                            <div class="am-text-truncate"> 老板我今天请假 </div>
                                            <div class="menu-messages-content-time">2016-09-16 上午 09:23</div>
                                        </div>
                                    </a>
                                </li>
                                <li class="tpl-dropdown-menu-messages">
                                    <a href="javascript:;" class="tpl-dropdown-menu-messages-item am-cf">
                                        <i class="am-icon-circle-o"></i> 进入列表…
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <!-- 新提示 -->
                        <li class="am-dropdown" data-am-dropdown>
                            <a href="javascript:;" class="am-dropdown-toggle" data-am-dropdown-toggle>
                                <i class="am-icon-bell"></i>
                                <span class="am-badge am-badge-warning am-round item-feed-badge">5</span>
                            </a>

                            <!-- 弹出列表 -->
                            <ul class="am-dropdown-content tpl-dropdown-content">
                                <li class="tpl-dropdown-menu-notifications">
                                    <a href="javascript:;" class="tpl-dropdown-menu-notifications-item am-cf">
                                        <div class="tpl-dropdown-menu-notifications-title">
                                            <i class="am-icon-line-chart"></i>
                                            <span> 有6笔新的销售订单</span>
                                        </div>
                                        <div class="tpl-dropdown-menu-notifications-time">
                                            12分钟前
                                        </div>
                                    </a>
                                </li>
                                <li class="tpl-dropdown-menu-notifications">
                                    <a href="javascript:;" class="tpl-dropdown-menu-notifications-item am-cf">
                                        <div class="tpl-dropdown-menu-notifications-title">
                                            <i class="am-icon-star"></i>
                                            <span> 有3个来自人事部的消息</span>
                                        </div>
                                        <div class="tpl-dropdown-menu-notifications-time">
                                            30分钟前
                                        </div>
                                    </a>
                                </li>
                                <li class="tpl-dropdown-menu-notifications">
                                    <a href="javascript:;" class="tpl-dropdown-menu-notifications-item am-cf">
                                        <div class="tpl-dropdown-menu-notifications-title">
                                            <i class="am-icon-folder-o"></i>
                                            <span> 上午开会记录存档</span>
                                        </div>
                                        <div class="tpl-dropdown-menu-notifications-time">
                                            1天前
                                        </div>
                                    </a>
                                </li>


                                <li class="tpl-dropdown-menu-notifications">
                                    <a href="javascript:;" class="tpl-dropdown-menu-notifications-item am-cf">
                                        <i class="am-icon-bell"></i> 进入列表…
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <!-- 退出 -->
                        <li class="am-text-sm" >
                            <a href="/coffeWeb/Admin/adminLogin.jsp">
                                <span class="am-icon-sign-out" ></span> 退出
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </header>
        <!-- 风格切换 -->
        <div class="tpl-skiner">
            <div class="tpl-skiner-toggle am-icon-cog">
            </div>
            <div class="tpl-skiner-content">
                <div class="tpl-skiner-content-title">
                    选择主题
                </div>
                <div class="tpl-skiner-content-bar">
                    <span class="skiner-color skiner-white" data-color="theme-white"></span>
                    <span class="skiner-color skiner-black" data-color="theme-black"></span>
                </div>
            </div>
        </div>
        <!-- 侧边导航栏 -->
        <div class="left-sidebar">
            <!-- 用户信息 -->
            <div class="tpl-sidebar-user-panel">
                <div class="tpl-user-panel-slide-toggleable">
                    <div class="tpl-user-panel-profile-picture">
                        <img src="/coffeWeb/assets/img/user04.png" alt="">
                    </div>
                    <span class="user-panel-logged-in-text">
              <i class="am-icon-circle-o am-text-success tpl-user-panel-status-icon"></i>
             ${AdminConfig.adminName}
          </span>
                    <a href="javascript:;" class="tpl-user-panel-action-link"> <span class="am-icon-pencil"></span> 账号设置</a>
                </div>
            </div>

            <!-- 菜单 -->
            <ul class="sidebar-nav">
                <!--  <li class="sidebar-nav-heading">Components <span class="sidebar-nav-heading-info"> 附加组件</span></li>-->
                <li class="sidebar-nav-link">
                    <a href="adminConfig.jsp" >
                        <i class="am-icon-home sidebar-nav-link-logo"></i> 首页
                    </a>
                </li>
                
               

                <!-- <li class="sidebar-nav-heading">Page<span class="sidebar-nav-heading-info"> 操作权限</span></li> -->
                <li class="sidebar-nav-link">
                    <a href="javascript:;" class="sidebar-nav-sub-title active" >
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 数据列表
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico sidebar-nav-sub-ico-rotate"></span>
                    </a>
                    <ul class="sidebar-nav sidebar-nav-sub" style="display: block;">
                        <li class="sidebar-nav-link">
                            <a href="UserOP.jsp" >
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 用户列表
                            </a>
                        </li>

                        <li class="sidebar-nav-link">
                            <a href="FoodOP.jsp"  class="sub-active">
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 菜品列表
                            </a>
                        </li>
                    </ul>
                </li>
                

            </ul>
        </div>

	

	
	 <!-- 内容区域 -->
        <div class="tpl-content-wrapper">
            <div class="row-content am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title  am-cf">餐品列表</div>


                            </div>
                            <div class="widget-body  am-fr">
								<!-- 功能模块 -->
                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                    <div class="am-form-group">
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <button type="button" class="am-btn am-btn-default am-btn-success" id="insert"><span class="am-icon-plus"></span> 添加</button>
                                                
                                                <button type="button" class="am-btn am-btn-default am-btn-warning" id="update"><span class="am-icon-archive"></span>修改</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-danger" id="delete"><span class="am-icon-trash-o"></span> 删除</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                    <div class="am-form-group tpl-table-list-select">
                                      
                                    </div>
                                </div>
                                <!-- 餐品搜索栏 -->
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        <input type="text" class="am-form-field " name="selectFoodParam" id="selectFoodParam">
                                        <span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" type="button" id="foodOPBtn"></button>
          </span>
                                    </div>
                                </div>

                                <div class="am-u-sm-12">
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
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="am-modal am-modal-no-btn" tabindex="-1" id="your-modal">
  		<div class="am-modal-dialog">
    		<div class="am-modal-hd">Modal 标题
      			<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
    		</div>
    		<!-- 模态内容 -->
   			 <div class="am-modal-bd">
      			<div id="demo" class="demo" style="width: 650px; height: 400px;">
					<form id="uploadForm" name="uploadForm" method="post" action="../Upload" enctype="multipart/form-data">
						<div class="upload_box">
							<div class="upload_main">			
								<div class="convent_choice">
									<div class="andArea">
										<div id="preview" class="upload_preview">
			 							<div class="uploadImg" style="width:105px">
			 							<img id="uploadImage" class="upload_image" src="/coffeWeb/Img/add_img.png">
			 							</div>
			 							</div>
										<div class="filePicker">点击选择文件</div>
										<input id="fileImage" onchange="changepic(this)" type="file" name="fileselect[]" accept="image/png, image/jpeg, image/gif, image/jpg">
			 						</div>
			 						<div class="status_bar">
			 							<div id="status_info" class="status_info"></div>
			 						</div>
			 					</div>
			 				</div>		
			 				餐品号:<input type="text" name="foodNo" id="foodNoInput"><br>
							餐品名:<input type="text" name="foodName" id="foodNameInput"><br>
							餐品单价:<input type="text" name="foodPrice" id="foodPriceInput"><br>
							餐品库存：<input type="text" name="foodMount" id="foodMountInput"><br>
							餐品类型：<input type="text" name="foodType" id="foodTypeInput">
							<input type="submit" value="提交" >
 			</div>
		</form>
		
	</div>
    		</div>
  		</div>
	</div>
  
   
    <script src="/coffeWeb/assets/js/amazeui.min.js"></script>
    <script src="/coffeWeb/assets/js/app.js"></script>
	
</body>
</html>