<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>
         	  关注${other.nickName}的人
        </title>
        <link href="/Weibo/css/connect.css" type="text/css" rel="stylesheet" />
        <link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="/Weibo/js/json.js"></script>
		<script type="text/javascript" src="/Weibo/js/index.js"></script>
		<script type="text/javascript" src="/Weibo/js/comment.js"></script>
		<script type="text/javascript" src="/Weibo/js/favors_manage.js"></script>
		<script type="text/javascript" src="/Weibo/js/transmit_manage.js"></script>
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
							<div class="user_head">
								<div class="picborder_r lf" id="pop_1"><a href="/Weibo/Others/othersProfile.action?otherId=${other.userId }"><img class="person_icon" src="${other.myFace}" pop="true" alt="" /></a></div>
								<div class="lf">
									<p class="font_14"><a href="/Weibo/Others/othersProfile.action?otherId=${other.userId }" namecard="true" title="${other.nickName }">${other.nickName }</a></p>
									<p>${other.province},&nbsp;${other.city}</p>
								</div>
							</div>
							<div class="user_atten MIB_linedot">
								<ul id="profile_following_follower_update">
									<li id="pop_2" class="MIB_line_r">
										<div class="num"><a href="/Weibo/Others/othersFollow.action?otherId=${other.userId }" id="mblog">${other.followCount}</a></div>
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
						<div >							
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
						
						<div >
							<!--标签-->
							<div class="f_pro">
								<div class="title font_14 MIB_linkcr"><a href="">${other.nickName}的标签</a></div>
									<div class="tags" id="module_tags">
										<a  href="" class="font_12 fb">NBA</a>
										<a  href="" class="font_14 fb">80后</a>
										<a  href="" class="font_12">旅游</a>
										<a  href="" class="font_14">美食</a>
										<a  href="" class="font_16 fb">听歌</a>
										<a  href="" class="font_16">电影</a>
										<a  href="" class="font_18">音乐</a>
									</div>
									<div class="txt_right">
										<a href="/Weibo/MyBlog/initSearch.action">标签搜索</a>
									</div>
								</div>
								<!--/标签-->						
						</div>
						
						<div>
							<!--某人的粉丝-->
							
							<!--/ 某人的粉丝-->
						</div>
						<div></div>
					</div>
                            <!--/右栏内容 -->
                            <!--左栏内容 -->
                            <div class="mainL MIB_600 MIB_txtal MIB_linkal">
                                <div class="cetSearch">
                                    <!-- 我的粉丝和关注页 -->
                                    <!--评论区 -->
                         <div class="btmTit_wrap csTitle">
                           	<div class="lf">
                           		<c:choose>
									<c:when test="${other.sex == 1}">${other.fansCount}人关注了他</c:when>
									<c:otherwise>${other.fansCount}人关注了她</c:otherwise>									
								</c:choose>
                            </div>
                            <div class="rt">
                            	<label>
                                	<input maxlength="20" type="text" class="txt_s1" id="fans_and_follow_filter_input" value="输入昵称" />
                                    <a href="javascript:previousBox();" class="btn_normal btnxs" id="fans_and_follow_filter_submit"><em>搜索</em></a>
                               	</label>
                            </div>
                          
                          </div>
                        <!--/评论区 -->
                                    <!--内容区 -->
                                    <!--排序-->
                                    <div id="system_information" style="display:none">
                                    </div>
                                    <div class="clear">
                                    </div>
                                    <!--/排序-->
                                    <!-- /我的粉丝关注页结束 -->
                                    <div class="box_gr1"  style="z-index:0;"> 
									<ul class="concernBox"  id="fansListTypename">
										<c:if test="${fansPageBean.totalPosts == 0 }">
										<span>还没有人关注他/她呦</span>
										</c:if>
									
                                            <c:forEach items="${fansList}" var="fans">
                                            <li class="MIB_linedot_l" id="2133029165">
                                                <div class="conBox_l">
												   <a href="/Weibo/Others/othersProfile.action?otherId=${fans.fansId}"><img src="${fans.myface}" title="${fans.fansName}"  src=""></img>
												   </a>
												</div>
                                                <div class="conBox_c"> 
												   <span class="name">
												      <a href="/Weibo/Others/othersProfile.action?otherId=${fans.fansId}" title="">${fans.fansName}
												      </a>
												   </span>
												   <c:if test="${fans.seximage!=2}">
                                                   <p class="address">
									                    <img src="" class="small_icon man" title="男" />${fans.fansCity },  
														<span>粉丝<strong>${fans.fansNumber}</strong>人</span>
												   </p>
												   </c:if>
												    <c:if test="${fans.seximage ==2}">
                                                   <p class="address">
									                    <img src="" class="small_icon sicon_female" title="女" />${fans.fansCity },  
														<span>粉丝<strong>${fans.fansNumber}</strong>人</span>
												   </p>
												   </c:if>
                                                   <div class="content MIB_linkbl">  
												       <c:if test="${ fans.fansIdPro != 0}">
													       <a href="/Weibo/MyBlog/profileContent.action?profId=${ fans.fansIdPro}" class="ms">
													       		${fans.fansIdProfId }&nbsp;(${fans.fansProTime })
														   </a> 
													   </c:if>
													   <c:if test="${ fans.fansIdPro == 0}">
													       <span class="gray6">${fans.fansIdProfId }</span> 
													   </c:if> 
												   </div>
                                                </div>
                                                <div id="${fans.fmId}" class="conBox_r " style="display:block;">
                                                <c:if test="${fans.ack}">
                                                    <p class="mutual">
														<a class="concernBtn_Yet"><span class="add_yet"></span>已关注</a>
													</p>
												</c:if>
												<c:if test="${!fans.ack && fans.fansId != sessionScope.user.userId}">
													<p  id="collect_${fans.fansId }">
														<a onclick="setOthersFansId(${fans.fansId});"  class="addFollow">
															<span class="addnew">+</span>加关注
														</a>
													</p>
												</c:if>
												<c:if test="${fans.fansId == sessionScope.user.userId}">
												</c:if>	
												</div>
                                                <div class="clearit"></div>
                                            </li>
                                            
                                     </c:forEach>
									
                                         </ul>
									<!--翻页-->
									<div class="MIB_bobar">
									<c:if test="${fansPageBean.totalPosts != 0}">
									<div class="fanye MIB_txtbl" style="float:right;" id="page">
									    <a href="/Weibo/Others/othersFans.action?pageNumber=1 &otherId=${other.userId }" class="btn_num btn_numWidth"><em>首页</em></a>
									    <c:if test="${pageNumber>1}">  
									        <a href="/Weibo/Others/othersFans.action?pageNumber=${pageNumber-1}&otherId=${other.userId }" class="btn_num btn_numWidth"><em>上一页</em></a>
									    </c:if>     
									    <c:forEach begin="1" end="5" step="1" var="pageIndex">  
			 								<c:if test="${pageNumber-(6-pageIndex) >=1}">   
									            <a class="btn_num" href="/Weibo/Others/othersFans.action?pageNumber=${pageNumber+pageIndex-6}&otherId=${other.userId }"><em>${pageNumber+pageIndex-6}</em></a>
									        </c:if>  
										</c:forEach>
										<span>${pageNumber}</span>
										<c:forEach begin="1" end="5" step="1" var="pageIndex">  
			 								<c:if test="${pageNumber+pageIndex <= fansPageBean.totalPages}">  
									            <a class="btn_num"  href="/Weibo/Others/othersFans.action?pageNumber=${pageNumber+pageIndex}&otherId=${other.userId }"><em>${pageNumber+pageIndex}</em></a>
									        </c:if>  
										</c:forEach>  
									    <c:if test="${pageNumber < fansPageBean.totalPages}">  
									        <a  href="/Weibo/Others/othersFans.action?pageNumber=${pageNumber+1}&otherId=${other.userId }" class="btn_num btn_numWidth"><em>下一页</em></a>
									    </c:if>    
									    <a  href="/Weibo/Others/othersFans.action?pageNumber=${fansPageBean.totalPages}&otherId=${other.userId }" class="btn_num btn_numWidth"><em>末页</em></a>
									</div>
									</c:if>
									</div>
									<!--翻页-->
								</div>
                                    <!--/内容区 -->
                                </div>
                            </div>
                            <!--/左栏内容 -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="position: absolute; top: 208px; left: 620px; z-index: 99;display:none"
        id="popMoreGrouplist" class="nfTaglay">
            <ul class="sltmenu_m">
            </ul>
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
