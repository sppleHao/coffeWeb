<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>新增餐品</title>
<link rel="stylesheet" href="/coffeWeb/CSS/zyUpload.css" type="text/css">
<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$(".filePicker").bind("click", function(e){
    	$("#fileImage").click();
    });
});

function changepic() {
	var reads= new FileReader();
    var file=document.getElementById('fileImage').files[0];
    reads.readAsDataURL(file);
    reads.onload=function (e) {
        document.getElementById('uploadImage').src=this.result;
    };
    var size = file.size;
    if (size > 1024 * 1024) {                    
		size = (Math.round(size * 100 / (1024 * 1024) ) / 100).toString() + 'MB';                
	} else {                    
		size = (Math.round(size * 100 / 1024) / 100).toString() + 'KB';                
	} 
	$("#status_info").text("选中1张图片，共"+size);
}

</script>
</head>
<body>
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
 				餐品号:<input type="text" name="foodNo" id="foodNo"><br>
				餐品名:<input type="text" name="foodName" id="foodName"><br>
				餐品单价:<input type="text" name="foodPrice" id="foodPrice"><br>
				餐品库存：<input type="text" name="foodMount" id="foodMount"><br>
				餐品类型：<input type="text" name="foodType" id="foodType">
				<input type="submit" value="提交" >
 			</div>
		</form>
		
	</div>
</body> 
</html> 