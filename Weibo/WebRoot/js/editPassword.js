var l = 0;
var m = 0;
var n = 0;
// 创建请求
var http_request;
function createXMLHttpRequest(){
	http_request=false;
    if(window.XMLHttpRequest){
		http_request=new XMLHttpRequest();  //初始化http_request
		if(http_request.overrideMimeType){
			http_request.overrideMimeType("text/html");
		}
	}else if(window.ActiveXObject){      
		try{
			http_request=new ActiveXObject("Msxml2.XMLHTTP");  //在IE中创建XMLHttpRequest对象,新版IE
		}catch(e){
			try{
				http_request=new ActiveXObject("Microsoft.XMLHTTP");  //在IE中创建XMLHttpRequest对象旧版IE
			}catch(e){}
		}
	}
		
	if(!http_request){
		window.alert("不能创建XMLHttpRequest对象实例");
		return false;
	}
}

//提示输入原密码
function onclickShowStyleOfOldPassword(){
	document.getElementById("successOldPwd").style.display="none";
	document.getElementById("inputOldPwd1").style.display="block";
	document.getElementById("errorOldPwd2").style.display="none";	
}

function onblurValidateOldPassword(id){
	var oldPassword = document.getElementById(id).value;
	validateOldPassword("validateOldPassword.action?oldpassword=" + oldPassword);
}

function validateOldPassword(url){	
	
	createXMLHttpRequest();
	// 指定处理函数 事件解发器！！！
	http_request.onreadystatechange=processValidateOldPassword; 	
	http_request.open("GET",url,true);  
	http_request.send(null); 
}

function processValidateOldPassword(){
	if(http_request.readyState==4){ 
		if(http_request.status==200){
			// 通过request获取reponse里的值
			var isPass = http_request.responseText;
			if( isPass == "false"){
				l = 1;
				// 提示框4
				document.getElementById("successOldPwd").style.display="block";
				document.getElementById("inputOldPwd1").style.display="none";
				document.getElementById("errorOldPwd2").style.display="none";	
			}else{
				l = 0;
				// 提示框3
				document.getElementById("successOldPwd").style.display="none";
				document.getElementById("inputOldPwd1").style.display="none";
				document.getElementById("errorOldPwd2").style.display="block";	
			}
		}
	}
}

//判断用户名是否为数字字母下滑线      
function notChinese(str){ 
	var reg=/[^A-Za-z0-9_]/g; 
    if (reg.test(str)){ 
    	return (false); 
    	}
    else{ 
    	return(true);
    	} 
}

//提示输入新密码
function onclickShowStyleOfNewPassword(){
	document.getElementById("successNewPwd").style.display="none";
	document.getElementById("inputNewPwd1").style.display="block";
	document.getElementById("errorNewPwd2").style.display="none";
}

//验证新密码
function onblurValidateNewPassword(id){
	var newPassword = document.getElementById(id).value;
	if( ( newPassword.length >=6 && newPassword.length <=16 ) && notChinese(newPassword) ){
		m = 1;
		document.getElementById("successNewPwd").style.display="block";
		document.getElementById("inputNewPwd1").style.display="none";
		document.getElementById("errorNewPwd2").style.display="none";
	}
	else{
		m = 0;
		document.getElementById("successNewPwd").style.display="none";
		document.getElementById("inputNewPwd1").style.display="none";
		document.getElementById("errorNewPwd2").style.display="block";
	}
}

//提示再次输入新密码
function onclickShowStyleOfConfirmPassword(){
	document.getElementById("successConfirmPassword").style.display="none";
	document.getElementById("inputConfirmPassword1").style.display="block";
	document.getElementById("errorConfirmPassword2").style.display="none";
}

//验证输入的密码
function onblurValidateConfirmPassword(id){
	var newPassword = document.getElementById("newPassword").value;
	var confirmPassword = document.getElementById(id).value;
	if( newPassword == confirmPassword && newPassword.length != 0){
		n = 1;
		document.getElementById("successConfirmPassword").style.display="block";
		document.getElementById("inputConfirmPassword1").style.display="none";
		document.getElementById("errorConfirmPassword2").style.display="none";
	}
	else{
		n = 0;
		document.getElementById("successConfirmPassword").style.display="none";
		document.getElementById("inputConfirmPassword1").style.display="none";
		document.getElementById("errorConfirmPassword2").style.display="block";
	}
}