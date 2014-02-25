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
var fans_Id;
var delete_fansId;
var delete_followId;
var pageNumber_fans;
var pageNumber_follow;
var pageSize_fans;
var fansType_name;
var user_Id;
var list_type;
var page_num;
function setFansId(id){
	fans_Id = id;
	addFansId("addFansId.action?fans.fansId="+fans_Id);
}
function addFansId(url){
	createXMLHttpRequest();	
	http_request.onreadystatechange=processFans;	
	http_request.open("GET",url,true);  
	http_request.send(null);
}
function processFans(){
	if(http_request.readyState==4){	
		if(http_request.status==200){ 
			var confirmCollection = document.getElementById("collect_"+fans_Id);
			var newP = document.createElement("p");
			newP.setAttribute("className","mutual");
			newP.innerHTML = '<img src="" title="互相关注中" class="small_icon sicon_atteo" />';			
			confirmCollection.parentNode.replaceChild(newP, confirmCollection);
		}
	}
}
//加他人粉丝或关注为自己关注
//fty


function setOthersFansId(id){
	fans_Id = id;
	addOthersFansId("/Weibo/Others/addOthersFansId.action?fans.fansId="+fans_Id);
}
function addOthersFansId(url){
	createXMLHttpRequest();	
	http_request.onreadystatechange=processOthersFans; 	
	http_request.open("GET",url,true);  
	http_request.send(null);
}
function processOthersFans(){
	if(http_request.readyState==4){	
		if(http_request.status==200){
			var confirmCollection = document.getElementById("collect_"+fans_Id);
			var newP = document.createElement("p");
			newP.setAttribute("className","mutual");
			newP.innerHTML = '<a class="concernBtn_Yet"><span class="add_yet"></span>已关注</a>';			
			confirmCollection.parentNode.replaceChild(newP, confirmCollection);
		}
	}
}
var listType_fanss;
function deletefansId(id,pageNumber,listType){
	delete_fansId = id;
	pageNumber_fans=pageNumber;
	listType_fanss=listType;
	showDialog('deletefansId');
}
function deleteFId(){
	var form;
	if( document.getElementById("delete_fans").style.display == "none" ){
		return false;
	}else{	
		var form = document.getElementById("delete_fans");
		form.action="deleteFansId.action?fans.fansId="+delete_fansId+"&pageNumber="+pageNumber_fans+"&listType="+listType_fanss;
		form.submit();
	}
}
function deletefollowId(id,pageNumber,listType){
	delete_followId = id;
	pageNumber_follow=pageNumber;
	list_type = listType;
	showDialog('deletefollowId');
}
function deleteFwId(){
	var form;
	if( document.getElementById("delete_follow").style.display == "none" ){
		return false;
	}else{	
		var form = document.getElementById("delete_follow");
		form.action="deleteFollowId.action?follow.followId="+delete_followId+"&pageNumber="+pageNumber_follow+"&listType="+list_type;
		form.submit();
	}
}
var listType_fans;
function saveAllfansId(pageNumber,pageSize,listType){
	pageNumber_fans=pageNumber;
	pageSize_fans=pageSize;
	listType_fans=listType;
	showDialog('saveAllfans');
}
function saveAF()
{
	var form;
	if( document.getElementById("save_fans").style.display == "none" ){
		return false;
	}else{	
		var form = document.getElementById("save_fans");
		form.action="SaveAllfansId.action?pageNumber="+pageNumber_fans+"&pageSize="+pageSize_fans+"&listType="+listType_fans;
		form.submit();
	}
}
function createFansType(userIds)
{
	user_Id=userIds;
	showDialog('follow_group');
}
function sendTypename(id,pageNumbers)
{   
	var typeName=document.getElementById(id).value;
	var form =document.getElementById("save_groupId");
	form.action ="SavegroupId.action?groupName="+encodeURI(encodeURI(typeName))+"&pageNumber="+pageNumbers;
	form.submit();
}
function onClickShowFollowList(listType,pageNumber)
{
	list_type = listType;
	page_num = pageNumber;
	showFollowList("showFollowList.action?pageNumber="+pageNumber+"&listType="+listType);
}
function showFollowList(url)
{
	createXMLHttpRequest();
	// 指定处理函数 事件解发器！！！
	
	http_request.onreadystatechange=processShowFollowList; 	
	http_request.open("GET",url,true);  
	http_request.send(null); 
}
function processShowFollowList()
{
	if(http_request.readyState==4)
	{ 		
		if(http_request.status==200)
		{	
			var follow = eval('('+http_request.responseText+')');
			var It ="";
			var followU =document.getElementById("folllowListId");
			switch(list_type)
			{
			    case 1:  It +='<li class="current" id="current_group"><a>全部</a></li>';
			             It +='<li class="MIB_line_l">|</li>';
			             It +='<li><a href="javascript:onClickShowFollowList(2,1);">相互关注</a></li>';
			             It +='<li class="MIB_line_l">|</li>';
			             It +='<li><a href="javascript:onClickShowFollowList(3,1);">未分组</a></li>';
			             It +='<li class="MIB_line_l">|</li>';
			             break;
			    case 2:  It +='<li><a href="javascript:onClickShowFollowList(1,1)">全部</a></li>';
	                     It +='<li class="MIB_line_l">|</li>';
	                     It +='<li class="current" id="current_group"><a>相互关注</a></li>';
	                     It +='<li class="MIB_line_l">|</li>';
	                     It +='<li><a href="javascript:onClickShowFollowList(3,1);">未分组</a></li>';
	                     It +='<li class="MIB_line_l">|</li>';
	                     break;
			    case 3:  It +='<li><a href="javascript:onClickShowFollowList(1,1)">全部</a></li>';
                         It +='<li class="MIB_line_l">|</li>';
                         It +='<li><a href="javascript:onClickShowFollowList(2,1);">相互关注</a></li>';
                         It +='<li class="MIB_line_l">|</li>';
                         It +='<li class="current" id="current_group"><a>未分组</a></li>';
                         It +='<li class="MIB_line_l">|</li>';
                         break;
			    default:  break;
			}
			    document.getElementById("groupIdList").innerHTML = It;
			    followList ="";
			    for(i=0;i<follow.length;i++){
			    	var follw = follow[i];
			    	followList +='<li class="MIB_linedot_l" onmouseover="mouseovershowDialog(\'follow_conBox_'+follw["fmId"]+'\')" onmouseout="mouseovercloseDialog(\'follow_conBox_'+follw["fmId"]+'\')" style="z-index:inherit;">';
			    	followList +='<div class="conBox_l"><a href="/Weibo/Others/othersProfile.action?otherId='+follw["followId"]+'"><img pop="true" title="'+follw["followName"]+'" namecard="true" uid="1781387491" imgtype="head" src="'+follw["fmyface"]+'" /></a>';
			    	followList +='</div>';
			    	followList +='<div class="conBox_c" style="z-index:inherit;"> <span class="name"> <a href="/Weibo/Others/othersProfile.action?otherId='+follw["followId"]+'" title="'+follw["followName"]+'">'+follw["followName"]+'</a> </span>';
				    if(follw["followsex"] != 2)
				     {
				    	followList +='<p class="address"><img src="" class="small_icon man" title="男" />'+follw["followCity"]+'<span>粉丝<strong>'+follw["followNumber"]+'</strong>人</span></p>';
				     }
				    else
				     {
				    	followList +='<p class="address"><img src="" class="small_icon sicon_female" title="女" />'+follw["followCity"]+'<span>粉丝<strong>'+follw["followNumber"]+'</strong>人</span></p>';
				     }
				    if(follw["followIdPro"] != 0)
				    {
				        followList +='<div class="content MIB_linkbl"><a href="/Weibo/MyBlog/profileContent.action?profId='+follw["followIdPro"]+'" class="ms">'+follw["followIdProfId"]+'</a></div>';
				    }
				    if(follw["followIdPro"] == 0)
				    {
				        followList +='<div class="content MIB_linkbl"><span class="gray6">'+follw["followIdProfId"]+'</span></div>';
				    }
				    followList +='<div class="roommate" style="z-index:inherit;">';
				    followList +='<a class="btn_privacy" href="#" title="" onclick="onClickShowDialog(\'follow_group_1\')" >';
				    followList +='<em>分组A<img class="small_icon down_arrow"></em>';           
				    followList +='</a>';
				    followList +='<div id="follow_group_1" class="cetdowme" style="position: absolute; z-index:1; display:none; ">';
				    followList +='<p class="hover"><input type="checkbox" class="labelbox" value="1"><label for="" title="分组A">分组A</label></p>';
				    followList +='<p><input type="checkbox" class="labelbox" value="1" id=""><label for="" title="分组B">分组B</label></p>';
				    followList +='<div class="MIB_linedot1"></div>';
				    followList +='<p><a href="javascript:void(0);">创建新分组 </a></p>';
				    followList +='<p class="opt" style="display: none; "><input type="text"></p>';
				    followList +='<span class="error_color" style="display: none; ">请不要超过8个汉字 </span>';
				    followList +='<p class="btn" style="display: none; ">';
				    followList +='<a href="javascript:void(0);" class="btn_normal btnxs"><em>保存</em></a>';
				    followList +='<a href="javascript:void(0);" class="btn_normal btnxs"><em>取消</em></a>';
				    followList +='</p>';
				    followList +='</div>';          
				    followList +='</div>';
				    followList +='</div>';
				    followList +='<div id="follow_conBox_'+follw["fmId"]+'" class="conBox_r" style="display:none;">';
				    followList +='<p><a href="javascript:deletefollowId(\''+follw["followId"]+'\',\''+page_num+'\',\''+list_type+'\')">取消关注</a></p>';
				    if(!follw["followack"])
				    	{
				    	   followList +='<p id="invite_"><a href="javascript:OnClickReply('+follw["followId"]+');">求关注</a></p>';
			            }
				    followList +='<input type="hidden" id="fmsgToName_'+follw["followId"]+'" value="'+follw["followName"]+'"/>';
				    followList +='</div>';
				    followList +='<div class="clearit"></div>';
				    followList +='</li>';
			    }
			    followU.innerHTML = followList;
			    var totalPosts = follw["totalPosts"];
//			    var fansNumber = follw["userFansNumber"];
//			   
//			    if( fansNumber== 0)
//			    {   
//			    	if(list_type == 2)
//			    	{
//			    	al +='<div class="PY_clew">';
//			    	al +='<div class="PY_clewcon">';
//			        al +='<div class="icon"><img align="absmiddle" title="" alt="" src="" class="PY_ib PY_ib_1"></div>';
//			    	al +='<div class="txt">咦，还没互相关注呢？赶紧和亲朋好友来互相关注啊~<a href="/">返回首页</a>。 ';
//			    	al +='</div>';
//			    	al +='<div class="clearit"></div>';
//			    	al +='</div>';
//			    	al +='</div>';
//			    	}
//			    }
//			    window.alert(fansNumber);
//			    if(totalPosts == 0)
//			    {   
//			    	if(list_type == 3 || list_type == 1)
//			    	{
//			    	al +='<div class="PY_clew">';
//			    	al +='<div class="PY_clewcon">';
//			        al +='<div class="icon"><img align="absmiddle" title="" alt="" src="" class="PY_ib PY_ib_1"></div>';
//			    	al +='<div class="txt">咦，还没关注呢？赶紧邀请亲朋好友来支持啊~<a href="/">返回首页</a>。 ';
//			    	al +='</div>';
//			    	al +='<div class="clearit"></div>';
//			    	al +='</div>';
//			    	al +='</div>';
//			    	}
//			    }
//			    document.getElementById("followWith").innerHTML = al;
				refreshFollowPage(totalPosts);
		}
	}
}
function refreshFollowPage(totalPosts){
	
	var pageText = "";
	var tmp = (totalPosts%5 > 0)? 1:0;
	var totalPage = Math.floor(totalPosts/5) + tmp;
	
	pageText +='<a onclick="onClickShowFollowList('+list_type+',1)" class="btn_num btn_numWidth"><em>首页</em></a>';
	
	if( page_num > 1){
		pageText +='&nbsp;<a onclick="onClickShowFollowList('+list_type+','+ (page_num-1) +')" class="btn_num btn_numWidth"><em>上一页</em></a>&nbsp;';
	}  

	for( var i = 5; i >= 1; i-- ){
		if(page_num-i>=1){
			pageText +='<a class="btn_num"  onclick="onClickShowFollowList('+list_type+','+(page_num-i)+')"><em>'+(page_num-i)+'</em></a>';
		}
	}
	pageText +='<span> '+page_num+' </span>';	
	for( var i = 1; i <= 5; i++ ){
		if(page_num+i<=totalPage){
			pageText +='<a class="btn_num"  onclick="onClickShowFollowList('+list_type+','+(page_num+i)+')"><em>'+(page_num+i)+'</em></a>';
		}
	}	
	pageText += '&nbsp;';
	
	if( page_num < totalPage ){
		pageText +='<a onclick="onClickShowFollowList('+list_type+','+(page_num+1)+')" class="btn_num btn_numWidth"><em>下一页</em></a>&nbsp;';		
	}   
	pageText +='<a onclick="onClickShowFollowList('+list_type+','+totalPage+')" class="btn_num btn_numWidth"><em>末页</em></a>';
	
	document.getElementById("page").innerHTML = pageText;		
	
}
var fList;
function showFansIdList(listType,pageNumber){
	list_type = listType;
	page_num = pageNumber;
	showFansLists("showFansLt.action?pageNumber="+pageNumber+"&listType="+listType);
}
function showFansLists(url){	
	
	createXMLHttpRequest();
	// 指定处理函数 事件解发器！！！
	
	http_request.onreadystatechange=processShowFansList;
	http_request.open("GET",url,true);	  
	http_request.send(null); 
}

function processShowFansList()
{
	if(http_request.readyState==4)
	{ 		
		if(http_request.status==200)
		{	
			var fans = eval('('+http_request.responseText+')');
			var It ="";
			var fansU =document.getElementById("fansListTypename");
			switch(list_type)
			{
			case 1:   It +='<li class="current"><a class="btn_chBlue"><em>关注时间</em></a></li>';
			          It +='<li><a href="javascript:showFansIdList(2,1)" class="btn_chBlue"><em>粉丝数</em></a></li>';
			          break;
			case 2:   It +='<li><a href="/Weibo/MyBlog/myFanspage.action?pageNumber=1&listType=1" class="btn_chBlue"><em>关注时间</em></a></li>';
			          It +='<li class="current"><a class="btn_chBlue"><em>粉丝数</em></a></li>';
			      	  break;
			default: break;
			}
			document.getElementById("fansLs").innerHTML = It;
			 fList ="";
			for(var i=0;i<fans.length;i++){
				var fan = fans[i];
				fList +='<li class="MIB_linedot_l" onmouseover="mouseovershowDialog(\'delete_'+fan["fmId"]+'\')" onmouseout="mouseovercloseDialog(\'delete_'+fan["fmId"]+'\')" id="2133029165">';
				fList +='<div class="conBox_l">';
				fList +='<a href="/Weibo/Others/othersProfile.action?otherId='+fan["fansId"]+'"><img src="'+fan["myface"]+'" pop="true" title="'+fan["fansName"]+'" namecard="true" uid="2133029165" imgtype="head" src=""></img></a>';
				fList +='</div>';
				fList +='<div class="conBox_c">'; 
				fList +='<span class="name">';
				fList +='<a href="/Weibo/Others/othersProfile.action?otherId='+fan["fansId"]+'" uid="2133029165" namecard="true" title="">'+fan["fansName"]+'</a>';
				fList +='</span>';
				if(fan["seximage"] != 2)
				{
			        fList +='<p class="address">';
			        fList +='<img src="" class="small_icon man" title="男" />'+fan["fansCity"]+',<span>粉丝<strong>'+fan["fansNumber"]+'</strong>人</span>';
			        fList +='</p>';
				}
				else
				{
			        fList +='<p class="address">';
			        fList +='<img src="" class="small_icon sicon_female" title="女" />'+fan["fansCity"]+',<span>粉丝<strong>'+fan["fansNumber"]+'</strong>人</span>';
			        fList +='</p>';
				}
			    fList +='<div class="content MIB_linkbl">';
			    if(fan["fansIdPro"] != 0)
			    {
			        fList +='<a href="/Weibo/MyBlog/profileContent.action?profId='+fan["fansIdPro"]+'" class="ms"> '+fan["fansIdProfId"]+'</a>'; 
			    }
			    if(fan["fansIdPro"] == 0)
			    {
			        fList +='<span class="gray6">'+fan["fansIdProfId"]+'</span> '; 
			    }
			    fList +='</div>';
			    fList +='</div>';
			    fList +='<div id="delete_'+fan["fmId"]+'" class="conBox_r " style="display:none;">';
			    if(fan["ack"])
			    {
			        fList +='<p class="mutual"><img src="" title="互相关注中" class="small_icon sicon_atteo" /></p>';
			    }
			    else
			    {	
			        fList +='<p  id="collect_'+fan["fansId"]+'">';
			        fList +='<a onclick="setFansId('+fan["fansId"]+');"  class="addFollow">';
			        fList +='<span class="addnew">+</span>加关注</a>';
			        fList +='</p>';
			    }
			    fList +='<p  id="cancel_2133029165">';
			    fList +='<a href="javascript:deletefansId(\''+fan["fansId"]+'\',\''+(page_num)+'\',\''+list_type+'\')" >移除粉丝</a>';
			    fList +='</p>';
			    fList +='<p  id="message_2133029165">';
			    fList +='<input type="hidden" id="fmsgToName_'+fan["fansId"]+'" value="'+fan["fansName"]+'"/>';
			    fList +='<a href="javascript:OnClickReply('+fan["fansId"]+');" >发私信</a>';
			    fList +='</p>';											
			    fList +='</div>';
			    fList +='<div class="clearit"></div>';
			    fList +='</li>';
			}
			
			fansU.innerHTML = fList;
			var ac="";
			ac +='<a class="btn_green" href="javascript:saveAllfansId(\''+(page_num)+'\',\''+fan["pageSize"]+'\',\''+list_type+'\')" id="attbtn"><em>关注本页所有人</em></a>';
			document.getElementById("saveAll").innerHTML = ac;
			var totalPosts = fan["totalPosts"];
			refreshPage(totalPosts);
		}
	}
}
function refreshPage(totalPosts){
	
	var pageText = "";
	var tmp = (totalPosts%5 > 0)? 1:0;
	var totalPage = Math.floor(totalPosts/5) + tmp;
	
	pageText +='<a onclick="showFansIdList('+list_type+',1)" class="btn_num btn_numWidth"><em>首页</em></a>';
	
	if( page_num > 1){
		pageText +='&nbsp;<a onclick="showFansIdList('+list_type+','+ (page_num-1) +')" class="btn_num btn_numWidth"><em>上一页</em></a>&nbsp;';
	}  

	for( var i = 5; i >= 1; i-- ){
		if(page_num-i>=1){
			pageText +='<a class="btn_num"  onclick="showFansIdList('+list_type+','+(page_num-i)+')"><em>'+(page_num-i)+'</em></a>';
		}
	}
	pageText +='<span> '+page_num+' </span>';	
	for( var i = 1; i <= 5; i++ ){
		if(page_num+i<=totalPage){
			pageText +='<a class="btn_num"  onclick="showFansIdList('+list_type+','+(page_num+i)+')"><em>'+(page_num+i)+'</em></a>';
		}
	}	
	pageText += '&nbsp;';
	
	if( page_num < totalPage ){
		pageText +='<a onclick="showFansIdList('+list_type+','+(page_num+1)+')" class="btn_num btn_numWidth"><em>下一页</em></a>&nbsp;';		
	}   
	pageText +='<a onclick="showFansIdList('+list_type+','+totalPage+')" class="btn_num btn_numWidth"><em>末页</em></a>';
	
	document.getElementById("page").innerHTML = pageText;		
	
}