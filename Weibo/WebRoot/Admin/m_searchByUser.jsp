<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>微博搜索</title>
		<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>
		<link href="/Weibo/css/srch_people.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/connect.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/right_module.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/faces.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="/Weibo/js/system_manage.js"></script>
		<script type="text/javascript" src="/Weibo/js/index.js"></script>
		<script type="text/javascript" src="/Weibo/js/msg_manage.js"></script>
		<script type="text/javascript" src="/Weibo/js/editor_manage.js"></script>
	</head>
	<body>
		<div class="MIB_bloga">
			<div class="MIB_blogb">
				<!--顶托盘-->
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
						 <div id="m_keyword_tip" class="resultTip" style="display:none">
						 </div> 
				    </div>
				<!--/顶托盘-->
				<!--正文-->
				<div class="MIB_blogbody">								
					<div class="MIB_mblogbgr ">
						<div class="MIB_mblogbgl ">
							<!--右栏内容 -->
							<div class="mainR MIB_200 MIB_txtar MIB_linkar"> 
								<div class="cetUsIn">
									<div class="user_head">
										<div class="picborder_r">
											<a href=""><img src="/Weibo/Images/Faces/manager.jpg"/></a>
										</div>
										<div class="lf">
											<p class="font_14"><a href="/Weibo/Admin/initManage.action">管理员</a></p>
											<p><em>湖南</em><em>长沙</em></p>
										</div>
									</div>
								</div>
								<div class="cetUsLtTit">
									<h3></h3>
									<div class="linedot">
									</div>
								</div>
								<div class="cetUsLtTit">
									<h3>
										<a href="/Weibo/Admin/initManage.action">管理微博</a>
									</h3>
									<div class="linedot">
									</div>
								</div>
								<div class="cetUsLtTit">
									<h3>
										<a href="/Weibo/Admin/noticeList.action?pageNumber=1">发布通知</a>
									</h3>
								</div>
								<div class="linedot"></div>
							</div>
				  			<!--/右栏内容 -->
			  				<!--左栏内容 -->
							<div class="mainL MIB_600 MIB_txtal MIB_linkal fps_wrap">
								<div class="srch_main_con lf">
									<!--搜索-->
									<div class="srch_con">
										<div class="srch_kind">
											<a href="javascript:weiboSearch('sInput',1);">微博</a>
											<strong>找人</strong>
										</div>
										<div class="srch_form lf">
											<div class="srch_form_r rt">
											</div>
											<div class="srch_form_l lf">
											</div>
											<div class="srch_form_c lf">
												<div class="srch_arrow">
													<div class="srch_form_cr rt">
													</div>
													<div class="srch_form_cl lf">
													</div>
													<input id="sInput" class="font_14 txt_srch" type="text" value="${nickName}" maxlength="40"/>
												</div>
											</div>
											<a class="srch_btn lf" href="javascript:userSearch('sInput',1);" id="search">
												搜索
											</a>
										</div>
										<div class="srch_tag">
											<span id="errKeyword"></span>
											<c:if test="${pageBean.totalPosts != 0}">
												<p class="srch_rs_total">找到${pageBean.totalPosts}条结果</p>
											</c:if>
										</div>
									</div>
									<!--/搜索-->
									
									<!-- 零数据  -->
									<c:if test="${pageBean.totalPosts == 0}">
									<div style="padding-top:30px;padding-left:5px;">
										<span class="srch_rs_total" >
											抱歉，没有找到<span style="color: #FF0000;">"${nickName}"</span>相关结果
										</span>
										<p style="padding-top:10px;color:#999;">建议：</p>
										<p style="color:#999;">请尽量输入常用词</p>
										<p style="color:#999;">请尽量使用简洁的关键词</p>
									</div>
									</c:if>
									<!-- /零数据  -->
	             
									<!-- 内容区 -->
									<ul class="concernBox" id="feed_list">
										<c:forEach items="${userList}" var="user">				
										<li class="MIB_linedot_l">
											<div class="conBox_l">
												<a onclick="" href="">
													<img src="${user.myFace}" title="${user.nickName}"/></a>
											</div>	
											<div class="conBox_c">
												<div>
													<a class="font_14" title="${user.nickName}" href="">${user.nickName}</a>
													<img title="男" class="small_icon sicon_female" />
													<span class="gray6 marRt10">${user.province}，${user.city} </span>
													<span class="gray6">
														粉丝<strong>${user.fansCount}</strong>人
													</span>
												</div>
												<div class="content">
													<p>${user.introduce}</p>
													<c:if test="${user.schoolName != null}">
													<div class="contentinfo">
														<p>教育信息：
															<span>${user.schoolName}</span>&nbsp;
															<span>${user.college}</span>
														</p>
													</div>
													</c:if>
													<c:if test="${user.workplace != null}">
													<div class="contentinfo">
														<p>职业信息：
															<span>${user.workplace}</span>&nbsp;
															<span>${user.department}</span>
														</p>
													</div>
													</c:if>
												</div>																																		
											</div>
											<div class="conBox_r ">
												<p>
													<c:choose>
														<c:when test="${user.role == 0}">
															<a href="javascript:freezeUser(${user.userId});" style="color:#FF0000;">冻结账号</a>
														</c:when>
														<c:otherwise>
															<a href="javascript:recoverUser(${user.userId});" style="color:#00DD00;">恢复账号</a>
														</c:otherwise>
													</c:choose>
												</p><input type="hidden" id="user_${user.userId }" value="${user.nickName}"/>
												<p><a href="javascript:void(0);" onclick="sOnClickReply(${user.userId });">发通知</a></p>
											</div>
										</li>
										</c:forEach>	
									</ul>
									<!-- /内容区 -->
								
									<!--翻页-->
									<div class="MIB_bobar">
										<c:if test="${pageBean.totalPosts != 0}">
										<div class="fanye MIB_txtbl" style="float:right;" id="page">
											<a href="javascript:userSearch('sInput',1);" class="btn_num btn_numWidth"><em>首页</em></a>
											<c:if test="${pageNumber>1}">  
											    <a href="javascript:userSearch('sInput',${pageNumber-1});" class="btn_num btn_numWidth"><em>上一页</em></a>
											</c:if>     
											<c:forEach begin="1" end="5" step="1" var="pageIndex">  
					 							<c:if test="${pageNumber-(6-pageIndex) >=1}">   
											        <a class="btn_num" href="javascript:userSearch('sInput',${pageNumber+pageIndex-6});"><em>${pageNumber+pageIndex-6}</em></a>
											    </c:if>  
											</c:forEach>
											<span>${pageNumber}</span>
											<c:forEach begin="1" end="5" step="1" var="pageIndex">  
					 							<c:if test="${pageNumber+pageIndex <= pageBean.totalPages}">  
											    	<a class="btn_num"  href="javascript:userSearch('sInput',${pageNumber+pageIndex});"><em>${pageNumber+pageIndex}</em></a>
											    </c:if>  
											</c:forEach>  
											<c:if test="${pageNumber < pageBean.totalPages}">  
											    <a  href="javascript:userSearch('sInput',${pageNumber+1});" class="btn_num btn_numWidth"><em>下一页</em></a>
											</c:if>    
											<a  href="javascript:userSearch('sInput',${pageBean.totalPages});" class="btn_num btn_numWidth"><em>末页</em></a>
										</div>
									</c:if>
									</div>
									<!--/翻页-->
								</div>				
							</div>	
							<!--/左栏内容 -->					
							</div>
							<div style="clear:both;"></div>
						</div>
					</div>
					<!--/正文-->
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
	</body>
</html>
