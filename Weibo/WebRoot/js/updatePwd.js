
var p = 0;
var q = 0;
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
		p = 1;
		document.getElementById("successNewPwd").style.display="block";
		document.getElementById("inputNewPwd1").style.display="none";
		document.getElementById("errorNewPwd2").style.display="none";
	}
	else{
		p = 0;
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
	var newPassword = document.getElementById("newPwd").value;
	var confirmPassword = document.getElementById(id).value;
	if( newPassword == confirmPassword && newPassword.length != 0){
		q = 1;
		document.getElementById("successConfirmPwd").style.display="block";
		document.getElementById("inputConfirmPwd1").style.display="none";
		document.getElementById("errorConfirmPwd2").style.display="none";
	}
	else{
		q = 0;
		document.getElementById("successConfirmPwd").style.display="none";
		document.getElementById("inputConfirmPwd1").style.display="none";
		document.getElementById("errorConfirmPwd2").style.display="block";
	}
}