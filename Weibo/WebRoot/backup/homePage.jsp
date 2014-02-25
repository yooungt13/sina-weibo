<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>我的首页</title>
		


<!--
<link href="http://img.t.sinajs.cn/t35/style/css/common/index.css?version=20110926202507" type="text/css" rel="stylesheet" />
<link id="skin_transformers" href="http://img1.t.sinajs.cn/t35/skin/skin_001/skin.css?version=20110926202507" type="text/css" rel="stylesheet" />
-->
<link href="css/index.css" type="text/css" rel="stylesheet" />
<link href="css/skin.css" type="text/css" rel="stylesheet" />
<link href="css/layer.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/index.js"></script>


</head>
<body>
	<div class="MIB_bloga">
		<div class="MIB_blogb">
		<div class="tsina_gnbarea" id="WB_box_1318070134145">
        	<div class="bg_gnbarea">&nbsp;</div>
            <div id="" class="tsina_gnb">
  				<ul class="gnb_r">
                	<li><a href="homePage.html" id="">${sessionScope.user.nickName }</a> </li>
                    <li><a href="messages.html">私信</a> </li>
                    <li><a href="systemNotice.html">通知</a> </li>
                    <li><a href="user.html">帐号设置</a> </li>
                    <li class="line">|</li>
					<li><a id="" href="login.html">退出</a> </li>
                </ul>
            </div>
        </div> 			
<div class="header">
  <div class="head_menu">
		<span class="menu_l">&nbsp;</span>
		<div class="menu_c">
			<div class="bg_menu_c">&nbsp;</div>
			<ul>
				<li class="cur"><a href="Page.action?pageNumber=1">我的首页</a></li>
                <li class="line">|</li><li><a href="myProfPage.action?pageNumber=1">我的微博</a></li>
                <li class="line">|</li><li><a href="follow.html">好友</a></li>
			</ul>
			<div class="search" id="m_search">
				<input type="text" id="m_keyword" autocomplete="off" dycolor="false" title="搜索微博、找人" accesskey="3" />
				<a class="submit" href="search.html" id="m_submit">搜索</a>
			</div>
		</div>
		<span class="menu_r">&nbsp;</span>
	</div>
	<div id="m_keyword_tip" class="resultTip" style="display:none"></div> 
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
			<div class="picborder_r lf" id="pop_1"><a href=""><img class="person_icon" src="" pop="true" alt="" /></a></div>
			<div class="lf">
			<p class="font_14"><a href="profile.html" uid="1883145382" namecard="true" title="${sessionScope.user.nickName }">${sessionScope.user.nickName }</a>			</p>
						<p><em>湖南</em><em>长沙</em></p></div>
			</div>
			  <div class="user_atten MIB_linedot">
				<ul id="profile_following_follower_update">
					<li id="pop_2" class="MIB_line_r">
					<div class="num" pop="true">0</div>
					<a href="follow.html">关注</a></li>
					<li class="MIB_line_r"><div class="num"><a href="" id="myfans">0</a></div>
					<a href="fans.html">粉丝</a></li>
					<li class=""><div class="num"><a href="" id="mblog">0</a></div>
					<a href="profile.html">微博</a></li>
				</ul>
			</div>
		</div>

<div class="right_nav"><ul>
			<li id="li_myprofile" class="cur MIB_txtar"> <a href="homePage.html">我的首页</a></li>
			</ul><ul><li><a href="atMe.html">@提到我的</a></li><li><a href="comments.html">我的评论</a></li><li><a href="favs.html">我的收藏</a></li></ul></div><div id="ads_35"></div><div wbml="widget" name="app4"></div><div wbml="widget" name="app20"></div><div wbml="widget" name="app5"></div><div wbml="widget" name="app6"></div><div id="ads_47"></div><div id="ads_37"></div><div id="ads_36"></div>
					  </div>
						<!--/右栏内容 -->
						<!--左栏内容 -->
						<div class="mainL MIB_600 MIB_txtal MIB_linkal" id="indexMainL" >
							<div class="MIB_mbloghead">
    <div class="MIB_mblogbox">
        <form action="Profile.action" method="post" name="prof" id="pubProfile">
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
                <div class="wordNumBg" id="publisher_info">请文明发言，还可以输入<span>140</span>字</div>
				<div class="postOptionBg" >
					<div class="OnTit" id="publisher_faces">
						<img src="" class="small_icon faceicon" title="表情" />
						<a href="javascript:void(0)" tabindex="2">表情</a>
					</div>
                    <div class="OnPic"  id="pop_7" >
                        <span id="publisher_image" pop="true" poptype="1">
                        	<img src="" class="small_icon picnormal" title="图片" /><a href="####" tabindex="3" >图片</a>
						</span>
                    </div>
                    <div class="OnTit" id="publisher_video">
                        <img src="" title="视频" class="small_icon videoicon" /><a href="javascript:void(0);" tabindex="4">视频</a>
					</div></div>
                <div class="postBtnBg">
                    <a href="javascript:toSubmit('pubProfile');" id="publisher_submit" tabindex="8" title=""></a>
                </div>
                 <div class="inputarea" style="display:block">
					<label for="publish_editor" style="display:none;">微博输入框</label>
                    <textarea tabindex="1" accesskey="1" name="prof.profContent" cols="" rows="" id="publish_editor" title=""></textarea>
                </div>
            </div>
        </div>
        </form>
    </div>
</div>
<!--内容区 -->
<div class="MIB_mbloglist">
<!--推荐引导区 -->
<!--/推荐引导区 -->
	
<!-- new分组+筛选 -->	
<div class="newFilter MIB_txtal" id="MIB_newFilter" >
	<div  class="nfTagB nfTagOff">
		<ul>
			<li class="current"><span _link="">所有分组</span></li>					
			<li><a href="">相互关注</a></li><li class="MIB_line_l">|</li>
			<li class="addNew" tip="1"><a href="javascript:void(0);" id="MIB_creategroup"><em>+</em><cite>创建分组</cite></a></li>
		</ul>
		<div id="feed_sort" class="timeHot_feed">
        	 排序：<a href="" class="cur">时间</a> | <a href="">兴趣</a>
    	</div>
		<div class="clear"></div>
	</div>                             
</div>
<!-- /new分组+筛选 -->		

<!-- /微博内容开始 -->
<c:forEach items="${profList}" var="prof">
<ul class="MIB_feed" id="feed_list" isWrite="1">
<li class="MIB_linedot_l" id="">
  <div class="head_pic"><a namecard="true" uid="" href="" ><img title="用户A" uid="" imgtype="head" / ></a>
</div>
  <div class="MIB_feed_c">
<p class="sms" mid="" type="1">
<a namecard="true" uid="" href="" title="${prof.publishName}">
<c:out value="${prof.publishName}"/>
</a>：
<img src="" title="泪" type="face" />
<c:out value="${prof.profContent}"/>
</p>
<div class="feed_preview" id="">
<div class="feed_img"><a onclick="" href="javascript:;"><img src="" class="imgicon" vimg="1" /></a></div>
<div class="clear"></div>
</div>
<div class="MIB_assign" id="" style="display:none;" > 
</div>

<div class="feed_att MIB_linkbl MIB_txtbl">

<div class="lf"><cite><a href="" onclick=""><strong date="1317044128">${prof.subTime}</strong></a></cite>

<strong lang="CL1006">来自</strong><cite><a href="" target="_blank"  onclick="">${prof.publishName}</a></cite></div>
<div class="rt"><!-- 转发 -->
<a href="javascript:void(0);" id="add_group1" onclick="showDialog('transmit');"><strong>转发</strong><strong>()</strong></a>
<!-- 转发 -->
<span class="MIB_line_l">|</span>
<a href="javascript:void(0);" onclick=""><strong lang="CL1003">收藏</strong></a>
<!-- 评论 -->
	<span class="MIB_line_l">|</span>
		<a id="" href="javascript:void(0);" onclick="onClickShowDialog('group_${prof.profId}')" ><strong>评论</strong><strong>()</strong></a>
	<!-- 评论 -->
	 </div>
    </div>
    <div id=""></div>
	<div class="MIB_assign rt" popcontainer="true" id="group_${prof.profId}" style="display:none" > 
	  <div class="MIB_asarrow_r"></div>
	  <div class="MIB_assign_t"></div>
	  <div class="MIB_assign_c MIB_txtbl">
				<div class="logininput new_position">
     <a title="表情" href="javascript:void(0);" class="faceicon1" onclick=""></a>
			<textarea id="" style="overflow-y: hidden; font-family: Tahoma, 宋体; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; word-wrap: break-word; line-height: 18px; overflow-x: hidden; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; font-size: 12px; height: 22px; " class="lf"></textarea>
			<a class="btn_normal" id="" href="javascript:void(0);"><em>评论</em></a>
			<div class="margin_b MIB_txtbl ml35">
				<p><input type="checkbox" id=""><label for="">同时转发到我的微博</label></p>
				<p><input type="checkbox" id=""><label for="">同时评论给原文作者 您不知道的事</label></p>			</div>
		</div>
		
<!-- /评论内容开始 -->	
<ul class="PL_list oddline">
	<li class="MIB_linedot3" cacheid="8" onmouseover="" onmouseout="">
		<a href=""><img namecard="true" uid="" class="picborder_l lf" title="" src=""></a>
		<div class="txt">
			<div class="txtinfo">
				<a namecard="true" uid="" href="" action-type="namecard">用户J</a> 
				<img src="" title="无" type="face" />
				<span class="MIB_txtbl">(10月30日 20:53)</span>
			</div>
			<p class="MIB_more MIB_linkbl">
				<span class="MIB_line_l" style="visibility: hidden; "></span>
				<a href="javascript:void(0);" onclick="" class="lose">回复</a>
			</p>
		</div>
		<span class="clear"></span>
	</li>
</ul>
<!-- /评论内容结束 -->	

			</div>
			<div class="MIB_assign_b"></div>
		</div>	
	</li>
</ul>
</c:forEach>
<!-- /微博DIV显示完毕 -->

<!--翻页-->

    <a href="refreshPage.action?pageNumber=1">首页</a>    
    <c:if test="${pageNumber>1}">  
        <a href="refreshPage.action?pageNumber=${pageNumber-1}">上一页</a>  
    </c:if>    
    跳转到第 <select name="pageNumber" onchange="refreshPage.action">  
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
    </select>页    
    <c:if test="${pageNumber<pageBean.totalPages}">  
        <a href="refreshPage.action?pageNumber=${pageNumber+1}">下一页</a>  
    </c:if>    
    <a href="refreshPage.action?pageNumber=${pageBean.totalPages}">末页</a>  

<!--翻页-->
							  </div>
						  </div>
							<!--/内容区 -->
						</div>
						<!--/左栏内容 -->

					</div>

				</div>

	    </div>
			<!--/正文-->
			<div id="ads_bottom_1"></div>
		</div>
	</div>
	
<div id="transmit" style="position: absolute; z-index: 850; visibility: visible; display:none;">
<table class="mBlogLayer"></table>
    <table class="mBlogLayer">
    <tbody><tr>
        <td class="top_l"></td>
        <td class="top_c"></td>
        <td class="top_r"></td></tr><tr>
        <td class="mid_l"></td>
        <td class="mid_c">
            <div class="layerBox">
            	<div class="layervote layerMoveto">
            		<div class="layerMedia_close"><a href="javascript:;" title="关闭" node-type="close" onclick="return false;" class="close"></a></div>
           	 			<div style=" width:450px;" node-type="inner" class="layerBoxCon">
            				<div class="shareLayer">
            					<div class="laymoveText" node-type="rootFeed"><a href="/1840384974" target="_blank">@涛苑</a>：......</div>
            					<div class="enterBox_topline">
            						<div class="lf"><a class="faceicon1" action-type="face" href="javascript:void(0);" title="表情"></a></div>
            						<div node-type="limit" style="color:#008800; height:22px;line-height:22px;overflow:hidden" class="rt">
                                    	<span class="normal">还可以输入***个汉字</span>
                                    </div>
                                </div>
            					<textarea style="overflow-y: hidden; color: rgb(51, 51, 51); font-family: Tahoma, 宋体; word-wrap: break-word; font-size: 14px; line-height: 18px; overflow-x: hidden; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); height: 35px; " node-type="editor" limit="140" class="PY_textarea" defaultvalue="顺便说点什么吧..."></textarea>
            					<div node-type="sync" class="selSend">
            					<p><input type="checkbox" id="isLast" name="isLast" node-type="isLast">
            					<label node-type="isLastLabel" for="isLast">同时评论给...</label></p>
            					<p><input type="checkbox" id="isRoot" name="isRoot" node-type="isRoot">
            					<label node-type="isLastLabel" for="isRoot">同时评论给原文作者 </label></p>
							</div>
            				<div class="MIB_btn">
                                <a href="javascript:;" id="group_submit" class="newabtn_ok">
                                <em>转发</em>
                                </a>
                                <a href="javascript:;" id="group_cancel" class="btn_notclick" onclick="closeDialog('transmit')">
                                <em>取消</em>
                                </a>
            				</div>
           				</div>
            		</div>
            	</div>
            </div>
        </td>
        <td class="mid_r"></td></tr>
        <tr><td class="bottom_l"></td>
        <td class="bottom_c"></td>
        <td class="bottom_r"></td>
        </tr>
        </tbody>
    </table>
</div>




</body>
</html>