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

//提示输入学校名称
function onclickShowStyleOfSchoolName(){
	document.getElementById("inputSchoolName1").style.display = "block";
	document.getElementById("errorSchoolName2").style.display = "none";
	document.getElementById("successSchoolName").style.display = "none";
}

function onblurValidateSchoolName(id){
	var educationinfo = document.getElementById(id).value;
	if( educationinfo.length == 0 ){
		document.getElementById("inputSchoolName1").style.display="none";
		document.getElementById("errorSchoolName2").style.display="none";
		document.getElementById("successSchoolName").style.display="none";
	}
	else{
		if( educationinfo.length >= 1 && educationinfo.length <= 20 ){
			document.getElementById("inputSchoolName1").style.display="none";
			document.getElementById("errorSchoolName2").style.display="none";
			document.getElementById("successSchoolName").style.display="block";
		}
		else{
			document.getElementById("inputSchoolName1").style.display="none";
			document.getElementById("errorSchoolName2").style.display="block";
			document.getElementById("successSchoolName").style.display="none";
		}
	}
}

//提示输入学院系名称
function onclickShowStyleOfCollege(){
	document.getElementById("inputCollege1").style.display = "block";
	document.getElementById("errorCollege2").style.display = "none";
	document.getElementById("successCollege").style.display = "none";
}

//验证院系名称
function onblurValidateCollege(id){
	var educationinfo = document.getElementById(id).value;
	if( educationinfo.length == 0 ){
		document.getElementById("inputCollege1").style.display="none";
		document.getElementById("errorCollege2").style.display="none";
		document.getElementById("successCollege").style.display="none";
	}
	else{
		if( educationinfo.length >= 1 && educationinfo.length <= 20 ){
			document.getElementById("inputCollege1").style.display="none";
			document.getElementById("errorCollege2").style.display="none";
			document.getElementById("successCollege").style.display="block";
		}
		else{
			document.getElementById("inputCollege1").style.display="none";
			document.getElementById("errorCollege2").style.display="block";
			document.getElementById("successCollege").style.display="none";
		}
	}
}

