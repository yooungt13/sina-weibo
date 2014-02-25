<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>我的微博</title>
		


<!--
<link href="http://img.t.sinajs.cn/t35/style/css/common/index.css?version=20110926202507" type="text/css" rel="stylesheet" />
<link id="skin_transformers" href="http://img1.t.sinajs.cn/t35/skin/skin_001/skin.css?version=20110926202507" type="text/css" rel="stylesheet" />
-->
<link href="/Weibo/css/index.css" type="text/css" rel="stylesheet" />
<link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
<link href="/Weibo/css/layer.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/Weibo/js/jquery.js"></script>
<script type="text/javascript" src="/Weibo/js/index.js"></script>

</head>
<body>
	<div class="MIB_bloga">
		<div class="MIB_blogb">
		<div class="tsina_gnbarea" id="">
        	<div class="bg_gnbarea">&nbsp;</div>
            <div id="WB_weiboTop_1318070134145" class="tsina_gnb">
  				<ul class="gnb_r">
                	<li><a href="homePage.html" id="">涛苑</a> </li>
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
						<li><a href="Page.action?pageNumber=1">我的首页</a></li><li class="line">|</li>
						<li class="cur"><a href="myProfPage.action?pageNumber=1">我的微博</a></li>
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
		
    <!--/顶托盘-->
    <!--logo-->
    <!--/logo-->
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
				<li  class="MIB_line_r"><div class="num" pop="true"><a href="" id="attentions">0</a></div>
			    <a href="follow.html">关注</a></li>
				<li class="MIB_line_r"><div class="num"><a href="" id="myfans">0</a></div>
			    <a href="fans.html">粉丝</a></li>
			  <li class=""><div class="num"><a href="" id="mblog">0</a></div>
				<a href="profile.html">微博</a></li>
            </ul>
			<div class="f_pro">
			  <div class="title font_14 MIB_linkcr"><a href="myBlog.html" target="_blank">我的资料</a></div>
			  <ul class="con">
			    <li class="MIB_dot">***大学</li>
			    <li class="MIB_dot">***高中 </li>
		      </ul>
		    </div>
			<div class="f_pro">
              <div class="title font_14 MIB_linkcr"><a href="" target="_blank">***的标签</a></div>
	          <ul class="con">
	            <table width="158" height="107" border="0">
                  <tr>
                    <td>标签1</td>
                  </tr>                
                </table>
	          </li>
              </ul>
             <a href="tag.html">标签管理</a></div>
	        <p>&nbsp;</p>
		  </div>
			</div>
			
		<div wbml="widget" name="app43"></div>
		<div wbml="widget" name="app41"></div>
		<div wbml="widget" name="app15"></div>
		<div wbml="widget" name="app11"></div>
		<div wbml="widget" name="app5"></div>
		<div wbml="widget" name="app9"></div>
        </div>
        <!--/右栏内容 -->
        
<!--左栏内容 -->
<div class="mainL MIB_600 MIB_txtal MIB_linkal" id="profileL">
	<!--发布区 -->
	<div class="MIB_mbloghead" id="profileHead">
    	<div class="MIB_mbloglist" id="profileHeadBg">
        	<div class="other_headpic"><a href=""><img src="" title="涛苑" /></a></div>
            <div class="other_info">
				<div class="name MIB_txtal">
					<span class="lf">涛苑</span>
					<span class="aboutwho rt"><a id="publisher" href="javascript:void(0)"  onclick="">我要发微博</a></span>
				</div>
				<p><a href="user.html">个人资料</a></p>
				<div class="ad MIB_txtbl">湖南,长沙</div>
				<p class="blog MIB_txtbl"><a href="g">添加</a><em style="color:#707070;">自己的博客地址</em></p>
				<p class="MIB_txtbl">快来<a href="">介绍一下自己</a>，获得更多人关注吧！</p>
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
					<li ><a href="myBolg.html">我的资料</a></li>
				</ul>
				<div class="clear"></div>
			</div>
		</div>
		
		<!--列表-->
		<ul class="MIB_feed onlytxt" id="feed_list">
			<c:forEach items="${profList}" var="prof">
			<li class="MIB_linedot_l" id="">
				<div class="MIB_feed_c">     
					<p class="sms" mid="" type="3">${prof.profContent}</p>
					<!-- /转发微博内容 -->
					<c:if test="${prof.tcId != 0}"> 
    				<div class="MIB_assign">
  						<div class="MIB_asarrow_l"></div>
  						<div class="MIB_assign_t"></div>
  						<div class="MIB_assign_c MIB_txtbl"> 
						    <p class="source" mid="" type="2">
						    	<a href="" namecard="true" uid=""><img src="" title="${prof.publishName}" type="face" />
							</p>
    						<div class="feed_preview" id="">
            					<div class="feed_img">
            						<a onClick="" href="javascript:void(0);"><img class="imgicon" src="" vimg="1" /></a>
      							</div>
            					<div class="clear"></div>
    						</div>
    						<div class="blogPicOri" id="" style="display:none;" > </div>
							<div class="feed_att MIB_linkbl MIB_txtbl">
								<div class="lf">
									<cite><a href=""  onclick=""><strong>${prof.subTime}</strong></a></cite> 
									<strong>来自</strong><cite><a href="" target="_blank"  onclick="">${prof.publishName}</a></cite>
								</div>
								<div class="rt">
									<a href="" onclick="">转发<strong rid="" type="rttCount">()</strong></a>
									<span class="MIB_line_l">|</span>
									<a href="" onclick="">评论<strong  rid="" type="commtCount">()</strong></a>
								</div>
							</div>
     					</div>
  						<div class="MIB_assign_b"></div>
					</div>
					</c:if>
					<!-- /转发微博内容结束 -->
					<div class="feed_att MIB_linkbl MIB_txtbl">
						<div class="lf">
							<cite><a href="" onclick=""><strong>${prof.subTime}</strong></a></cite>
							<strong lang="CL1006">来自</strong><cite><a href="" target="_blank" onclick="">${prof.publishName}</a></cite>
						</div>
						<div class="rt">
							<strong><a href="javascript:void(0);" onclick="showDialog('profile_cancel')"><strong lang="CX0043">删除</strong></a>
							<span class="MIB_line_l">|</span></strong>
							<!-- 转发 -->      
							<a href="javascript:void(0);" onclick="showDialog('profile_group')"><strong>转发</strong><strong>()</strong></a>
							<!-- 转发 -->
							<span class="MIB_line_l">|</span>
							<a href="javascript:void(0);" onclick="showDialog('profile_favs')"><strong lang="CL1003">收藏</strong></a>
							<!-- 评论 -->
							<span class="MIB_line_l">|</span>
							<a id="" href="javascript:void(0);" onclick="onClickShowDialog('group_${prof.profId}')"><strong>评论</strong><strong>()</strong></a>
							<!-- 评论 -->
						</div>
    				</div>
    				<div id=""></div>
    				
					<div class="MIB_assign rt" popcontainer="true" id="group_${prof.profId}" style="display: none; "> 
						<div class="MIB_asarrow_r"></div>
						<div class="MIB_assign_t"></div>
						<div class="MIB_assign_c MIB_txtbl">
						<div class="logininput new_position">
				     		<a title="表情" href="javascript:void(0);" class="faceicon1" onclick=""></a>
							<textarea id="" style="overflow-y: hidden; font-family: Tahoma, 宋体; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; word-wrap: break-word; line-height: 18px; overflow-x: hidden; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; font-size: 12px; height: 22px; " class="lf"></textarea>
							<a class="btn_normal" id="" href="javascript:void(0);"><em>评论</em></a>
							<div class="margin_b MIB_txtbl ml35">
								<p><input type="checkbox" id=""><label for="">同时转发到我的微博</label></p>
								<p><input type="checkbox" id=""><label for="">同时评论给原文作者 您不知道的事</label></p>
							</div>
						</div>
		
						<!-- /评论内容开始 -->	
						<ul class="PL_list oddline">
							<li class="MIB_linedot3" cacheid="8" onmouseover="" onmouseout="">
								<a href=""><img namecard="true" uid="" class="picborder_l lf" title="" src=""></a>
								<div class="txt">
									<div class="txtinfo">
										<a namecard="true" uid="" href="" action-type="namecard">用户J</a> 
										<img src="" title="无" type="face">
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
				</div>
			</li>
			</c:forEach>
		</ul>
		<!--/列表-->
		
		<div class="MIB_bobar"></div>
		<!--翻页-->
		              
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
  </div>
  <div id="profile_group" style="position: absolute; z-index: 850; visibility: visible; display:none;">
<table class="mBlogLayer"></table>
<table class="mBlogLayer"><tbody><tr>
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
<div class="laymoveText" node-type="rootFeed"><a href="/1840384974" target="_blank">@您不知道的事</a>：......</div>
<div class="enterBox_topline">
<div class="lf"><a class="faceicon1" action-type="face" href="javascript:void(0);" title="表情"></a></div>
<div node-type="limit" style="color:#008800; height:22px;line-height:22px;overflow:hidden" class="rt"><span class="normal">还可以输入***个汉字</span></div></div>
<textarea style="overflow-y: hidden; color: rgb(51, 51, 51); font-family: Tahoma, 宋体; word-wrap: break-word; font-size: 14px; line-height: 18px; overflow-x: hidden; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); height: 35px; " node-type="editor" limit="140" class="PY_textarea" defaultvalue="顺便说点什么吧..."></textarea>
<div node-type="sync" class="selSend">
<p><input type="checkbox" id="isLast" name="isLast" node-type="isLast">
<label node-type="isLastLabel" for="isLast">同时评论给...</label></p>
<p><input type="checkbox" id="isRoot" name="isRoot" node-type="isRoot">
<label node-type="isLastLabel" for="isRoot">同时评论给原文作者 您不知道的事</label>
</p>
</div>
<div class="MIB_btn">
<a href="javascript:;" id="group_submit" class="newabtn_ok"><em>转发</em></a><a href="javascript:;" id="group_cancel" class="btn_notclick" onclick="closeDialog('profile_group')"><em>取消</em></a></div></div></div></div></div></td>
<td class="mid_r"></td></tr>
<tr><td class="bottom_l"></td>
<td class="bottom_c"></td>
<td class="bottom_r"></td></tr>
</tbody>
</table>
</div>
<div style="position: absolute; clear: both; z-index: 1000; left: 634px; top: 380px; display: none; width: 202px; height: 77px;
 visibility: visible;" id="profile_favs"><div style=""><div class="miniPopLayer" style="width:200px;"><div class="txt1 gray6"><img class="tipicon tip4" src="http://img.t.sinajs.cn/t35/style/images/common/PY_ib.gif"><div>收藏成功</div></div><div style="" class="btn"><span><a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="closeDialog('profile_favs')"><em>确定</em></a></span></div></div></div></div></div>
 
<div style="position: absolute; clear: both; z-index: 1000; left: 634px; top: 380px; display: none; width: 202px; height: 77px;
 visibility: visible;" id="profile_cancel"><div style=""><div class="miniPopLayer" style="width:200px;"><div class="txt1 gray6"><img class="tipicon tip4" src="http://img.t.sinajs.cn/t35/style/images/common/PY_ib.gif"><div>确定要删除该微博？</div></div><div style="" class="btn"><span><a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="return false;"><em>确定</em></a></span><span><a style="width:39px;" class="newabtn_ok" href="javascript:void(0)" onclick="closeDialog('profile_cancel')"><em>取消</em></a></span></div></div></div></div></div>
</body>
</html>
