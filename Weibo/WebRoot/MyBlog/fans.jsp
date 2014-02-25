<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>
关注我的人</title>
<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>

<link href="/Weibo/css/connect.css" type="text/css" rel="stylesheet" />
<link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
<link href="/Weibo/css/faces.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/Weibo/js/index.js"></script>     
<script type="text/javascript" src="/Weibo/js/fans_manage.js"></script>
<script type="text/javascript" src="/Weibo/js/json.js"></script>            
<script type="text/javascript" src="/Weibo/js/msg_manage.js"></script>        
<script type="text/javascript" src="/Weibo/js/editor_manage.js"></script>                                   
</head>
<body onload ="refreshCount();">
<div class="MIB_bloga">
  <div class="MIB_blogb">
        
        <!--顶托盘-->
      <div class="tsina_gnbarea" id="WB_box_1318070134145">
	    <div class="bg_gnbarea">&nbsp;</div>
          <div id="WB_weiboTop_1318070134145" class="tsina_gnb">
                <ul class="gnb_r">
                     <li><a href="/Weibo/myProfPage.action?pageNumber=1" >${sessionScope.user.nickName}</a> </li>
                     <li><a href="/Weibo/frommsgList.action?pageNumber=1">私信</a> </li>
                     <li><a href="/Weibo/systemList.action?pageNumber=1">通知</a> </li>
                     <li><a href="/Weibo/Setting/Setting.action">帐号设置</a> </li>
                     <li class="line">|</li>
                     <li><a  href="/Weibo/exitLogin.action">退出</a> </li>
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
	<div class="">
		<!-- 去往专题页面logo -->
		<a href="" class="link_sp" target="_blank"></a>
		<!-- //去往专题页面logo -->
	</div>
	   <div class="head_menu">
		      <span class="menu_l">&nbsp;</span>
		   <div class="menu_c">
			    <div class="bg_menu_c">&nbsp;</div>
			  <ul>
				  <li><a href="/Weibo/Page.action?pageNumber=1">我的首页</a></li>
				  <li class="line">|</li>
				  <li><a href="/Weibo/myProfPage.action?pageNumber=1">我的微博</a></li>
				  <li class="line">|</li>
				  <li class="cur"><a href="/Weibo/MyBlog/myFollowpage.action?pageNumber=1&listType=2">好友</a></li>
			  </ul>
			<div class="search" id="m_search">
				<input type="text" id="m_keyword" autocomplete="off" dycolor="false" title="搜索微博、找人" accesskey="3" />
				<a class="submit" href="javascript:search('m_keyword',1);" id="m_submit">搜索</a>
			</div>
		</div>
		     <span class="menu_r">&nbsp;</span>
	</div>
	<div id="m_keyword_tip" class="resultTip" style="display:none"></div> 
</div>
        <!--/顶托盘-->
        <!--正文-->
        <div class="MIB_blogbody">
               <div class="MIB_mblogbgr ">
                     <div class="MIB_mblogbgl">
                    <!--右栏内容 -->
                          <div class="mainR MIB_200 MIB_txtar MIB_linkar">
                                <div class="cetUsIn">
                                    <!--个人信息-->
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
                                <div class="cetUsLtTit">
                                     <h3><a href="/Weibo/MyBlog/myFollowpage.action?pageNumber=1&listType=1">我的关注</a></h3>
                                     <div class="linedot"></div>
                                </div>
                                <div class="cetUsLtTit cutcurr">
                                     <h3>
									    我的粉丝<em></em>
									 </h3>
                                     <div class="linedot"></div>
                                </div>

                                <div class="cetUsLtTit">
                                     <h3><a href="/Weibo/MyBlog/findFriends.jsp">找人</a><em></em></h3>
                                     <div class="linedot"></div>
                                </div>
                                <div class="cetUsLtTit">
                                     <h3 class="text_r">
						                <a class="font_12" href="javascript:previousBox();">管理我的黑名单</a><em></em>
						             </h3>
                                     <div class="linedot"></div>
                                </div>

                         </div>
                    <!--/右栏内容 -->
                    
                    <!--左栏内容 -->
                         <div class="mainL MIB_600 MIB_txtal MIB_linkal">
                               <div class="cetSearch">
                       <!-- 我的粉丝和关注页 -->
                                         	 <!--评论区 -->
                                     <div class="btmTit_wrap csTitle">
                           	              <div class="lf">
                                                       		  
                                        已有${ pageBean.totalPosts}人关注你
                                               <a class="fnormal" id="invite_attention" href="/invite/recv.php?rf=attlist"></a>                            
							              </div>
                                          <div class="rt">
                            	              <label>
                                	             <input maxlength="20" type="text" class="txt_s1" id="fans_and_follow_filter_input" value="输入昵称" />
                                                 <a href="javascript:previousBox();" class="btn_normal btnxs" id="fans_and_follow_filter_submit"><em>搜索</em></a>
                               	             </label>
                                         </div>
                          
                                     </div>
									 <div class="newFilter MIB_txtal">
							            <div class="nfBox clearFix">
							                <div class="chgz_tit">排序方式：</div>
							                <ul class="chgz_tag" id="fansLs">
											    <li class="current"><a class="btn_chBlue"><em>关注时间</em></a>
												</li>
												<li><a href="javascript:showFansIdList(2,1)" class="btn_chBlue"><em>粉丝数</em></a>
												</li>
							                </ul>
							            </div>
						             </div>
										<c:if test="${ pageBean.totalPosts == 0}">
									  <div class="PY_clew">
                                       <div class="PY_clewcon">
                                        <div class="icon"><img align="absmiddle" title="" alt="" src="/Weibo/css/img/PY_ib.gif" class="PY_ib PY_ib_1"></div>
                                        <div class="txt">咦，还没有人关注你？赶紧邀请亲朋好友来支持啊~  
                                        </div>
                                        <div class="clearit"></div>
                                    </div>
                                    </div> 
                                    </c:if>   	  	                        <!--内容区 -->
                                                    
                                                        
                                                    <!-- /我的粉丝关注页结束 --> 
                        
                        <!-- 他人的粉丝关注页 -->  
                            
                        <!-- /他人的粉丝关注页 --> 
                        
                        	         <div class="box_gr1">
                        	         
                                         <ul class="concernBox" popcontainer="true"  id="fansListTypename">
                                            <c:forEach items="${fansList}" var="fans">
                                            <li class="MIB_linedot_l" 
											onmouseover="mouseovershowDialog('${fans.fmId}')" onmouseout="mouseovercloseDialog('${fans.fmId}')" 
											id="2133029165">
                                                <div class="conBox_l">
												   <a href="/Weibo/Others/othersProfile.action?otherId=${ fans.fansId}"><img src="${fans.myface}" pop="true" title="${fans.fansName}" namecard="true" uid="2133029165" imgtype="head" src=""></img>
												   </a>
												</div>
                                                <div class="conBox_c"> 
												   <span class="name">
												      <a href="/Weibo/Others/othersProfile.action?otherId=${fans.fansId}" uid="2133029165" namecard="true" title="">${fans.fansName}
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
                                                <div id="${fans.fmId}" class="conBox_r " style="display:none;">
                                                <c:if test="${fans.ack}">
                                                    <p class="mutual">
													<img src="" title="互相关注中" class="small_icon sicon_atteo" />
													</p>
												</c:if>
												<c:if test="${!fans.ack}">
												   <p id="collect_${fans.fansId }">
													   <a onclick="setFansId(${fans.fansId});"  class="addFollow">
													   <span class="addnew">+</span>加关注</a>
												   </p>
												</c:if>	
                                                    <p  id="cancel_2133029165">
													   <a href="javascript:deletefansId('${fans.fansId}','${pageNumber}','${listType}')" >移除粉丝
													   </a>
													</p>
                                                 <p  id="message_2133029165">
                                                    	<input type="hidden" id="fmsgToName_${fans.fansId}" value="${fans.fansName}"/>
                                                   
													   <a href="javascript:OnClickReply(${fans.fansId});" >发私信
													   </a>
													</p>
																									
                                                </div>
                                                <div class="clearit"></div>
                                            </li>
                                            
                                     </c:forEach>
									
                                         </ul>
                                       
                                        </div>
                                   <c:if test="${ pageBean.totalPosts != 0}">     
                                    <div class="MIB_bobar">
                                       <div class="MIB_btn" id="saveAll"> 
		                                    <a class="btn_green" href="javascript:saveAllfansId('${pageNumber}','${pageBean.pageSize}','${listType}')" id="attbtn"><em>关注本页所有人</em></a>
		                                </div>
								     </div>
									 </c:if>
                                       <div class="MIB_bobar">
									<c:if test="${pageBean.totalPosts != 0}">
									<div class="fanye MIB_txtbl" style="float:right;" id="page">
									    <a onclick="showFansIdList(${listType},1)" class="btn_num btn_numWidth"><em>首页</em></a>
									    <c:if test="${pageNumber>1}">  
									        <a onclick="showFansIdList(${listType},${pageNumber-1})" class="btn_num btn_numWidth"><em>上一页</em></a>
									    </c:if>     
									    <c:forEach begin="1" end="5" step="1" var="pageIndex">  
			 								<c:if test="${pageNumber-(6-pageIndex) >=1}">  
									            <a class="btn_num"  onclick="showFansIdList(${listType},${pageNumber-(6-pageIndex)})"><em>${pageNumber-(6-pageIndex)}</em></a>
									        </c:if>  
										</c:forEach>
										<span>${pageNumber}</span>
										<c:forEach begin="1" end="5" step="1" var="pageIndex">  
			 								<c:if test="${pageNumber+pageIndex <= pageBean.totalPages}">  
									            <a class="btn_num"  onclick="showFansIdList(${listType},${pageNumber+pageIndex})"><em>${pageNumber+pageIndex}</em></a>
									        </c:if>  
										</c:forEach>  
									    <c:if test="${pageNumber < pageBean.totalPages}">  
									        <a onclick="showFansIdList(${listType},${pageNumber+1})" class="btn_num btn_numWidth"><em>下一页</em></a>
									    </c:if>    
									    <a onclick="showFansIdList(${listType},${pageBean.totalPages})" class="btn_num btn_numWidth"><em>末页</em></a>
									</div>
									</c:if>
									</div>
								</div>
								<form action="deleteFansId.action" method="post" name="delete_fans"  id="delete_fans">                       
								   <div id="deletefansId" style="position: absolute; clear: both; z-index: 1001; left: 737px; top: 71px; display: block; width: 252px; height: 124px; visibility: visible; display:none;">
								      <div style="">
								          <div class="miniPopLayer" style="width: 250px; ">
								              <div class="txt1 gray6">
								               <div>确定要移除该粉丝?<br>移除之后将取消他对你的关注
								              </div>
								             </div>
								           <div style="" class="btn">
								               <span>
								                 <a style="width:39px;" class="newabtn_ok" href="javascript:deleteFId()"><em>确定</em>
								                 </a>
								              </span>
								              <span>
								                 <a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="closeDialog('deletefansId');"><em>取消</em>
								                 </a>
								              </span>
								          </div>
								        </div>
								     </div>
								  </div>                                
								</form>   
								<form action="SaveAllfansId.action" method="post" name="save_fans"  id="save_fans">                                                            
								    <div id="saveAllfans" style="position: absolute; clear: both; z-index: 1002; left: 509px; top: 307px; display: block; width: 202px; height: 78px; visibility: visible; display: none;">
								       <div style="">
								          <div class="miniPopLayer" style="width: 200px; ">
								            <div class="txt1 gray6">
								                  <div>确定要关注他们吗?</div>
								            </div>
								            <div style="" class="btn">
								              <span>
								                <a style="width:39px;" class="newabtn_ok" href="javascript:saveAF()"><em>确定</em></a>
								              </span>
								               <span>
								                    <a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="closeDialog('saveAllfans');"><em>取消</em></a>
								               </span>
								            </div>
								         </div>
								      </div>
								   </div>  
								</form>                                
		                        <!--/内容区 -->
							</div>
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
