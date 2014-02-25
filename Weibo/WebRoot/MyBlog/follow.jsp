<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>
我关注的人
</title>
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
	    <div class="bg_gnbarea">&nbsp;
		</div>
		<div id="WB_weiboTop_1318070134145" class="tsina_gnb">
            <ul class="gnb_r">
			   <li>
			      <a href="/Weibo/myProfPage.action?pageNumber=1" >${sessionScope.user.nickName }</a> 
			   </li>
			   <li>
			      <a href="/Weibo/frommsgList.action?pageNumber=1">私信</a> 
			   </li>
			   <li>
			      <a href="/Weibo/systemList.action?pageNumber=1">通知</a>
			   </li>
			   <li>
			      <a href="/Weibo/Setting/Setting.action">帐号设置</a>
			   </li>
			   <li class="line">|</li>
			   <li>
			      <a id="WB_logout_1318070134145" href="/Weibo/exitLogin.action">退出</a> 
			   </li>
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
				<li><a href="/Weibo/Page.action?pageNumber=1">我的首页</a></li>
				<li class="line">|</li><li><a href="/Weibo/myProfPage.action?pageNumber=1">我的微博</a></li>
				<li class="line">|</li><li class="cur"><a href="/Weibo/MyBlog/myFollowpage.action?pageNumber=1&listType=2">好友</a></li>
			  </ul>
			  <div class="search" id="m_search">
				<input type="text" id="m_keyword" autocomplete="off" dycolor="false" title="搜索微博、找人" accesskey="3" />
				<a class="submit" href="javascript:search('m_keyword',1);" id="m_submit">搜索</a>
			  </div>
		    </div>
		    <span class="menu_r">&nbsp;</span>
	    </div>
	    <div id="m_keyword_tip" class="resultTip" style="display:none">
	    </div> 
     </div>
        <!--/顶托盘-->
        <!--正文-->
     <div class="MIB_blogbody">
            <div class="MIB_mblogbgr ">
                <div class="MIB_mblogbgl">
                    <!--右栏内容 -->
                    <div class="mainR MIB_200 MIB_txtar MIB_linkar">
                      <div class="cetUsIn">
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
                       <div class="cetUsLtTit cutcurr">
                           <h3>我的关注</h3>
                           <div class="linedot"></div>
                       </div>
                       <div class="cetUsLtTit">
                          <h3><a href="/Weibo/MyBlog/myFanspage.action?pageNumber=1&listType=1">我的粉丝</a><em></em></h3>
                          <div class="linedot"></div>
                       </div>
                       <div class="cetUsLtTit">
                          <h3><a href="/Weibo/MyBlog/findFriends.jsp">找人</a><em></em></h3>
                          <div class="linedot"></div>
                       </div>
                       <div class="cetUsLtTit">
                          <h3 class="text_r"><a class="font_12" href="javascript:previousBox();">管理我的黑名单</a><em></em></h3>
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
                               我关注了${followIdNumber}人
                            </div>
                            <div class="rt">
                            	<label>
                                	<input maxlength="20" type="text" class="txt_s1" id="fans_and_follow_filter_input" value="输入昵称或备注" />
                                    <a href="javascript:previousBox();" class="btn_normal btnxs" id="fans_and_follow_filter_submit"><em>搜索</em></a>
                               	</label>
                            </div>
                          
                          </div>
                        <!--/评论区 -->
					  <div class="newFilter MIB_txtal">
							<!--头部分组导航-->
							<div class="nfTagB nfTagOn clearFix">
							  <ul  id ="groupIdList">
							   <c:if test="${listType == 1}">
								<li class="current" id='current_group'><a href="">全部</a></li>
								<li class="MIB_line_l">|</li>
								<li><a href="javascript:onClickShowFollowList(2,1);">相互关注</a></li>
								<li class="MIB_line_l">|</li>
								<li><a href="javascript:onClickShowFollowList(3,1);">未分组</a></li>
                                <li class="MIB_line_l">|</li>
                               </c:if>
                               <c:if test="${listType == 2}">
                                <li><a href="javascript:onClickShowFollowList(1,1);">全部</a></li>
								<li class="MIB_line_l">|</li>
								<li class="current" id='current_group'><a href="">相互关注</a></li>
								<li class="MIB_line_l">|</li>
								<li><a href="javascript:onClickShowFollowList(3,1);">未分组</a></li>
                                <li class="MIB_line_l">|</li>
                                </c:if>
                              </ul>
                              <ul  id="group_ListId">
                                <c:forEach items="${firstgroupList}" var="firstgroup">
                                <li><a href="">${firstgroup.groupName }</a></li>                                
                                <li class="MIB_line_l">|</li>
                                </c:forEach>        
							  </ul>
							  <a href="javascript:previousBox();"  class="newbtnadd" ><img class="SG_icon" src="" title="关注已选"><em>创建分组</em>
							  </a>
							  <div class="clear"></div>
							</div>
							<!--/头部分组导航-->

							<!--互相关注头部信息-->
							<div class="nfBox clearFix">
							  <div class="chgz_list">
                                <span class="p_nolik">
                                <img title="" class="small_icon male" src=""><span>互相关注<em>${userFansNumber }</em>人</span>
                                </span>
							 </div>
							</div>
					  </div>
					  	  <div  id="followWith">
					  <c:if test="${ followIdNumber == 0}">
					  <div class="PY_clew">
                         <div class="PY_clewcon">
                           <div class="icon"><img align="absmiddle" title="" alt="" src="/Weibo/css/img/PY_ib.gif" class="PY_ib PY_ib_1"></div>
                             <div class="txt">咦，还没关注呢？赶紧邀请亲朋好友来支持啊~。 
                             </div>
                             <div class="clearit"></div>
                         </div>	
                         </div> 
                      </c:if>                        <!--内容区 -->
                           </div>                       <!--内容区 -->
                                                <!--排序-->
                        <div id="system_information" style="display:none"></div>
                        <div class="clear"></div>
                        <!--/排序-->
                        
               <!-- /我的粉丝关注页结束 --> 
                            
<div class="box_gr1"  style="z-index:0;"> 
	<ul class="concernBox" id="folllowListId" popcontainer="true">
	  <c:forEach items="${followList}" var="follow">
	  <li class="MIB_linedot_l" onmouseover="mouseovershowDialog('follow_conBox_${follow.fmId}')" onmouseout="mouseovercloseDialog('follow_conBox_${follow.fmId}')" style="z-index:inherit;">
	    <div class="conBox_l"><a href="/Weibo/Others/othersProfile.action?otherId=${ follow.followId}"><img pop="true" title="${follow.followName }" namecard="true" uid="1781387491" imgtype="head" src="${follow.fmyface }" /></a>
		</div>
	    <div class="conBox_c" style="z-index:inherit;"> <span class="name"> <a href="/Weibo/Others/othersProfile.action?otherId=${ follow.followId}" title="${follow.followName }">${follow.followName }</a> </span>
	    <c:if test="${follow.followsex!=2 }">
	     <p class="address"><img src="" class="small_icon man" title="男" />${follow.followCity }<span>粉丝<strong>${follow.followNumber }</strong>人</span></p>
	     </c:if>
	     <c:if test="${follow.followsex==2 }">
	      <p class="address"><img src="" class="small_icon sicon_female" title="女" />${follow.followCity }<span>粉丝<strong>${follow.followNumber }</strong>人</span></p>
	      </c:if>
	      <div class="content MIB_linkbl">
	      <c:if test="${ follow.followIdPro != 0}">
	      	<a href="/Weibo/MyBlog/profileContent.action?profId=${ follow.followIdPro}" class="ms">
	      		${follow.followIdProfId }&nbsp;(${follow.followProTime })
	      	</a>
	      </c:if>
	      <c:if test="${ follow.followIdPro == 0}">
	      	<span class="gray6">${follow.followIdProfId }</span>
	      </c:if>
	      </div>
	      <!-- /设置分组 -->
	      <div class="roommate" style="z-index:inherit;">
            <a class="btn_privacy" href="#" title="" onclick="onClickShowDialog('follow_group_${follow.followId }')" >
          	<em>分组A<img class="small_icon down_arrow"></em>           
            </a>
          			<div id="follow_group_${follow.followId }" class="cetdowme" style="position: absolute; z-index:1; display:none; ">
  							<p class="hover"><input type="checkbox" class="labelbox" value="1"><label for="" title="分组A">分组A</label></p>
                            <p><input type="checkbox" class="labelbox" value="1" id=""><label for="" title="分组B">分组B</label></p>
                            <div class="MIB_linedot1"></div>
                            <p><a href="javascript:void(0);">创建新分组 </a></p>
                            <p class="opt" style="display: none; "><input type="text"></p>
                            <span class="error_color" style="display: none; ">请不要超过8个汉字 </span>
                            <p class="btn" style="display: none; ">
                                <a href="javascript:void(0);" class="btn_normal btnxs"><em>保存</em></a>
                                <a href="javascript:void(0);" class="btn_normal btnxs"><em>取消</em></a>
                            </p>
                    </div>          
          </div>
	    </div>
	    <div id="follow_conBox_${follow.fmId}" class="conBox_r" style="display:none;">
	      <p><a href="javascript:deletefollowId('${follow.followId }','${pageNumber}','${listType}')">取消关注</a></p>
	      <c:if test="${!follow.followack}">
	      <input type="hidden" id="fmsgToName_${follow.followId}" value="${follow.followName}"/>
	      <p  id="invite_"><a href="javascript:OnClickReply(${follow.followId});">求关注</a></p>
	      </c:if>
	    </div>
	    <div class="clearit"></div>
	   </li>
	   </c:forEach>
	</ul>
</div>


                          <div class="MIB_bobar">
							<c:if test="${pageBean.totalPosts != 0}">
							<div class="fanye MIB_txtbl" style="float:right;" id="page">
							    <a onclick="onClickShowFollowList(${listType},1)" class="btn_num btn_numWidth"><em>首页</em></a>
							    <c:if test="${pageNumber>1}">  
							        <a onclick="onClickShowFollowList(${listType},${pageNumber-1})" class="btn_num btn_numWidth"><em>上一页</em></a>
							    </c:if>     
							    <c:forEach begin="1" end="5" step="1" var="pageIndex">  
	 								<c:if test="${pageNumber-(6-pageIndex) >=1}">  
							            <a class="btn_num"  onclick="onClickShowFollowList(${listType},${pageNumber-pageIndex})"><em>${pageNumber-pageIndex}</em></a>
							        </c:if>  
								</c:forEach>
								<span>${pageNumber}</span>
								<c:forEach begin="1" end="5" step="1" var="pageIndex">  
	 								<c:if test="${pageNumber+pageIndex <= pageBean.totalPages}">  
							            <a class="btn_num"  onclick="onClickShowFollowList(${listType},${pageNumber+pageIndex})"><em>${pageNumber+pageIndex}</em></a>
							        </c:if>  
								</c:forEach>  
							    <c:if test="${pageNumber < pageBean.totalPages}">  
							        <a onclick="onClickShowFollowList(${listType},${pageNumber+1})" class="btn_num btn_numWidth"><em>下一页</em></a>
							    </c:if>    
							    <a onclick="onClickShowFollowList(${listType},${pageBean.totalPages})" class="btn_num btn_numWidth"><em>末页</em></a>
							</div>
							</c:if>
							</div>
<form action="deleteFollowId.action" method="post" name="delete_follow"  id="delete_follow">                       
   <div id="deletefollowId" style="position: absolute; clear: both; z-index: 1001; left: 737px; top: 71px; display: block; width: 252px; height: 124px; visibility: visible; display: none;">
      <div style="">
          <div class="miniPopLayer" style="width: 250px; ">
              <div class="txt1 gray6">
               <div>确定要移除该关注?<br>移除之后将取消对他的关注

              </div>
             </div>
           <div style="" class="btn">
               <span>
                 <a style="width:39px;" class="newabtn_ok" href="javascript:deleteFwId()"><em>确定</em>
                 </a>
              </span>
              <span>
                 <a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="closeDialog('deletefollowId');"><em>取消</em>
                 </a>
              </span>
          </div>
        </div>
     </div>
  </div>                                
</form>  
<!--翻页-->                                                                
<!--翻页-->

<!--/内容区 -->
</div>
</div>
<!--/左栏内容 -->
			  </div>
            </div>
        </div>
        <!--/正文-->
        <!--尾-->
      <!--/尾--> 
    </div>
</div>
<!-- SUDA_CODE_START -->
<form action="SavegroupId.action" method="post" name="save_groupId"  id="save_groupId"> 
<div id="follow_group" style="position: absolute; z-index: 1200; visibility: visible; left: 564px; top: 221.5px; display:none;">
	<table class="mBlogLayer">
	<tbody>
    	<tr>
        	<td class="top_l"></td>
            <td class="top_c"></td>
            <td class="top_r"></td>
        </tr>
        <tr>
        	<td class="mid_l"></td>
            <td class="mid_c">
            	<div class="layerBox">
                	<div class="layerBoxTop">
                    	<div class="topCon">
                        	<strong>创建分组</strong>
                            <a href="javascript:;" class="close" title="关闭"></a>
                            <div class="clear"></div>
                        </div>
                    </div>
                <div class="layerBoxCon" style="width: 300px; height: auto; ">
                 	<div class="groupLayer">
                        <div class="inputBox">分组名：<input id="group_newname" type="text" value="输入分组名字"></div>
                        <div id="errorTs" class="errorTs" style="display: none; "></div>
                        <div class="btns">
                         	<a id="group_submit" href="javascript:sendTypename('group_newname','${pageNumber}')" class="btn_normal">
                            	<em>确定</em>
                            </a>
                            <a onclick="closeDialog('follow_group')" href="javascript:void(0)" class="btn_normal">
                            	<em>取消</em>
                            </a>
                         </div>
                     </div>
                  </div>
                </div>
            </td>
            <td class="mid_r"></td>	
         </tr>
         <tr>
         	<td class="bottom_l"></td>
            <td class="bottom_c"></td>
            <td class="bottom_r"></td>
         </tr>
      </tbody>
     </table>
</div>
</form>
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
