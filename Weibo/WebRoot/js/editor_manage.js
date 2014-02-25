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

function openFacesBox(id,cid){
	closeFacesBox('facesBox');
	
	var fcBox = document.createElement("div");
	
	fcBox.setAttribute('id','facesBox');

	fcBox.setAttribute('className','W_layer');
	fcBox.setAttribute('class','W_layer');

	var faceBtn = document.getElementById(id);
	var top = document.body.scrollTop + document.documentElement.scrollTop + faceBtn.getBoundingClientRect().top + 20;
	var left = faceBtn.getBoundingClientRect().left - 15;
	fcBox.style.cssText = "visibility: visible; left:" + left + "px; top:" + top + "px ;";

	if( cid == "inputTe"){		
		fcBox.style.position = "fixed";	
		fcBox.style.top = faceBtn.getBoundingClientRect().top + 20 + 'px';	
	}
	
	var htmlList = '';
	htmlList += '<div class="bg">';
	htmlList += '<table cellspacing="0" cellpadding="0" border="0">';
	htmlList += '<tbody><tr><td>';
	htmlList += '<div class="content">';
	htmlList += '<a class="W_close" href="javascript:closeFacesBox(\'facesBox\');" title="关闭"></a>';
	htmlList += '<div node-type="outer" class="layer_faces clearfix">';  
	htmlList += '<div class="tab W_textb" style="height:25px;"></div>';								
	htmlList += '<div style="margin-top:10px;">';                               
	htmlList += '<div class="detail">';
	htmlList += '<ul class="faces_list clearfix" node-type="inner">';
	htmlList += '<li><img src="/Weibo/Images/emotions/otm.gif" id="otm" onclick="addEmotion(\'otm\',\''+ cid +'\');"title="奥特曼"></li>';
	htmlList += '<li><img src="/Weibo/Images/emotions/wg.gif" id="wg" onclick="addEmotion(\'wg\',\''+ cid +'\');"title="围观"></li>';
	htmlList += '<li><img src="/Weibo/Images/emotions/geili.gif" id="geili" onclick="addEmotion(\'geili\',\''+ cid +'\');"title="给力"></li>';
	htmlList += '<li><img src="/Weibo/Images/emotions/bs.gif" id="bs" onclick="addEmotion(\'bs\',\''+ cid +'\');"title="鄙视"></li>';
	htmlList += '<li><img src="/Weibo/Images/emotions/hate.gif" id="hate" onclick="addEmotion(\'hate\',\''+ cid +'\');"title="讨厌"></li>';
	htmlList += '<li><img src="/Weibo/Images/emotions/hei.gif" id="hei" onclick="addEmotion(\'hei\',\''+ cid +'\');"title="嘿嘿"></li>';
	htmlList += '<li><img src="/Weibo/Images/emotions/ldln.gif" id="ldln" onclick="addEmotion(\'ldln\',\''+ cid +'\');"title="懒得理你"></li>';
	htmlList += '<li><img src="/Weibo/Images/emotions/hs.gif" id="hs" onclick="addEmotion(\'hs\',\''+ cid +'\');"title="花心"></li>';
	htmlList += '<li><img src="/Weibo/Images/emotions/kbs.gif" id="kbs" onclick="addEmotion(\'kbs\',\''+ cid +'\');"title="扣鼻屎"></li>';
	htmlList += '<li><img src="/Weibo/Images/emotions/sad.gif" id="sad" onclick="addEmotion(\'sad\',\''+ cid +'\');"title="伤心"></li>';
	htmlList += '<li><img src="/Weibo/Images/emotions/laugh.gif" id="laugh" onclick="addEmotion(\'laugh\',\''+ cid +'\');"title="哈哈"></li>';
	htmlList += '<li><img src="/Weibo/Images/emotions/yx.gif" id="yx" onclick="addEmotion(\'yx\',\''+ cid +'\');" title="阴险"></li>';
	htmlList += '</ul></div></div></div></div></td></tr></tbody></table>';
	htmlList += '<div class="arrow arrow_t">';
	htmlList += '</div>';
	
	fcBox.innerHTML = htmlList;	
	
	document.body.appendChild(fcBox);
}

function closeFacesBox(id){
	var fcBox= document.getElementById(id);
	if(fcBox != null){
		if( id == "image_preview"){
			document.getElementById('upload_img').value = '';
		}
		document.body.removeChild(fcBox);
	}
}

function addEmotion(id,cid){
	var emt = document.getElementById(id);
	var inputBox = document.getElementById(cid);
	inputBox.focus();
	var tmpList = inputBox.value;

	if( cid == "publish_editor"){
		inputBox.value = tmpList + '[' + emt.title + ']';
		checkLen(inputBox);
	}else if( cid == "inputTe"){
		if(tmpList=='顺便说点什么吧...'){
			inputBox.value = '[' + emt.title + ']';
		}else{	
			inputBox.value = '[' + emt.title + ']' + tmpList;
		}
		checkLength(cid);
	}else{
		inputBox.value = tmpList + '[' + emt.title + ']';
	}
	
	closeFacesBox('facesBox');	
}

function uploadImg(){
	closeFacesBox('image_preview');
	closeFacesBox('facesBox');
	var file = document.getElementById("upload_img");
	file.click();
}

//function ShowImage(value)
//{   
//	// 获取input file对象
//	var faceBtn = document.getElementById("upload_img");
//	
//	if(CheckExt(value.substr(value.length-3,3))){
//    	uploadPreviewImg("/Weibo/uploadPreviewImg.action?fileFileName="+value);
//    } 
//    else{
//    	var msgBox = document.createElement("div");
//		msgBox.setAttribute("id","upload_failed");
//		var styleData = "position: fixed; clear: both; z-index: 1000; width: 100px; height: 77px;visibility: visible;";
//
//		msgBox.style.cssText = styleData;
//		msgBox.innerHTML = "";
//		
//    	msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:210px;"><div class="txt1 gray6"><img class="tipicon tip2" src="/Weibo/css/img/PY_ib.gif"><div>图片格式错误,只支持jpg,png,gif</div>';
//		
//		document.body.appendChild(msgBox); 
//		centerDiv('upload_failed');
//		faceBtn.value='';
//		
//		function removeChild(){
//			document.body.removeChild(msgBox); 
//		}
//		setInterval(removeChild,1500);
//    }
//}

function ShowImage(value)
{
    //alert(value);
    //检测盘符
    //alert(value.indexOf(':'));
    //检测文件是否有扩展名
    //alert(value.length-value.lastIndexOf('.'));
    //取文件扩展名
    //alert(value.substr(value.length-3,3));
    //检测文件扩展名是否合法
    //alert(CheckExt(value.substr(value.length-3,3)));
	
	var imgPreview = document.createElement("div");
	
	imgPreview.setAttribute('id','image_preview');
	imgPreview.setAttribute('className','W_layer');
	imgPreview.setAttribute('class','W_layer');
	
	var faceBtn = document.getElementById("upload_img");
	var top = document.body.scrollTop + document.documentElement.scrollTop + faceBtn.getBoundingClientRect().top + 20;
	var left = faceBtn.getBoundingClientRect().left - 10;
	imgPreview.style.cssText = "visibility: visible; left:" + left + "px; top:" + top + "px ;";
	
	var htmlList = "";
	
	htmlList += '<div class="bg">';
	htmlList += '<div class="arrow arrow_t"></div>';
	htmlList += '<table cellspacing="0" cellpadding="0" border="0">';
	htmlList += '<tbody><tr><td>';
	htmlList += '<div class="content">';
	htmlList += '<a class="W_close" href="javascript:closeFacesBox(\'image_preview\');" title="关闭"></a>';
	htmlList += '<div>';
	htmlList += '<div class="layer_send_pic" style="width: 240px;margin:10px;">';
	htmlList += '<div class="laPic_tit">';
	
	var imgvalue = ( value.length > 30 )? (value.substr(0,10)+ "..." + value.substr(value.length-10,10)):value;
	htmlList += '<span>'+ imgvalue +'</span>';
	htmlList += '<span class="right">';
	htmlList += '</span>';
	htmlList += '</div>';
	htmlList += '<div class="laPic_Pic">';
	htmlList += '<img id="preview_img" style="display:none;" onload="DrawImage(this);"/></div></div></td></tr></tbody>';
	  
    imgPreview.innerHTML = htmlList;   
	
	// 创建上传失败提示框
	var msgBox = document.createElement("div");
	msgBox.setAttribute("id","upload_failed");
	var styleData = "position: fixed; clear: both; z-index: 1000; width: 100px; height: 77px;visibility: visible;";

	msgBox.style.cssText = styleData;
	msgBox.innerHTML = "";
    
    if(CheckExt(value.substr(value.length-3,3))){
    	document.body.appendChild(imgPreview);
        var img = document.getElementById("preview_img");
    	img.src=value;
    	img.alt="图片预览";  
    	
    	//window.alert(document.getElementById("upload_img").files[0].fileSize);
    	
    	if(document.all){
	    	if(document.all.preview_img.fileSize > 1024*1024 || document.all.preview_img.fileSize<0){	    	
	    		closeFacesBox('image_preview');
	    		msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:220px;"><div class="txt1 gray6"><img class="tipicon tip2" src="/Weibo/css/img/PY_ib.gif"><div>图片大小错误,只支持1MB以下</div>';
	    		
	    		document.body.appendChild(msgBox); 
	    		centerDiv('upload_failed');
	    		faceBtn.value='';
	    		
	    		function removeChild(){
	    			document.body.removeChild(msgBox); 
	    		}
	    		setInterval(removeChild,1500);
	    	}
    	}else{
    		var ffsize = document.getElementById("upload_img").files.item(0).size;
    		if(ffsize > 1024*1024 || ffsize<0){
	    		closeFacesBox('image_preview');
	    		msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:210px;"><div class="txt1 gray6"><img class="tipicon tip2" src="/Weibo/css/img/PY_ib.gif"><div>图片大小错误,只支持1MB以下</div>';
	    		
	    		document.body.appendChild(msgBox); 
	    		centerDiv('upload_failed');
	    		faceBtn.value='';
	    		
	    		function removeChild(){
	    			document.body.removeChild(msgBox); 
	    		}
	    		setInterval(removeChild,1500);
	    	}
    	}
    } 
    else{
    	msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:210px;"><div class="txt1 gray6"><img class="tipicon tip2" src="/Weibo/css/img/PY_ib.gif"><div>图片格式错误,只支持jpg,png,gif</div>';
		
		document.body.appendChild(msgBox); 
		centerDiv('upload_failed');
		faceBtn.value='';
		
		function removeChild(){
			document.body.removeChild(msgBox); 
		}
		setInterval(removeChild,1500);
    }
}

//检查扩展名是否合法,合法返回True
function CheckExt(ext)
{
    //这里设置允许的扩展名
    var AllowExt="jpg|gif|png";
    var ExtOK=false;
    var ArrayExt;
    
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
    return ExtOK;
}

//裁剪图片
var flag=false;
function DrawImage(ImgD){
    var image=new Image();
    image.src=ImgD.src;
    if(image.width>0 && image.height>0){
    		
    	flag=true;
    	if(image.width/image.height>= 240/180){
    		if(image.width>240){
    			ImgD.width=240;
    			ImgD.height=(image.height*240)/image.width;
    		}else{
    			ImgD.width=image.width;
    			ImgD.height=image.height;
    		}
    	}else{ 		
    		if(image.height>180){
    			ImgD.height=180;
    			ImgD.width=(image.width*180)/image.height;
    		}else{
    			ImgD.width=image.width;
    			ImgD.height=image.height;
    		}
    	}
    }
}

function toSubmitForm(){	
	var content = document.getElementById("publish_editor").value;
	
	var msgBox = document.createElement("div");
	msgBox.setAttribute("id","publish_tips");
	var styleData = "position: fixed; clear: both; z-index: 1000; width: 100px; height: 77px;visibility: visible;";

	msgBox.style.cssText = styleData;
	msgBox.innerHTML = "";

	if( content == '' ){
    	msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:130px;"><div class="txt1 gray6"><img class="tipicon tip2" src="/Weibo/css/img/PY_ib.gif"><div>内容不能为空噢</div>';

		document.body.appendChild(msgBox); 
		centerDiv('publish_tips');
		
		function removeChild(){
			document.body.removeChild(msgBox); 
		}
		setInterval(removeChild,1500);
	}else{
    	msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:100px;"><div class="txt1 gray6"><img class="tipicon tip3" src="/Weibo/css/img/PY_ib.gif"><div>发布成功</div>';
		
		document.body.appendChild(msgBox); 
		centerDiv('publish_tips');
		
		function remove(){
			document.body.removeChild(msgBox); 
			document.forms.pubProfile.submit();
		}
		setInterval(remove,1500);			
	}
	
}

function getFileSize(imgOjb){  
	  
	if(document.all){  	  
		//如果是IE,空文件会返回-1  		  
		var img=new Image();  		  
		img.dynsrc=imgOjb.value;  	  
		return img.fileSize;  
	  
	}else{  
	  	//如果是FF或者Chrome  	  
		if(imgOjb.value=='')  	  
			//如果文件为空  	  
			return -1;  	  
	}  	  
	return imgOjb.files[0].fileSize;  	  
}

// 上传预览照片
function uploadPreviewImg(url){
	createXMLHttpRequest();
	http_request.onreadystatechange=processUploadPreviewImg;
	http_request.open("GET",url,true);  
	http_request.send(null);
}

function processUploadPreviewImg(){
	if(http_request.readyState==4){ 		
		if(http_request.status==200){
			
			var imgsrc = http_request.responseText;
			
			// 获取input file对象
			var faceBtn = document.getElementById("upload_img");
			
			// 创建图片预览框
			var imgPreview = document.createElement("div");
			
			imgPreview.setAttribute('id','image_preview');
			imgPreview.setAttribute('className','W_layer');
			imgPreview.setAttribute('class','W_layer');
			
			// 定位预览框坐标
			var top = document.body.scrollTop + document.documentElement.scrollTop + faceBtn.getBoundingClientRect().top + 20;
			var left = faceBtn.getBoundingClientRect().left - 10;
			imgPreview.style.cssText = "visibility: visible; left:" + left + "px; top:" + top + "px ;";
			
			var htmlList = "";
			
			htmlList += '<div class="bg">';
			htmlList += '<div class="arrow arrow_t"></div>';
			htmlList += '<table cellspacing="0" cellpadding="0" border="0">';
			htmlList += '<tbody><tr><td>';
			htmlList += '<div class="content">';
			htmlList += '<a class="W_close" href="javascript:closeFacesBox(\'image_preview\');" title="关闭"></a>';
			htmlList += '<div>';
			htmlList += '<div class="layer_send_pic" style="width: 240px;margin:10px;">';
			htmlList += '<div class="laPic_tit">';
			
			var imgvalue = ( value.length > 40 )? (value.substr(0,10)+ "..." + value.substr(value.length-10,10)):value;
			htmlList += '<span>'+ imgvalue +'</span>';
			htmlList += '<span class="right">';
			htmlList += '</span>';
			htmlList += '</div>';
			htmlList += '<div class="laPic_Pic">';
			htmlList += '<img id="preview_img" onload="DrawImage(this);"/></div></div></td></tr></tbody>';
			  
		    imgPreview.innerHTML = htmlList;   
		    document.body.appendChild(imgPreview);
		    
			// 创建上传失败提示框
			var msgBox = document.createElement("div");
			msgBox.setAttribute("id","upload_failed");
			var styleData = "position: fixed; clear: both; z-index: 1000; width: 100px; height: 77px;visibility: visible;";

			msgBox.style.cssText = styleData;
			msgBox.innerHTML = "";
			
			
			// 给预览框中图片路径赋值
	        var img = document.getElementById("preview_img");
	    	img.src = imgsrc;
	    	img.alt = "图片预览";  
	    	
	    	// 判断图片上传大小
	    	if(document.all){ // IE解决方法
		    	if(document.all.preview_img.fileSize > 1024*1024 || document.all.preview_img.fileSize<0){	    	
		    		closeFacesBox('image_preview');
		    		msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:220px;"><div class="txt1 gray6"><img class="tipicon tip2" src="/Weibo/css/img/PY_ib.gif"><div>图片大小错误,只支持1MB以下</div>';
		    		
		    		document.body.appendChild(msgBox); 
		    		centerDiv('upload_failed');
		    		faceBtn.value='';
		    		
		    		function removeChild(){
		    			document.body.removeChild(msgBox); 
		    		}
		    		setInterval(removeChild,1500);
		    	}
	    	}else{ // FF、Chrome解决方法
	    		var ffsize = document.getElementById("upload_img").files.item(0).size;
	    		if(ffsize > 1024*1024 || ffsize<0){
		    		closeFacesBox('image_preview');
		    		msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:210px;"><div class="txt1 gray6"><img class="tipicon tip2" src="/Weibo/css/img/PY_ib.gif"><div>图片大小错误,只支持1MB以下</div>';
		    		
		    		document.body.appendChild(msgBox); 
		    		centerDiv('upload_failed');
		    		faceBtn.value='';
		    		
		    		function removeChild(){
		    			document.body.removeChild(msgBox); 
		    		}
		    		setInterval(removeChild,1500);
		    	}
	    	}
		}
	}
}
