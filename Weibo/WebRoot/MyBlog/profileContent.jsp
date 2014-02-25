<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>
			${prof.publishName}的微博
		</title>
		
		<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>
		
		<link href="/Weibo/css/com_manage.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/faces.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/fancybox/jquery.fancybox-1.3.4.css" type="text/css" rel="stylesheet" media="screen" />
		
		<script type="text/javascript" src="/Weibo/js/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="/Weibo/js/index.js"></script>
		<script type="text/javascript" src="/Weibo/js/json.js"></script>
		<script type="text/javascript" src="/Weibo/js/comment.js"></script>
		<script type="text/javascript" src="/Weibo/js/transmit_manage.js"></script>
		<script type="text/javascript" src="/Weibo/js/favors_manage.js"></script>
		<script type="text/javascript" src="/Weibo/js/editor_manage.js"></script>
		<script type="text/javascript" src="/Weibo/js/jquery.mousewheel-3.0.4.pack.js"></script>
		<script type="text/javascript" src="/Weibo/js/jquery.fancybox-1.3.4.pack.js"></script>
		
		<script type="text/javascript">
			$(document).ready(function() {
				$("a#fancyBox").fancybox({
					'overlayShow'	: false,
					'transitionIn'	: 'elastic',
					'transitionOut'	: 'elastic'
				});
			});
		</script>
	</head>
	<body onload="refreshCount();">
		<div class="MIB_bloga">
			<div class="MIB_blogb">
				<!--顶托盘-->
				<div class="tsina_gnbarea" id="WB_box_1318070134145">
		        	<div class="bg_gnbarea">&nbsp;</div>
		            <div id="" class="tsina_gnb">
		  				<ul class="gnb_r">
		                	<li><a href="/Weibo/myProfPage.action?pageNumber=1" id="">${sessionScope.user.nickName }</a> </li>
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
				  <div class="head_menu">
						<span class="menu_l">&nbsp;</span>
						<div class="menu_c">
							<div class="bg_menu_c">&nbsp;</div>
							<ul>
								<li><a href="/Weibo/Page.action?pageNumber=1">我的首页</a></li>
				                <li class="line">|</li><li><a href="/Weibo/myProfPage.action?pageNumber=1">我的微博</a></li>
				                <li class="line">|</li><li><a href="/Weibo/MyBlog/myFollowpage.action?pageNumber=1&listType=2">好友</a></li>
							</ul>
							
							<div class="search" id="m_search">
								<input type="text" id="m_keyword" autocomplete="off" name="profContent" title="搜索微博、找人" accesskey="3" />					
								<a class="submit" href="javascript:search('m_keyword',1);" id="m_submit">搜索</a>
							</div>
							
						</div>
						<span class="menu_r">&nbsp;</span>
					</div>
				</div>
				<!--/顶托盘-->
				<!--正文-->
				<div class="MIB_blogbody">
					<div class="MIB_mblogbgr blackBg">
						<div class="MIB_mblogbgl">
							<!--右栏内容 -->
							<div class="mainR MIB_200 MIB_txtar MIB_linkar">
								<!--个人信息-->
								<div class="userinfo">
									<div class="user_head">
										<div class="picborder_r lf" id="pop_1"><a href=""><img class="person_icon" src="${sessionScope.user.myFace}" alt="" /></a></div>
										<div class="lf">
											<p class="font_14"><a href="/Weibo/myProfPage.action?pageNumber=1" title="${sessionScope.user.nickName }">${sessionScope.user.nickName }</a></p>
											<p>${sessionScope.user.province},&nbsp;${sessionScope.user.city}</p>
											</div>
									</div>
									<div class="user_atten MIB_linedot">
										<ul id="profile_following_follower_update">
											<li id="pop_2" class="MIB_line_r">
												<div class="num"><a href="/Weibo/MyBlog/myFollowpage.action?pageNumber=1&listType=1" id="mblog">${sessionScope.user.followCount}</a></div>
												<a href="/Weibo/MyBlog/myFollowpage.action?pageNumber=1&listType=1">关注</a>
											</li>
											<li class="MIB_line_r">
												<div class="num"><a href="/Weibo/MyBlog/myFanspage.action?pageNumber=1&listType=1" id="myfans">${sessionScope.user.fansCount}</a></div>
												<a href="/Weibo/MyBlog/myFanspage.action?pageNumber=1&listType=1">粉丝</a>
											</li>
											<li class="">
												<div class="num"><a href="/Weibo/myProfPage.action?pageNumber=1" id="mblog">${sessionScope.user.profileCount}</a></div>
												<a href="/Weibo/myProfPage.action?pageNumber=1">微博</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<!--/右栏内容 -->
							<!--左栏内容 -->
							<div class="mainL MIB_600 MIB_txtal MIB_linkal">
								<!--内容区 -->
								<div class="MIB_mbloglist">
									<div class="singleBlogCont" id="">
										<p class="txtCont font_14">${prof.publishContent}</p>
										<div>
											<c:if test="${prof.imageRef != null}">
											<div class="MIB_assign">
						  						<div class="MIB_asarrow_l"></div>
						  						<div class="MIB_assign_t"></div>
						  						<div class="MIB_assign_c MIB_txtbl"> 					    						
													<div class="feed_preview">
														<div class="feed_img">
														<a id="fancyBox" href="/Weibo/Images/Refrences/${prof.imageRef}">
															<img src="/Weibo/Images/Refrences/${prof.imageRef}" class="imgicon" style="max-width:420px;"/>
														</a>
														</div>
														<div class="clear"></div>
													</div>
						     					</div>
						  						<div class="MIB_assign_b"></div>
											</div>
											</c:if>
										</div>
										<div class="comeform MIB_linkbl">
											<div class="lf">
												<cite>
													<a href="" onclick="">
														<strong style="margin-right: 10px;">${prof.subTime}</strong>
													</a>
												</cite>
												<strong>来自</strong>
												<cite>
													<a href="/Weibo/Others/othersProfile.action?otherId=${prof.userinfo.userId}" target="_blank">${prof.publishName}</a>
												</cite>
											</div>
											<div class="rt">												
												<!-- 转发-->
												<input type="hidden" id="tcId_${prof.profId}" value="${prof.tcId}"/>
												<input type="hidden" id="profContent_${prof.profId}" value="${prof.profContent}"/>
												<input type="hidden" id="publishName_${prof.profId}" value="${prof.publishName}"/>
												<input type="hidden" id="publishId_${prof.profId}" value="${prof.userinfo.userId}"/>
												<input type="hidden" id="tsmit_${prof.profId}" value="${(prof.tsmit == null)?0:1}"/>
												<a href="javascript:void(0);" onclick="onClickToInitTransmit(${prof.profId});">
													<strong>转发</strong>
													<c:if test="${prof.transmitCount != 0}">
														<strong>(${prof.transmitCount})</strong>
													</c:if>
												</a>
												<!-- /转发 -->
												<span class="MIB_line_l">|</span>
												<a id="collect_${prof.profId}" href="javascript:void(0);" onclick="onClickToCollection(${prof.profId});">
													<strong>收藏</strong>
												</a>
												<!-- 大评论 -->
												<span class="MIB_line_l">|</span>
												<a href="javascript:void(0)" onclick="clearOrgInfo('comment_content');">
													<strong >评论</strong>
													<c:if test="${prof.commentCount != 0}">
														<strong>(${prof.commentCount})</strong>
													</c:if>
												</a>
												<!-- 大评论 -->
											</div>
										</div>
									</div>
									<div id="comment_list">
										<div class="commendBox singCommendList">
											<!-- commentsmanage -->
											<div class="commentsmanage MIB_pl">
												<div class="MIB_comheader">
													<span class="lf font_14">
														评论
													</span>
												</div>
												<div class="MIB_linedot_l ncpsition">
													<form action="/Weibo/makeComReply.action" method="post" id="comment_form">
													<div class="logininput pl_long ">
														<input type="hidden" name="com.profile.profId" value="${prof.profId}"/>
														<div class="lf">
															<a class="faceicon1" id="publisher_faces" href="javascript:void(0);" onclick="openFacesBox('publisher_faces','comment_content');" title="表情"></a>
														</div>
														<div class="lf">
															<textarea id="comment_content" name="com.comContent" maxlength="140" onfocus="clearOrgInfo('comment_content');" onblur="addOrgInfo('comment_content');" style="color:#999; font-family: Tahoma, 宋体; overflow-y: hidden; overflow-x: hidden;">随便说说...</textarea>
														</div>
														<div class="margin_b MIB_txtbl">
															<div class="lf">
																<p class="check"></p>
															</div>
															<div class="rt">
																<a id="comment_post_miniblog" href="javascript:toSubmit('comment_form');" class="btn_normal">
																	<em>发评论</em>
																</a>
															</div>
														</div>
														
														<div class="MIB_btn">
														</div>
													</div>
													</form>
												</div>
												<div class="navStyle  MIB_pl_t">
													<div class="lf">
														<span class="fb">全部</span>														
													</div>
													<div class="rt">
														共<span>${prof.commentCount}</span>条
													</div>
													<div class="clearit">
													</div>
													<!--翻页-->												
													<!--翻页-->
												</div>
												<ul class="commentsList oddline">
													<!-- 评论循环开始 -->	
													<c:forEach items="${prof.comList}" var="com">										
													<li class="commentsCell MIB_linedot_l selected" onmouseover=""	onmouseout="">
														<div class="commentsTxt">
															<a href="/Weibo/Others/othersProfile.action?otherId=${com.userinfo.userId}">
																<img class="picborder_l" style="width:40px;height:40px;" title="saricat" src="${com.comFace}"/>
															</a>
															<div class="commentsContants">
																<p class="commentsParm MIB_txtal">
																	<a href="/Weibo/Others/othersProfile.action?otherId=${com.userinfo.userId}">${com.comFrom}</a>:&nbsp;
																	${com.publishContent}(${com.pubTime})
																</p>
																<div class="commentOption">
																	<cite class="rt">																		
																		<a href="javascript:makeReply('comment_reply_miniblog_${com.comId}');">回复</a>
																	</cite>
																</div>
																<!-- 评论回复框开始 -->
																<div class="clearit"></div>
																<form action="/Weibo/makeComReply.action" method="post" id="comment_form_${com.comId}">
																<div class="MIB_assign" style="display:none;" id="comment_reply_miniblog_${com.comId}">
																	<div class="MIB_asarrow_r"></div>
																	<div class="MIB_assign_t"></div>
																	<div class="MIB_assign_c">
																		<div class="logininput">									
																			<a class="faceicon1" href="javascript:void(0);" id="comment_faces_${com.comId}" title="表情" onclick="openFacesBox('comment_faces_${com.comId}','comment_content_${com.comId}');"></a>
																			<input type="hidden" name="com.profile.profId" value="${prof.profId}"/>
																			<input type="hidden" id="comment_name_${com.comId}" value="${com.comFrom}"/>
																			<input type="hidden" name="com.comComId" value="${com.comId}"/>
																			<textarea id="comment_content_${com.comId}" name="com.comContent" maxlength="140" style="overflow: hidden; height: 18px;" class="lf"></textarea>
																			<a class="btn_normal" href="javascript:onClickMakeComReply();">
																				<em>评论</em>
																			</a>
																		</div>
																	</div>
																	<div class="MIB_assign_b">
																	</div>
																</div>
																</form>
																<!-- 评论回复框结束 -->
															</div>
														</div>
													</li>
													</c:forEach>		
												</ul>												
											</div>
											<!-- commentsmanage -->
											<!-- 发评论 begin -->
											<!-- 发评论 end -->
										</div>
									</div>
									<!--/内容区 -->
								</div>
								<!--/左栏内容 -->
							</div>
							<!--/左栏内容 -->
						</div>
					</div>				
				</div>
				<!--/正文-->
			</div>
		</div>
		
		<!-- /网站信息 -->
		<div class="bottomLinks " id="bottomborder">
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
