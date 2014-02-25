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
	<link href="/Weibo/css/person_connect.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/right_module.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/faces.css" type="text/css" rel="stylesheet" />
	
	<script type="text/javascript" src="/Weibo/js/index.js"></script>
	<script type="text/javascript" src="/Weibo/js/json.js"></script>
	<script type="text/javascript" src="/Weibo/js/msg_manage.js"></script>
	<script type="text/javascript" src="/Weibo/js/editor_manage.js"></script> 
	<script type="text/javascript" src="/Weibo/js/fans_manage.js"></script>  
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
			<!--/顶托盘-->
			<!--正文-->
			<div class="MIB_blogbody">								
				<div class="MIB_mblogbgr ">
					<div class="MIB_mblogbgl ">
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
										  		<a href="/Weibo/Others/othersProfile.action?otherId=${famous.userId}"><img src="${famous.myFace}" width="50" height="50"/></a>
										  	</dt>
										  	<dd>
											 	<p class="name"><a href="/Weibo/Others/othersProfile.action?otherId=${famous.userId}" title="">${famous.nickName}</a>
											 	</p>
											 	<p class="info W_linkb">粉丝${famous.fansCount}人</p>
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
						<div class="mainL MIB_600 MIB_txtal MIB_linkal fps_wrap">
							<div class="srch_main_con lf">
								<!--搜索-->
								<div class="srch_con">
									<div class="srch_kind">
										<a href="javascript:search('sInput',1);">微博</a>
										<strong>找人</strong>
									</div>
									<div class="srch_form lf">
										<div class="srch_form_r rt"></div>
										<div class="srch_form_l lf"></div>
										<div class="srch_form_c lf">
											<div class="srch_arrow">
												<div class="srch_form_cr rt"></div>
												<div class="srch_form_cl lf"></div>
												<input id="sInput" class="font_14 txt_srch" type="text" value="${nickName}" maxlength="40"/>
											</div>
										</div>
										<a class="srch_btn lf" href="javascript:searchByName('sInput',1);" id="search">搜索</a>
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
											<a target="_blank" href="/Weibo/Others/othersProfile.action?otherId=${user.userId}">
												<img src="${user.myFace}" title="${user.nickName}"/></a>
										</div>	
										<div class="conBox_c">
											<div>
												<a target="_blank" class="font_14" title="${user.nickName}" href="/Weibo/Others/othersProfile.action?otherId=${user.userId}">${user.nickName}</a>
												<c:choose>
													<c:when test="${user.sex == 2}"><img title="女" class="small_icon sicon_female" /></c:when>
													<c:otherwise><img title="男" class="small_icon male" /></c:otherwise>
												</c:choose>
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
										<c:if test="${sessionScope.user.userId != user.userId}">
										<div class="conBox_r ">
											<p  id ="collect_${user.userId }">
										     <c:choose>
											 <c:when test="${!user.ack}">
												<a onclick="setOthersFansId(${user.userId});" class="addFollow">
													<span class="addnew">+</span>加关注
												</a>
											 </c:when>
											 <c:otherwise>
											    <a class="concernBtn_Yet"><span class="add_yet"></span>已关注</a>
										     </c:otherwise>
										     </c:choose>
											</p>
											<p><input type="hidden" id="fmsgToName_${user.userId }" value="${user.nickName}"/>
												<a href="javascript:void(0);" onclick="OnClickReply(${user.userId});">发私信</a>
											</p>
										</div>
										</c:if>
									</li>
									</c:forEach>	
								</ul>
								
								<!--翻页-->
								<div class="MIB_bobar">
								<c:if test="${pageBean.totalPosts != 0}">
								<div class="fanye MIB_txtbl" style="float:right;" id="page">
								    <a href="javascript:searchByName('sInput',1);" class="btn_num btn_numWidth"><em>首页</em></a>
								    <c:if test="${pageNumber>1}">  
								        <a href="javascript:searchByName('sInput',${pageNumber-1});" class="btn_num btn_numWidth"><em>上一页</em></a>
								    </c:if>     
								    <c:forEach begin="1" end="5" step="1" var="pageIndex">  
		 								<c:if test="${pageNumber-(6-pageIndex) >=1}">   
								            <a class="btn_num" href="javascript:searchByName('sInput',${pageNumber+pageIndex-6});"><em>${pageNumber+pageIndex-6}</em></a>
								        </c:if>  
									</c:forEach>
									<span>${pageNumber}</span>
									<c:forEach begin="1" end="5" step="1" var="pageIndex">  
		 								<c:if test="${pageNumber+pageIndex <= pageBean.totalPages}">  
								            <a class="btn_num"  href="javascript:searchByName('sInput',${pageNumber+pageIndex});"><em>${pageNumber+pageIndex}</em></a>
								        </c:if>  
									</c:forEach>  
								    <c:if test="${pageNumber < pageBean.totalPages}">  
								        <a  href="javascript:searchByName('sInput',${pageNumber+1});" class="btn_num btn_numWidth"><em>下一页</em></a>
								    </c:if>    
								    <a  href="javascript:searchByName('sInput',${pageBean.totalPages});" class="btn_num btn_numWidth"><em>末页</em></a>
								</div>
								</c:if>
								</div>
								<!--/翻页-->
							</div>
							<!-- /内容区 -->				
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
