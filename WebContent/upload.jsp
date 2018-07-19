<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.js"></script>
</script>
<title>添加图片</title> 
</head> 
<body> 
 	<form method="post" action="Upload" enctype="multipart/form-data">
 		<input type="file" name="file"><br>
 		<input type="submit" value="提交" >
 	</form>
</body> 
</html> 