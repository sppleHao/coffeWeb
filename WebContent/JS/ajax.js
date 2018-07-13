var  xmlHttpRequest =null;
function createXHR() {
//    try {
//        xmlHttpRequest = new XMLHttpRequest();
//    }catch (e1) {
//        var  _msxmlhttp = new Array("Msxml2.XMLHTTP.6.0","Msxml2.XMLHTTP.5.0",
//                                     "Msxml2.XMLHTTP.4.0", "Msxml2.XMLHTTP.3.0",
//                                     "Msxml2.XMLHTTP.2.0","Msxml2.XMLHTTP",
//                                    "Microsoft.XMLHTTP");
//        for (var i = 0; i < _msxmlhttp.length; i++) {
//            try {
//                xmlHttpRequest = new ActiveXObject(_msxmlhttp[i]);
//                if (xmlHttpRequest==null){break;}
//            }
//            catch (e2) { }
//        }
//    }
//    if (xmlHttpRequest==null){
//        alert("不能创建Ajax对象！");
//    }
    
    if (window.XMLHttpRequest)
    {
      // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
      xmlHttpRequest=new XMLHttpRequest();
    }
    else
    {
      // IE6, IE5 浏览器执行代码
    	xmlHttpRequest=new ActiveXObject("Microsoft.XMLHTTP");
    }
}

function sendRequest(url,params,method,handler) {
    createXHR();
    if (xmlHttpRequest==null) return false;
    xmlHttpRequest.onreadystatechange = handler;
    if (method=="GET"){
        xmlHttpRequest.open(method,url+'?'+params,true);
        xmlHttpRequest.send(null);
    }
    if(method=="POST"){
        xmlHttpRequest.open(method,url,true);
        xmlHttpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlHttpRequest.send(params);
    }
}
