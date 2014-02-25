var com_id;
var list_type = 1;
var page_num = 1;

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
function onClickShowCommentsList(listType,pageNumber){	
	list_type = listType;
	page_num = pageNumber;
	showCommentsList("showCommentsList.action?pageNumber="+pageNumber+"&listType="+listType);  
}

function showCommentsList(url){	
	
	createXMLHttpRequest();
	// 指定处理函数 事件解发器！！！
	
	http_request.onreadystatechange=processShowList; 	
	http_request.open("GET",url,true);  
	http_request.send(null); 
}
 

// 处理返回信息的函数
function processShowList(){	
	if(http_request.readyState==4){ 
		if(http_request.status==200){		
			var coms = eval('('+http_request.responseText+')');
			
			var rs = "";
			var lt = "";	
			var comUL = document.getElementById("comlist");
			
			switch(list_type){
			case 1:
				lt +='<span class="fb">全部</span>';
				lt +='<span class="MIB_line_l">|</span>';
				lt +='<a href="javascript:onClickShowCommentsList(2,1);">我关注的</a>';
				lt +='<span class="MIB_line_l">|</span>';
				lt +='<a href="javascript:onClickShowCommentsList(3,1);">陌生人</a>';
				break;
			case 2:
				lt +='<a href="commentsList.action?pageNumber=1&listType=1">全部</a>';
				lt +='<span class="MIB_line_l">|</span>';
				lt +='<span class="fb">我关注的</span>';
				lt +='<span class="MIB_line_l">|</span>';
				lt +='<a href="javascript:onClickShowCommentsList(3,1);">陌生人</a>';
				break;
			case 3:
				lt +='<a href="commentsList.action?pageNumber=1&listType=1">全部</a>';
				lt +='<span class="MIB_line_l">|</span>';
				lt +='<a href="javascript:onClickShowCommentsList(2,1);">我关注的</a>';
				lt +='<span class="MIB_line_l">|</span>';
				lt +='<span class="fb">陌生人</span>';
				break;
			case 4:
				rs +='<span><a href="commentsList.action?pageNumber=1&listType=1">收到的评论</a></span>';
				rs +='<span class="MIB_line_l2 ">|</span>';
				rs +='<span class="fb">发出的评论</span>';
				lt = "";
				document.getElementById("recvOrSend").innerHTML = rs;
				break;
			default: break;
			}
					
			document.getElementById("listType").innerHTML = lt;	
			
			if( coms.length == 0 ){	
				document.getElementById("noCom").innerHTML = '<br>还没有评论。</br>';
				document.getElementById("page").innerHTML = '';	
				document.getElementById("comheader").style.display="none";	
				document.getElementById("combottom").style.display="none";	
				comUL.innerHTML = "";							
			}else{
				
				document.getElementById("noCom").innerHTML = '';
				var headlist = '';
				headlist +=	'<div class="MIB_comheader">';
				headlist +=	'<input type="checkbox" class="selectall" id="selectallbottom" name="selectAll" onclick="selectAllComment();"/>';
				headlist +=	'<a onclick="selectAllComment();" href="javascript:void(0);">全选</a>';
				headlist +=	'<span class="MIB_line_l">|</span><a onclick="deleteSelected();" href="javascript:void(0);">删除</a>';
				headlist +=	'</div>';
				
				document.getElementById("comheader").innerHTML = headlist;	
				document.getElementById("combottom").innerHTML = headlist;	
				
				comlist = "";
				for( var i = 0; i < coms.length; i++){
					var com = coms[i];
					comlist +='<li class="commentsCell MIB_linedot_l" id="comMsg_'+com["comId"]+'" onmouseover="mouseovershowDialog(\'deleteCom_'+com["comId"]+'\')" onmouseout="mouseovercloseDialog(\'deleteCom_'+com["comId"]+'\')">';
					comlist +='<div class="selector">';
					comlist +='<input type="checkbox" class="ckb" name="selectedList" onclick="selectOne()" value="'+com["comId"]+'"/>';				
					comlist +='</div>';
					comlist +='<div class="commentsTxt">';
					comlist +='<a href="/Weibo/Others/othersProfile.action?otherId='+com["comFromId"]+'"><img class="picborder_l" style="width:50px; height:50px;" title="'+com["comFrom"]+'" src="'+com["comFace"]+'"/></a>';
					comlist +='<div class="icon_closel rt" id="deleteCom_'+com["comId"]+'" title="删除" onclick="setDeleteComId(this);" title="删除" class="icon_closel" style="display:none;">x</div>';
					comlist +='<div class="commentsContants">';
					comlist +='<p class="commentsParm MIB_txtal">';
					if( list_type != 4 ){
						comlist +='<a href="/Weibo/Others/othersProfile.action?otherId='+com["comFromId"]+'" namecard="true" title="'+com["comFrom"]+'">'+com["comFrom"]+'</a> ';
					}
					comlist +=com["comContent"]+' ('+com["pubTime"]+')';
					comlist +='</p>';
					comlist +='<div class="commentOption">';
					comlist +='<cite class="rt">';	
					comlist +='<span class="MIB_line_l" style="visibility:hidden">|</span>';
					comlist +='<a href="javascript:void(0);"  onclick="onClickShowDialog(\'comment_'+com["comId"]+'\');onClickReply(\''+com["comId"]+'\')"><img title="" src="" class="small_icon recall"/>回复</a>';
					comlist +='</cite>';
					if( list_type == 4 ){
						comlist +='<span class="from">'; 
						if ( com["comComId"] != 0 ){			
							if( com["comComContent"] == "error"  ){
								comlist +='<span><font color="#F00">该评论已被删除！</font></span>';
							}else{
								comlist +='<label class="MIB_txtbl">回复<a href="/Weibo/Others/othersProfile.action?otherId='+com["comComFromId"]+'">'+ com["comFrom"] +'</a>的评论：</label>“ <a href="/Weibo/MyBlog/profileContent.action?profId='+com["comComProfileId"]+'">'+com["comComContent"]+'</a>”';
							}
							comlist +='</span>';
						}else{							 
							if( com["comProfContent"] == "error"  ){
								comlist +='<span><font color="#F00">该微博已被删除！</font></span>';
							}else{
								comlist +='<label class="MIB_txtbl">回复<a href="/Weibo/Others/othersProfile.action?otherId='+com["comProfileFromId"]+'">'+ com["comFrom"] +'</a>的微博：</label>“ <a href="/Weibo/MyBlog/profileContent.action?profId='+com["comProfileId"]+'">'+com["comProfContent"]+'</a>”';
							}
							comlist +='</span>';
						}
					}else{
						if ( com["comComId"] != 0 ){			
							comlist +='<span class="from"><label class="MIB_txtbl">回复我的评论：&nbsp;</label>';
							if( com["comComContent"] == "error" ){
								comlist +='<span>该评论已被删除！</span>';
							}else{
								comlist +='“<a href="/Weibo/MyBlog/profileContent.action?profId='+com["comComProfileId"]+'">'+com["comComContent"]+'</a>”';
							}
							comlist +='</span>';
						}else{
							comlist +='<span class="from"><label class="MIB_txtbl">回复我的微博：&nbsp;</label>';
							if( com["comComContent"] == "error"  ){
								comlist +='<span>该微博已被删除！</span>';
							}else{
								comlist +='“<a href="/Weibo/MyBlog/profileContent.action?profId='+com["comProfileId"]+'">'+com["comProfContent"]+'</a>”';
							}
							comlist +='</span>';
						}
					}
					comlist +='</div>';
					comlist +='<!-- 评论回复框开始 -->';
					comlist +='<div class="clearit"></div>';
					comlist +='<div class="logininput">';                                     
					comlist +='<div class="MIB_assign" id="comment_'+com["comId"]+'" style="display:none" >';
					comlist +='<div class="MIB_asarrow_r"></div>';
					comlist +='<div class="MIB_assign_t"></div>';
					comlist +='<div class="MIB_assign_c">';
					comlist +='<form action="makeComment.action" method="post" id="input_'+com["comId"]+'">';
					comlist +='<div class="logininput">';
					comlist +='<a title="表情" href="javascript:void(0);" class="faceicon1" onclick=""></a>';
					comlist +='<input type="hidden" name="profId" value="'+com["profId"]+'"/>';
					comlist +='<input type="hidden" name="com.comComId" id="comCom_'+com["comId"]+'"/>';
					comlist +='<textarea id="inputCom_'+com["comId"]+'" name="comContent" style="overflow-y: hidden; font-family: Tahoma, 宋体; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; word-wrap: break-word; line-height: 18px; overflow-x: hidden; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; font-size: 12px; height: 22px; " class="lf"></textarea>';
					comlist +='<a class="btn_normal" onclick="onClickSubmitComment(\'input_'+com["comId"]+'\');closeDialog(\'comment_'+com["comId"]+'\');divDisappear(\'comment_confirm\')"><em>评论</em></a>';
					comlist +='<div class="margin_b MIB_txtbl ml35">';
					comlist +='<p></p>';														
					comlist +='</div>';
					comlist +='</div>';
					comlist +='</form>';
					comlist +='</div>';
					comlist +='<div class="MIB_assign_b"></div>';
					comlist +='</div>';                                              
					comlist +='</div>';
					comlist +='<!-- 评论回复框结束 -->';
					comlist +='</div>';
					comlist +='</div>';
					comlist +='<div class="clearit"></div>';
					comlist +='</li>';			
				}
				
				
				comUL.innerHTML = comlist;	
				
				var totalPosts = com["totalPosts"];	
				refreshPage(totalPosts);												
				document.getElementById("totalPosts").innerHTML = '共<span>' + totalPosts + '</span>条';
			}
		}
	}
}

// 刷新翻页DIV
function refreshPage(totalPosts){
	
	var pageText = "";
	var tmp = (totalPosts%5 > 0)? 1:0;
	var totalPage = Math.floor(totalPosts/5) + tmp;
	
	pageText +='<a onclick="onClickShowCommentsList('+list_type+',1)" class="btn_num btn_numWidth"><em>首页</em></a>';
	
	if( page_num > 1){
		pageText +='&nbsp;<a onclick="onClickShowCommentsList('+list_type+','+ (page_num-1) +')" class="btn_num btn_numWidth"><em>上一页</em></a>&nbsp;';
	}  

	for( var i = 5; i >= 1; i-- ){
		if(page_num-i>=1){
			pageText +='<a class="btn_num"  onclick="onClickShowCommentsList('+list_type+','+(page_num-i)+')"><em>'+(page_num-i)+'</em></a>';
		}
	}
	pageText +='<span> '+page_num+' </span>';	
	for( var i = 1; i <= 5; i++ ){
		if(page_num+i<=totalPage){
			pageText +='<a class="btn_num"  onclick="onClickShowCommentsList('+list_type+','+(page_num+i)+')"><em>'+(page_num+i)+'</em></a>';
		}
	}	
	pageText += '&nbsp;';
	
	if( page_num < totalPage ){
		pageText +='<a onclick="onClickShowCommentsList('+list_type+','+(page_num+1)+')" class="btn_num btn_numWidth"><em>下一页</em></a>&nbsp;'		
	}   
	pageText +='<a onclick="onClickShowCommentsList('+list_type+','+totalPage+')" class="btn_num btn_numWidth"><em>末页</em></a>';
	
	document.getElementById("page").innerHTML = pageText;		
	
}


// 显示回复人
function onClickReply(id){
	com_id = id;
	replyCom("replyComment.action?com.comComId="+com_id);
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
			document.getElementById("inputCom_" + com_id).innerHTML = "回复@" + com["comTo"] + ":&nbsp;";				
			document.getElementById("comCom_" + com_id).innerHTML = com_id;	
		}
	}	
}

// 提交评论内容
function onClickSubmitComment(id){
	
	var form = document.getElementById(id);	
	var comContent = form.comContent.value;	
	var prof_id = form.profId.value;
	var comid = (com_id == null)? 0 : com_id;
		
	makeComment("makeComment.action?com.profile.profId="+prof_id+"&com.comContent="+encodeURI(encodeURI(comContent))+"&com.comComId="+comid);		
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
			showCommentsList("showCommentsList.action?pageNumber="+page_num+"&listType="+list_type);  
		}
	}	
}

// 删除评论
// 传递id至提示框
var delete_comid; 
function setDeleteComId(obj)
{
	showDialog('comment_delete');
	delete_comid = obj.id.replace("deleteCom_","");
}

function toConfirmDeleteCom(){	
	if( document.getElementById("comment_delete").style.display == "none" ){
		return false;
	}else{			
		deleteComment("deleteComment.action?com.comId=" + delete_comid);
 		closeDialog('comment_delete');
	}
}

function deleteComment(url){	
	createXMLHttpRequest();	
	http_request.onreadystatechange=processRefreshCom; 	
	http_request.open("GET",url,true);  
	http_request.send(null); 
}

// 全选删除
var boolean = 0;
function selectAllComment(){	
	var obj = document.getElementsByName('selectedList'); 
	var obj2 = document.getElementsByName('selectAll');
	
	for( var i = 0; i < obj.length; i++){ 
	    if( obj[i].checked == false ){
	    	boolean = 0;
	    	break;
	    } 
	}
	
	if( boolean == 0 ){				
		for( var i = 0; i < obj.length; i++){ 
		    obj[i].checked = true; 
		} 
	
		for( var i = 0; i < obj2.length; i++){ 
		    obj2[i].checked = true; 
		} 
		boolean = 1;
	}else{
		for( var i = 0; i < obj.length; i++){ 
		    obj[i].checked = false; 
		} 
	
		for( var i = 0; i < obj2.length; i++){ 
		    obj2[i].checked = false; 
		} 
		boolean = 0;
	}
}

function selectOne(){
	var obj2 = document.getElementsByName('selectAll');
	for( var i = 0; i < obj2.length; i++){ 
	    obj2[i].checked = false; 
	} 
}

function deleteSelected(){
	
	var selectedList = new Array();
	var obj = document.getElementsByName('selectedList'); 

	for( var i = 0; i < obj.length; i++){ 
	    if( obj[i].checked == true ){
	    	selectedList.push(obj[i].value);	    	
	    } 
	}
	
	createXMLHttpRequest();
	http_request.onreadystatechange=processRefreshCom; 	
	http_request.open("GET","deleteSelected.action?selectedList="+selectedList,true);
	http_request.send(null);;
}

function createMsgBox(){
	var msgBox = document.createElement("div");
	msgBox.setAttribute("id","profile_favs");
	var styleData = "position: fixed; clear: both; z-index: 1000; left: 634px; top: 380px; width: 100px; height: 77px;visibility: visible;";

	msgBox.style.cssText = styleData;
	msgBox.innerHTML = "";
	msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:100px;"><div class="txt1 gray6"><img class="tipicon tip3" src="/Weibo/css/img/PY_ib.gif"><div>保存成功</div>';
	
	document.body.appendChild(msgBox); 
	centerDiv('profile_favs');
	
	function removeChild(){
		document.body.removeChild(msgBox); 
	}
	setInterval(removeChild,1500);
}