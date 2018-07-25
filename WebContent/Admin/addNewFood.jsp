<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>新增餐品</title>
<script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery.validate.min.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/messages_zh.js"></script>
<script type="text/javascript" src="/coffeWeb/JS/jquery-form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var ajax_option={
			url:"foodUpload",
			success:function(data){
				if (data='must-img') {
					alert("请添加图片!");
				}
				else if(data='success') {
					alert("成功!");
					location.reload();
				}
				
			}
		};
	
	//ajax提交表单
	$("#uploadForm").validate({
        submitHandler:function(form){
        	if(confirm("确认")){
        		$("#uploadForm").ajaxSubmit(ajax_option);
        	}
        } 
    });
	//点击按钮
	$(".filePicker").bind("click", function(e){
    	$("#fileImage").click();
    });
});

//计算图片大小
function computeSize() {
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
		<!-- 表单 -->
		<form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data">
			<div class="upload_box">
				<div class="upload_main">			
					<div class="convent_choice">
						<div class="andArea">
							<div id="preview" class="upload_preview">
 							<div class="uploadImg" style="width:105px">
 							<img id="uploadImage" class="upload_image" src="/coffeWeb/Img/add_img.png" style="width:105px; height:100px;">
 							</div>
 							</div>
 							<!-- 选择文件图片 -->
							<div class="filePicker">点击选择文件</div>
							<!-- 隐藏的表单 -->
							<input id="fileImage" onchange="computeSize(this)" type="file" name="fileselect[]" accept="image/png, image/jpeg, image/gif, image/jpg">
 						</div>
 						<!-- 大小显示 -->
 						<div class="status_bar">
 							<div id="status_info" class="status_info"></div>
 						</div>
 					</div>
 				</div>
 				<!-- 餐品信息 -->
 				操作名称：<input type="text" name="opName" id="opName" readonly="readonly"><br>
 				餐品号:<input type="text" name="foodNoInput" id="foodNoInput"><br>
				餐品名:<input type="text" name="foodNameInput" id="foodNameInput"><br>
				餐品单价:<input type="text" name="foodPriceInput" id="foodPriceInput"><br>
				餐品库存：<input type="text" name="foodMountInput" id="foodMountInput"><br>
				餐品类型：<input type="text" name="foodTypeInput" id="foodTypeInput">
				<input type="submit" value="提交" >
 			</div>
		</form>
	</div>
</body> 
</html> 