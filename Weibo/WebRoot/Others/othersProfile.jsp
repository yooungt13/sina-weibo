<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>${other.nickName}的微博</title>
	
	<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>	
	<link href="/Weibo/css/index.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/layer.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/faces.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/artZoom.css" type="text/css" rel="stylesheet"/>
	
	<script type="text/javascript" src="/Weibo/js/jquery-1.3.2.min.js" ></script>
	<script type="text/javascript" src="/Weibo/js/artZoom.js"></script>
	<script type="text/javascript" src="/Weibo/js/json.js"></script>
	<script type="text/javascript" src="/Weibo/js/index.js"></script>
	<script type="text/javascript" src="/Weibo/js/comment.js"></script>
	<script type="text/javascript" src="/Weibo/js/favors_manage.js"></script>
	<script type="text/javascript" src="/Weibo/js/transmit_manage.js"></script>
	<script type="text/javascript" src="/Weibo/js/editor_manage.js"></script>
	<script type="text/javascript" src="/Weibo/js/fans_manage.js"></script>  
	
</head>
<body onload="refreshCount();">
	<div class="MIB_bloga">
		<div class="MIB_blogb">
			<div class="tsina_gnbarea" id="">
	        	<div class="bg_gnbarea">&nbsp;</div>
	            <div class="tsina_gnb">
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
						<input type="text" id="m_keyword" autocomplete="off" dycolor="false" name="profContent" title="搜索微博、找人" accesskey="3" />					
						<a class="submit" href="javascript:search('m_keyword',1);" id="m_submit">搜索</a>
					</div>
				</div>
				<span class="menu_r">&nbsp;</span>
			</div>
			<div id="m_keyword_tip" class="resultTip" style="display:none"></div> 
		</div>
		
	    <!--正文-->
	    <div class="MIB_blogbody" id="profileMain">
	    	<div class="MIB_mblogbgr ">
	    		<div class="MIB_mblogbgl">
			        <!--右栏内容 -->
			        <div class="mainR MIB_200 MIB_txtar MIB_linkar">
		  				<!--个人信息-->
						<div class="userinfo">
							<div class="user_atten MIB_linedot">
								<ul id="profile_following_follower_update">
									<li id="pop_2" class="MIB_line_r">
										<div class="num" pop="true"><a href="/Weibo/Others/othersFollow.action?otherId=${other.userId }" id="mblog">${other.followCount}</a></div>
										<a href="/Weibo/Others/othersFollow.action?otherId=${other.userId }">关注</a>
									</li>
									<li class="MIB_line_r">
										<div class="num"><a href="/Weibo/Others/othersFans.action?otherId=${other.userId }" id="myfans">${other.fansCount}</a></div>
										<a href="/Weibo/Others/othersFans.action?otherId=${other.userId }">粉丝</a>
									</li>
									<li class="">
										<div class="num"><a href="/Weibo/Others/othersProfile.action?otherId=${other.userId }" id="mblog">${other.profileCount}</a></div>
										<a href="/Weibo/Others/othersProfile.action?otherId=${other.userId }">微博</a>
									</li>
								</ul>
							</div>
							<div class="medal_show1" id="medal_box">
								 <ul id="medal_list_box">
								 </ul>
							</div>
						</div>
						<div wbml="widget" name="app43"></div>
						<div wbml="widget" name="app41"></div>
						<div wbml="widget" name="app15">							
							<!--个人资料-->
							<div class="f_pro">
								<div class="title font_14 MIB_linkcr">
									<a href="">
										<c:choose>
											<c:when test="${other.sex == 1}">他的资料</c:when>
											<c:otherwise>她的资料</c:otherwise>									
										</c:choose>
									</a>
								</div>
								<ul class="con"><li class="MIB_dot"><a href="">${other.schoolName}</a>&nbsp;&nbsp;<a href="">${other.college}</a></li></ul>
								<c:if test="${other.workplace != null}">
								<ul class="con"><li class="MIB_dot"><a href="">${other.workplace}</a>&nbsp;&nbsp;<a href="">${other.department}</a></li></ul>
								</c:if>
								
							</div>
							<!--/ 个人资料-->
						</div>
						
						<div wbml="widget" name="app11">
							<!--标签-->
							<div class="f_pro">
								<div class="title font_14 MIB_linkcr">${other.nickName}的标签</div>
									<div class="tags" id="module_tags">
										<a tagid="228" weight="199890" href="" class="font_12 fb">NBA</a>
										<a tagid="847" weight="2682790" href="" class="font_14 fb">80后</a>
										<a tagid="10" weight="2446775" href="" class="font_12">旅游</a>
										<a tagid="464" weight="2491786" href="" class="font_14">美食</a>
										<a tagid="2725" weight="2795663" href="" class="font_16 fb">听歌</a>
										<a tagid="283" weight="3269305" href="" class="font_16">电影</a>
										<a tagid="285" weight="3911791" href="" class="font_18">音乐</a>
									</div>
									<div class="txt_right">
										<a href="/Weibo/MyBlog/initSearch.action">标签搜索</a>
									</div>
								</div>
								<!--/标签-->						
						</div>
						
						<div wbml="widget" name="app9">
							<!--某人的粉丝-->
							<div class="f_pro">
								<div class="title font_14 MIB_linkcr">
										<c:choose>
											<c:when test="${other.sex == 1}">他的粉丝</c:when>
											<c:otherwise>她的粉丝</c:otherwise>									
										</c:choose>(${other.fansCount})
								</div>
								<ul class="user_recom" style="overflow-x: hidden;">
									<c:forEach items="${other.fansList}" var="fans">
									<li>
										<a href="/Weibo/Others/othersProfile.action?otherId=${fans.userId}" title="${fans.nickName}">
											<img namecard="true" src="${fans.myFace}" style="width:50px; height:50px;" >
										</a>
										<div class="name">
											<a namecard="true" href="/Weibo/Others/othersProfile.action?otherId=${fans.userId}" title="${fans.nickName}">${fans.nickName}</a>
										</div>
									</li>
									</c:forEach>							
								</ul>
								<div class="txt_right" style="padding-bottom:50px;">
									<c:if test="${other.fansCount > 9}">
										<a href="/Weibo/Others/othersFans.action?otherId=${other.userId }">更多<em>&gt;&gt;</em></a>
									</c:if>
								</div>
							</div>
							<!--/ 某人的粉丝-->
						</div>
						<div wbml="widget" name="app10003"></div>
					</div>
		        	<!--/右栏内容 -->
	        
					<!--左栏内容 -->
					<div class="mainL MIB_600 MIB_txtal MIB_linkal" id="profileL">
						<!--发布区 -->
						<div class="MIB_mbloghead" id="profileHead">
					    	<div class="MIB_mbloglist" id="profileHeadBg">
					        	<div class="other_headpic"><a href=""><img src="${other.myFace}" title="${other.nickName}" /></a></div>
					            <div class="other_info">
									<div class="name MIB_txtal">
										<span class="lf">${other.nickName}</span>
									</div>
									<p><a href="/Weibo/Others/othersInformationPage.action?otherId=${other.userId}">个人资料</a></p>					
									<div class="ad MIB_txtbl">
										<p class="blog MIB_txtbl">
										<c:choose>
										<c:when test="${other.sex == 1}">
										<img title="男" class="small_icon male" />	
										</c:when>
										<c:otherwise>
										<img title="女" class="small_icon female" />
										</c:otherwise>									
										</c:choose>
										${other.province},${other.city}</p>
										<p class="blog MIB_txtbl">${other.introduce}</p>										
									</div>
									<div class="ad MIB_txtbl">
									</div>
									<div class="concern">
						                <div class="MIB_btn lf"  id ="collect_${other.userId}">
						                <c:choose>
						                <c:when test="${!other.ack }">
						                    <a pop="true" id="add_atn" class="btn_add"  onclick="setOthersFansId(${other.userId});"><img title="加关注" class="SG_icon"><em>加关注</em></a>
						                </c:when>
						                <c:otherwise>
											<a class="concernBtn_Yet"><span class="add_yet"></span>已关注</a>
										</c:otherwise>
										</c:choose>
						                </div>
						            </div>
					            </div>
					        </div>
						</div>
					    <!--/发布区 -->
		    
						<!--内容区 -->
						<div class="MIB_mbloglist" id="profileFeed">
							<div class="newFilter MIB_txtal newFilterMb0">
								<div class="nfTagB nfTagOff">
									<ul>
										<li class="current"><span>微博</span></li>
										<li ><a href="/Weibo/Others/othersInformationPage.action?otherId=${other.userId}">
										<c:choose>
											<c:when test="${other.sex == 1}">他的资料</c:when>
											<c:otherwise>她的资料</c:otherwise>									
										</c:choose></a></li>
									</ul>
									<div class="clear"></div>
								</div>
							</div>
							
							<c:if test="${pageBean.totalPosts == 0}">
								<div style="color: #B8B7B7;padding: 20px 5px">
									<p class="title">这家伙很懒，神马都没留下</p>
								</div>
							</c:if>
				
							<!--列表-->
							<ul class="MIB_feed" id="feed_list">
								<!-- /微博内容开始 -->
									<c:forEach items="${profList}" var="prof">
										<li class="MIB_linedot_l">			
										  	<div class="head_pic">
										  		<a namecard="true" href="/Weibo/Others/othersProfile.action?otherId=${prof.userinfo.userId}" ><img title="${prof.publishName}" imgtype="head" src="${prof.publishFace}"/></a>
											</div>
										  	<div class="MIB_feed_c">
												<p class="sms" type="1">
													<a namecard="true" href="/Weibo/Others/othersProfile.action?otherId=${prof.userinfo.userId}" title="${prof.publishName}">${prof.publishName}</a>：${prof.publishContent}
												</p>
												
												<input type="hidden" id="tcId_${prof.profId}" value="${prof.tcId}"/>
												<input type="hidden" id="profContent_${prof.profId}" value="${prof.profContent}"/>
												<input type="hidden" id="publishName_${prof.profId}" value="${prof.publishName}"/>
												<input type="hidden" id="publishId_${prof.profId}" value="${prof.userinfo.userId}"/>
												<input type="hidden" id="tsmit_${prof.profId}" value="${(prof.tsmit == null)?0:1}"/>
												<!-- 转发微博内容 -->
												<c:if test="${prof.tcId != 0}"> 							
							    				<div class="MIB_assign">
							  						<div class="MIB_asarrow_l"></div>
							  						<div class="MIB_assign_t"></div>
							  						<div class="MIB_assign_c MIB_txtbl"> 
							  						<c:choose>
							  							<c:when test="${prof.tsmit == null}">
							  							<p class="source" mid="" type="2">
													    	<span>该微博已被原作者删除！</span>
														</p>
							  							</c:when>
							  							<c:otherwise>
													    <p class="source" mid="" type="2">
													    	<a href="/Weibo/Others/othersProfile.action?otherId=${prof.tsmit.userinfo.userId}" namecard="true" uid="">@${prof.tsmit.publishName}:</a>
													    	<span>${prof.tsmit.publishContent}</span>
														</p>
							    						<c:if test="${prof.tsmit.imageRef != null}">
															<div class="feed_preview" id="">
																<div class="feed_img">
																	<a href="/Weibo/MyBlog/profileContent.action?profId=${prof.tsmit.profId}">
																		<img src="/Weibo/Images/Refrences/${prof.tsmit.imageRef}" class="imgicon" onload="previewImage(this);" />
																	</a>
																</div>
																<div class="clear"></div>
															</div>
														</c:if>
														<div class="feed_att MIB_linkbl MIB_txtbl">
															<div class="lf">
																<cite><a href="/Weibo/MyBlog/profileContent.action?profId=${prof.tsmit.profId}"><strong>${prof.tsmit.subTime}</strong></a></cite> 
																<strong>来自</strong><cite><a href="/Weibo/Others/othersProfile.action?otherId=${prof.tsmit.userinfo.userId}" target="_blank">${prof.tsmit.publishName}</a></cite>
															</div>
															<div class="rt">
																<!-- 转发 -->
																<a href="/Weibo/MyBlog/profileContent.action?profId=${prof.tsmit.profId}" id="transmit_${prof.tsmit.profId}">
																	<strong>转发</strong>
																	<c:if test="${prof.tsmit.orgCount != 0}">(${prof.tsmit.orgCount})</c:if>
																</a>
																<!-- /转发 -->
																<!-- 评论 -->
																<span class="MIB_line_l">|</span>
																<a href="/Weibo/MyBlog/profileContent.action?profId=${prof.tsmit.profId}" >
																	<input type="hidden" id="commentCount_${prof.tsmit.profId}" value="${prof.tsmit.commentCount}"/>
																	<strong>评论</strong>
																	<strong id="showComCount_${prof.tsmit.profId}">
																	<c:if test="${prof.tsmit.commentCount != 0}">(${prof.tsmit.commentCount})</c:if>
																	</strong>
																</a>
																<!-- 评论 -->
															</div>
														</div>
														</c:otherwise>
													</c:choose>
							     					</div>
							  						<div class="MIB_assign_b"></div>
												</div>
												</c:if>	
												<!-- /转发微博内容结束 -->						
												<c:if test="${prof.imageRef != null}">
												<div class="feed_preview" id="">
													<div class="feed_img">
														<a class="miniImg artZoom" href="/Weibo/Images/Refrences/${prof.imageRef}" >
															<img src="/Weibo/Images/Refrences/${prof.imageRef}" class="imgicon small" style="max-width:240px; max-height:180px;"/>
														</a>
													</div>
													<div class="clear"></div>
												</div>
												</c:if>							
												<div class="MIB_assign" id="" style="display:block;" > </div>						
												<div class="feed_att MIB_linkbl MIB_txtbl">					
													<div class="lf">
														<cite><a href="/Weibo/MyBlog/profileContent.action?profId=${prof.profId}"><strong>${prof.subTime}</strong></a></cite>
														<strong lang="CL1006">来自</strong><cite><a href="/Weibo/Others/othersProfile.action?otherId=${prof.userinfo.userId}" target="_blank"  onclick="">${prof.publishName}</a></cite>
													</div>
													<div class="rt">													
														<!-- 转发 -->
														<a href="javascript:void(0);" id="transmit_${prof.profId}" onclick="onClickToInitTransmit(${prof.profId});">
															<strong>转发</strong>
															<c:if test="${prof.transmitCount != 0}">(${prof.transmitCount})</c:if>
														</a>
														<!-- /转发 -->
														<span class="MIB_line_l">|</span>
														<a id="collect_${prof.profId}" href="javascript:void(0);" onclick="onClickToCollection(${prof.profId})"><strong>收藏</strong></a>
														<!-- 评论 -->
														<span class="MIB_line_l">|</span>
														<a href="javascript:void(0);" onclick="onClickComment('comment_${prof.profId}')" >
															<input type="hidden" id="commentCount_${prof.profId}" value="${prof.commentCount}"/>
															<strong>评论</strong>
															<strong id="showComCount_${prof.profId}">
															<c:if test="${prof.commentCount != 0}">(${prof.commentCount})</c:if>
															</strong>
														</a>
														<!-- 评论 -->
													</div>
												</div>
											    <div id=""></div>
												<div class="MIB_assign rt" popcontainer="true" id="comment_${prof.profId}" style="display:none" > 
													<div class="MIB_asarrow_r"></div>
													<div class="MIB_assign_t"></div>
													<div class="MIB_assign_c MIB_txtbl">
														<form action="makeComment.action" method="post" id="input_${prof.profId}" name="input_${prof.profId}">
														<div class="logininput new_position">
												     		<a title="表情" id="face_${prof.profId}" href="javascript:void(0);" class="faceicon1" onclick="openFacesBox('face_${prof.profId}','inputCom_${prof.profId}');"></a>
												     		<input type="hidden" name="com.profile.profId" value="${prof.profId}"/>
												     		<input type="hidden" name="com.comComId" id="comCom_${prof.profId}"/>
												     		<input type="hidden" value="${prof.userinfo.userId eq sessionScope.user.userId}" name="isEqMyProf"/>
															<textarea maxlength="140" id="inputCom_${prof.profId}" name="comContent" style="overflow-y: hidden; font-family: Tahoma, 宋体; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; word-wrap: break-word; line-height: 18px; overflow-x: hidden; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; font-size: 12px; height: 22px; " class="lf"></textarea>
															<a class="btn_normal" href="javascript:onClickSubmitComment('inputCom_${prof.profId}');"><em>评论</em></a>
															<div class="margin_b MIB_txtbl ml35"></div>
														</div>
														</form>
														<!-- 评论内容开始 -->	
														<ul class="PL_list oddline" id="comContent_${prof.profId}">								
														</ul>
														<div class="list_head MIB_linedot3 moreheight" id="moreCom_${prof.profId}" style="display:none;"></div>
														<!-- /评论内容结束 -->
													</div>
													<div class="MIB_assign_b"></div>
												</div>	
											</div>
										</li>							
									</c:forEach>
								<!-- /微博DIV显示完毕 -->
							</ul>
							<!--/列表-->	
				
							<div class="MIB_bobar"></div>
							<!--翻页-->
							<div class="MIB_bobar">
							<c:if test="${pageBean.totalPosts != 0}">
							<div class="fanye MIB_txtbl" style="float:right;" id="page">
							    <a href="/Weibo/Others/othersProfile.action?otherId=${other.userId}&pageNumber=1" class="btn_num btn_numWidth"><em>首页</em></a>
							    <c:if test="${pageNumber>1}">  
							        <a href="/Weibo/Others/othersProfile.action?otherId=${other.userId}&pageNumber=${pageNumber-1})" class="btn_num btn_numWidth"><em>上一页</em></a>
							    </c:if>     
							    <c:forEach begin="1" end="5" step="1" var="pageIndex">  
	 								<c:if test="${pageNumber-(6-pageIndex) >=1}">   
							            <a class="btn_num" href="/Weibo/Others/othersProfile.action?otherId=${other.userId}&pageNumber=${pageNumber+pageIndex-6}"><em>${pageNumber+pageIndex-6}</em></a>
							        </c:if>  
								</c:forEach>
								<span>${pageNumber}</span>
								<c:forEach begin="1" end="5" step="1" var="pageIndex">  
	 								<c:if test="${pageNumber+pageIndex <= pageBean.totalPages}">  
							            <a class="btn_num"  href="/Weibo/Others/othersProfile.action?otherId=${other.userId}&pageNumber=${pageNumber+pageIndex}"><em>${pageNumber+pageIndex}</em></a>
							        </c:if>  
								</c:forEach>  
							    <c:if test="${pageNumber < pageBean.totalPages}">  
							        <a  href="/Weibo/Others/othersProfile.action?otherId=${other.userId}&pageNumber=${pageNumber+1}" class="btn_num btn_numWidth"><em>下一页</em></a>
							    </c:if>    
							    <a  href="/Weibo/Others/othersProfile.action?otherId=${other.userId}&pageNumber=${pageBean.totalPages}" class="btn_num btn_numWidth"><em>末页</em></a>
							</div>
							</c:if>
							</div>
							<!--翻页-->
						</div>
						<!--/内容区 -->
					</div>
					<!--/左栏内容 -->
				</div>
	   		</div>
		</div>
		<!--/正文-->			
	</div>
</div>

<!-- /收藏成功确认DIV开始 -->
<div style="position: fixed; clear: both; z-index: 1000; left: 634px; top: 380px; display: none; width: 202px; height: 77px;visibility: visible;" id="profile_favs">
	<div style="">
		<div class="miniPopLayer" style="width:200px;">
			<div class="txt1 gray6">
				<img class="tipicon tip4" src="/Weibo/css/img/PY_ib.gif">
				<div>收藏成功</div>
			</div>
			<div style="" class="btn">
				<span><a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="closeDialog('profile_favs')"><em>确定</em></a></span>
			</div>
		</div>
	</div>
</div>
<!-- /收藏成功确认DIV结束 -->

<!-- /删除确认微博DIV开始 -->
<form action="deleteProf.action" method="post" name="delete_prof"  id="delete_prof">
<div style="position: fixed; clear: both; z-index: 1000; left: 634px; top: 380px; display: none; width: 202px; height: 77px; visibility: visible;" id="profile_cancel">
	<div style="">
		<div class="miniPopLayer" style="width:200px;">
			<div class="txt1 gray6">
				<img class="tipicon tip4" src="/Weibo/css/img/PY_ib.gif"/>
				<div>&nbsp;确定要删除该微博？</div>
			</div>
			<div style="" class="btn">
				<span>
					<a style="width:39px;" class="newabtn_ok" onclick="toConfirmDeleteProf()">
						<em>确定</em>
					</a>
				</span>
				<span>
					<a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="closeDialog('profile_cancel')">
						<em>取消</em>					
					</a></span>
			</div>
		</div>
	</div>
</div>
</form>
<!-- /删除确认微博DIV结束 -->

<!-- /删除确认评论DIV开始 -->
<form action="deleteComment.action" method="post" name="delete_com"  id="delete_com">
<div style="position: fixed; clear: both; z-index: 1000; left: 634px; top: 380px; display: none; width: 202px; height: 77px; visibility: visible;" id="comment_cancel">
	<div style="">
		<div class="miniPopLayer" style="width:200px;">
			<div class="txt1 gray6">
				<img class="tipicon tip4" src="/Weibo/css/img/PY_ib.gif"/>
				<div>&nbsp;确定要删除该评论？</div>
			</div>
			<div style="" class="btn">
				<span>
					<a style="width:39px;" class="newabtn_ok" onclick="onClickConfirmDeleteComment()">
						<em>确定</em>
					</a>
				</span>
				<span>
					<a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="closeDialog('comment_cancel');">
						<em>取消</em>					
					</a></span>
			</div>
		</div>
	</div>
</div>
</form>
<!-- /删除确认评论DIV结束 -->

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
