<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
	<%@ taglib prefix="s" uri="/struts-tags" %>
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
				<title>
					修改头像
				</title>
				<link rel="shortcut icon" href="/Weibo/css/img/v.png" />
				<link href="../css/setup.css" type="text/css" rel="stylesheet" />
				<link href="../css/skin.css" type="text/css" rel="stylesheet" />
				<script type="text/javascript" src="/Weibo/js/index.js">
				</script>
				<script type="text/javascript" src="/Weibo/js/system_manage.js">
				</script>
			</head>
			<body onload="refreshCount();">
				<div class="MIB_bloga">
					<div class="MIB_blogb">
						<div class="tsina_gnbarea" id="WB_box_1318070134145">
							<div class="bg_gnbarea">
								&nbsp;
							</div>
							<div id="" class="tsina_gnb">
								<ul class="gnb_r">
									<li>
										<a href="/Weibo/myProfPage.action?pageNumber=1" id="">
											${sessionScope.user.nickName }
										</a>
									</li>
									<li>
										<a href="/Weibo/frommsgList.action?pageNumber=1">
											私信
										</a>
									</li>
									<li>
										<a href="/Weibo/systemList.action?pageNumber=1">
											通知
										</a>
									</li>
									<li>
										<a href="/Weibo/Setting/Setting.action">
											帐号设置
										</a>
									</li>
									<li class="line">
										|
									</li>
									<li>
										<a id="" href="/Weibo/exitLogin.action">
											退出
										</a>
									</li>
								</ul>
							</div>
						</div>
						<!-- 小黄签 -->
						<div class="small_Yellow_div">
							<div class="small_Yellow" id="small_Yellow" style="display:none;">
								<table class="CP_w">
									<thead>
										<tr>
											<th class="tLeft">
												<span>
												</span>
											</th>
											<th class="tMid">
												<span>
												</span>
											</th>
											<th class="tRight">
												<span>
												</span>
											</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<td class="tLeft">
												<span>
												</span>
											</td>
											<td class="tMid">
												<span>
												</span>
											</td>
											<td class="tRight">
												<span>
												</span>
											</td>
										</tr>
									</tfoot>
									<tbody>
										<tr>
											<td class="tLeft">
												<span>
												</span>
											</td>
											<td class="tMid">
												<!-- 任何内容 开始 -->
												<div class="yInfo gray6" id="notice_yellow_tips">
												</div>
												<div class="close">
													<a href="javascript:onClickShowDialog('small_Yellow');">
													</a>
												</div>
												<!-- 任何内容 结束 -->
											</td>
											<td class="tRight">
												<span>
												</span>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="arrow">
								</div>
							</div>
						</div>
						<!-- /小黄签 -->
						<div class="header">
							<div class="head_menu">
								<span class="menu_l">
									&nbsp;
								</span>
								<div class="menu_c">
									<div class="bg_menu_c">
										&nbsp;
									</div>
									<ul>
										<li class="">
											<a href="/Weibo/Page.action?pageNumber=1">
												我的首页
											</a>
										</li>
										<li class="line">
											|
										</li>
										<li>
											<a href="/Weibo/myProfPage.action?pageNumber=1">
												我的微博
											</a>
										</li>
										<li class="line">
											|
										</li>
										<li>
											<a href="/Weibo/MyBlog/myFollowpage.action?pageNumber=1&listType=2">
												好友
											</a>
										</li>
									</ul>
									<div class="search" id="m_search">
										<input type="text" id="m_keyword" autocomplete="off" dycolor="false" name="profContent"
										title="搜索微博、找人" accesskey="3" />
										<a class="submit" href="javascript:search('m_keyword',1);" id="m_submit">
											搜索
										</a>
									</div>
								</div>
								<span class="menu_r">
									&nbsp;
								</span>
							</div>
						</div>
						<!--正文-->
						<div class="MIB_blogbody">
							<!--找朋友-->
							<div class="MIB_column">
								<div class="MIB_main_cont">
									<div class="MIB_setup">
										<!--页签-->
										<div class="PY_tag">
											<ul>
												<li>
													<div class="PY_tagn">
														<span>
															<a href="/Weibo/Setting/user.jsp">
																个人资料
															</a>
														</span>
													</div>
												</li>
												<li>
													<div class="PY_tago">
														<span class="bold">
															修改头像
														</span>
													</div>
												</li>
												<li>
												</li>
												<li>
													<div class="PY_tagn">
														<span>
															<a href="/Weibo/Setting/privacy.jsp">
																隐私设置
															</a>
														</span>
													</div>
												</li>
												<li>
													<div class="PY_tagn">
														<span>
															<a href="">
																个性设置
															</a>
														</span>
													</div>
												</li>
												<li>
												</li>
												<li>
												</li>
											</ul>
										</div>
										<!--/页签-->
										<!--个人资料-->
										<div class="setup_main">
											<div id="system_information" style="display:none">
											</div>
											<div id="div_flashupload" class="up">
												<div id="miniblog_photo_swf" style="text-align:center">
												</div>
												<table align="center" width="50%">
													<td>
														<s:fielderror cssStyle="color:red" />
													</td>
												</table>
												<!--表单 -->
												<table>
													<s:form action="upload" theme="simple" enctype="multipart/form-data">
														<table>
															<td>
																上传照片
															</td>
															<td style="padding-left:10px;">
																<s:file name="file" onchange="CheckPicture(this);">
																</s:file>
															</td>
															<td style="padding-left:5px;">
																<s:submit value="提交">
																</s:submit>
															</td>
															<td style="padding-left:5px;">
																<s:reset value="重置">
																</s:reset>
															</td>
														</table>
													</s:form>
												</table>
												<div style="color: #0082CB;padding:10px 0;">
													<p>
														仅支持JPG、GIF、PNG图片文件，且文件小于4M
													</p>
												</div>
												<div style="position:relative;top:20px;">
													<img src="${sessionScope.user.myFace}" style="width:180px;height:180px;">
													</img>
													<br/>大尺寸,180*180
												</div>
												<div style="position:relative;top:-175px;left:220px;">
													<img src="${sessionScope.user.myFace}" style="width:50px;height:50px;">
													</img>
													<br/>中尺寸,50*50
												</div>
												<div style="position:relative;top:-90px;left:220px;">
													<img src="${sessionScope.user.myFace}" style="width:30px;height:30px;">
													</img>
													<br/>小尺寸,30*30
												</div>
											</div>
											<!--/个人资料-->
										</div>
									</div>
								</div>
								<!--/找朋友-->
								<iframe frameborder="0" scrolling="no" width="800" src="/Weibo/Template/Copyright.jsp">
								</iframe>
							</div>
							<!--/正文-->
						</div>
					</div>
				</div>
				</div>
			</body>
		
		</html>