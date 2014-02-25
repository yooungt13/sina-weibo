<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>管理微博</title>
	<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>
	<link href="/Weibo/css/manage.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
	
	<script type="text/javascript" src="/Weibo/js/system_manage.js"></script>
	<script type="text/javascript" src="/Weibo/js/index.js"></script>
	<script type="text/javascript" src="/Weibo/js/json.js"></script>
</head>

<body>
<div class="MIB_bloga"> 
	<!--顶托盘-->
	<div class="MIB_blogb"> 
		<div class="tsina_gnbarea" id="WB_box_1318070134145">
			<div class="bg_gnbarea">&nbsp;</div>
			<div id="WB_weiboTop_1318070134145" class="tsina_gnb">
				<ul class="gnb_r">
					<li><a href="/Weibo/Admin/initManage.action">管理员</a> </li>
					<li><a href="/Weibo/Admin/noticeList.action?pageNumber=1">通知</a> </li>
					<li><a href="/Weibo/exitLogin.action">退出</a> </li>
				</ul>
			</div>
		</div> 		
		<div class="header">
			<div class="head_menu app">
				<div class="search" id="m_search"> 
					<input type="text" id="m_keyword" autocomplete="off" title="搜索微博、找人" accesskey="3"/>
					<a class="submit" href="javascript:weiboSearch('m_keyword',1);" id="m_submit">搜索</a>
				</div> 
			</div> 
			<div id="m_keyword_tip" class="resultTip" style="display:none"></div> 
		</div> 

		<!--/顶托盘-->

		<div class="MIB_blogbody">
			<div id="controlpanel" class="MIB_mblogbgr">
				<div class="MIB_mblogbgl"> 
					<!--右栏内容 -->
					<div class="mainR MIB_200 MIB_txtar MIB_linkar"> <div class="cetUsIn">
						<div class="user_head">
							<div class="picborder_r">
								<a href=""><img src="/Weibo/Images/Faces/manager.jpg"/></a>
							</div>
							<div class="lf">
								<p class="font_14"><a href="/Weibo/Admin/initManage.action">管理员</a></p>
								<p><em>湖南</em><em>长沙</em></p>
							</div>
						</div>
						</div>
						<div class="cetUsLtTit">
							<h3></h3>
							<div class="linedot">
							</div>
						</div>
						<div class="cetUsLtTit">
							<h3>
								<a href="/Weibo/Admin/initManage.action">管理微博</a>
							</h3>
							<div class="linedot">
							</div>
						</div>
						<div class="cetUsLtTit">
							<h3>
								<a href="/Weibo/Admin/noticeList.action?pageNumber=1">发布通知</a>
							</h3>
						</div>
						<div class="linedot"></div>
					</div>
			  		<!--/右栏内容 --> 

					<!--左栏内容 --> 
					<div class="mainL MIB_600 MIB_txtal MIB_linkal fps_wrap">
					  <div class="cetSearch cetSYq">                    
							<div class="btmTit_wrap searchLTitle">
								<div class="csTitle">管理微博</div>
								<p class="gray9">进行管理员操作</p>
							</div>

							<!--按昵称查找-->                          
							<div class="MIB_linedot2">
								<h3 class="lf searchTit"><a href="javascript:void(0);" id="nickname_updown">查找昵称<span class="arrowup"></span></a></h3>
								<div class="jh_attenTopNote" style="" id="nickname_content">
									<p class="t2 gray6">这里输入昵称，如：涛苑</p>
									<table cellspacing="0" cellpadding="0" border="0" class="tab">
										<tbody>
											<tr>
												<td><div class="inputBg lf">
														<input type="text" class="fm_txt wdt1 sf_input1" value="" id="nickname_input" style="color: rgb(153, 153, 153);" />
													</div>
													<a class="btn_normal font_14" href="javascript:userSearch('nickname_input',1);"  id="nickname_btn"><em>查找</em></a></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<!--end按昵称查找--> 

							<!--按内容查找-->

							<div class="MIB_linedot2">
								<h3 class="lf searchTit"><a href="javascript:void(0);" id="hobby_updown">查找内容<span class="arrowup"></span></a></h3>
								<div class="jh_attenTopNote" style="" id="hobby_content">
									<p class="t2 gray6">输入需查找的内容</p>
									<table cellspacing="0" cellpadding="0" border="0" class="tab">
										<tbody>
											<tr>
												<td><div class="inputBg lf">
														<input type="text" class="fm_txt wdt1 sf_input1" id="hobby_input" style="color: rgb(153, 153, 153);" />
													</div>
												<a class="btn_normal font_14" href="javascript:weiboSearch('hobby_input',1);" id="hobby_btn"><em>查找</em></a></td>
											</tr>
											</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
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
</html>
