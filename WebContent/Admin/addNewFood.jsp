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
				if (data=='mustImg') {
					alert("请添加图片!");
				}
				if(data=='success') {
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
        },
		rules:{
			foodNoInput:{
				required:true,
				digits:true,
				rangelength:[3,3]
			},
			foodNameInput:{
				required:true,
				maxlength:12
			},
			foodPriceInput:{
				required:true,
				digits:true
			},
			foodTypeInput:"required",
			foodMountInput:{
				required:true,
				digits:true,
			}
		},
		errorElement: "span",
		messages:{
			foodNoInput:{
				required:"餐品号不能为空",
				digits:"必须为3位的数字",
				rangelength:"必须为3位的数字"
			},
			foodNameInput:{
				required:"餐品名不能为空",
				maxlength:"不能超过12位"
			},
			foodPriceInput:{
				required:"餐品价格不能为空",
				digits:"餐品价格只能为数字"
			},
			foodTypeInput:"餐品类型不能为空",
			foodMountInput:{
				required:"餐品库存不能为空",
				digits:"餐品库存只能为数字"
			}
		}
    });
	
	//点击按钮
	$(".filePicker").bind("click", function(e){
    	$("#fileImage").click();
    });
	
	$(".submitBtn").bind("click", function(e){
    	$("#submit").click();
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
<style type="text/css">
#opName,#fileImage,#submit{
	display: none;
}
#opTitle{
	font-size: 20px;
    font-weight:700;
}
.filePicker{
	background: none repeat scroll 0 0 #00B7EE;
    border-radius: 3px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
    color: #FFFFFF;
    cursor: pointer;
    display: inline-block;
    font-size: 18px;
    height: 44px;
    line-height: 44px;
    width: 200px;
    text-align:center;
    margin: 0 auto 0px;
    overflow: hidden;
    transition: background 0.2s;
	-moz-transition: background 0.2s;
	-webkit-transition: background 0.2s;
	-o-transition: background 0.2s;
}
.submitBtn{
	background: none repeat scroll 0 0 #00B7EE;
    border-radius: 3px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
    color: #FFFFFF;
    cursor: pointer;
    display: inline-block;
    font-size: 18px;
    font-weight:700;
    height: 44px;
    line-height: 44px;
    width: 90%;
    min-width:120px;
    max-width:240px;
    text-align:center;
    overflow: hidden;
    transition: background 0.2s;
	-moz-transition: background 0.2s;
	-webkit-transition: background 0.2s;
	-o-transition: background 0.2s;
}
.upload_main{
	display: flex;
	border:1px solid #000
}
.img-upload{
	padding: 20px;
}
.config-upload{
	padding: 20px;
	border-left:1px solid #000;
	text-align: left;
}
.submit-upload{
	padding: 20px;
	display: flex;
	justify-content: center; 
	align-items: center;
	border:1px solid #000
}
.status_info{
	text-align: center;
}
</style>
</head>
<body>
	<div id="demo" class="demo" style="width: 650px; height: 400px;">
		<div id="opTitle"></div>
		<!-- 表单 -->
		<form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data">
			<div class="upload_box">
				<div class="upload_main">			
					<div class="img-upload">
						<div class="andArea">
							<div id="preview" class="upload_preview">
 							<div class="uploadImg" style="width:105px">
 							<img id="uploadImage" class="upload_image" src="/coffeWeb/Img/add_img.png" style="width:200px; height:150px;">
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
 					<div class="config-upload">
 						<!-- 餐品信息 -->
		 				<!-- 操作名称 -->
		 				<input type="text" name="opName" id="opName" readonly="readonly"><br>
		 				<input type="text" name="foodNoInput" id="foodNoInput" placeholder="餐品号"><br>
						<input type="text" name="foodNameInput" id="foodNameInput" placeholder="餐品名"><br>
						<input type="text" name="foodPriceInput" id="foodPriceInput" placeholder="餐品价格"><br>
						<input type="text" name="foodMountInput" id="foodMountInput" placeholder="餐品库存"><br>
						<input type="text" name="foodTypeInput" id="foodTypeInput" placeholder="餐品类型"><br>
 					</div>
 				</div>
 				<div class="submit-upload">
					<div class="submitBtn">点击提交</div>
					<input id="submit" type="submit" value="提交" >
				</div>
 			</div>
		</form>
	</div>
</body> 
</html> 