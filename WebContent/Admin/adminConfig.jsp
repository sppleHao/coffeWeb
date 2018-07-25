<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>管理员信息</title>
<script type="text/javascript" src="/coffeWeb/JS/ajax.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.js"></script>

<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--  <link rel="icon" type="image/png" href="/coffeWeb/assets/i/favicon.png">--><!-- 网页logo -->
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

<body data-type="index">

	<!-- ADMIN CONFIG<br>
	AdminNo:${AdminConfig.adminNo}<br>
	AdminName:${AdminConfig.adminName}<br>
	 -->
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
                        <li class="am-text-sm">
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
                    <a href="adminConfig.jsp" class="active">
                        <i class="am-icon-home sidebar-nav-link-logo"></i> 首页
                    </a>
                </li>
                
              

                <!-- <li class="sidebar-nav-heading">Page<span class="sidebar-nav-heading-info"> 操作权限</span></li> -->
                <li class="sidebar-nav-link">
                    <a href="javascript:;" class="sidebar-nav-sub-title">
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 数据列表
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                    </a>
                    <ul class="sidebar-nav sidebar-nav-sub">
                        <li class="sidebar-nav-link">
                            <a href="UserOP.jsp">
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

            <div class="container-fluid am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
                        <div class="page-header-heading"><span class="am-icon-home page-header-heading-icon"></span> 数据总览 <small>星伍克coffee</small></div>
                        <p class="page-header-description">为了客户的极致体验</p>
                    </div>
                    <div class="am-u-lg-3 tpl-index-settings-button">
                        <button type="button" class="page-header-button"><span class="am-icon-paint-brush"></span> 设置</button>
                    </div>
                </div>

            </div>

            <div class="row-content am-cf">
                <div class="row  am-cf">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-4">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">月度财务收支计划</div>
                                 <div id="main" class="widget-function am-fr">
                                  <!--  <a href="javascript:;" class="am-icon-cog"></a>-->
                                </div>
                                 
                            </div>
                            <div class="widget-body am-fr">
                                <div class="am-fl">
                                    <div class="widget-fluctuation-period-text">
                                        ￥61746.45
                                        <button class="widget-fluctuation-tpl-btn">
                        <i class="am-icon-calendar"></i>
                        更多月份
                      </button>
                                    </div>
                                </div>
                                <div class="am-fr am-cf">
                                    <div class="widget-fluctuation-description-amount text-success" am-cf>
                                        +￥30420.56

                                    </div>
                                    <div class="widget-fluctuation-description-text am-text-right">
                                        8月份收入
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                        <div class="widget widget-primary am-cf">
                            <div class="widget-statistic-header">
                                本季度利润
                            </div>
                            <div class="widget-statistic-body">
                                <div class="widget-statistic-value">
                                    ￥27,294
                                </div>
                                <div class="widget-statistic-description">
                                    本季度比去年多收入 <strong>2593元</strong> 人民币
                                </div>
                                <span class="widget-statistic-icon am-icon-credit-card-alt"></span>
                            </div>
                        </div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                        <div class="widget widget-purple am-cf">
                            <div class="widget-statistic-header">
                                本季度利润
                            </div>
                            <div class="widget-statistic-body">
                                <div class="widget-statistic-value">
                                    ￥27,294
                                </div>
                                <div class="widget-statistic-description">
                                    本季度比去年多收入 <strong>2593元</strong> 人民币
                                </div>
                                <span class="widget-statistic-icon am-icon-support"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row am-cf">
                    <div class="am-u-sm-12 am-u-md-8">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">月度财务收支计划</div>
                                <div class="widget-function am-fr">                 
                                    <a href="javascript:;" class="am-icon-cog"></a>
                                </div>
                            </div>
                            <div class="widget-body-md widget-body tpl-amendment-echarts am-fr" id="tpl-echarts">

                            </div>
                        </div>
                    </div>

                    <div class="am-u-sm-12 am-u-md-4">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">专用服务器负载</div>
                                <div class="widget-function am-fr">
                                    <a href="javascript:;" class="am-icon-cog"></a>
                                </div>
                            </div>
                            <div class="widget-body widget-body-md am-fr">

                                <div class="am-progress-title">CPU Load <span class="am-fr am-progress-title-more">28% / 100%</span></div>
                                <div class="am-progress">
                                    <div class="am-progress-bar" style="width: 15%"></div>
                                </div>
                                <div class="am-progress-title">CPU Load <span class="am-fr am-progress-title-more">28% / 100%</span></div>
                                <div class="am-progress">
                                    <div class="am-progress-bar  am-progress-bar-warning" style="width: 75%"></div>
                                </div>
                                <div class="am-progress-title">CPU Load <span class="am-fr am-progress-title-more">28% / 100%</span></div>
                                <div class="am-progress">
                                    <div class="am-progress-bar am-progress-bar-danger" style="width: 35%"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row am-cf">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-4 widget-margin-bottom-lg ">
                        <div class="tpl-user-card am-text-center widget-body-lg">
                            <div class="tpl-user-card-title">
                               ${AdminConfig.adminName}
                            </div>
                            <div class="achievement-subheading">
                               月度最佳员工
                            </div>
                            <img class="achievement-image" src="/coffeWeb/assets/img/user07.png" alt="">
                            <div class="achievement-description">
                              ${AdminConfig.adminName}在
                                <strong>30天内</strong> 提升了
                                <strong>10%</strong>营业额。
                            </div>
                        </div>
                    </div>

                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-8 widget-margin-bottom-lg">

                        <div class="widget am-cf widget-body-lg">

                            <div class="widget-body  am-fr">
                                <div class="am-scrollable-horizontal ">
                                    <table width="100%" class="am-table am-table-compact am-text-nowrap tpl-table-black " id="example-r">
                                        <thead>
                                            <tr>
                                                <th>事务动态</th>
                                                <th>发布者</th>
                                                <th>时间</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="gradeX">
                                                <td>新加坡星伍克初创子公司 Latize 获 150 万美元风险融资</td>
                                                <td>邓文晋</td>
                                                <td>2017-09-26</td>
                                                <td>
                                                    <div class="tpl-table-black-operation">
                                                        <a href="javascript:;">
                                                            <i class="am-icon-pencil"></i> 编辑
                                                        </a>
                                                        <a href="javascript:;" class="tpl-table-black-operation-del">
                                                            <i class="am-icon-trash"></i> 删除
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="even gradeC">
                                                <td>厦门世茂分店开业大吉，第一天就人满为患</td>
                                                <td>韩蕾</td>
                                                <td>2018-09-26</td>
                                                <td>
                                                    <div class="tpl-table-black-operation">
                                                        <a href="javascript:;">
                                                            <i class="am-icon-pencil"></i> 编辑
                                                        </a>
                                                        <a href="javascript:;" class="tpl-table-black-operation-del">
                                                            <i class="am-icon-trash"></i> 删除
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="gradeX">
                                                <td>厦门大学校内分馆已落成，与校方协议已签署</td>
                                                <td>黄鸿宇</td>
                                                <td>2018-06-26</td>
                                                <td>
                                                    <div class="tpl-table-black-operation">
                                                        <a href="javascript:;">
                                                            <i class="am-icon-pencil"></i> 编辑
                                                        </a>
                                                        <a href="javascript:;" class="tpl-table-black-operation-del">
                                                            <i class="am-icon-trash"></i> 删除
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="even gradeC">
                                                <td>星伍克云数据服务部成立，陈梓豪出任部长</td>
                                                <td>陈梓豪</td>
                                                <td>2016-07-11</td>
                                                <td>
                                                    <div class="tpl-table-black-operation">
                                                        <a href="javascript:;">
                                                            <i class="am-icon-pencil"></i> 编辑
                                                        </a>
                                                        <a href="javascript:;" class="tpl-table-black-operation-del">
                                                            <i class="am-icon-trash"></i> 删除
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="even gradeC">
                                                <td>星伍克iCoffe技术部再添一员，加入云计算之争</td>
                                                <td>赖建群</td>
                                                <td>2017-05-26</td>
                                                <td>
                                                    <div class="tpl-table-black-operation">
                                                        <a href="javascript:;">
                                                            <i class="am-icon-pencil"></i> 编辑
                                                        </a>
                                                        <a href="javascript:;" class="tpl-table-black-operation-del">
                                                            <i class="am-icon-trash"></i> 删除
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>


                                            <!-- more data -->
                                        </tbody>
                                    </table>
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