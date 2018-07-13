<%@ page language="java" import="beans.*" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>管理员信息</title>
<script type="text/javascript" src="/coffeWeb/JS/ajax.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<!--jsp代码段（位置随意) -->
	<jsp:include page="adminGuide.jsp"></jsp:include>
	
	<!-- 输出：管理员号,管理员名 -->
	ADMIN CONFIG<br>
	AdminNo: ${AdminConfig.adminNo}<br>
	AdminName: ${AdminConfig.adminName}<br>
</body>
</html>