var msg_id;
var http_request;
var fmsg_id;
var z = 0;
var x = 1;

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

function OnClickReply(id){

	OnClickSendMsg();

	var msgName = document.getElementById("fmsgToName_"+id).value;
	var msgTo = document.getElementById('popUpNick');
	
	msgTo.setAttribute("value",msgName);
	msgTo.setAttribute("readonly","readonly");
	z=1;

}
function OnClickSendMsg(){

	var msg_box = document.createElement("div");
	
	msg_box.setAttribute("id","msg_box");
	var styleData = "position: fixed; z-index: 1000; visibility: visible; ";
	msg_box.style.cssText = styleData;

	
	var htmlList = '';
	htmlList += '<form id="msg" action="/Weibo/MyBlog/Message.action?pageNumber=1" method="post" name="message">';
	htmlList += '<table class="mBlogLayer">';
	htmlList += '<tbody>';
	htmlList += '<tr>';
	htmlList += '<td class="top_l"></td>';
	htmlList += '<td class="top_c"></td>';
	htmlList += '<td class="top_r"></td>';
	htmlList += '</tr>';
	htmlList += '<tr>';
	htmlList += '<td class="mid_l"></td>';
	htmlList += '<td class="mid_c">';
	htmlList += '<div class="layerBox">';
	htmlList += '<div class="layerBoxTop">';
        htmlList += '<div class="topCon"><strong>发私信</strong>';
	htmlList += '<a href="javascript:void(0);" class="close" id= "msg_box_cancle" onclick="removeMsgBox();closeFacesBox(\'facesBox\')" title="关闭"></a>';

	htmlList += '<div class="clear">';
	htmlList += '</div>';
	htmlList += '</div>';
	htmlList += '</div>';
	htmlList += '<div class="layerBoxCon" style="width: 430px; height: auto; ">';
	htmlList += '<table class="noteTab2">';
        htmlList += '<tbody>';
	htmlList += '<tr>';
	htmlList += '<th>发私信给：&nbsp;';
	htmlList += '</th>';
	htmlList += '<td><input id="popUpNick" type="text" name="msgToName" class="PY_input" style="color: rgb(153, 153, 153); "onclick="onClickShowStyleOfLoginName()" onblur="onClickmsgToName(\'popUpNick\')" >&nbsp;&nbsp;</input>';
    htmlList += '  <span id="errorNickName3" style="color:#FF0000; visibility:hidden;">用户名不存在</span> ';
	htmlList += '</td>';
	htmlList += '</tr>';
	htmlList += '<tr class="tPadding">';
    htmlList += '<th>私信内容：&nbsp;';
	htmlList += '</th>';
	htmlList += '<td><textarea id="popUpEditor" class="PY_input" name="message.msgContent" style="overflow-y:hidden; overflow-x: hidden; "></textarea>'; 


	htmlList += '</td>';
	htmlList += '</tr>';
	htmlList += '<tr class="tPadding1">';
	htmlList += '<th>';
        htmlList += '</th>';
	htmlList += '<td><a class="faceicon1" id="insert_face_icon" href="javascript:openFacesBox(\'insert_face_icon\',\'popUpEditor\');" title="表情"></a>';
	htmlList += '</td>';
	htmlList += '</tr>';

	htmlList += '<tr>';
	htmlList += '<th></th>';
	htmlList += '<td><a id="popUpSubmit" href="javascript:validateMsgSubmit(\'msg\');" class="btn_normal" ><em>发送</em></a>';
	htmlList += '</td>';
	htmlList += '</tr>';
	htmlList += '<tr>';
        htmlList += '<td></td>';
	htmlList += '<td><p class="inviteLayer_tip gray9">说明：长度不能超过300字</p>';
	htmlList += '</td>';
	htmlList += '</tr>';
	htmlList += '</tbody>';
	htmlList += '</table>';
	htmlList += ' </div>';
	htmlList += '</div>';
        htmlList += '</td>';

	htmlList += '<td class="mid_r">';
	htmlList += '</td>';
	htmlList += '</tr>';
	htmlList += '<tr>';
	htmlList += ' <td class="bottom_l"></td>';
	htmlList += '<td class="bottom_c"></td>';
        htmlList += '<td class="bottom_r"></td>';
	htmlList += '</tr>';
	htmlList += '</tbody>';
	htmlList += '</table>';	
	htmlList += '</form> ';	
	
	msg_box.innerHTML = htmlList;	
	
	document.body.appendChild(msg_box);
	centerDiv('msg_box');

	
	createLayer();
}

function removeMsgBox(){
	var msg_box = document.getElementById('msg_box');
	document.body.removeChild(msg_box);
	
	removeLayer();
}
function nremoveMsgBox(){

	var msg_box = document.getElementById('msg_box');
	var msgTo = document.getElementById('tpopUpNick');
	msgTo.value=" ";
	document.body.removeChild(msg_box);
	
	removeLayer();
}
function sOnClickReply(id){
	
	sOnClickSendMsg();

	var msgName = document.getElementById("user_"+id).value;
	var msgTo = document.getElementById('spopUpNick');
	
	msgTo.setAttribute("value",msgName);
	msgTo.setAttribute("readonly","readonly");

}
function sOnClickSendMsg(){

	var msg_box = document.createElement("div");
	
	msg_box.setAttribute("id","msg_box");
	var styleData = "position: fixed; z-index: 1000; visibility: visible; ";
	msg_box.style.cssText = styleData;

	
	var htmlList = '';
	htmlList += '<form id="msg" action="/Weibo/Admin/sendnotice.action?pageNumber=1" method="post" name="notice">';
	htmlList += '<table class="mBlogLayer">';
	htmlList += '<tbody>';
	htmlList += '<tr>';
	htmlList += '<td class="top_l"></td>';
	htmlList += '<td class="top_c"></td>';
	htmlList += '<td class="top_r"></td>';
	htmlList += '</tr>';
	htmlList += '<tr>';
	htmlList += '<td class="mid_l"></td>';
	htmlList += '<td class="mid_c">';
	htmlList += '<div class="layerBox">';
	htmlList += '<div class="layerBoxTop">';
        htmlList += '<div class="topCon"><strong>发通知</strong>';
	htmlList += '<a href="javascript:void(0);" class="close" id= "smsg_box_cancle" onclick="sremoveMsgBox();closeFacesBox(\'facesBox\')" title="关闭"></a>';

	htmlList += '<div class="clear">';
	htmlList += '</div>';
	htmlList += '</div>';
	htmlList += '</div>';
	htmlList += '<div class="layerBoxCon" style="width: 430px; height: auto; ">';
	htmlList += '<table class="noteTab2">';
        htmlList += '<tbody>';
	htmlList += '<tr>';
	htmlList += '<th>发通知给：&nbsp;';
	htmlList += '</th>';
	htmlList += '<td><input id="spopUpNick" type="text" name="msgToName" class="PY_input" style="color: rgb(153, 153, 153); "onclick="onClickShowStyleOfLoginName()" onblur="onClickmsgToName(\'spopUpNick\')" >&nbsp;&nbsp;</input>';
    htmlList += '  <span id="errorNickName3" style="color:#FF0000; visibility:hidden;">用户名不存在</span> ';
	htmlList += '</td>';
	htmlList += '</tr>';
	htmlList += '<tr class="tPadding">';
    htmlList += '<th>通知内容：&nbsp;';
	htmlList += '</th>';
	htmlList += '<td><textarea id="popUpEditor" class="PY_input" name="message.msgContent" style="overflow-y:hidden; overflow-x: hidden; "></textarea>'; 


	htmlList += '</td>';
	htmlList += '</tr>';
	htmlList += '<tr class="tPadding1">';
	htmlList += '<th>';
        htmlList += '</th>';
	htmlList += '<td><a class="faceicon1" id="insert_face_icon" href="javascript:openFacesBox(\'insert_face_icon\',\'popUpEditor\');" title="表情"></a>';
	htmlList += '</td>';
	htmlList += '</tr>';

	htmlList += '<tr>';
	htmlList += '<th></th>';
	htmlList += '<td><a id="popUpSubmit" href="javascript:toSubmit(\'msg\');" class="btn_normal" ><em>发送</em></a>';
	htmlList += '</td>';
	htmlList += '</tr>';
	htmlList += '<tr>';
        htmlList += '<td></td>';
	htmlList += '<td><p class="inviteLayer_tip gray9">说明：长度不能超过300字</p>';
	htmlList += '</td>';
	htmlList += '</tr>';
	htmlList += '</tbody>';
	htmlList += '</table>';
	htmlList += ' </div>';
	htmlList += '</div>';
        htmlList += '</td>';

	htmlList += '<td class="mid_r">';
	htmlList += '</td>';
	htmlList += '</tr>';
	htmlList += '<tr>';
	htmlList += ' <td class="bottom_l"></td>';
	htmlList += '<td class="bottom_c"></td>';
        htmlList += '<td class="bottom_r"></td>';
	htmlList += '</tr>';
	htmlList += '</tbody>';
	htmlList += '</table>';	
	htmlList += '</form> ';	
	
	msg_box.innerHTML = htmlList;	
	
	document.body.appendChild(msg_box);
	centerDiv('msg_box');

	
	createLayer();
}

function sremoveMsgBox(){
	var msg_box = document.getElementById('msg_box');
	document.body.removeChild(msg_box);
	
	removeLayer();
}



function fOnClickremove(id){
	fremoveMsg(id);
}
function fremoveMsg(id){

	var rmsg_box = document.createElement("div");
	
	rmsg_box.setAttribute("id","fprofile_cancel");
	var styleData = "position: absolute; clear: both; z-index: 1000; width: 202px; height: 77px; visibility: visible;display: block; ";
	rmsg_box.style.cssText = styleData;

	
	
	var htmlList1 = '';
	htmlList1 += '<form id="frmsg" action="/Weibo/MyBlog/fmsgRemove.action?pageNumber=1" method="post" name="fremessage">'
	htmlList1 += '<div style="">';
	htmlList1 += '<div class="miniPopLayer" style="width:200px;">';
	htmlList1 += '<div class="txt1 gray6">';
	htmlList1 += '<img class="tipicon tip4">';
	htmlList1 += '<div>确认删除的私信？';
	htmlList1 += ' </div></div>';
	htmlList1 += '<div style="" class="btn">';
    htmlList1 += '<span>';
	htmlList1 += '<a style="width:39px;" class="newabtn_ok" href="/Weibo/MyBlog/fmsgRemove.action?msg_id='+id+'"?pageNumber=1 >';
	htmlList1 += '<em>确定</em>';
	htmlList1 += '</a></span>';	
	htmlList1 += '<span><a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="fremoveRmsg_box()">';
	htmlList1 += '<em>取消</em>';
	htmlList1 += '</a></span></div></div></div></div></form>';
	rmsg_box.innerHTML = htmlList1;	
	document.body.appendChild(rmsg_box);
	centerDiv('fprofile_cancel');
	createLayer();
}
function fremoveRmsg_box(){
	var rmsg_box = document.getElementById('fprofile_cancel');
	document.body.removeChild(rmsg_box);
	removeLayer();
}  

function OnClickremove(id){
	
	removeMsg(id);
	
}
function removeMsg(id){
    var rmsg_box = document.createElement("div");
	rmsg_box.setAttribute("id","profile_cancel");
	var styleData = "position: absolute; clear: both; z-index: 1000; width: 202px; height: 77px; visibility: visibledisplay: block;  ";
	rmsg_box.style.cssText = styleData;

	var htmlList1 = '';
	htmlList1 += '<form id="rmsg" action="/Weibo/MyBlog/msgRemove.action?pageNumber=1" method="post" name="remessage">'
	htmlList1 += '<div style="">';
	htmlList1 += '<div class="miniPopLayer" style="width:200px;">';
	htmlList1 += '<div class="txt1 gray6">';
	htmlList1 += '<img class="tipicon tip4">';
	htmlList1 += '<div>确认删除私信？';
	htmlList1 += ' </div></div>';
	htmlList1 += '<div style="" class="btn">';
    htmlList1 += '<span>';
	htmlList1 += '<a style="width:39px;" class="newabtn_ok" href="/Weibo/MyBlog/msgRemove.action?msg_id='+id+'"?pageNumber=1 >';
	htmlList1 += '<em>确定</em>';
	htmlList1 += '</a></span>';	
	htmlList1 += '<span><a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="removeRmsg_box()">';
	htmlList1 += '<em>取消</em>';
	htmlList1 += '</a></span></div></div></div></div></form>';
	rmsg_box.innerHTML = htmlList1;	
	document.body.appendChild(rmsg_box);
	centerDiv('profile_cancel');
	createLayer();
}
function removeRmsg_box(){
	var rmsg_box = document.getElementById('profile_cancel');
	document.body.removeChild(rmsg_box);
	removeLayer();
}  
function sOnClickremove(id){
	sremoveMsg(id);
}
function sremoveMsg(id){
	var rmsg_box = document.createElement("div");
	rmsg_box.setAttribute("id","fprofile_cancel");
	var styleData = "position: absolute; clear: both; z-index: 1000; width: 202px; height: 77px; visibility: visibledisplay: block;  ";
	rmsg_box.style.cssText = styleData;
	
	var htmlList1 = '';
	htmlList1 += '<form id="frmsg" action="/Weibo/MyBlog/smsgRemove.action?pageNumber=1" method="post" name="fremessage">'
	htmlList1 += '<div style="">';
	htmlList1 += '<div class="miniPopLayer" style="width:200px;">';
	htmlList1 += '<div class="txt1 gray6">';
	htmlList1 += '<img class="tipicon tip4">';
	htmlList1 += '<div>确认删除通知？';
	htmlList1 += ' </div></div>';
	htmlList1 += '<div style="" class="btn">';
    htmlList1 += '<span>';
	htmlList1 += '<a style="width:39px;" class="newabtn_ok" href="/Weibo/MyBlog/smsgRemove.action?msg_id='+id+'"?pageNumber=1 >';
	htmlList1 += '<em>确定</em>';
	htmlList1 += '</a></span>';	
	htmlList1 += '<span><a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="sremoveRmsg_box()">';
	htmlList1 += '<em>取消</em>';
	htmlList1 += '</a></span></div></div></div></div></form>';
	rmsg_box.innerHTML = htmlList1;	
	document.body.appendChild(rmsg_box);
	centerDiv('fprofile_cancel');
	createLayer();
}
function sremoveRmsg_box(){
	var rmsg_box = document.getElementById('fprofile_cancel');
	document.body.removeChild(rmsg_box);
	removeLayer();
}  
function onClickmsgToName(id){	
	
	var login = document.getElementById(id).value;
	checkMsgName("/Weibo/MyBlog/validatemsgtoName.action?msgToName="+encodeURI(encodeURI(login)));
	
	//document.getElementById("errorNickName3").style.display="block";	
}
function checkMsgName(url){
	
	// 创建请求，并赋值（使用第1,2步）
	createXMLHttpRequest();
	// 指定action执行后的回调函数
	http_request.onreadystatechange=processCheckName;
	// 执行action	
	http_request.open("GET",url,true); 
	
	// 传参，但是参数写在url里进行传参，这里参数就可以写为null 
	http_request.send(null);
}
function processCheckName(){
	if(http_request.readyState==4){ 	
		if(http_request.status==200){
			
			// 通过request获取reponse里的值
			var isPass = http_request.responseText;
			if( isPass == "true"){
				//window.alert("验证通过");
				// 提示框4
				
				z=0;
				document.getElementById("errorNickName3").style.visibility = "visible";
				//document.getElementById("errorNickName10").style.visibility = "visible";
				
			}
			else{
				
				z=1;
				// 提示框3
				document.getElementById("errorNickName3").style.visibility = "hidden";
				//document.getElementById("errorNickName10").style.visibility = "hidden";
			}
		}
	}

}
function nonClickmsgToName(id){	
	
	var login = document.getElementById(id).value;
	checkMsgName("/Weibo/Admin/nvalidatemsgtoName.action?msgToName="+encodeURI(encodeURI(login)));
	
	//document.getElementById("errorNickName3").style.display="block";	
}

function suoding(){
	
	var msgTo = document.getElementById('1popUpNick');
	msgTo.value = "所有人";


}
function jiesuo(){
	var msgTo = document.getElementById('1popUpNick');
	msgTo.value = "";


}
