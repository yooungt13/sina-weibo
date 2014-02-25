<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>我的通知</title>
 
<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>
<link href="/Weibo/css/notice.css" type="text/css" rel="stylesheet" /> 
<link id="skin_transformers" href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
<link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
<link href="/Weibo/css/systemmsg.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="/Weibo/js/jquery.js"></script>
<script type="text/javascript" src="/Weibo/js/overflow.js"></script>
<script type="text/javascript" src="/Weibo/js/index.js"></script>
<script type="text/javascript" src="/Weibo/js/msg_manage.js"></script>

</head>

<body onload="refreshCount();">

<div class="MIB_bloga">

  <div class="MIB_blogb">

<div class="tsina_gnbarea" id=""><div class="bg_gnbarea">&nbsp;</div><div id="" class="tsina_gnb">
  					<ul class="gnb_r">
	                	<li><a href="/Weibo/myProfPage.action?pageNumber=1" id="">${sessionScope.user.nickName }</a> </li>
	                    <li><a href="/Weibo/frommsgList.action?pageNumber=1">私信</a> </li>
	                    <li><a href="/Weibo/systemList.action?pageNumber=1">通知</a> </li>
	                    <li><a href="/Weibo/Setting/Setting.action">帐号设置</a> </li>
	                    <li class="line">|</li>
						<li><a id="" href="/Weibo/exitLogin.action">退出</a> </li>
	                </ul>
  </div></div> 	
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
  <div id="m_keyword_tip" class="resultTip" style="display:none"></div> 
</div>

		<!--正文-->

		<div class="MIB_blogbody">

			<!--找朋友-->

			<div class="MIB_column">

				<div class="MIB_main_cont">

					<div class="ntc_wrap">

											<div class="ntc_tit">

							<div class="tit_bd">

								<h1>我的通知&nbsp;&nbsp;<span>共${pageBean.totalPosts }条通知</span></h1>

							</div>

						</div>

						<div class="ntc_cont" id="notice_list">

							<div class="fanye_qx">

								<div class="lf checklf"><span class="gray6">显示：</span> <a href="javascript:void(0);"  class="current_sel"></a><span class="gray6">&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;</span><a href="javascript:void(0);"  class="current_sel"></a></div>

						  </div>

							

							  

		<div class="ntc_rowr"> 
	 	 <c:forEach items="${systemList}" var="smsg">
		  <input type="hidden" id="${smsg.msgId}" value="${smsg.msgId}"/>
			<div class="MIB_ntcf" >
			
			 <div class="img_col" id="smsg_${smsg.msgFrom}">
		      <a href="/weibodaren">
		       <img src="/Weibo/Images/Faces/manager.jpg" alt="" id="${smsg.msgFrom}" width="50" height="50"//>
		      </a>
	         </div>
	         <div class="msg_col">
		      <span class="name_msg" id="${smsg.msgFromName}"><a href="">${smsg.msgFromName}</a></span>
		      <p class="tit_z" > 标题：系统管理员给你的信
		      </p>
	         </div>
	          
	         <div class="time_col" id="${smsg.sendTime }">${smsg.sendTime }
	          <a href="javascript:void(0);" style="border:0;" title="点击展开通知" onclick="onClickShowDialog('system_box_${smsg.msgId}')">
	          <img class="tmPTicon_Up"/></a></div>
			 </div>                       
			<div class="info_ntcf" id="system_box_${smsg.msgId}" style="display:none;">
			<div class="hlw_info">${smsg.msgContent}</div></div>
 		 </c:forEach> 	 				            		
		</div>


				  </div>
<!--翻页-->
									<div class="MIB_bobar">
										<c:if test="${pageBean.totalPosts != 0}">
										<div class="fanye MIB_txtbl" style="float:right;" id="page">
										    <a href="systemList.action?pageNumber=1" class="btn_num btn_numWidth"><em>首页</em></a>
										    <c:if test="${pageNumber>1}">  
										        <a href="systemList.action?pageNumber=${pageNumber-1}" class="btn_num btn_numWidth"><em>上一页</em></a>
										    </c:if>     
										    <c:forEach begin="1" end="5" step="1" var="pageIndex">  
				 								<c:if test="${pageNumber-(6-pageIndex) >=1}">  
										            <a class="btn_num"  href="systemList.action?pageNumber=${pageNumber+pageIndex-6}"><em>${pageNumber+pageIndex-6}</em></a>
										        </c:if>  
											</c:forEach>
											<span>${pageNumber}</span>
											<c:forEach begin="1" end="5" step="1" var="pageIndex">  
				 								<c:if test="${pageNumber+pageIndex <= pageBean.totalPages}">  
										            <a class="btn_num"  href="systemList.action?pageNumber=${pageNumber+pageIndex}"><em>${pageNumber+pageIndex}</em></a>
										        </c:if>  
											</c:forEach>  
										    <c:if test="${pageNumber < pageBean.totalPages}">  
										        <a href="systemList.action?pageNumber=${pageNumber+1}" class="btn_num btn_numWidth"><em>下一页</em></a>
										    </c:if>    
										    <a href="systemList.action?pageNumber=${pageBean.totalPages}" class="btn_num btn_numWidth"><em>末页</em></a>
										</div>
										</c:if>
									</div>
									<!--翻页-->
				</div>

			</div>

			<!--/找朋友-->
			

    </div>


	</div>

		<!-- 网站信息 -->
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
</div>
</body>

</html>
