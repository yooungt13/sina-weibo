<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>${other.nickName}的资料</title>
	
	<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>	
		
	<link href="/Weibo/css/index.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/layer.css" type="text/css" rel="stylesheet" />
	
	<script type="text/javascript" src="/Weibo/js/json.js"></script>
	<script type="text/javascript" src="/Weibo/js/index.js"></script>
	<script type="text/javascript" src="/Weibo/js/comment.js"></script>
	<script type="text/javascript" src="/Weibo/js/favors_manage.js"></script>
	<script type="text/javascript" src="js/transmit_manage.js"></script>
    <script type="text/javascript" src="/Weibo/js/fans_manage.js"></script> 
	
</head>
<body onload="refreshCount();">
	<div class="MIB_bloga">
		<div class="MIB_blogb">
			<div class="tsina_gnbarea" id="">
	        	<div class="bg_gnbarea">&nbsp;</div>
	            <div id="WB_weiboTop_1318070134145" class="tsina_gnb">
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
									<a href="/Weibo/Others/othersInformationPage.action?otherId=${other.userId}">
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
										<c:when test="${other.sex == 1}">他的粉丝(${other.fansCount})</c:when>
										<c:otherwise>她的粉丝(${other.fansCount})</c:otherwise>									
									</c:choose>
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
										<li><a href="/Weibo/Others/othersProfile.action?otherId=${other.userId}"><span>微博</span></a></li>
										<li class="current">
											<c:choose>
												<c:when test="${other.sex == 1}"><span>他的资料</span></c:when>
												<c:otherwise><span>她的资料</span></c:otherwise>									
											</c:choose>
										</li>
									</ul>
									<div class="clear"></div>
								</div>
							</div>
				
							<!--列表-->
							<div class="MindexInfoList">
                                        <!-- 信息列表 -->
                                        <dl class="indexInfoList">
                                            <dt class="MIB_fixdot font_14">
                                                <strong class="font_14">
                                                    基本信息
                                                </strong>
                                            </dt>
                                            <dd>
                                                <ul>
                                                    <li>
                                                    	<c:choose>
                                                    		<c:when test="${other.email != null}">
                                                    		邮箱：${other.email}
                                                    		</c:when>
                                                    		<c:otherwise>
                                                    		亲，他/她有点懒，没有设置呦
                                                    		</c:otherwise>
                                                    	</c:choose>                                           
                                                    </li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <div class="MIB_linedot_l1">
                                        </div>
                                        <!-- /信息列表 -->
                                        <dl class="indexInfoList">
                                            <dt class="MIB_fixdot font_14">
                                                <strong>
                                                    教育信息
                                                </strong>
                                            </dt>
                                            <dd>
                                                <ul>
                                                    <li>
                                                    	<c:choose>
                                                    		<c:when test="${other.schoolTime != null || other.schoolName != null || other.college != null || other.schoolType!=null }">
                                                    			<p>学校：${other.schoolName} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${other.schoolTime}入学年份</p>
                                                    			<span>院系：${other.college}</span>
                                                    		</c:when>
                                                    		<c:otherwise>
                                                    			亲，他/她有点懒，没有设置呦
                                                    		</c:otherwise>
                                                    	</c:choose>
                                                    </li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="indexInfoList">
                                            <dt class="MIB_fixdot font_14">
                                                <strong>
                                                    职业信息
                                                </strong>
                                            </dt>
                                            <dd>
                                                <ul>
                                                    <li>
                                                        <c:choose>
                                                    		<c:when test="${other.workTimeFrom != null || other.workTimeTo != null || other.workplace != null || other.workProv != null || other.workCity != null || other.department != null}">
                                                    		<p>公司：${other.workplace} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.user.workTimeFrom}-${sessionScope.user.workTimeTo}</p>
                                                    		<p>职位：${other.department}</p>
                                                    		</c:when>
                                                    		<c:otherwise>
                                                    			亲，他/她有点懒，没有设置呦
                                                    		</c:otherwise>
                                                    	</c:choose>
                                                    </li>
                                                </ul>
                                            </dd>
                                        </dl>
                                    </div>
							<!--/列表-->
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
