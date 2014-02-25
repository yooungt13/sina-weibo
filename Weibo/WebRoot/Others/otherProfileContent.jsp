<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>
			涛苑的微博
		</title>
		
		<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>
		
		<link href="/Weibo/css/com_manage.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
		
		<script type="text/javascript" src="/Weibo/js/index.js"></script>
		<script type="text/javascript" src="/Weibo/js/json.js"></script>
		<script type="text/javascript" src="/Weibo/js/comment.js"></script>
		<script type="text/javascript" src="/Weibo/js/transmit_manage.js"></script>
		<script type="text/javascript" src="/Weibo/js/fans_manage.js"></script>
		<script type="text/javascript" src="/Weibo/js/editor_manage.js"></script>
	</head>
	<body>
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
				<div class="header">
				  <div class="head_menu">
						<span class="menu_l">&nbsp;</span>
						<div class="menu_c">
							<div class="bg_menu_c">&nbsp;</div>
							<ul>
								<li class="cur"><a href="/Weibo/Page.action?pageNumber=1">我的首页</a></li>
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
										<p class="txtCont font_14">
											${prof.profContent}
										</p>
										<div>
											<div class="MIB_linedot_l1"></div>
											<c:if test="${prof.imageRef != null}">
											<div class="blogPicOri">											
												<img src="/Weibo/Images/Refrences/${prof.imageRef}" id="imgContainer"/>										
											</div>
											</c:if>
										</div>
										<!-- 转发 -->
										<!-- 转发 -->
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
												<a href="javascript:void(0);" onclick="">
													<strong>转发</strong>
													<c:if test="${prof.transmitCount != 0}">
														<strong>(${prof.transmitCount})</strong>
													</c:if>
												</a>
												<!-- /转发 -->
												<span class="MIB_line_l">|</span>
												<a href="javascript:void(0);" onclick="">
													<strong>收藏</strong>
												</a>
												<!-- 大评论 -->
												<span class="MIB_line_l">|</span>
												<a id="" href="javascript:void(0)" onclick="">
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
													<div class="logininput pl_long ">
														<div class="lf">
															<a class="faceicon1" href="javascript:void(0);" onclick="" title="表情"></a>
														</div>
														<div class="lf">
															<textarea id="comment_content" style="font-family: Tahoma, 宋体; overflow-y: hidden; overflow-x: hidden; ">
															</textarea>
														</div>
														<div class="margin_b MIB_txtbl">
															<div class="lf">
																<p class="check"></p>
															</div>
															<div class="rt">
																<a id="comment_post_miniblog" href="javascript:void(0);" class="btn_normal">
																	<em>发评论</em>
																</a>
															</div>
														</div>
														
														<div class="MIB_btn">
														</div>
													</div>
												</div>
												<div class="navStyle  MIB_pl_t">
													<div class="lf">
														<span class="fb">全部</span>														
													</div>
													<div class="rt">
														共<span>3</span>条
													</div>
													<div class="clearit">
													</div>
													<!--翻页-->												
													<!--翻页-->
												</div>
												<ul class="commentsList oddline">
													<!-- 评论循环开始 -->													
													<li class="commentsCell MIB_linedot_l selected" onmouseover=""	onmouseout="">
														<div class="commentsTxt">
															<a href="">
																<img class="picborder_l"  title="saricat" src=""/>
															</a>
															<div class="commentsContants">
																<p class="commentsParm MIB_txtal">
																	<a>
																		用户C
																	</a>
																	转发此微博:喜欢(51分钟前)
																</p>
																<div class="commentOption">
																	<cite class="rt">																		
																		<a href="javascript:void(0);" onclick="">回复</a>
																	</cite>
																</div>
																<!-- 评论回复框开始 -->
																<div class="clearit">
																</div>
																<div class="MIB_assign" id="comment_reply_miniblog">
																	<div class="MIB_asarrow_r">
																	</div>
																	<div class="MIB_assign_t">
																	</div>
																	<div class="MIB_assign_c">
																		<div class="logininput">									
																			<a class="faceicon1" href="javascript:void(0);" title="表情" onclick=""></a>
																			<textarea id="comment_content"
																			style="overflow: hidden; height: 18px;" class="lf">
																			</textarea>
																			<a class="btn_normal" href="javascript:void(0);">
																				<em>评论</em>
																			</a>
																			<div class="margin_b MIB_txtbl ml35">
																				<p></p>
																			</div>
																		</div>
																	</div>
																	<div class="MIB_assign_b">
																	</div>
																</div>
																<!-- 评论回复框结束 -->
															</div>
														</div>
													</li>
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
	</body>
</html>
