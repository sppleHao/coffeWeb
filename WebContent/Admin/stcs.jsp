<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Insert title here</title> 
</head> 
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="height:400px"></div>
    <!-- ECharts单文件引入 -->
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
    <script type="text/javascript" src="/coffeWeb/JS/jquery-3.3.1.js"></script>
    <script type="text/javascript">
    	
    
        // 路径配置
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
                
                
                
                myChart.showLoading();
                
                $.ajax({
                	type:'POST',
                	url:'GetStsc',
                	async:true,
                	success:function(data){
            			if(data){
            				var obj = eval('(' + data + ')');
            				myChart.hideLoading();
            				var option = {
            	                	    title : {
            	                	        text: '菜品欢迎程度分析',
            	                	        subtext: '数据来源于本网站'
            	                	    },
            	                	    tooltip : {
            	                	        trigger: 'axis'
            	                	    },
            	                	    legend: {
            	                	        data:['数量']
            	                	    },
            	                	    toolbox: {
            	                	        show : true,
            	                	        feature : {
            	                	            mark : {show: true},
            	                	            dataView : {show: true, readOnly: false},
            	                	            magicType: {show: true, type: ['line', 'bar']},
            	                	            restore : {show: true},
            	                	            saveAsImage : {show: true}
            	                	        }
            	                	    },
            	                	    calculable : true,
            	                	    xAxis : [
            	                	        {
            	                	            type : 'value',
            	                	            boundaryGap : [0, 0.01]
            	                	        }
            	                	    ],
            	                	    yAxis : [
            	                	        {
            	                	            type : 'category',
            	                	            data : obj.foodNames
            	                	        }
            	                	    ],
            	                	    series : [
            	                	        {
            	                	            name:'数量',
            	                	            type:'bar',
            	                	            data: obj.foodNums
            	                	        }
            	                	    ]
            	                	};
            				
            				 myChart.setOption(option); 

            			}
            		},		
        	        error : function(errorMsg) {
        	            //请求失败时执行该函数
        	        alert("请求数据失败!");
        	        myChart.hideLoading();
        	        }
                });
         		
            }
        );
        
    </script>
</body>
</html> 