<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>找人</title>
		
		<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>
		<link rel="shortcut icon" href="/Weibo/css/img/weibo.ico"/>
		<link href="/Weibo/css/connect.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet"/>
		<link href="/Weibo/css/person_connect.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/right_module.css" type="text/css" rel="stylesheet" />
					
		<script type="text/javascript" src="/Weibo/js/index.js"></script>
		<script type="text/javascript" src="/Weibo/js/json.js"></script>
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
				<!--/顶托盘-->
				<div class="MIB_blogbody">
					<div id="controlpanel" class="MIB_mblogbgr">
						<div class="MIB_mblogbgl"> 
							<!--右栏内容 -->
							<div class="mainR MIB_200 MIB_txtar MIB_linkar">
								<div class="cetUsIn">
                                <!--个人信息-->
									<div class="user_head">
										<div class="picborder_r lf" id="pop_1"><a href="/Weibo/myProfPage.action?pageNumber=1"><img class="person_icon" src="${sessionScope.user.myFace}"" pop="true" alt="" /></a></div>
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
												<div class="num"><a href="myProfPage.action?pageNumber=1" id="mblog">${sessionScope.user.profileCount}</a></div>
												<a href="myProfPage.action?pageNumber=1">微博</a>
											</li>
										</ul>
									</div>
                                </div>
                                <div class="cetUsLtTit">
                                     <h3><a href="/Weibo/MyBlog/myFollowpage.action?pageNumber=1&listType=1">我的关注</a></h3>
                                     <div class="linedot"></div>
                                </div>
                                <div class="cetUsLtTit">
                                     <h3><a href="/Weibo/MyBlog/myFanspage.action?pageNumber=1&listType=1">
									    我的粉丝</a><em></em>
									 </h3>
                                     <div class="linedot"></div>
                                </div>

                                <div class="cetUsLtTit cutcurr">
                                     <h3>找人</a><em></em></h3>
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
						<!-- 全部 ==============================================   -->
						<div class="mainL MIB_600 MIB_txtal MIB_linkal fps_wrap">
							<div class="cetSearch cetSYq">
								<div class="btmTit_wrap searchLTitle">
									<div class="csTitle">找人</div>
									<p class="gray9">你只需敲敲键盘，就能找到你想找的人</p>
								</div>
								<!--按昵称查找-->
								<div class="MIB_linedot2">
									<h3 class="lf searchTit">
										<a href="javascript:void(0);" id="nickname_updown">
											按昵称查找
											<span class="arrowup"></span>
										</a>
									</h3>
									<div class="jh_attenTopNote" style="" id="nickname_content">
										<p class="t2 gray6">这里输入朋友的姓名或昵称，如：涛苑</p>
										<table cellspacing="0" cellpadding="0" border="0" class="tab">
											<tbody>
												<tr>
													<td>
														<div class="inputBg lf">
															<input type="text" class="fm_txt wdt1 sf_input1" id="nickname_input" name="nickName"
															style="color: rgb(153, 153, 153);" autocomplete="off"/>
														</div>
														<a class="btn_normal font_14" href="javascript:searchByName('nickname_input',1);" id="nickname_btn">
															<em>查找</em>
														</a>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!--end按昵称查找-->
								<!--按标签查找-->
								<div class="MIB_linedot2">
									<h3 class="lf searchTit">
										<a href="javascript:void(0);" id="hobby_updown">
											按标签查找
											<span class="arrowup">
											</span>
										</a>
									</h3>
									<div class="jh_attenTopNote" style="" id="hobby_content">
										<p class="t2 gray6">输入你的兴趣爱好，找到更多同类。如：音乐</p>
										<table cellspacing="0" cellpadding="0" border="0" class="tab">
											<tbody>
												<tr>
													<td>
														<div class="inputBg lf">
															<input type="text" class="fm_txt wdt1 sf_input1" value="" id="hobby_input"
															style="color: rgb(153, 153, 153);" />
														</div>
														<a class="btn_normal font_14" href="javascript:previousBox();" id="hobby_btn">
															<em>查找</em>
														</a>
													</td>
												</tr>
												<tr>
													<td>
														<div class="tbl_rowh fdB_tips">
															<p class="btn_grnbq">
																<span>我的标签</span>
															</p>
															<a href="">天下无爱</a>
															<a href="">微博控</a>
															<a href="">23K氦金狗眼</a>
															<a href="">风中凌乱的小萝卜</a>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!--end按标签查找-->
								<!--按邮箱查找-->
								<div class="MIB_linedot2">
									<h3 class="lf searchTit">
										<a href="javascript:void(0);" id="mail_updown">
											按邮箱查找
											<span class="arrowup">
											</span>
										</a>
									</h3>
									<div style="" class="n_co_naviConn sf_msn" id="mail_tab">
										<div class="le">
											<div class="inli">
												<span class="a">邮箱地址：</span>
												<span class="b">
													<input type="text" value="" name="user" class="fm_txt" style="width: 80px; height: 18px; vertical-align: middle; color: rgb(153, 153, 153);"id="fi3" />
													<em class="at" style="margin: 0pt 5px;">@</em>
													<select style="color: rgb(102, 102, 102); height: 22px; vertical-align: middle;"
													id="emailHost" name="type">
														<option value="10">请选择邮箱类型</option>
														<option value="0">sina.com</option>
														<option value="2">gmail.com</option>
														<option value="3">163.com</option>
														<option value="4">126.com</option>
													</select>
												</span>
											</div>
											<div class="inli2">
												<span class="a">输入完整帐号，如weibo@taughan.com</span>
											</div>
											<div class="inli3">
												<span class="a">
													<a class="btn_normal" href="javascript:previousBox();" id="mail_invitebtn">
														<em>查找</em>
													</a>
												</span>
											</div>
											<div class="inliErr">											
											</div>
										</div>
										<div class="rig"></div>
	
									</div>
								</div>
								<!--end按邮箱查找-->
								<!--按学校查找-->
								<div class="MIB_linedot2">
									<h3 class="lf searchTit">
										<a href="javascript:void(0);" id="school_updown">
											按学校查找
											<span class="arrowup">
											</span>
										</a>
									</h3>
									<div class="sf_interest" id="school_content">
										<div class="cmli">
											<span class="a">昵称：</span>
											<span class="b">
												<input type="text" name="" class="sf_input2" id="school_user_ipt" value="请输入他的昵称"
												maxlength="30" />
											</span>
										</div>
										<div class="cmli">
											<span class="a">学校：</span>
											<span class="b">
												<input type="text" name="" class="sf_input2" id="school_name_ipt" maxlength="30"
												/>
											</span>
											<span class="c">
											</span>
										</div>
										<div class="cmli1">
											<span class="a">
												<a class="btn_normal" href="javascript:previousBox();" id="school_btn">
													<em>查找</em>
												</a>
											</span>
										</div>
									</div>
								</div>
								<!--end按学校查找-->
								<!--按地区查找-->
								<div class="MIB_linedot2">
									<h3 class="lf searchTit">
										<a href="javascript:void(0);" id="location_updown">
											按地区查找
											<span class="arrowup">
											</span>
										</a>
									</h3>
									<div class="sf_interest" id="location_content">
										<div class="cmli">
											<span class="a">昵称：</span>
											<span class="b">
												<input type="text" name="" class="sf_input2" value="请输入他的昵称" id="location_ipt"
												maxlength="30" />
											</span>
										</div>
										<div class="cmli">
											<span class="a">地区：</span>
											<span class="b">
												<select id="location_province" truevalue="43">
												</select>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<select id="location_city" truevalue="1">
												</select>
											</span>
											<span class="c">
											</span>
										</div>
										<div class="cmli">
											<span class="a">性别：</span>
											<span class="b sel_sex">
												<label for="man">
													<input name="sex" type="radio" value="man" id="man" />
													&nbsp;男
												</label>
												<label for="women">
													<input name="sex" type="radio" value="women" id="women" />
													&nbsp;女
												</label>
												<label for="nolimte">
													<input name="sex" type="radio" value="0" id="nolimte" checked="true" />
													&nbsp;不限
												</label>
											</span>
										</div>
										<div class="cmli">
											<span class="a">年龄：</span>
											<span class="b">
												<select id="age" name="age">
													<option value="" selected="true">不限</option>
													<option value="18y">18岁以下</option>
													<option value="22y">19~22岁</option>
													<option value="29y">23~29岁</option>
													<option value="39y">30~39岁</option>
													<option value="40y">40岁以上</option>
												</select>
											</span>
										</div>
										<div class="cmli1">
											<span class="a">
												<a class="btn_normal" href="javascript:previousBox();" id="location_save_btn">
													<em>查找</em>
												</a>
											</span>
										</div>
									</div>
								</div>
								<!--end按地区查找--->
							</div>
						</div>
						<!-- /全部 ==============================================  --> 
						<!--/左栏内容 --> 
					</div>
				</div>
			</div>
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