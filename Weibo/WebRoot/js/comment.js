var prof_id;
var com_id;

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

// 显示评论列表
var comlist;
function onClickComment(id){	
	if( document.getElementById(id).style.display == "none"){		
		document.getElementById(id).style.display = "block";		
		prof_id = id.replace("comment_","");
		showComments("/Weibo/showComments.action?com.profile.profId="+prof_id);
		
	}else{
		document.getElementById(id).style.display = "none";
		document.getElementById("inputCom_" + prof_id).value = "";
		document.getElementById("comCom_" + prof_id).innerHTML = 0;
		com_id = 0;
	}  
}

function showComments(url){	
	
	createXMLHttpRequest();
	// 指定处理函数 事件解发器！！！
	http_request.onreadystatechange=processRequest; 	
	http_request.open("GET",url,true);  
	http_request.send(null); 
}
 

// 处理返回信息的函数
function processRequest(){	
	if(http_request.readyState==4){ 		
		if(http_request.status==200){			
			var coms = eval('('+http_request.responseText+')');
			comlist = "";
			var length = (coms.length<10)? coms.length : 10;
			for( var i = 0; i < length; i++){
				var com = coms[i];
				comlist += '<li class="MIB_linedot3">';
				comlist += '<a href="/Weibo/Others/othersProfile.action?otherId='+com["comFromId"]+'"><img namecard="true" class="picborder_l lf" title="" src="' + com["comFace"] + '"></a>';
				comlist += '<div class="txt">';
				comlist += '<div class="txtinfo">';
				comlist += '<a namecard="true" id="comFrom_' + com["comId"] + '" href="/Weibo/Others/othersProfile.action?otherId='+com["comFromId"]+'">' + com["comFrom"] + ':</a>' + com["comContent"];
				comlist += '<span class="MIB_txtbl" id="comTime_' + com["comId"] + '">(' + com["comTime"] + ')</span>';
				comlist += '</div>';
				comlist += '<p class="MIB_more MIB_linkbl">';	
				if( document.getElementById('input_'+prof_id).isEqMyProf.value == 'true' ){
					comlist += '<a href="javascript:void(0);" class="lose" onclick="showDialog(\'comment_cancel\');onClickDeleteComment(' + com["comId"] + ');">删除</a>';
					comlist += '<span class="MIB_line_l">|</span>';
				}
				comlist += '<a href="javascript:void(0);" id="comReply_' + com["comId"] + '"onclick="onClickReply(' + com["comId"] + ')" class="lose">回复</a>';
				comlist += '</p>';
				comlist += '</div>';
				comlist += '<span class="clear"></span>';
				comlist += '</li>';
			}
			document.getElementById("comContent_"+prof_id).innerHTML = comlist;	
			
			if( coms.length > 10 ){			
				document.getElementById("moreCom_"+prof_id).style.display="block";
				document.getElementById("moreCom_"+prof_id).innerHTML = '后面还有<span>'+ (coms.length -10) +'</span>条评论，<a href="/Weibo/MyBlog/profileContent.action?profId='+prof_id+'">点击查看<em>&gt;&gt;</em></a>';	
			}
			
			var commentCount = document.getElementById("commentCount_"+prof_id).value;
			if( coms.length > 0 ){
				document.getElementById("showComCount_"+prof_id).innerHTML = '('+ coms.length +')';
			}else{
				document.getElementById("showComCount_"+prof_id).innerHTML = '';
			}
			document.getElementById("commentCount_"+prof_id).value = coms.length;
		}
	}
}

// 显示回复人
function onClickReply(id){
	com_id = id;
	replyCom("/Weibo/replyComment.action?com.profile.profId="+prof_id+"&com.comComId="+com_id);
}

function replyCom(url){
	
	createXMLHttpRequest();
	http_request.onreadystatechange=processReplyCom; 	
	http_request.open("GET",url,true);  
	http_request.send(null); 
}

function processReplyCom(){
	if(http_request.readyState==4){ 		
		if(http_request.status==200){
			var com = eval('('+http_request.responseText+')');
			document.getElementById("inputCom_" + prof_id).value = "回复@" + com["comTo"] + ": ";				
			document.getElementById("comCom_" + prof_id).innerHTML = com_id;	
		}
	}	
}

// 提交评论内容
function onClickSubmitComment(id){
	
	var form = document.getElementById(id);	
	var comContent = form.value;	
	var comid = (com_id == null)? 0 : com_id;

	makeComment("/Weibo/makeComment.action?com.profile.profId="+prof_id+"&com.comContent="+encodeURI(encodeURI(comContent))+"&com.comComId="+comid);			
	createMsgBox();
}

function makeComment(url){	
	createXMLHttpRequest();
	http_request.onreadystatechange=processRefreshCom; 
	http_request.open("GET",url,true);  
	http_request.send(null); 
}

function processRefreshCom(){
	if(http_request.readyState==4){ 		
		if(http_request.status==200){
			document.getElementById("inputCom_" + prof_id).value = "";
			document.getElementById("comCom_" + prof_id).innerHTML = 0;
			
			showComments("/Weibo/showComments.action?com.profile.profId="+prof_id);	
		}
	}	
}

// 删除评论
function onClickDeleteComment(id){
	com_id = id;	
}

function onClickConfirmDeleteComment(){
	if( document.getElementById("delete_com").style.display == "none" ){
		return false;
	}else{
		deleteComment("deleteComment.action?com.comId="+com_id);
		closeDialog('comment_cancel');
	}
}

function deleteComment(url){	
	createXMLHttpRequest();	
	http_request.onreadystatechange=processRefreshCom; 	
	http_request.open("GET",url,true);  
	http_request.send(null); 
}

function createMsgBox(){
	var msgBox = document.createElement("div");
	msgBox.setAttribute("id","profile_favs");
	var styleData = "position: fixed; clear: both; z-index: 1000; left: 634px; top: 380px; width: 100px; height: 77px;visibility: visible;";

	msgBox.style.cssText = styleData;
	msgBox.innerHTML = "";
	msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:100px;"><div class="txt1 gray6"><img class="tipicon tip3" src="/Weibo/css/img/PY_ib.gif"><div>评论成功</div>';
	
	document.body.appendChild(msgBox); 
	centerDiv('profile_favs');
	
	function removeChild(){
		document.body.removeChild(msgBox); 
	}
	setInterval(removeChild,1500);
}

// 微博内容页提取评论人姓名
function makeReply(id){
	onClickShowDialog(id);
	com_id = id.replace("comment_reply_miniblog_","");
	
	var input = document.getElementById("comment_content_" + com_id);
	var name = document.getElementById("comment_name_" + com_id).value;
	input.innerHTML = "回复@" + name + ":";
}

// 微博内容页回复别人评论
function onClickMakeComReply(){
	var form = document.getElementById("comment_form_"+com_id);
	form.submit();
}

//微博内容页回复微博
function onClickMakeCom(){
	var form = document.getElementById("comment_form");
	form.submit();	
}

function onClickComAt(id){
	
	var form = document.getElementById(id);	
	var comContent = form.value;
	prof_id = document.getElementById("comment_profile_"+com_id).value;
	
	createXMLHttpRequest();	
	http_request.onreadystatechange=processComAt; 	
	http_request.open("GET","makeComment.action?com.profile.profId="+prof_id+"&com.comContent="+encodeURI(encodeURI(comContent))+"&com.comComId="+com_id,true);  
	http_request.send(null); 
				
	
}

function processComAt(){
	if(http_request.readyState==4){ 		
		if(http_request.status==200){
			createMsgBox();
		}
	}
}