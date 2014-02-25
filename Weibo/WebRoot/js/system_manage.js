function weiboSearch(id,pn){
	var form = document.createElement("form");
	var content = document.getElementById(id).value;
	form.action = "/Weibo/Admin/weiboSearch.action?profContent=" + encodeURI(encodeURI(content)) + "&pageNumber= " + pn;
	form.method = "post";
	form.submit();
}

function userSearch(id,pn){
	var form = document.createElement("form");
	var content = document.getElementById(id).value;
	form.action = "/Weibo/Admin/userSearch.action?nickName=" + encodeURI(encodeURI(content)) + "&pageNumber= " + pn;
	form.method = "post";
	form.submit();
}

function deleteWeibo(id){
	
	var content = document.getElementById("sInput").value;
	var msgBox = document.createElement("div");
	msgBox.setAttribute("id","profile_delete");
	
	var styleData = "position: fixed; clear: both; z-index: 1000;width: 100px; height: 77px;visibility: visible;";
	msgBox.style.cssText = styleData;
	
	var inner = '';
	inner += '<div style="position: fixed; clear: both; z-index: 1000;width: 100px; height: 77px;visibility: visible;">';
	inner += '<div style="">';
	inner += '<div class="miniPopLayer" style="width:200px;">';
	inner += '<div class="txt1 gray6">';
	inner += '<img class="tipicon tip4" src="/Weibo/css/img/PY_ib.gif"/>';
	inner += '<div>&nbsp;确定要删除该微博？</div>';
	inner += '</div>';
	inner += '<div style="" class="btn">';
	inner += '<span>';
	inner += '<a style="width:39px;" class="newabtn_ok" href="/Weibo/Admin/deleteWeibo.action?prof.profId='+id+'&profContent='+encodeURI(encodeURI(content))+'">';
	inner += '<em>确定</em>';
	inner += '</a>';
	inner += '</span>';
	inner += '<span>';
	inner += '<a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="removeDeleteConfirm(\'profile_delete\');">';
	inner += '<em>取消</em>';				
	inner += '</a></span>';
	inner += '</div>';
	inner += '</div>';
	inner += '</div>';
	inner += '</div>';
	
	msgBox.innerHTML = inner;

	document.body.appendChild(msgBox);
	centerDiv('profile_delete');
	
}

function freezeUser(id){
	
	var content = document.getElementById("sInput").value;
	var msgBox = document.createElement("div");
	msgBox.setAttribute("id","user_freeze");
	
	var styleData = "position: fixed; clear: both; z-index: 1000;width: 100px; height: 77px;visibility: visible;";
	msgBox.style.cssText = styleData;
	
	var inner = '';
	inner += '<div style="position: fixed; clear: both; z-index: 1000;width: 100px; height: 77px;visibility: visible;">';
	inner += '<div style="">';
	inner += '<div class="miniPopLayer" style="width:200px;">';
	inner += '<div class="txt1 gray6">';
	inner += '<img class="tipicon tip4" src="/Weibo/css/img/PY_ib.gif"/>';
	inner += '<div>&nbsp;确定要冻结该用户？</div>';
	inner += '</div>';
	inner += '<div style="" class="btn">';
	inner += '<span>';
	inner += '<a style="width:39px;" class="newabtn_ok" href="/Weibo/Admin/freezeUser.action?userId='+id+'&nickName='+encodeURI(encodeURI(content))+'">';
	inner += '<em>确定</em>';
	inner += '</a>';
	inner += '</span>';
	inner += '<span>';
	inner += '<a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="removeDeleteConfirm(\'user_freeze\');">';
	inner += '<em>取消</em>';				
	inner += '</a></span>';
	inner += '</div>';
	inner += '</div>';
	inner += '</div>';
	inner += '</div>';
	
	msgBox.innerHTML = inner;

	document.body.appendChild(msgBox);
	centerDiv('user_freeze');
	
}

function recoverUser(id){
	
	var content = document.getElementById("sInput").value;
	var msgBox = document.createElement("div");
	msgBox.setAttribute("id","user_recover");
	
	var styleData = "position: fixed; clear: both; z-index: 1000;width: 100px; height: 77px;visibility: visible;";
	msgBox.style.cssText = styleData;
	
	var inner = '';
	inner += '<div style="position: fixed; clear: both; z-index: 1000;width: 100px; height: 77px;visibility: visible;">';
	inner += '<div style="">';
	inner += '<div class="miniPopLayer" style="width:200px;">';
	inner += '<div class="txt1 gray6">';
	inner += '<img class="tipicon tip4" src="/Weibo/css/img/PY_ib.gif"/>';
	inner += '<div>&nbsp;确定要恢复该用户？</div>';
	inner += '</div>';
	inner += '<div style="" class="btn">';
	inner += '<span>';
	inner += '<a style="width:39px;" class="newabtn_ok" href="/Weibo/Admin/recoverUser.action?userId='+id+'&nickName='+encodeURI(encodeURI(content))+'">';
	inner += '<em>确定</em>';
	inner += '</a>';
	inner += '</span>';
	inner += '<span>';
	inner += '<a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="removeDeleteConfirm(\'user_freeze\');">';
	inner += '<em>取消</em>';				
	inner += '</a></span>';
	inner += '</div>';
	inner += '</div>';
	inner += '</div>';
	inner += '</div>';
	
	msgBox.innerHTML = inner;

	document.body.appendChild(msgBox);
	centerDiv('user_recover');
	
}

function onClickConfirmUpdatePwd(id){
	var myform = document.getElementById(id);
	var validateNum = p*q;
	var msgBox = document.createElement("div");
	msgBox.setAttribute("id","updatepwd_confirm");
	var styleData = "position: fixed; clear: both; z-index: 1000; left: 634px; top: 380px; width: 100px; height: 77px;visibility: visible;";

	if(validateNum == 1){
		msgBox.style.cssText = styleData;
		msgBox.innerHTML = "";
		msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:100px;"><div class="txt1 gray6"><img class="tipicon tip3" src="/Weibo/css/img/PY_ib.gif"><div>修改成功</div>';
		
		document.body.appendChild(msgBox); 
		centerDiv('updatepwd_confirm');
		
		function removeChild(){
			document.body.removeChild(msgBox); 
			myform.submit();
		}
		setInterval(removeChild,1500);
	}
}

function removeDeleteConfirm(id){
	var msgBox = document.getElementById(id);
	document.body.removeChild(msgBox); 
}

function CheckPicture(object){
	
    //这里设置允许的扩展名
    var AllowExt="jpg|gif|png";
    var ExtOK=false;
    var ArrayExt;
    var ext = object.value.substr(object.value.length-3,3);
    
    if(AllowExt.indexOf('|')!=-1){
        ArrayExt=AllowExt.split('|');   
        for(i=0;i<ArrayExt.length;i++){
            if(ext.toLowerCase()==ArrayExt[i]){         	
                ExtOK=true;
                break;
            }
        }
    }
    else{
        ArrayExt=AllowExt;
        if(ext.toLowerCase()==ArrayExt){
            ExtOK=true;
        }
    }
    
    if(!ExtOK){
    	// 创建上传失败提示框
    	var msgBox = document.createElement("div");
    	msgBox.setAttribute("id","upload_failed");
    	var styleData = "position: fixed; clear: both; z-index: 1000; width: 100px; height: 77px;visibility: visible;";

    	msgBox.style.cssText = styleData;
    	msgBox.innerHTML = "";
    	
    	msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:210px;"><div class="txt1 gray6"><img class="tipicon tip2" src="/Weibo/css/img/PY_ib.gif"><div>图片格式错误,只支持jpg,png,gif</div>';
		
		document.body.appendChild(msgBox); 
		centerDiv('upload_failed');
		object.value='';
		
		function removeChild(){
			document.body.removeChild(msgBox); 
		}
		setInterval(removeChild,1500);
    }
}
