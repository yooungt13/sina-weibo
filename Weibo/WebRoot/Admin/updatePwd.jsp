<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[899,1,49] published at 2011-09-01 00:06:14 from #187 by 2602-->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>
			找回密码
		</title>
		<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>
		<link href="/Weibo/css/tlogin_1.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/regv4.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/layout.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/setup.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="/Weibo/js/index.js"></script>
		<script type="text/javascript" src="/Weibo/js/updatePwd.js"></script>
		<script type="text/javascript" src="/Weibo/js/system_manage.js"></script>
		<style>
			body{ background-color:#9EDFE8; }
		</style>
	</head>
	<body>
		<div class="MB_wrap">
			<div class="login_top"></div>
			<div class="login_body">
				<div class="login_l">
					<div class="tit"></div>
					<div class="talking">
						<strong class=""></strong>
						<div class="coverl"></div>
						<div class="coverr"></div>
					</div>
					<div class="talking_list">
						<div class="clearit"></div>
					</div>
				</div>
				<div class="reg_left" style="height:450px;background: url(/Weibo/css/img/btbg.png) no-repeat bottom;">
					<div class="info_tab01">
						<form action="/Weibo/Admin/confirmUpdatePwd.action" method="post" id="updatePwd">	
						<table>
							<tbody>
								<tr>
									<th class="gray1" style="font-weight:bold;">修改密码</th>
								</tr>
								<tr>
									<th scope="row" class="gray6"></th>
								</tr>
								<tr>
									<th scope="row" class="gray6">登陆名：</th>
									<td>
										<input type="text" name="log.loginName" class="PY_input gray6" value="${sessionScope.updatepwd.loginName}" readonly="readonly"/>
										<span style="display:none" class="errorTs2">
										</span>
									</td>
									<td id="new_password_td">
										<table class="cudTs3" id="red_npwd" style="display:none">
											<tr>
												<td class="topL"></td>
												<td></td>
												<td class="topR"></td>
											</tr>
											<tr>
												<td></td>
												<td class="tdCon"></td>
												<td></td>
											</tr>
											<tr>
												<td class="botL"></td>
												<td></td>
												<td class="botR"></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<th scope="row" class="gray6">新密码：</th>
									<td>
										<input type="password" id="newPwd" name="log.password" class="PY_input" onclick="onclickShowStyleOfNewPassword()" onblur="onblurValidateNewPassword('newPwd')"/>
										<span style="display:none" class="errorTs2">
										</span>
									</td>
									<td node-type="tip">
                                                        	<div class="setup_info" style="display: none;" id="successNewPwd">
                                                                <div class="info_tip2">
                                                                    <div class="tipicon tip3" title="">
                                                                    </div>
                                                                </div>
                                                                <div class="info_tip1">
                                                                </div>
                                                            </div>
                                                            <table class="cudTs" style="display:none" id="inputNewPwd1">
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="topL">
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                        <td class="topR">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                        </td>
                                                                        <td class="tdCon">
                                                                           输入长度为6-16位由数字英文字母及"_"组成的新密码
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="botL">
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                        <td class="botR">
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <table class="cudTs3" style="display:none;" id="errorNewPwd2">
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="topL">
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                        <td class="topR">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                        </td>
                                                                        <td class="tdCon">
                                                                           请输入合法的密码
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="botL">
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                        <td class="botR">
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
								</tr>
								<tr>
									<th scope="row" class="gray6">
										确认密码：
									</th>
									<td>
										<input type="password" class="PY_input" id="confirmPwd" onclick="onclickShowStyleOfConfirmPassword()" onblur="onblurValidateConfirmPassword('confirmPwd')">
										<span style="display:none" class="errorTs2">
										</span>
									</td>
									<td node-type="tip">
                                                        	<div class="setup_info" style="display: none;" id="successConfirmPwd">
                                                                <div class="info_tip2">
                                                                    <div class="tipicon tip3" title="">
                                                                    </div>
                                                                </div>
                                                                <div class="info_tip1">
                                                                </div>
                                                            </div>
                                                            <table class="cudTs" style="display:none" id="inputConfirmPwd1">
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="topL">
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                        <td class="topR">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                        </td>
                                                                        <td class="tdCon">
                                                                            再次输入新密码
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="botL">
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                        <td class="botR">
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <table class="cudTs3" style="display:none;" id="errorConfirmPwd2">
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="topL">
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                        <td class="topR">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                        </td>
                                                                        <td class="tdCon">
                                                                           与新密码不相符
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="botL">
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                        <td class="botR">
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
								</tr>
								<tr>
									<th scope="row">
									</th>
									<td>
										<div class="MIB_btn">
											<a href="javascript:onClickConfirmUpdatePwd('updatePwd');" id="submit_password" class="newabtngrn">
												<em>修改</em>
											</a>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						</form>
					</div>
					<div class="login_r">
						<div class="login_item">
							<div class="loginform" id="login_form">
								<div style="margin-bottom: 10px;width: 194px;height: 31px;">
						            <div align="center">已有微博帐号？ </div>
						        </div>
								
								<div class="signin">
									<a href="/Weibo/initLogin.action" class="sp" id="login_submit_btn" title="微博登录" tabindex="5">
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="clearit">
					</div>
				</div>
			</div>
			<div class="bodybt">
				<div class="MIB_foot_new MIB_txtbr MIB_linkbr" style="text-align:center;">
				    <p></p>		
				    <p>特别声明：本网站用于学习参考，严禁一切商业行为。如有违反，后果自负。</p>              
				    <p>Copyright © 2011-2013  <a href="http://weibo.com/yooungt">有田十三</a>  All Rights Reserved.</p>		
					<p></p>
				</div>
			</div>
	</body>

</html>
