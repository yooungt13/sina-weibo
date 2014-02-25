<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html xmlns="http://www.w3.org/1999/xhtml">
  
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>我的首页</title>
	
	<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>

	<link href="/Weibo/css/artZoom.css" type="text/css" rel="stylesheet"/>
	<link href="/Weibo/css/index.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/layer.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/person_connect.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/right_module.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/faces.css" type="text/css" rel="stylesheet" />
	
	<script type="text/javascript" src="/Weibo/js/index.js"></script>
	<script type="text/javascript" src="/Weibo/js/json.js"></script>
	<script type="text/javascript" src="/Weibo/js/comment.js"></script>
	<script type="text/javascript" src="/Weibo/js/favors_manage.js"></script>
	<script type="text/javascript" src="/Weibo/js/transmit_manage.js"></script>
	<script type="text/javascript" src="/Weibo/js/fans_manage.js"></script>
	<script type="text/javascript" src="/Weibo/js/editor_manage.js"></script>
	<script type="text/javascript" src="/Weibo/js/jquery-1.3.2.min.js" ></script>
	<script type="text/javascript" src="/Weibo/js/artZoom.js"></script>
	
</head>
<body onload="refreshCount();">
<div class="MIB_bloga">
	<div class="MIB_blogb">
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
						<input type="text" id="m_keyword" autocomplete="off" dycolor="false" name="profContent" title="搜索微博、找人" accesskey="3" />					
						<a class="submit" href="javascript:search('m_keyword',1);" id="m_submit">搜索</a>
					</div>
					
				</div>
				<span class="menu_r">&nbsp;</span>
			</div>
		</div>
		<!--正文-->
		<div class="MIB_blogbody">
		<!--  <input type="button" value="弹层" id="custom_widget_btn"> -->
		<div class="MIB_mblogbgr ">
			<div class="MIB_mblogbgl">
				<!--右栏内容 -->
				<div class="mainR MIB_200 MIB_txtar MIB_linkar">
					<!--个人信息-->
					<div class="userinfo">
						<div class="user_head">
							<div class="picborder_r lf" id="pop_1"><a href=""><img class="person_icon" src="${sessionScope.user.myFace}"" pop="true" alt="" /></a></div>
							<div class="lf">
								<p class="font_14"><a href="/Weibo/myProfPage.action?pageNumber=1" namecard="true" title="${sessionScope.user.nickName }">${sessionScope.user.nickName }</a></p>
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
									<div class="num"><a href="/Weibo/myProfPage.action?pageNumber=1" id="mblog">${sessionScope.user.profileCount}</a></div>
									<a href="/Weibo/myProfPage.action?pageNumber=1">微博</a>
								</li>
							</ul>
						</div>
					</div>
		
					<div class="right_nav">
						<ul><li id="li_myprofile" class="cur MIB_txtar"> <a href="/Weibo/Page.action?pageNumber=1">我的首页</a></li></ul>
						<ul><li><a href="/Weibo/atMeList.action?pageNumber=1">@提到我的</a></li>
						<li><a href="/Weibo/commentsList.action?pageNumber=1&listType=1">我的评论</a></li>
						<li><a href="/Weibo/collectionList.action?pageNumber=1">我的收藏</a></li></ul>
					</div>
					
					<div id="pl_relation_recommendPopularUsers">
						<div id="" class="W_rightModule">
							<div class="title">
								<a style="text-decoration: none;">人气用户推荐</a>
							</div>
							<div>
								<c:if test="${famousCount == 0}">
								<p style="color: #B8B7B7;">亲，宇宙里已经没有人能阻止你加关注了.</p>
								</c:if>
								<c:forEach items="${famousList}" var="famous"> 
							  	<dl class="interPer clearfix">
								  	<dt>
								  		<a href="/Weibo/Others/othersProfile.action?otherId=${famous.userId}"><img title="${famous.nickName}" imgtype="head" src="${famous.myFace}" width="50" height="50"></a>
								  	</dt>
								  	<dd>
									 	<p class="name"><a href="/Weibo/Others/othersProfile.action?otherId=${famous.userId}" title="">${famous.nickName}</a></p>
									 	<p class="fllow clearfix"><a href="javascript:;" class="W_addbtn" action-type="followBtn">
									 		<a href="/Weibo/MyBlog/addFansId.action?fans.fansId=${famous.userId}" id="collect_${famous.userId}" class="addFollow" style="color: #390;"><span class="addnew">+</span>加关注</a>
									 	</p>
									 	<p class="info W_linkb">${famous.province}，${famous.city}</p>
								 	</dd>
							 	</dl>
							 	</c:forEach>
							</div>						
						</div>
					</div>
					
					<div wbml="widget" name="app20"></div>
					<div wbml="widget" name="app5"></div>
					<div wbml="widget" name="app6"></div>
				</div>
				<!--/右栏内容 -->
				
				<!--左栏内容 -->
				<div class="mainL MIB_600 MIB_txtal MIB_linkal" id="indexMainL" >
					<div class="MIB_mbloghead">
					    <div class="MIB_mblogbox">
					    	<!-- 发布区  -->
					        <form action="Profile.action" method="post" name="prof" id="pubProfile" theme="simple" enctype="multipart/form-data">
					        <div class="postWrap">
					            <div class="pngBg">
					                <div class="postOptionBg">
					                </div>
					                <div class="pngGuidBg">
					                </div>
					                <div class="pngAreaBg">
					                </div>
					            </div>
					            <div class="connBg">
					                <div class="wordNumBg" id="publisher_info">请文明发言，还可以输入<span id="count">140</span>字</div>
									<div class="postOptionBg" >
										<div class="OnTit" id="publisher_faces">
											<img class="small_icon faceicon" title="表情" onclick="openFacesBox('publisher_faces','publish_editor');"/>
											<a href="javascript:void(0)" onclick="openFacesBox('publisher_faces','publish_editor');">表情</a>
										</div>
					                    <div class="OnPic"  id="pop_7" >
					                        <span id="publisher_image" pop="true" poptype="1"/>
					                        	<img title="图片" class="small_icon picnormal" src="/Weibo/css/img/fbqimgclose.gif" onclick="uploadImg();"><a href="javascript:;" onclick="uploadImg();" >图片</a>
					                        	<input type="file" id="upload_img" name="file" onchange="javascript:ShowImage(this.value);"/>
											</span>
					                    </div>
					                </div>
					                <div class="postBtnBg">
					                    <a href="javascript:;" onclick="toSubmitForm();" id="publisher_submit" tabindex="8" title=""></a>
					                </div>
					                 <div class="inputarea" style="display:block">
										<label for="publish_editor" style="display:none;">微博输入框</label>										
					                    <textarea maxlength="140" tabindex="1" accesskey="1" name="prof.profContent" id="publish_editor" style="overflow-y:hidden;" onkeyup="checkLen(this);"></textarea>					      
					                </div>
					            </div>
					        </div>
					        </form>
					    	<!-- /发布区  -->
					    </div>
					</div>
					<!--内容区 -->
					<div class="MIB_mbloglist">
						
						<div class="newFilter MIB_txtal" id="MIB_newFilter" >
							<div  class="nfTagB nfTagOff">
								<ul>
									<li class="current"><span _link="">所有微博</span></li>					
								</ul>
								
								<div class="clear"></div>
							</div>                             
						</div>	
						
						<c:if test="${pageBean.totalPosts == 0}">
							<div class="zero_follow">
								<p class="title">微博小秘书： 如何快速找到有趣的人？看看小秘书多年总结出的经验吧。</p>
								<ul>
								<li>
									<a class="title_link" target="_blank" href="/Weibo/MyBlog/initSearch.action"></a>
									找亲朋好友，查询方式多种多样：
									<br>按 <a href="/Weibo/MyBlog/initSearch.action">MSN</a>、
									<a href="/Weibo/MyBlog/initSearch.action">邮箱</a>、
									<a href="/Weibo/MyBlog/initSearch.action">手机号码</a>、
									<a href="/Weibo/MyBlog/initSearch.action">昵称</a>、
									<a href="/Weibo/MyBlog/initSearch.action">公司</a>、
									<a href="/Weibo/MyBlog/initSearch.action">学校</a>、
									<a href="/Weibo/MyBlog/initSearch.action">所在地</a>查找
								</li>						
								<li>
									<a class="title_link" target="_blank" href=""></a>
									只要你填写了标签、学校、公司等个人资料，或者多发几篇微博，
									<br>你还能据此查找到你可能感兴趣的人。 <a href="/Weibo/Setting/user.jsp">去设置个人资料»</a>
								</li>
								<li>
									<a class="title_link" target="_blank" href=""></a>
									你还可以通过主页右侧的人气用户推荐，关注微博达人。
									<br>微博达人过着什么样的生活，等着你来发现。
								</li>							
								</ul>
							</div>							
						</c:if>
											
						<!-- /微博内容开始 -->
						<ul class="MIB_feed" id="feed_list" isWrite="1">
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
									    <p class="source" type="2">
									    	<a href="/Weibo/Others/othersProfile.action?otherId=${prof.tsmit.userinfo.userId}" namecard="true" uid="">@${prof.tsmit.publishName}:</a>
									    	<span>${prof.tsmit.publishContent}</span>
										</p>
			    						<c:if test="${prof.tsmit.imageRef != null}">
											<div class="feed_preview">
												<div class="feed_img">
													<a href="/Weibo/MyBlog/profileContent.action?profId=${prof.tsmit.profId}">
														<img src="/Weibo/Images/Refrences/${prof.tsmit.imageRef}" class="imgicon" style="max-width:160px; max-height:120px;" onload="previewImage(this);" />
													</a>
												</div>
												<div class="clear"></div>
											</div>
										</c:if>
										<div class="feed_att MIB_linkbl MIB_txtbl">
											<div class="lf">
												<cite><a href="/Weibo/MyBlog/profileContent.action?profId=${prof.tsmit.profId}"  onclick=""><strong>${prof.tsmit.subTime}</strong></a></cite> 
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
												<a href="/Weibo/MyBlog/profileContent.action?profId=${prof.tsmit.profId}">
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
								<div class="feed_preview">
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
						</ul>
						<!-- /微博DIV显示完毕 -->
						
						<!--翻页-->
						<c:if test="${pageBean.totalPosts != 0}">
						<div class="MIB_bobar">
						<form action="Page.action" method="post" name="page" id="page">
						<div class="fanye MIB_txtbl" style="float:right;">
						    <a href="Page.action?pageNumber=1" class="btn_normal btns"><em>首页</em></a>
						    <c:if test="${pageNumber>1}">  
						        <a href="Page.action?pageNumber=${pageNumber-1}" class="btn_normal btns"><em>上一页</em></a>
						    </c:if>    
						    <select name="pageNumber" onchange="gotoSelectedPage()" style="width:40px;">  
						    <c:forEach begin="1" end="${pageBean.totalPages}" step="1" var="pageIndex">  
						        <c:choose>  
						            <c:when test="${pageIndex eq pageNumber}">  
						                <option value="${pageIndex}" selected="selected">${pageIndex}</option>  
						            </c:when>  
						            <c:otherwise>  
						                <option value="${pageIndex}">${pageIndex}</option>  
						            </c:otherwise>  
						        </c:choose>  
						    </c:forEach>  
						    </select>  
						    <c:if test="${pageNumber<pageBean.totalPages}">  
						        <a href="Page.action?pageNumber=${pageNumber+1}" class="btn_normal btns"><em>下一页</em></a>
						    </c:if>    
						    <a href="Page.action?pageNumber=${pageBean.totalPages}" class="btn_normal btns"><em>末页</em></a>
						</div>
						</form>
						</div>
						</c:if>
						<!--翻页-->
					</div>
					<!--/内容区 -->
				</div>
				<!--/左栏内容 -->
			</div>
		</div>
		<!--/正文-->
	</div>
		
	<div id="ads_bottom_1"></div>
	</div>
</div>

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
					<a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="closeDialog('comment_cancel')">
						<em>取消</em>					
					</a></span>
			</div>
		</div>
	</div>
</div>
</form>
<!-- /删除确认评论DIV结束 -->

<!-- 表情 -->

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