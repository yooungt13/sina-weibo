<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>
			加入微博 分享新鲜事
		</title>
		<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>
		<link href="css/tlogin_1.css" type="text/css" rel="stylesheet" />
		<link href="css/layout.css" type="text/css" rel="stylesheet" />
		<link href="css/regv4.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="js/index.js"></script>
		<script type="text/javascript" src="js/login_manage.js"></script>
	</head>
	<body onkeydown="keyLogin(event);">
		<div class="MB_wrap">
			<div class="login_top">
			</div>
			<div class="login_body">
				<div class="login_l">
					<div class="tit">
					</div>
					<div class="talking">
						<strong class="">
						</strong>
						<div class="coverl">
						</div>
						<div class="coverr">
						</div>
					</div>

				</div>
				<div class="reg_left" style="padding-top:30px;">
					<div style="display:none;" id="notice_tommail" class="notice1">
					</div>
					<div class="talking_list">
						<div class="tList_mdu1">
							<dl class="manlist">
								<dt>
									这些人正在用微博
								</dt>
								<dd>
									<ul class="userlist">
									<c:forEach items="${newcomList}" var="ncm">
										<li>
											<img  title="${ncm.nickName}" src="${ncm.myFace}" />
											<a href="" title="${ncm.nickName}">
												${ncm.nickName}
											</a>
										</li>
									</c:forEach>									
									</ul>
								</dd>
							</dl>
							<dl class="manlist">
								<dt>
									有趣的人
								</dt>
								<dd>
									<ul class="userlist">
									<c:forEach items="${famousList}" var="fms">
										<li>
											<img  title="${fms.nickName}" src="${fms.myFace}" />
											<a href="" title="${fms.nickName}">
												${fms.nickName}
											</a>
										</li>
									</c:forEach>
									</ul>
								</dd>
							</dl>
						</div>
						<div class="tList_mdu2">
							<dl class="twit_list">
								<dt>
									大家正在说
								</dt>
								<dd>
									<div class="maincontent" id="txtBoxCon" style="padding-top:10px;">
									<c:forEach items="${recentList}" var="prof">
										<div class="itemt">
											<div class="twit_item MIB_linedot2">
												<div class="twit_item_pic">
													<img style="width:50px;height:50px;" src="${prof.publishFace}" />											
												</div>
												<div class="twit_item_content">
													<a title="${prof.publishName}">${prof.publishName}</a>:&nbsp;${prof.publishContent}
													<div class="twit_item_time">${prof.subTime}	</div>
												</div>
											</div>
										</div>
									</c:forEach>
									</div>
								</dd>
							</dl>
						</div>
						<div class="clearit">
						</div>
					</div>
				</div>
				<div class="login_r">
					<div class="login_item">
						<div class="regtop">
							<a href="regist.jsp" target="_blank" class="regbtn" title="立即注册微博" tabindex="7">
							</a>
						</div>
						<form id="login" action="Login.action" method="post" name="login">
							<div class="loginform" id="login_form">
								<div class="input_bg">
									<input type="text" id="loginname" name="login.loginName" title="登录名" tabindex="1"
									onfocus="clearLogin(id);" value="请输入登陆名称" autocomplete="off" />
								</div>
								<div class="input_bg">
									<input type="text" id="password_text" tabindex="1" title="密码" onfocus="clearPassword();"
									value="请输入密码" />
									<input type="password" id="password" name="login.password" tabindex="1"
									title="密码" onblur="recoverPassword();" style="display:none;" />
								</div>
								<div id="door_p" style='display:none'>
									<div class="inputcodeM">
										<span class="input_code">
											<input type="text" id="door">
										</span>
										<img height="32" width="80" id="door_img" src="">
									</div>
									<div class="inputcodeM_sett">
										<a href="javascript:void(0)" id="door_change">
											看不清，换一换
										</a>
									</div>
								</div>
								<div class="setting">
									<span class="lf">
										<input type="checkbox" class="labelbox" id="remusrname" checked/>
										<label for="remusrname">
											下次自动登录
										</label>
									</span>
									<a class="rt" href="/Weibo/Admin/getPwd.action" target="_blank" tabindex="4">
										找回密码
									</a>
								</div>
								<div class="signin">
									<a href="javascript:void(0);" onclick="toSubmit('login');" class="sp" id="login_submit_btn" tabindex="2">
									</a>
								</div>
								<div align="center">
									<br>
									<br>
									<br>
									<p>
										${sessionScope.error}
									</p>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="clearit">
				</div>
			</div>
			<div class="bodybt">
				<div class="MIB_foot_new MIB_txtbr MIB_linkbr" style="text-align:center;">
					<p>
					</p>
					<p>特别声明：本网站用于学习参考，严禁一切商业行为。如有违反，后果自负。</p>
					<p>Copyright © 2011-2013<a href="http://weibo.com/yooungt">有田十三</a>All Rights Reserved.
					</p>
					<p>
					</p>
				</div>
			</div>
	</body>
</html>
