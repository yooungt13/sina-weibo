<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<title>我的评论</title>
	
		<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>
		<link href="/Weibo/css/com_manage.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/faces.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="/Weibo/js/comment_manage.js"></script>
		<script type="text/javascript" src="/Weibo/js/index.js"></script>
		<script type="text/javascript" src="/Weibo/js/json.js"></script>
		<script type="text/javascript" src="/Weibo/js/editor_manage.js"></script>
	</head>                    

	<body onload="refreshCount();">                
		<div class="tsina_gnbarea" id="">
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
							<input type="text" id="m_keyword" autocomplete="off" dycolor="false" name="profContent" title="搜索微博、找人" accesskey="3" />					
							<a class="submit" href="javascript:search('m_keyword',1);" id="m_submit">搜索</a>
						</div>
					</div>
					<span class="menu_r">&nbsp;</span>
			</div>
		</div>

	    <!--正文-->
	    <div class="MIB_blogbody">
	        <div class="MIB_mblogbgr ">
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
						
						<div class="right_nav">
							<ul><li id="li_myprofile"><a href="Page.action?pageNumber=1">我的首页</a></li></ul>
							<ul><li><a href="atMeList.action?pageNumber=1">@提到我的</a></li>
							<li class="cur MIB_txtar" id="toptray_ring">我的评论</li>
							<li><a href="collectionList.action?pageNumber=1">我的收藏</a></li></ul>
						</div>
	
						<div class="f_pro">
							<div class="title font_14 MIB_linkcr" id="setintro">
								<img alt="" src="/Weibo/css/img/transparent.gif" class="tipicon tip5" align="absmiddle"/>设置说明
							</div>
							<ul class="con">
								<li class="MIB_dot">
									可以<a href="javascript:onClickShowCommentsList(2,1);">只看自己关注人</a>的评论哦
								</li>
								<li class="MIB_dot">
									可以<a href="/Weibo/Setting/privacy.jsp">设置</a>只允许自己关注的人评论你的微博哦
								</li>
								<li class="MIB_dot">
								被你拖入<a href="javascript:previousBox();">黑名单</a>的人，也是不能给你发评论的
								</li>
							</ul>
						</div>
					</div>
	                <!--/右栏内容 -->
					
	                <!--左栏内容 -->
	                <div class="mainL MIB_600 MIB_txtal MIB_linkal">
	                    <!--评论区 -->
	                    <div class="MIB_lf_titl font_14" id="recvOrSend"> 
							<span class="fb">收到的评论</span>
							<span class="MIB_line_l2 ">|</span>
							<span><a href="javascript:onClickShowCommentsList(4,1);">发出的评论</a></span>
						</div>
	                    <!--/评论区 -->
	
						<!--内容区 -->
						<div class="commendBox">
	                  		<div class="navStyle">
								<div class="lf" id="listType">
									<span class="fb">全部</span>
									<span class="MIB_line_l">|</span>
									<a href="javascript:onClickShowCommentsList(2,1);">我关注的</a>
									<span class="MIB_line_l">|</span>
									<a href="javascript:onClickShowCommentsList(3,1);">陌生人</a>
								</div>
								<div class="rt">
									<div class="chdd">
										<form action="" >
											<label><input type="text" class="test" def="查找评论或评论人" value="查找评论或评论人" id="searchkeyword" name="searchkeyword">
											<a href="javascript:;" id="search_btn" class="btn_normal btnxs"><em>搜索</em></a>
											</label>
										</form>
									</div>
								</div>
								<div class="clearit"></div>
	                        </div>
	                            
							<!-- commentsmanage -->
	                        <div class="commentsmanage" id="commentsmanage">
	                        	
	                        	<div id="noCom">
			                        <c:if test="${pageBean.totalPosts eq 0}">
			                           <br>还没有评论。</br> 	
			                        </c:if>
		                        </div>  
	                            <div  id="comheader">
	                            <c:if test="${pageBean.totalPosts != 0}">
	                            <div class="MIB_comheader">
	                                <input type="checkbox" class="selectall" id="selectall"  name="selectAll" onclick="selectAllComment();"/>
	                                <a onclick="selectAllComment();" href="javascript:void(0);">全选</a>
									<span class="MIB_line_l">|</span>
									<a onclick="deleteSelected();" href="javascript:void(0);">删除</a>
	                                <div class="rt" id="totalPosts">共<span>${pageBean.totalPosts}</span>条</div>
	                            </div>
	                            </c:if> 
	                            </div>
								<ul class="commentsList" popcontainer="true" id="comlist">
	                                <!-- 评论循环开始 -->
	                                <c:forEach items="${comList}" var="com">
	                                <li class="commentsCell MIB_linedot_l" id="comMsg_${com.comId}" onmouseover="mouseovershowDialog('deleteCom_${com.comId}')" onmouseout="mouseovercloseDialog('deleteCom_${com.comId}')">
	                                    <div class="selector">
	                                        <input type="checkbox" class="ckb" name="selectedList" value="${com.comId}" onclick="selectOne()"/>
	                                    </div>
	                                    <div class="commentsTxt">
	                                        <a href="/Weibo/Others/othersProfile.action?otherId=${com.userinfo.userId}" ><img class="picborder_l" style="width:50px; height:50px;" title="${com.comFrom}" src="${com.comFace}"/></a>
											<div class="icon_closel rt" id="deleteCom_${com.comId}" title="删除" onclick="setDeleteComId(this);" style="display:none;">x</div>
	                                        <div class="commentsContants">
	                                            <p class="commentsParm MIB_txtal">
													<a href="/Weibo/Others/othersProfile.action?otherId=${com.userinfo.userId}" namecard="true" title="${com.comFrom}">${com.comFrom}</a> ${com.publishContent} (${com.pubTime})
	                                            </p>
	                                            <div class="commentOption">
	                                                <cite class="rt">	
														<span class="MIB_line_l" style="visibility:hidden">|</span>
														<a href="javascript:;"  onclick="onClickShowDialog('comment_${com.comId}');onClickReply('${com.comId}')"><img title="" src="" class="small_icon recall"/>回复</a>
													</cite>
													<c:choose>
														<c:when test="${com.comComId != 0}">
															<span class="from"><label class="MIB_txtbl">回复我的评论：&nbsp;</label>“<a href="/Weibo/MyBlog/profileContent.action?profId=${com.comCom.profile.profId}">${com.publishComContent}</a>”</span>
														</c:when>
														<c:otherwise>
															<span class="from"><label class="MIB_txtbl">评论我的微博：&nbsp;</label>“<a href="/Weibo/MyBlog/profileContent.action?profId=${com.profile.profId}">${com.publishProfContent}</a>”</span>
	                                                	</c:otherwise>
	                                                </c:choose>
	                                            </div>
	                                            <!-- 评论回复框开始 -->
	                                            <div class="clearit"></div>
	                                            <div class="logininput">                                       
													<div class="MIB_assign" id="comment_${com.comId}" style="display:none" >
														<div class="MIB_asarrow_r"></div>
														<div class="MIB_assign_t"></div>
														<div class="MIB_assign_c">
															<form action="makeComment.action" method="post" id="input_${com.comId}" name="input_${prof.profId}">
															<div class="logininput">
														     	<a title="表情" id="face_${com.comId}" href="javascript:void(0);" class="faceicon1" onclick="openFacesBox('face_${com.comId}','inputCom_${com.comId}');"></a>
																<input type="hidden" name="profId" value="${com.profile.profId}"/>
									     						<input type="hidden" name="com.comComId" id="comCom_${com.comId}"/>
																<textarea id="inputCom_${com.comId}" name="comContent" style="overflow-y: hidden; font-family: Tahoma, 宋体; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; word-wrap: break-word; line-height: 18px; overflow-x: hidden; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; font-size: 12px; height: 22px; " class="lf"></textarea>
																<a class="btn_normal" onclick="onClickSubmitComment('input_${com.comId}');closeDialog('comment_${com.comId}');"><em>评论</em></a>
																<div class="margin_b MIB_txtbl ml35"></div>
															</div>
															</form>
														</div>
														<div class="MIB_assign_b"></div>
													</div>                                              
												</div>
												<!-- 评论回复框结束 -->
											</div>
	                                    </div>
	                                     
										<div class="clearit"></div>
	                                </li>
	                                </c:forEach>
	                            </ul>
	                            <div id="combottom">
	                            <c:if test="${pageBean.totalPosts != 0}">
									<div class="MIB_comheader">
	                                    <input type="checkbox" class="selectall" id="selectallbottom" name="selectAll" onclick="selectAllComment();"/>
	                                    <a onclick="selectAllComment();" href="javascript:void(0);">全选</a>
										<span class="MIB_line_l">|</span><a onclick="deleteSelected();" href="javascript:void(0);">删除</a>
	                                </div>	                    	
	                        	</c:if>
	                        	</div>
	                        </div>
	                        <!-- commentsmanage -->
	                            
	                        <!--翻页-->                      
							<div class="MIB_bobar">
							<c:if test="${pageBean.totalPosts != 0}">
							<div class="fanye MIB_txtbl" style="float:right;" id="page">
							    <a onclick="onClickShowCommentsList(${listType},1)" class="btn_num btn_numWidth"><em>首页</em></a>
							    <c:if test="${pageNumber>1}">  
							        <a onclick="onClickShowCommentsList(${listType},${pageNumber-1})" class="btn_num btn_numWidth"><em>上一页</em></a>
							    </c:if>     
							    <c:forEach begin="1" end="5" step="1" var="pageIndex">  
	 								<c:if test="${pageNumber-(6-pageIndex) >=1}">  
							            <a class="btn_num"  onclick="onClickShowCommentsList(${listType},{pageNumber+pageIndex-6})"><em>{pageNumber+pageIndex-6}</em></a>
							        </c:if>  
								</c:forEach>
								<span>${pageNumber}</span>
								<c:forEach begin="1" end="5" step="1" var="pageIndex">  
	 								<c:if test="${pageNumber+pageIndex <= pageBean.totalPages}">  
							            <a class="btn_num"  onclick="onClickShowCommentsList(${listType},${pageNumber+pageIndex})"><em>${pageNumber+pageIndex}</em></a>
							        </c:if>  
								</c:forEach>  
							    <c:if test="${pageNumber < pageBean.totalPages}">  
							        <a onclick="onClickShowCommentsList(${listType},${pageNumber+1})" class="btn_num btn_numWidth"><em>下一页</em></a>
							    </c:if>    
							    <a onclick="onClickShowCommentsList(${listType},${pageBean.totalPages})" class="btn_num btn_numWidth"><em>末页</em></a>
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
	
		<!-- /评论成功确认DIV开始 -->
		<div style="position: fixed; clear: both; z-index: 1001; left: 714px; top: 962px; width: 202px; height: 46px; visibility: visible;" id="comment_confirm">
			<div style="">
				<div class="miniPopLayer" style="width:200px;">
					<div class="txt1 gray6">
						<img class="tipicon tip3" src="/Weibo/css/img/PY_ib.gif">
						<div>评论成功！</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /评论成功确认DIV结束 -->
		
		<!-- /删除确认评论DIV开始 -->
		<form action="deleteComment.action" method="post" name="delete_com"  id="delete_com">
		<div style="position: fixed; clear: both; z-index: 1000; left: 634px; top: 380px; display: none; width: 202px; height: 77px; visibility: visible;" id="comment_delete">
			<div style="">
				<div class="miniPopLayer" style="width:200px;">
					<div class="txt1 gray6">
						<img class="tipicon tip4" src="/Weibo/css/img/PY_ib.gif"/>
						<div>&nbsp;确定要删除该评论？</div>
					</div>
					<div style="" class="btn">
						<span>
							<a style="width:39px;" class="newabtn_ok" onclick="toConfirmDeleteCom()">
								<em>确定</em>
							</a>
						</span>
						<span>
							<a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="closeDialog('comment_delete');">					
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
