<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>发布通知</title>

<link href="/Weibo/css/privatemsg.css" type="text/css" rel="stylesheet" />
<link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
<link href="/Weibo/css/faces.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="/Weibo/js/index.js"></script>
<script type="text/javascript" src="/Weibo/js/msg_manage.js"></script> 
<script type="text/javascript" src="/Weibo/js/editor_manage.js"></script>
<script type="text/javascript" src="/Weibo/js/system_manage.js"></script>
</head>

<body>



<div class="MIB_bloga">

<!--顶托盘-->

  <div class="MIB_blogb">

		<!--/顶托盘-->
    <div class="tsina_gnbarea" id="WB_box_1318070134145">
        <div class="bg_gnbarea">&nbsp;</div>
        <div id="WB_weiboTop_1318070134145" class="tsina_gnb">
            <ul class="gnb_r">
              <li><a href="/Weibo/Admin/initManage.action">管理员</a> </li>
			  <li><a href="/Weibo/Admin/noticeList.action?pageNumber=1">通知</a> </li>
			  <li><a href="/Weibo/exitLogin.action">退出</a> </li>
            </ul>
        </div>
    </div>
<div class="header">
  <div class="head_menu app"> 
		<div class="search" id="m_search"> 
					<input type="text" id="m_keyword" autocomplete="off" title="搜索微博、找人" accesskey="3"/>
					<a class="submit" href="javascript:weiboSearch('m_keyword',1);" id="m_submit">搜索</a>
				</div> 
	</div> 
	<div id="m_keyword_tip" class="resultTip" style="display:none"></div> 
</div>

  <!--正文-->

    <div class="MIB_blogbody">



	 <div class="MIB_mblogbgr">

	 <div class="MIB_mblogbgl">

	 

	<!--右栏内容 -->

	    <div class="mainR MIB_200 MIB_txtar MIB_linkar">

	    		<!--个人信息--> 
		<div class="userinfo"> 
						            			<div class="user_head"> 
			<div class="picborder_r lf" id="pop_1"><a href=""><img class="person_icon" src="/Weibo/Images/Faces/manager.jpg" pop="true" alt="" width="50" height="50"/></a></div> 
			<div class="lf"> 
			<p class="font_14"><a href="/Weibo/Admin/initManage.action" uid="" namecard="true" title="管理员">管理员</a>			</p> 
						<p><em>湖南</em><em>长沙</em></p></div> 
			</div>
		</div> 
        
        <div class="cetUsLtTit">
            <h3><a href="/Weibo/Admin/initManage.action">管理微博</a><em></em></h3>
            <div class="linedot"></div>
          </div>
        <div class="cetUsLtTit">
            <h3><a href="/Weibo/Admin/noticeList.action?pageNumber=1">发布通知</a><em></em></h3>
            <div class="linedot"></div>
        </div>
		<!--企业白名单入口--> 
				<!-- 企业白名单入口 -->
	    </div>

	 <!--/右栏内容 -->

    <!--左栏内容 -->

	<div class="mainL MIB_600 MIB_txtal MIB_linkal ssdh_wrap">

		<div class="msg_lf clearFix titmg10">

			<div class="titmg10"> <span class="font_14 fb">发布通知</span> </div>

			<div class="lf"> <a class="newbbtngrn" id="msg_publisher_submit" onclick="showDialog('msg_box')" ><em>发通知</em></a></div>

			<div class="rt">



</div>

		</div>

				<!--防骗提示-->
		  <!--/防骗提示-->

          <ul class="MIB_feed" id="nmsg_list" popcontainer="true">

    <!-- 直接加 -->

							
				 <c:forEach items="${noticeList}" var="tmsg">
				<li id="${tmsg.msgId }"class="MIB_linedot_l" onmouseover="mouseovershowDialog('notice_cancle1')_${nmsg.msgId }" onmouseout="mouseovercloseDialog('notice_cancle1')_${nmsg.msgId }" style="z-index:inherit;">

								<div class="user_pic user_Stat">

										<div class="head_pic">

										<img namecard="true" src="/Weibo/Images/Faces/manager.jpg" width="50" height="50" title="用户A" class="picborder_l"/>
										</a></a></div>

					</div>

					<div class="MIB_feed_c">

					<div class="rt icon_closel" id="notice_cancle1" title="删除" style=" display:none"><a href="javascript:void(0);"  onclick="" class="close" >x</a></div>

						<p class="letter">
						发送给<a namecard="true">@${tmsg.msgToName}</a>&nbsp;的通知&nbsp;&nbsp;&nbsp;&nbsp; ${tmsg.msgContent} 
						</p>
						<div class="feed_att MIB_linkbl">
							<div class="lf">
								<span class="gray9">${tmsg.sendTime }</span>
								<em class ="reportBtn">
																	
								</em>
						    </div>
					    </div>
					</div>
				</li>
				</c:forEach>
				<!--翻页-->
									<div class="MIB_bobar">
										<c:if test="${pageBean.totalPosts != 0}">
										<div class="fanye MIB_txtbl" style="float:right;" id="page">
										    <a href="noticeList.action?pageNumber=1" class="btn_num btn_numWidth"><em>首页</em></a>
										    <c:if test="${pageNumber>1}">  
										        <a href="noticeList.action?pageNumber=${pageNumber-1}" class="btn_num btn_numWidth"><em>上一页</em></a>
										    </c:if>     
										    <c:forEach begin="1" end="5" step="1" var="pageIndex">  
				 								<c:if test="${pageNumber-(6-pageIndex) >=1}">  
										            <a class="btn_num"  href="noticeList.action?pageNumber=${pageNumber+pageIndex-6}"><em>${pageNumber+pageIndex-6}</em></a>
										        </c:if>  
											</c:forEach>
											<span>${pageNumber}</span>
											<c:forEach begin="1" end="5" step="1" var="pageIndex">  
				 								<c:if test="${pageNumber+pageIndex <= pageBean.totalPages}">  
										            <a class="btn_num"  href="noticeList.action?pageNumber=${pageNumber+pageIndex}"><em>${pageNumber+pageIndex}</em></a>
										        </c:if>  
											</c:forEach>  
										    <c:if test="${pageNumber < pageBean.totalPages}">  
										        <a href="noticeList.action?pageNumber=${pageNumber+1}" class="btn_num btn_numWidth"><em>下一页</em></a>
										    </c:if>    
										    <a href="noticeList.action?pageNumber=${pageBean.totalPages}" class="btn_num btn_numWidth"><em>末页</em></a>
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
    
    <!--私信框-->
<form id="msg" action="/Weibo/Admin/sendallnotice.action?pageNumber=1" method="post" name="notice">
      <div  id="msg_box" style="position: absolute; z-index: 1000; visibility: visible; left: 419px; top: 150px; display:none;">
       <table class="mBlogLayer">
        <tbody>
         <tr>
          <td class="top_l"></td>
          <td class="top_c"></td>
          <td class="top_r"></td>
          </tr>
         <tr>
            <td class="mid_l"></td>
            <td class="mid_c">
             <div class="layerBox">
              <div class="layerBoxTop">
               <div class="topCon"><strong>发通知</strong>
                <a href="javascript:void(0);" class="close" id= "msg_box_cancle" onclick="closeDialog('msg_box');nremoveMsgBox()" title="关闭"></a>
                <div class="clear">
                </div>
                
               </div>
              </div>
              <div class="layerBoxCon" style="width: 430px; height: auto; ">
               <table class="noteTab1">
                <tbody>
                <tr>
	                <div style="position:relative;padding:20px 0 10px 25px;" id="category_cont_bottom">
						<input type="radio" name="srchb" value="1" checked="checked" onclick="jiesuo();"/>私人
						<input type="radio" name="srchb" value="2" onclick="suoding();"/>所有人
					</div>
                </tr>
            	 <tr id>
                  <th>发通知给：&nbsp;
                  </th>
                  <td><input id="1popUpNick" type="text" name="msgToName" class="PY_input" style="color: rgb(153, 153, 153); " onblur="nonClickmsgToName('1popUpNick')" >&nbsp;&nbsp;</input>
                  <span id="errorNickName3" style="color:#FF0000; visibility:hidden;">用户名不存在</span> 
                  </td>
                 </tr>
                 <tr class="tPadding">
                  <th>通知内容：&nbsp;
                  </th>
                  <td><textarea id="popUpEditor" class="PY_input" name="message.msgContent" style="overflow-y: hidden; overflow-x: hidden; " onclick="nonClickmsgToName('1popUpNick')"></textarea>
                  </td>
                 </tr>
                 <tr class="tPadding1">
                  <th>
                  </th>
                  <td><a class="faceicon1" id="insert_face_icon" href="javascript:openFacesBox('insert_face_icon','popUpEditor');"  title="表情"></a>
                  </td>
                 </tr>
                 <tr>
                  <th></th>
                  <td><a id="popUpSubmit" href="javascript:validateMsgSubmit('msg');" class="btn_normal" style="margin:20px 0;"><em>发送</em></a>
                   <span id="popUpError" style="display:none" class="errorTs2 error_color">密码错误
                   </span>
                  </td>
                 </tr>
                 <tr>
                  <td></td>
                  <td><p class="inviteLayer_tip gray9" style="padding-bottom:20px;">说明：长度不能超过300字</p>
                  </td>
                 </tr> 	
                </tbody>
               </table>
              </div>
             </div>
            </td>
            <td class="mid_r">
            </td>
         </tr>
         <tr>
          <td class="bottom_l"></td>
          <td class="bottom_c"></td>
          <td class="bottom_r"></td>
         </tr>			    
        </tbody>
       </table>
      </div>
     </form>                                                
  </div>
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
