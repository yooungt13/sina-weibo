<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		
		<title>我的私信</title>

		<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>		
		<link href="/Weibo/css/privatemsg.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/sendMsg.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/faces.css" type="text/css" rel="stylesheet" />
		
		<script type="text/javascript" src="/Weibo/js/msg_manage.js"></script>
		<script type="text/javascript" src="/Weibo/js/index.js"></script>
	    <script type="text/javascript" src="/Weibo/js/editor_manage.js"></script> 
	                    
	</head>
 <body onload="refreshCount();">
   <div class="MIB_bloga">
   <div class="MIB_blogb">
    <div class="tsina_gnbarea" id="WB_box_1318070134145">
        	<div class="bg_gnbarea">&nbsp;</div>
            <div id="" class="tsina_gnb">
  				<ul class="gnb_r">
                	<li><a href="myProfPage.action?pageNumber=1" id="">${sessionScope.user.nickName }</a> </li>
                    <li><a href="/Weibo/frommsgList.action?pageNumber=1">私信</a> </li>
                    <li><a href="/Weibo/systemList.action?pageNumber=1">通知</a> </li>
                    <li><a href="/Weibo/Setting/Setting.action">帐号设置</a> </li>
                    <li class="line">|</li>
					<li><a id="" href="/Weibo/exitLogin.action">退出</a> </li>
                </ul>
            </div>
        </div> 
        <!-- 小黄签 -->
		<div class="small_Yellow_div">
			<div class="small_Yellow" id="small_Yellow" style="display:none;">
				<table class="CP_w" >
					<thead>
						<tr>
							<th class="tLeft"><span></span></th>
							<th class="tMid"><span></span></th>
							<th class="tRight"><span></span></th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td class="tLeft"><span></span></td>
							<td class="tMid"><span></span>
							</td>
							<td class="tRight"><span></span></td>
						</tr>
					</tfoot>
					<tbody>
						<tr>
							<td class="tLeft"><span></span></td>
							<td class="tMid">
								<!-- 任何内容 开始 -->
								<div class="yInfo gray6" id="notice_yellow_tips"></div>
								<div class="close">
									<a href="javascript:onClickShowDialog('small_Yellow');"></a>
								</div>
								<!-- 任何内容 结束 -->
							</td>
							<td class="tRight"><span></span></td>
						</tr>
					</tbody>
				</table>
				<div class="arrow"></div>
			</div>
		</div> 			
		<!-- /小黄签 -->	 
    <div class="header">
     <div class="head_menu app"> 
     <div class="search" id="m_search"> 
							<input type="text" id="m_keyword" autocomplete="off" dycolor="false" title="搜索微博、找人" accesskey="3">
							<a class="submit" href="javascript:search('m_keyword',1);" id="m_submit">搜索</a>
				     	</div>
     </div> 
	 <div id="m_keyword_tip" class="resultTip" style="display:none">
	 </div> 
    </div>
    <div class="MIB_blogbody">
     <div class="MIB_mblogbgr">
     <div class="MIB_mblogbgl">
	 <!--右栏内容 -->
	 <div class="mainR MIB_200 MIB_txtar MIB_linkar">
	 				<!--个人信息-->
					<div class="userinfo">
						<div class="user_head">
							<div class="picborder_r lf" id="pop_1"><a href=""><img class="person_icon" src="${sessionScope.user.myFace}"" pop="true" alt="" /></a></div>
							<div class="lf">
								<p class="font_14"><a href="myProfPage.action?pageNumber=1" namecard="true" title="${sessionScope.user.nickName }">${sessionScope.user.nickName }</a></p>
								<p>${sessionScope.user.province},&nbsp;${sessionScope.user.city}</p>
								</div>
						</div>
						<div class="user_atten MIB_linedot">
							<ul id="profile_following_follower_update">
								<li id="pop_2" class="MIB_line_r">
									<div class="num" pop="true"><a href="/Weibo/MyBlog/myFollowpage.action?pageNumber=1&listType=1" id="mblog">${sessionScope.user.followCount}</a></div>
									<a href="/Weibo/MyBlog/myFollowpage.action?pageNumber=1&listType=1">关注</a>
								</li>
								<li class="MIB_line_r">
									<div class="num"><a href="/Weibo/MyBlog/myFanspage.action?pageNumber=1&listType=1" id="myfans">${sessionScope.user.fansCount}</a></div>
									<a href="/Weibo/MyBlog/myFanspage.action?pageNumber=1&listType=1">粉丝</a>
								</li>
								<li class="">
									<div class="num"><a href="myProfPage.action?pageNumber=1" id="mblog">${sessionScope.user.profileCount}</a></div>
									<a href="myProfPage.action?pageNumber=1">微博</a>
								</li>
							</ul>
						</div>
					</div>
	 </div>
	 <!--/右栏内容 -->
     <!--左栏内容 -->
	 <div class="mainL MIB_600 MIB_txtal MIB_linkal ssdh_wrap">
	  <div class="msg_lf clearFix titmg10">
	   <div class="titmg10"> <span class="font_14 fb">我的私信</span>&nbsp; <span class="gray6"></span>
	   </div>
	   <div class="lf"> <a class="newbbtngrn" id="send_Msg"  href="javascript:void(0);" onclick="OnClickSendMsg();"><em>发私信</em></a>
	   </div>
       <div class="rt">
        <div class="chdd">
		<form action="/message/search_msg.php">
		<form action="search_msg.php">
		<label><input id="searchkeyword" name="searchkeyword" type="text" style="color: rgb(153, 153, 153);" class="txt_s2" value="查找联系人 / 搜索私信内容" def="查找联系人 / 搜索私信内容">
		<a id="search_btn" href="javascript:previousBox();" class="btn_normal btnxs"><em>搜索</em></a>
		</label>
	    </form>
	    </div>
       </div>
	  </div>
     
	 <div id="atme_filter" class="atme_filter1">									
		<div act="panel" class="atmef_con1 clearFix">
				<ul class="lf">
				<li class="cur">
					<b>已收到的私信</b>
					 </li>
					<li><a href="msgList.action?pageNumber=1"> 已发出的私信</a></li>
					
				</ul>
			<div id="feed_sort" class="timeHot_feed">共${pageBean.totalPosts }条</div>
		</div>										
	</div>
	 
      <ul class="MIB_feed" id="msg_list" popcontainer="true">   
      <c:if test="${pageBean.totalPosts == 0}">
							<div style="color: #B8B7B7;padding: 10px 30px;">
								<p>亲，给你的好友发送一条私信吧</p>
						
							</div>							
						</c:if> 
     <!-- 直接加 -->
	   <c:forEach items="${frommsgList}" var="fmsg">
		<li id="${fmsg.msgId }" class="MIB_linedot_l" onmouseover="mouseovershowDialog('messages_cancle1_${fmsg.msgId}')" onmouseout="mouseovercloseDialog('messages_cancle1_${fmsg.msgId}')" style="z-index:inherit;">
		 <div class="user_pic user_Stat">
		 <div class="head_pic">
		 <a namecard="true" uid="${fmsg.msgFrom}" href="" >
		 <img title="${fmsg.msgFromName}" uid="${fmsg.msgFrom}" imgtype="head" src="${fmsg.msgFromFace}" width="50" height="50"/></a>
		  </div>
		 </div>
         <div class="MIB_feed_c">
		  <div class="rt icon_closel" title="删除" id="messages_cancle1_${fmsg.msgId}" style="display:none;"><a href="javascript:void(0);" onclick="fOnClickremove(${fmsg.msgId })" >x</a>
		  </div>
          <p class="letter">
		  <a namecard="true" id="fmsg_${fmsg.msgId}" href="/Weibo/Others/othersProfile.action?otherId=${fmsg.msgFrom}" title="${fmsg.msgFrom} ">@${fmsg.msgFromName}</a>&nbsp;给我发的私信：&nbsp;&nbsp; ${fmsg.msgContent}  
		  </p>
          <div class="feed_att MIB_linkbl">
		   <div class="lf">
            <span class="gray9">${fmsg.sendTime }
            </span>
            <em class ="reportBtn">
            </em>
           </div>
           <div class="rt">
           	<input type="hidden" id="fmsgToName_${fmsg.msgId }" value="${fmsg.msgFromName}"/>
           	<a href="javascript:void(0);"  onclick="OnClickReply(${fmsg.msgId });">回复</a>
           </div>
          </div>
         </div>
        </li>
	   </c:forEach>
	   <!--翻页-->
									<div class="MIB_bobar">
										<c:if test="${pageBean.totalPosts != 0}">
										<div class="fanye MIB_txtbl" style="float:right;" id="page">
										    <a href="frommsgList.action?pageNumber=1" class="btn_num btn_numWidth"><em>首页</em></a>
										    <c:if test="${pageNumber>1}">  
										        <a href="frommsgList.action?pageNumber=${pageNumber-1}" class="btn_num btn_numWidth"><em>上一页</em></a>
										    </c:if>     
										    <c:forEach begin="1" end="5" step="1" var="pageIndex">  
				 								<c:if test="${pageNumber-(6-pageIndex) >=1}">  
										            <a class="btn_num"  href="frommsgList.action?pageNumber=${pageNumber+pageIndex-6}"><em>${pageNumber+pageIndex-6}</em></a>
										        </c:if>  
											</c:forEach>
											<span>${pageNumber}</span>
											<c:forEach begin="1" end="5" step="1" var="pageIndex">  
				 								<c:if test="${pageNumber+pageIndex <= pageBean.totalPages}">  
										            <a class="btn_num"  href="frommsgList.action?pageNumber=${pageNumber+pageIndex}"><em>${pageNumber+pageIndex}</em></a>
										        </c:if>  
											</c:forEach>  
										    <c:if test="${pageNumber < pageBean.totalPages}">  
										        <a href="frommsgList.action?pageNumber=${pageNumber+1}" class="btn_num btn_numWidth"><em>下一页</em></a>
										    </c:if>    
										    <a href="frommsgList.action?pageNumber=${pageBean.totalPages}" class="btn_num btn_numWidth"><em>末页</em></a>
										</div>
										</c:if>
									</div>
									<!--翻页-->
      </ul>
      
	 </div>
     </div>
     </div>
     <!--/正文-->
     <!--尾-->
     <!--/尾--> 
    </div>
   </div>

</div>
                                               
  </div>
  
 		<!-- /网站信息 -->
		<div class="bottomLinks " id="bottomborder"">
			<div class="bottombg"></div>
		    <div class="MIB_foot_new MIB_txtbr MIB_linkbr" style="text-align:center;">
				<p></p>		
		        <p>特别声明：本网站仅用于学习参考，严禁一切商业行为。如有违反，后果自负。</p>              
		        <p>Copyright © 2011-2013  <a href="http://weibo.com/yooungt">有田十三</a>  All Rights Reserved.</p>		
				<div class="clearit"></div>
				<p></p>
			</div>
		</div>
 </body>
</html>
