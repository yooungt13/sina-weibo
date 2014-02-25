<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>
            我的资料
        </title>
        <link href="/Weibo/css/index.css" type="text/css" rel="stylesheet" />
        <link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="/Weibo/js/json.js"></script>
		<script type="text/javascript" src="/Weibo/js/index.js"></script>
		<script type="text/javascript" src="/Weibo/js/comment.js"></script>
		<script type="text/javascript" src="/Weibo/js/favors_manage.js"></script>
		<script type="text/javascript" src="js/transmit_manage.js"></script>
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
						<li class=""><a href="/Weibo/Page.action?pageNumber=1">我的首页</a></li>
		                <li class="line">|</li><li class="cur"><a href="/Weibo/myProfPage.action?pageNumber=1">我的微博</a></li>
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
                <div class="MIB_blogbody" id="profileMain">
                    <div class="MIB_mblogbgr ">
                        <div class="MIB_mblogbgl">
                            <div class="mainR MIB_200 MIB_txtar MIB_linkar">
		  				<!--个人信息-->
						<div class="userinfo">
							<div class="user_atten MIB_linedot">
								<ul id="profile_following_follower_update">
									<li id="pop_2" class="MIB_line_r">
										<div class="num" pop="true"><a href="/Weibo/MyBlog/myFollowpage.action?pageNumber=1" id="mblog">${sessionScope.user.followCount}</a></div>
										<a href="/Weibo/MyBlog/myFollowpage.action?pageNumber=1">关注</a>
									</li>
									<li class="MIB_line_r">
										<div class="num"><a href="/Weibo/MyBlog/myFanspage.action?pageNumber=1" id="myfans">${sessionScope.user.fansCount}</a></div>
										<a href="/Weibo/MyBlog/myFanspage.action?pageNumber=1">粉丝</a>
									</li>
									<li class="">
										<div class="num"><a href="myProfPage.action?pageNumber=1" id="mblog">${sessionScope.user.profileCount}</a></div>
										<a href="myProfPage.action?pageNumber=1">微博</a>
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
								<div class="title font_14 MIB_linkcr"><a href="">我的资料</a></div>
								<ul class="con"><li class="MIB_dot"><a href="">${sessionScope.user.schoolName}</a>&nbsp;<a href="">${sessionScope.user.college}</a></li></ul>
								<c:if test="${sessionScope.user.workplace != null}">
								<ul class="con"><li class="MIB_dot"><a href="">${sessionScope.user.workplace}&nbsp;${sessionScope.user.department}</a></li></ul>
								</c:if>
								
								<div class="txt_right">
									<a href="/Weibo/Setting/educationinfo.jsp">修改</a><span class="MIB_liner">|</span>
									<a href="/Weibo/Setting/Setting.action">更多<em>&gt;&gt;</em></a>
								</div>
							</div>
							<!--/ 个人资料-->
						</div>
						
						<div wbml="widget" name="app11">
							<!--标签-->
							<div class="f_pro">
								<div class="title font_14 MIB_linkcr"><a href="">${sessionScope.user.nickName}的标签</a></div>
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
										<a href="">标签搜索</a>
										<span class="MIB_liner">|</span>
										<a href="javascript:;" id="addUserTag">添加</a>
										<span class="MIB_liner">|</span>
										<a href="">管理<em>&gt;&gt;</em></a>
									</div>
								</div>
								<!--/标签-->						
						</div>
						
						<div wbml="widget" name="app9">
							<!--某人的粉丝-->
							<div class="f_pro">
								<div class="title font_14 MIB_linkcr"><a href="">我的粉丝(${sessionScope.user.fansCount})</a></div>
								<ul class="user_recom" style="overflow-x: hidden;">
									<c:forEach items="${sessionScope.user.fansList}" var="fans">
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
								<c:if test="${sessionScope.user.fansCount > 9}">
								<div class="txt_right">
									<a href="/Weibo/MyBlog/myFanspage.action?pageNumber=1">更多<em>&gt;&gt;</em></a>
								</div>
								</c:if>
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
					        	<div class="other_headpic"><a href=""><img src="${sessionScope.user.myFace}" title="${sessionScope.user.nickName}" /></a></div>
					            <div class="other_info">
									<div class="name MIB_txtal">
										<span class="lf">${sessionScope.user.nickName}</span>
										<span class="aboutwho rt"><a id="publisher" href="/Weibo/Page.action?pageNumber=1">我要发微博</a></span>
									</div>
									<p><a href="/Weibo/MyBlog/myInformationPage.jsp">个人资料</a></p>					
									<div class="ad MIB_txtbl">
										<c:choose>
										<c:when test="${sessionScope.user.sex == 1}">
										<img title="男" class="small_icon male" />	
										</c:when>
										<c:otherwise>
										<img title="女" class="small_icon female" />
										</c:otherwise>									
										</c:choose>
										${sessionScope.user.province},${sessionScope.user.city}
									</div>
									<c:choose>
										<c:when test="${sessionScope.user.introduce == null }">
										<p class="MIB_txtbl">快来
											<a href="/Weibo/Setting/Setting.action">介绍一下自己</a>
											，获得更多人关注吧！
										</p>
										</c:when>
										<c:otherwise>
										<p class="MIB_txtbl">${sessionScope.user.introduce}</p>
										</c:otherwise>
					            	</c:choose>
					            </div>
					        </div>
						</div>
                                <!--/发布区 -->
                                <!--内容区 -->
                                <div class="MIB_mbloglist" id="profileFeed">
                                    <div class="newFilter MIB_txtal newFilterMb0">
                                        <div class="nfTagB nfTagOff">
                                            <ul>
                                                <li>
                                                    <a href="/Weibo/myProfPage.action?pageNumber=1">
                                                        微博
                                                    </a>
                                                </li>
                                                <li class="current">
                                                    <span>我的资料</span>
                                                </li>
                                            </ul>
                                            <div class="clear">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="MindexInfoList">
                                        <!-- 信息列表 -->
                                        <dl class="indexInfoList">
                                            <dt class="MIB_fixdot font_14">
                                                <strong class="font_14">  基本信息
                                                </strong>
                                                &nbsp;&nbsp;
                                                <a href="/Weibo/Setting/user.jsp" id="uispan_edit_0" class="MIB_linkbl">编辑
                                                </a>
                                            </dt>
                                            <dd>
                                                <ul>
                                                    <li>
                                                    	<c:choose>
                                                    		<c:when test="${sessionScope.user.email != null}">
                                                    		邮箱：${sessionScope.user.email}
                                                    		</c:when>
                                                    		<c:otherwise>
                                                    		亲，您还没有设置<a href="/Weibo/Setting/user.jsp">&nbsp;设置</a>
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
                                                &nbsp;&nbsp;
                                                <a href="/Weibo/Setting/educationinfo.jsp" id="uispan_edit_0" class="MIB_linkbl">
                                                    编辑
                                                </a>
                                            </dt>
                                            <dd>
                                                <ul>
                                                    <li>
                                                    	<c:choose>
                                                    		<c:when test="${sessionScope.user.schoolTime != null || sessionScope.user.schoolName != null || sessionScope.user.college != null }">
                                                    			<p>学校：${sessionScope.user.schoolName} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;入学年份：${sessionScope.user.schoolTime}</p>
                                                    			<span>院系：${sessionScope.user.college}</span>
                                                    		</c:when>
                                                    		<c:otherwise>
                                                    			亲，您还没有填写<a href="/Weibo/Setting/educationinfo.jsp">&nbsp;填写</a>
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
                                                &nbsp;&nbsp;
                                                <a href="/Weibo/Setting/workinfo.jsp" id="uispan_edit_0" class="MIB_linkbl">
                                                    编辑
                                                </a>
                                            </dt>
                                            <dd>
                                                <ul>
                                                    <li>
                                                        <c:choose>
                                                    		<c:when test="${sessionScope.user.workTimeFrom != null || sessionScope.user.workTimeTo != null || sessionScope.user.workplace != null || sessionScope.user.workProv != null || sessionScope.user.workCity != null ||sessionScope.user.department != null}">
                                                    		<p>公司：${sessionScope.user.workplace} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.user.workTimeFrom}-${sessionScope.user.workTimeTo}</p>
                                                    		<span>职位：${sessionScope.user.department}</span>
                                                    		</c:when>
                                                    		<c:otherwise>
                                                    			亲，您还没有填写<a href="/Weibo/Setting/workinfo.jsp">&nbsp;填写</a>
                                                    		</c:otherwise>
                                                    	</c:choose>
                                                    </li>
                                                </ul>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                                <!--/左栏内容 -->
                            </div>
                        </div>
                    </div>
				</div>
			</div>
		</div>
                    <!--/正文-->
                    <!--尾-->
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