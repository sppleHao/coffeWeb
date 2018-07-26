<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>用户操作</title>
<script type="text/javascript" src="/coffeWeb/JS/ajax.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.js"></script>
<script type="text/javascript">
function updateUI(){
	<%
	String pageNo="1";
	if(request.getParameter("pageNo")!=null){
		pageNo=request.getParameter("pageNo");
	}
	%>
	$.ajax({
		url: 'GetUsers',
		type:'POST',
		async:true,
		data:{ 
				userParam: $("#selectUserParam").val(),
				pageNo: <%=pageNo%> 
			},
		timeout:5000,
		success:function(data){
			$("#userOP").html(data);
			$("tr.info").bind("click",function(){
				
				var tr = $(this);
				
				var userNoTd = tr.children(".userNo");
				var userNameTd = tr.children(".userName");
				//var passwordDiv = div.children(".password");
				var telTd = tr.children(".tel");
				var emailTd = tr.children(".email");
				
				
				var bt=$(this).children(".unchecked");
				
				if(!bt.hasClass('checked')){
					//no checked
					$(".checked").removeClass("checked");
					bt.addClass("checked");
					
					$("#userNo").val(userNoTd.text());
					$("#userName").val(userNameTd.text());
					//$("#password").val(passwordDiv.text());
					$("#tel").val(telTd.text());
					$("#email").val(emailTd.text());
				}
				else{
					bt.removeClass("checked");
					
					$("#userNo").val("");
					$("#userName").val("");
					//$("#password").val("");
					$("#tel").val("");
					$("#email").val("");
				}
			});
			
			$("#skipBtn").bind("click",function(){
				if ($("#skipPage").val()!='') {
					window.location.href="/coffeWeb/Admin/UserOP.jsp?pageNo="+$("#skipPage").val();
				}
				else {
					alert("请输入跳转的页码")
				}
			});
		}
	});
};
$(document).ready(function(){
	
	//搜索关键字
	$("#userOPBtn").click(function(){
		updateUI();
	});
	
	//新增按钮
	$("#insert").click(function(){
		$.ajax({
			url: 'AdminUserOP',
			type:'POST',
			async:true,
			data:{
				opName: "insert",
				userNo: $("#userNo").val(),
				userName: $("#userName").val(),
				//password: $("#password").val(),
				tel: $("#tel").val(),
				email: $("#email").val()
			},
			timeout:5000,
			success:function(data){
				alert(data);
				updateUI();
			}
		});
	});
	
	//删除按钮
	$("#delete").click(function(){
		if(confirm("确认删除")){
			$.ajax({
				url: 'AdminUserOP',
				type:'POST',
				async:true,
				data:{
					opName: "delete",
					userNo: $("#userNo").val(),
					userName: $("#userName").val(),
					//password: $("#password").val(),
					tel: $("#tel").val(),
					email: $("#email").val()
				},
				timeout:5000,
				success:function(data){
					alert(data);
					updateUI();
				}
			});
		}
	});
	
	//修改按钮
	$("#update").click(function(){
		$.ajax({
			url: 'AdminUserOP',
			type:'POST',
			async:true,
			data:{
				opName: "update",
				userNo: $("#userNo").val(),
				userName: $("#userName").val(),
				//password: $("#password").val(),
				tel: $("#tel").val(),
				email: $("#email").val()
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
<!-- 美化页面配置 -->
<meta charset="utf-8">
	<link rel="stylesheet" href="/coffeWeb/CSS/UserOP.css">
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
                <a href="javascript:;"><img class="coffee_Logo" src="/coffeWeb/Img/adminHead.png" alt=""></a>
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
                            <a href="/coffeWeb/Admin/AdminSignOut">
                                <span class="am-icon-sign-out"></span> 退出
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
                            <a href="UserOP.jsp" class="sub-active" >
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 用户列表
                            </a>
                        </li>

                        <li class="sidebar-nav-link">
                            <a href="FoodOP.jsp">
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
                                <div class="widget-title  am-cf">用户列表</div>


                            </div>
                            <div class="widget-body  am-fr">

                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                    <div class="am-form-group">
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <button type="button" class="am-btn am-btn-default am-btn-success" id="insert"><span class="am-icon-plus"></span> 添加</button>
                                                <!-- <button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>  -->
                                                <button type="button" class="am-btn am-btn-default am-btn-warning" id="update"><span class="am-icon-archive"></span> 修改</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-danger" id="delete"><span class="am-icon-trash-o"></span> 删除</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                               <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                    <div class="am-form-group tpl-table-list-select">
                                        
                                    </div>
                                </div>
                               
                                <!-- 用户信息搜索栏 -->
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        <input type="text" class="am-form-field " name="selectUserParam" id="selectUserParam">
                                        <span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" type="button" id="userOPBtn"></button>
          </span>
                                    </div>
                                </div>

                                <div class="am-u-sm-12">
                                	<!-- 信息输出部分(点击按钮后该div会从服务器获得文本) -->
									<div id="userOP" ></div>
                                    <!-- 底部表单 -->
									<form>
										</br>
										用户名:<input type="text" name="userNo" id="userNo">
										昵称:<input type="text" name="userName" id="userName">
										电话：<input type="text" name="tel" id="tel">
										邮箱：<input type="text" name="email" id="email">
									</form>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <script src="/coffeWeb/assets/js/amazeui.min.js"></script>
    <script src="/coffeWeb/assets/js/amazeui.datatables.min.js"></script>
    <script src="/coffeWeb/assets/js/dataTables.responsive.min.js"></script>
    <script src="/coffeWeb/assets/js/app.js"></script>
</body>
</html>