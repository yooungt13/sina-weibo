var prof_id;
var favor_id;

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

// 添加收藏
function onClickToCollection(id){
	prof_id = id;
	addCollection("/Weibo/MyBlog/addCollection.action?profile.profId=" + prof_id );
}
function addCollection(url){
	createXMLHttpRequest();
	http_request.onreadystatechange=processAddCollection;
	http_request.open("GET",url,true);  
	http_request.send(null);
}
function processAddCollection(){
	if(http_request.readyState==4){ 	
		if(http_request.status==200){	
			var htmlList = "";
			 
			var confirmCollection = document.getElementById("collect_"+prof_id);
			var newSpan = document.createElement("span");
			newSpan.innerHTML = "<strong>已收藏</strong>";
			confirmCollection.parentNode.replaceChild(newSpan,confirmCollection);	
			
			var msgBox = document.createElement("div");
			msgBox.setAttribute("id","profile_favs");
			
			var styleData = "position: fixed; clear: both; z-index: 1000; left: 634px; top: 380px; width: 100px; height: 77px;visibility: visible;";
			//msgBox.setAttribute("style","position: fixed; clear: both; z-index: 1000; left: 634px; top: 380px; width: 100px; height: 77px;visibility: visible;");
			msgBox.style.cssText = styleData;
			
			msgBox.innerHTML = "";
			msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:100px;"><div class="txt1 gray6"><img class="tipicon tip3" src="/Weibo/css/img/PY_ib.gif"><div>收藏成功</div>';
			
			document.body.appendChild(msgBox); 
			centerDiv('profile_favs');
			
			function removeChild(){
				document.body.removeChild(msgBox); 
			}
			setInterval(removeChild,1000);
		}
	}
}

// 删除收藏
function onClickDelete(id){
	favor_id = id;
	var msgBox = document.createElement("div");
	
	var tmp = document.getElementById('delete_confirm');
	if( tmp != null ){
		document.body.removeChild(tmp); 
	}
	
	msgBox.setAttribute("id","delete_confirm");
	
	var styleData = "position: fixed; clear: both; z-index: 1000; left: 634px; top: 380px; width: 100px; height: 77px;visibility: visible;";
	msgBox.style.cssText = styleData;

	var inner = '';
	inner += '<div style="position: fixed; clear: both; z-index: 1000; left: 634px; top: 380px; width: 202px; height: 77px; visibility: visible;">';
	inner += '<div style="">';
	inner += '<div class="miniPopLayer" style="width:200px;">';
	inner += '<div class="txt1 gray6">';
	inner += '<img class="tipicon tip4" src="/Weibo/css/img/PY_ib.gif"/>';
	inner += '<div>&nbsp;确定要取消该收藏？</div>';
	inner += '</div>';
	inner += '<div style="" class="btn">';
	inner += '<span>';
	inner += '<a style="width:39px;" class="newabtn_ok" href="/Weibo/MyBlog/deleteCollection.action?favorId='+favor_id+'">';
	inner += '<em>确定</em>';
	inner += '</a>';
	inner += '</span>';
	inner += '<span>';
	inner += '<a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="removeMsgBox()">';
	inner += '<em>取消</em>';				
	inner += '</a></span>';
	inner += '</div>';
	inner += '</div>';
	inner += '</div>';
	inner += '</div>';
	
	msgBox.innerHTML += inner;
	
	document.body.appendChild(msgBox); 	
}
function removeMsgBox(){
	var msgBox = document.getElementById('delete_confirm');
	document.body.removeChild(msgBox); 	
}