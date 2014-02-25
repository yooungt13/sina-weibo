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

// 显示DIV
function showDialog(id){ 
	document.getElementById(id).style.display="block"; 
	centerDiv(id);
	createLayer();
} 
			
// 隐藏DIV
function closeDialog(id){ 
	document.getElementById(id).style.display="none"; 
	removeLayer();
} 
			
// 用来判断是否显示
function onClickShowDialog(id){ 
	if( document.getElementById(id).style.display == "none"){
		document.getElementById(id).style.display = "block";
	}else{
		document.getElementById(id).style.display = "none";
	}
}

// 用来提交表单数据
function toSubmit(id){
	var myform = document.getElementById(id);
	myform.submit();
}

function toSubmitChange(id){
	
	var myform = document.getElementById(id);
	
	var msgBox = document.createElement("div");
	msgBox.setAttribute("id","update_tips");
	var styleData = "position: fixed; clear: both; z-index: 1000; left: 634px; top: 380px; width: 100px; height: 77px;visibility: visible;";

	msgBox.style.cssText = styleData;
	msgBox.innerHTML = "";
	msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:100px;"><div class="txt1 gray6"><img class="tipicon tip3" src="/Weibo/css/img/PY_ib.gif"><div>保存成功</div>';
	
	document.body.appendChild(msgBox); 
	centerDiv('update_tips');
	
	function removeChild(){
		document.body.removeChild(msgBox); 
		myform.submit();
	}
	setInterval(removeChild,1000);		
}

//验证私信提交表单 黄颖
function validateMsgSubmit(id){
	validateNum = x*z;
	if(validateNum == 1){
		var myform = document.getElementById(id);
		myform.submit();
	}
}
//验证后提交表单数据
function validateRegistSubmit(id){
	validateNum = a*b*c*d*e*f;
	if(validateNum == 1){
		var myform = document.getElementById(id);
		myform.submit();
	}
}

function validateEditPasswordSubmit(id){
	validateNum = l*m*n;
	if(validateNum == 1){
		var myform = document.getElementById(id);
		
		var msgBox = document.createElement("div");
		msgBox.setAttribute("id","editpwd_tips");
		var styleData = "position: fixed; clear: both; z-index: 1000; left: 634px; top: 380px; width: 100px; height: 77px;visibility: visible;";

		msgBox.style.cssText = styleData;
		msgBox.innerHTML = "";
		msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:100px;"><div class="txt1 gray6"><img class="tipicon tip3" src="/Weibo/css/img/PY_ib.gif"><div>保存成功</div>';
		
		document.body.appendChild(msgBox); 
		centerDiv('editpwd_tips');
		
		function removeChild(){
			document.body.removeChild(msgBox);
			myform.submit();
		}
		setInterval(removeChild,1500);
		
	}
}
// 滑动显示DIV
function mouseovershowDialog(id){ 
	document.getElementById(id).style.display = "block";
} 
			
// 滑动隐藏DIV
function mouseovercloseDialog(id){ 
	document.getElementById(id).style.display = "none";	
}  

// 使DIV居中
function centerDiv(id){
	var width = document.body.offsetWidth;
	var height = document.documentElement.clientHeight;
	var left = ( width - document.getElementById(id).offsetWidth ) / 2;
	var top = ( height - document.getElementById(id).offsetHeight ) / 2;

	document.getElementById(id).style.left = left + 'px'; 
	document.getElementById(id).style.top = top + 'px'; 
}

// 跳转翻页
function gotoSelectedPage()   
{   
    var x = document.getElementById("page");     
    x.submit();   
} 

// 传递id至提示框
var delete_id; 
function setProfId(obj)
{
	showDialog('profile_cancel');
	delete_id = obj.id;
}

function toConfirmDeleteProf(){	
	if( document.getElementById("delete_prof").style.display == "none" ){
		return false;
	}else{	
		var form = document.getElementById("delete_prof");
		form.action="deleteProf.action?profId=" + delete_id; 
		form.submit(); 
	}
}

function createLayer(){  
	
	var mybg = document.createElement("div");  
	mybg.setAttribute("id","mybg");  
	mybg.style.background = "#000";  
	mybg.style.width = "100%";  
	mybg.style.height = "100%";  
	mybg.style.position = "fixed";  
	mybg.style.top = "0";  
	mybg.style.left = "0";  
	mybg.style.zIndex = "810";  
	mybg.style.opacity = "0.1";  
	mybg.style.filter = "Alpha(opacity=30)";  
	document.body.appendChild(mybg);  
	  
	//document.body.style.overflow = "hidden";  
}  

function removeLayer(){
	
	var mybg = document.getElementById('mybg');
	document.body.removeChild(mybg);
}

// 清楚编辑框中内容
function clearInfo(obj){
	obj.value='';
}

// 验证编辑框
function checkLen(obj)  { 
    var maxChars = 140;//最多字符数     
    var curr = maxChars - obj.value.length; 
    if( curr > 0 ){
    	document.getElementById("count").innerHTML = curr.toString(); 
    }else{
    	document.getElementById("count").innerHTML = '0';
    }
} 

// 裁剪图片
var flag=false;

function previewImage(ImgD){
    var image=new Image();
    image.src=ImgD.src;
    if(image.width>0 && image.height>0){
    		
    	flag=true;
    	if(image.width/image.height>= 160/120){
    		if(image.width>160){
    			ImgD.width=160;
    			ImgD.height=(image.height*160)/image.width;
    		}else{
    			ImgD.width=image.width;
    			ImgD.height=image.height;
    		}
    	}else{ 		
    		if(image.height>120){
    			ImgD.height=120;
    			ImgD.width=(image.width*120)/image.height;
    		}else{
    			ImgD.width=image.width;
    			ImgD.height=image.height;
    		}
    	}
    }
}

// 开发中，敬请期待提示框
function previousBox(){
	var msgBox = document.createElement("div");
	msgBox.setAttribute("id","previous");
	var styleData = "position: fixed; clear: both; z-index: 1000;width: 100px; height: 77px;visibility: visible;";

	msgBox.style.cssText = styleData;
	msgBox.innerHTML = "";
	msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:150px;"><div class="txt1 gray6"><img class="tipicon tip7" src="/Weibo/css/img/PY_ib.gif"><div>开发中，敬请期待</div>';
	
	document.body.appendChild(msgBox); 
	centerDiv('previous');
	
	function removeChild(){
		document.body.removeChild(msgBox);
	}
	setInterval(removeChild,2000);
}

// 通过微博内容进行模糊查找
function search(id,pn){
	var form = document.createElement("form");
	var content = document.getElementById(id).value;
	form.action = "/Weibo/MyBlog/weiboSearch.action?profContent=" + encodeURI(encodeURI(content)) + "&pageNumber= " + pn;
	form.method = "post";
	form.submit();
}

//通过用户昵称进行模糊查找
function searchByName(id,pn){
	var form = document.createElement("form");
	var content = document.getElementById(id).value;
	form.action = "/Weibo/MyBlog/userSearch.action?nickName=" + encodeURI(encodeURI(content)) + "&pageNumber= " + pn;
	form.method = "post";
	form.submit();
}

function clearOrgInfo(id){
	var input = document.getElementById(id);
	if(input.value == "随便说说..."){
		input.innerHTML = '';
		input.style.color = "#000";
	}
	input.focus();
}

function addOrgInfo(id){
	var input = document.getElementById(id);
	if(input.value == ""){
		input.innerHTML = '随便说说...';
		input.style.color = "#999";
	}	
}

function refreshCount(){
	createXMLHttpRequest();	
	http_request.onreadystatechange=processRefreshCount; 	
	http_request.open("GET","/Weibo/refreshCount.action",true);  
	http_request.send(null); 
}

function processRefreshCount(){
	if(http_request.readyState==4){ 	
		if(http_request.status==200){
			var count = eval('('+http_request.responseText+')');
			
			var flag = false;
			var yellow = document.getElementById("notice_yellow_tips");
			
			var htmlList = '<ul>';
			if( count["fansCount"] > 0 ){
				htmlList += '<li>'+count["fansCount"]+'位新粉丝，查看<a href="/Weibo/MyBlog/myFanspage.action?pageNumber=1&listType=1">粉丝</a></li>';
				flag = true;
			}
			if( count["atProfileCount"] > 0 ){
				htmlList += '<li>'+count["atProfileCount"]+'条微博提到我，查看<a href="/Weibo/atMeList.action?pageNumber=1">@我</a></li>';
				flag = true;
			}
			if( count["atCommentCount"] > 0 ){
				htmlList += '<li>'+count["atCommentCount"]+'条评论提到我，查看<a href="/Weibo/atMeComList.action?pageNumber=1">@我</a></li>';
				flag = true;
			}
			if( count["msgCount"] > 0 ){
				htmlList += '<li>'+count["msgCount"]+'条新私信，查看<a href="/Weibo/frommsgList.action?pageNumber=1">私信</a></li>';
				flag = true;
			}
			if( count["noticeCount"] > 0 ){
				htmlList += '<li>'+count["noticeCount"]+'条新通知，查看<a href="/Weibo/systemList.action?pageNumber=1">通知</a></li>';
				flag = true;
			}if( count["commentCount"] > 0 ){
				htmlList += '<li>'+count["commentCount"]+'条新评论，查看<a href="/Weibo/commentsList.action?pageNumber=1&listType=1">评论</a></li>';
				flag = true;
			}
			htmlList +='</ul>';
			yellow.innerHTML = htmlList;
			
			if( flag ){
				document.getElementById("small_Yellow").style.display = "block";
			}
			
		}
	}
}