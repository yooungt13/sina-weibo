var prof_id;

//创建请求
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

// 添加转发
function onClickToAddTransmit(){
	var myform = document.getElementById("tsmit_form");
	closeDialog("tsmit_form");
	
	// 创建转发成功提示框
	var msgBox = document.createElement("div");
	msgBox.setAttribute("id","tsmit_success");
	var styleData = "position: fixed; clear: both; z-index: 1000;width: 100px; height: 77px;visibility: visible;";

	msgBox.style.cssText = styleData;
	msgBox.innerHTML = "";
	msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:100px;"><div class="txt1 gray6"><img class="tipicon tip3" src="/Weibo/css/img/PY_ib.gif"><div>转发成功</div>';
	
	document.body.appendChild(msgBox); 
	centerDiv('tsmit_success');
	
	function removeChild(){
		document.body.removeChild(msgBox);
		var btn = document.getElementById("submit_btn");
		btn.click();
		closeTsmitBox();
	}
	setInterval(removeChild,1500);
}

// 初始化转发窗口
function onClickToInitTransmit(id){
	prof_id = id;
	var tc_id = document.getElementById("tcId_"+id).value;	
	var tsmit = document.getElementById("tsmit_"+ id).value;
	if( tc_id != 0 ){
		if(tsmit != 0)
			initTransmit("/Weibo/MyBlog/initTransmit.action?tcId=" + tc_id );
		else
			createTstBox();
	}else{
		showTrsmitBox(id);
	}
}

function initTransmit(url){
	createXMLHttpRequest();
	http_request.onreadystatechange=processInitTransmit;
	http_request.open("GET",url,true);  
	http_request.send(null);
}
function processInitTransmit(){
	if(http_request.readyState==4){ 
		if(http_request.status==200){
			
			var profContent = document.getElementById("profContent_"+ prof_id).value;
			var publishName = document.getElementById("publishName_"+ prof_id).value;
			var publishId = document.getElementById("publishId_"+ prof_id).value;
			
			var tsmit = eval('('+http_request.responseText+')');
			
			var tsmit_box = document.createElement("div");
			tsmit_box.setAttribute("id","tsmit_box");  
			
			var styleData = "position: fixed; z-index: 850; visibility: visible;";
			tsmit_box.style.cssText = styleData;
			//tsmit_box.setAttribute("style","position: fixed; z-index: 850; visibility: visible;");  			
			
			var htmlList = '';
			
			htmlList += '<form action="/Weibo/MyBlog/addTransmit.action" method="post" id="tsmit_form" name="tsmit_prof">'; 
			htmlList += '<table class="mBlogLayer">';
			htmlList += '<tbody><tr>';
			htmlList += '<td class="top_l"></td>';
			htmlList += '<td class="top_c"></td>';
			htmlList += '<td class="top_r"></td></tr><tr>';
			htmlList += '<td class="mid_l"></td>';
			htmlList += '<td class="mid_c">';
			htmlList += '<div class="layerBox">';
			htmlList += '<div class="layervote layerMoveto">';
			htmlList += '<div class="layerMedia_close"><a href="javascript:;" title="关闭" node-type="close" onclick="closeTsmitBox(\'tsmit_box\')" class="close"></a></div>';
			htmlList += '<div style=" width:450px;" node-type="inner" class="layerBoxCon">';
			htmlList += '<div class="shareLayer">';
			htmlList += '<div class="laymoveText" node-type="rootFeed"><a href="" target="_blank">@'+tsmit["orgName"]+'</a>：'+tsmit["orgContent"]+'</div>';
			htmlList += '<div class="enterBox_topline">';
			htmlList += '<div class="lf"><a class="faceicon1" id="tsmit_publish_faces" href="javascript:openFacesBox(\'tsmit_publish_faces\',\'inputTe\');" title="表情"></a></div>';
			htmlList += '<div node-type="limit" style="color:#008800; height:22px;line-height:22px;overflow:hidden" class="rt">';
			htmlList += '<span class="normal" id="tcount">还可以输入140个汉字</span>';
			htmlList += '</div>';
			htmlList += '</div>';
			htmlList += '<input type="hidden" name="profile.profId" value="'+prof_id+'"/>';
			htmlList += '<textarea id="inputTe" name="profile.profContent" onkeyup="checkLength(\'inputTe\');" onclick="setSelectRange(\'inputTe\');" maxlength="140" style="overflow-y: hidden; color: rgb(51, 51, 51); font-family: Tahoma, 宋体; word-wrap: break-word; font-size: 14px; line-height: 18px; overflow-x: hidden; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); height: 35px; " node-type="editor" limit="140" class="PY_textarea">//@'+publishName+': '+profContent+'</textarea>';
			htmlList += '<div node-type="sync" class="selSend">';
//			htmlList += '<p><input type="checkbox" id="isLast" name="isLast" node-type="isLast">';
//			htmlList += '<label node-type="isLastLabel" for="isLast">同时评论给 '+publishName+'</label></p>';
//			htmlList += '<p><input type="checkbox" id="isRoot" name="isRoot" node-type="isRoot">';
//			htmlList += '<label node-type="isLastLabel" for="isRoot">同时评论给原文作者 </label></p>';
			htmlList += '</div>';
			htmlList += '<div class="MIB_btn">';
			htmlList += '<a href="javascript:onClickToAddTransmit();" id="group_submit" class="newabtn_ok">';
			htmlList += '<em>转发</em>';			
			htmlList += '</a>';
			htmlList += '<input type="submit" id="submit_btn" style="display:none;"/>';
			htmlList += '<a href="javascript:;" id="group_cancel" class="btn_notclick" onclick="closeTsmitBox(\'tsmit_box\')">';
			htmlList += '<em>取消</em>';
			htmlList += '</a>';
			htmlList += '</div>';
			htmlList += '</div>';
			htmlList += '</div>';
			htmlList += '</div>';
			htmlList += '</div>';
			htmlList += '</td>';
			htmlList += '<td class="mid_r"></td></tr>';
			htmlList += '<tr><td class="bottom_l"></td>';
			htmlList += '<td class="bottom_c"></td>';
			htmlList += '<td class="bottom_r"></td>';
			htmlList += '</tr>';
			htmlList += '</tbody>';
			htmlList += '</table>';
			htmlList += '</form>';

			tsmit_box.innerHTML = htmlList;
			document.body.appendChild(tsmit_box); 
			centerDiv('tsmit_box');
			createLayer();
			
			checkLength('inputTe');						
		}
	}
}

function showTrsmitBox(id){
	
	var profContent = document.getElementById("profContent_"+ id).value;
	var publishName = document.getElementById("publishName_"+ id).value;
	var publishId = document.getElementById("publishId_"+ id).value;
	
	var tsmit_box = document.createElement("div");  
	tsmit_box.setAttribute("id","tsmit_box"); 	
	var styleData = "position: fixed; z-index: 850; visibility: visible;";
	tsmit_box.style.cssText = styleData;
	
	var htmlList = '';
	
	htmlList += '<form action="/Weibo/MyBlog/addTransmit.action" method="post" id="tsmit_form" name="tsmit_prof">';  
	htmlList += '<table class="mBlogLayer">';
	htmlList += '<tbody><tr>';
	htmlList += '<td class="top_l"></td>';
	htmlList += '<td class="top_c"></td>';
	htmlList += '<td class="top_r"></td></tr><tr>';
	htmlList += '<td class="mid_l"></td>';
	htmlList += '<td class="mid_c">';
	htmlList += '<div class="layerBox">';
	htmlList += '<div class="layervote layerMoveto">';
	htmlList += '<div class="layerMedia_close"><a href="javascript:;" title="关闭" node-type="close" onclick="closeTsmitBox(\'tsmit_box\')" class="close"></a></div>';
	htmlList += '<div style=" width:450px;" node-type="inner" class="layerBoxCon">';
	htmlList += '<div class="shareLayer">';
	htmlList += '<div class="laymoveText" node-type="rootFeed"><a href="" target="_blank">@'+publishName+'</a>：'+profContent+'</div>';
	htmlList += '<div class="enterBox_topline">';
	htmlList += '<div class="lf"><a class="faceicon1" id="tsmit_publish_faces" href="javascript:openFacesBox(\'tsmit_publish_faces\',\'inputTe\');" title="表情"></a></div>';
	htmlList += '<div node-type="limit" style="color:#008800; height:22px;line-height:22px;overflow:hidden" class="rt">';
	htmlList += '<span class="normal" id="tcount">还可以输入140个汉字</span>';
	htmlList += '</div>';
	htmlList += '</div>';
	htmlList += '<input type="hidden" name="profile.profId" value="'+prof_id+'"/>';
	htmlList += '<textarea maxlength="140" id="inputTe" name="profile.profContent" onkeyup="checkLength(\'inputTe\');" onclick="if(this.value==\'顺便说点什么吧...\'){clearInfo(this);}" style="overflow-y: hidden; color: rgb(51, 51, 51); font-family: Tahoma, 宋体; word-wrap: break-word; font-size: 14px; line-height: 18px; overflow-x: hidden; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); height: 35px; " node-type="editor" limit="140" class="PY_textarea">顺便说点什么吧...</textarea>';
	htmlList += '<div node-type="sync" class="selSend">';
//	htmlList += '<p><input type="checkbox" id="isLast" name="isLast" node-type="isLast">';
//	htmlList += '<label node-type="isLastLabel" for="isLast">同时评论给 '+publishName+'</label></p>';
	htmlList += '</div>';
	htmlList += '<div class="MIB_btn">';
	htmlList += '<a href="javascript:onClickToAddTransmit();" id="group_submit" class="newabtn_ok">';
	htmlList += '<em>转发</em>';
	htmlList += '</a>';
	htmlList += '<input type="submit" id="submit_btn" style="display:none;"/>';
	htmlList += '<a href="javascript:;" id="group_cancel" class="btn_notclick" onclick="closeTsmitBox(\'tsmit_box\')">';
	htmlList += '<em>取消</em>';
	htmlList += '</a>';
	htmlList += '</div>';
	htmlList += '</div>';
	htmlList += '</div>';
	htmlList += '</div>';
	htmlList += '</div>';
	htmlList += '</td>';
	htmlList += '<td class="mid_r"></td></tr>';
	htmlList += '<tr><td class="bottom_l"></td>';
	htmlList += '<td class="bottom_c"></td>';
	htmlList += '<td class="bottom_r"></td>';
	htmlList += '</tr>';
	htmlList += '</tbody>';
	htmlList += '</table>';
	htmlList += '</form>';
	
	tsmit_box.innerHTML = htmlList;
	document.body.appendChild(tsmit_box);  

	centerDiv('tsmit_box');
	createLayer();
}

function closeTsmitBox(){
	var tsmit_box = document.getElementById('tsmit_box');
	document.body.removeChild(tsmit_box);
	removeLayer();
	isFirstClick = 0;
	
	var fcBox= document.getElementById('facesBox');
	if(fcBox != null){
		document.body.removeChild(fcBox);
	}
}

var isFirstClick = 0;
function setSelectRange(id){
	if( isFirstClick == 0 ){
		var tea = document.getElementById(id); 
		//将光标定位在textarea的开头 
		tea.setSelectionRange(0, 0); 
	}
	isFirstClick = 1;
}

function checkLength(id)  { 
    var maxChars = 140;//最多字符数     
    var obj = document.getElementById(id);
    var curr = maxChars - obj.value.length; 
    if( curr > 0 ){
    	document.getElementById("tcount").innerHTML = '还可以输入'+curr.toString()+'个汉字'; 
    }else{
    	document.getElementById("tcount").innerHTML = '还可以输入0个汉字';
    }
} 


function createTstBox(){
	var msgBox = document.createElement("div");
	msgBox.setAttribute("id","profile_favs");
	var styleData = "position: fixed; clear: both; z-index: 1000; left: 634px; top: 380px; width: 200px; height: 77px;visibility: visible;";

	msgBox.style.cssText = styleData;
	msgBox.innerHTML = "";
	msgBox.innerHTML += '<div><div class="miniPopLayer" style="text-align:center;color:#FF0000;width:200px;">微博已删除，无法转载！</div></div>';
	
	document.body.appendChild(msgBox); 
	centerDiv('profile_favs');
	
	function removeChild(){
		document.body.removeChild(msgBox); 
	}
	setInterval(removeChild,1000);
}

function createTstSuccessBox(){
	var msgBox = document.createElement("div");
	msgBox.setAttribute("id","tsmit_success");
	var styleData = "position: fixed; clear: both; z-index: 1000; left: 634px; top: 380px; width: 100px; height: 77px;visibility: visible;";

	msgBox.style.cssText = styleData;
	msgBox.innerHTML = "";
	msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:100px;"><div class="txt1 gray6"><img class="tipicon tip3" src="/Weibo/css/img/PY_ib.gif"><div>转发成功</div>';
	
	document.body.appendChild(msgBox); 
	centerDiv('profile_favs');	
}