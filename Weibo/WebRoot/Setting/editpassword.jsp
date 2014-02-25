<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
 
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>修改密码</title>
<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>
<link href="../css/setup.css" type="text/css" rel="stylesheet" />
<link href="../css/skin.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/Weibo/js/index.js"></script>
<script type="text/javascript" src="/Weibo/js/editPassword.js"></script>
</head>

<body onload="refreshCount();">
<div class="MIB_bloga">
  <div class="MIB_blogb">

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
						<li class=""><a href="/Weibo/Page.action?pageNumber=1">我的首页</a></li>
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



<div class="MIB_blogbody">
	<div class="MIB_column">
		<div class="MIB_main_cont">
			<div class="MIB_setup">
				<!--页签-->
				<div class="PY_tag">
				<ul>
					<li><div class="PY_tago"> <span class="bold">个人资料</span></div></li>
					<li><div class="PY_tagn"><span><a href="/Weibo/Setting/myface.jsp">修改头像</a></span></div></li>
					<li><div class="PY_tagn"><span><a href="/Weibo/Setting/privacy.jsp">隐私设置</a></span></div></li>
					<li><div class="PY_tagn"><span><a href="">个性设置</a></span></div></li>

				</ul>
				</div>
			<div id="system_information" style="display:none"></div>
			<!--个人资料-->
			<div class="setup_main">
				<div class="infoTop">
					<div class="infoTop_nav">
						<span><a href="/Weibo/Setting/user.jsp">基本信息</a></span>
						<span class="navBorder gray9">|</span>
						<span class="edutop_cur">修改密码</span>
						<span class="navBorder gray9">|</span>
						<span><a href="/Weibo/Setting/educationinfo.jsp">教育信息</a></span>
						<span class="navBorder gray9">|</span>
						<span><a href="/Weibo/Setting/workinfo.jsp">职业信息</a></span>
						<span class="navBorder gray9">|</span>
						<span><a href="/Weibo/Setting/tag.jsp">个人标签</a></span>
					</div>
				</div>

                
			<form id="updatepassword"  action="updatePassword.action" method="post" name="updatepassword">
				<div class="title MIB_linedot2 title1">
                                        <span class="fb">
                                            修改密码
                                        </span>
                                    </div>
				<div class="info_tab01">
					<table>
						<tbody>
							<tr>
								<th scope="row" class="gray6">当前密码：</th>
									<td><input type="password" class="PY_input" id="oldPassword" name="oldpassword" onclick="onclickShowStyleOfOldPassword()" onblur="onblurValidateOldPassword('oldPassword')"></input><span style="display:none" class="errorTs2"></span></td>
									<td node-type="tip">
                                                        	<div class="setup_info" style="display: none;" id="successOldPwd">
                                                                <div class="info_tip2">
                                                                    <div class="tipicon tip3" title="">
                                                                    </div>
                                                                </div>
                                                                <div class="info_tip1">
                                                                </div>
                                                            </div>
                                                            <table class="cudTs" style="display:none" id="inputOldPwd1">
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
                                                                            输入当前密码
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
                                                            <table class="cudTs3" style="display:none;" id="errorOldPwd2">
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
                                                                           与当前密码不符
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
					<th scope="row" class="gray6">新 密 码：</th>
						<td><input type="password" id="newPassword" class="PY_input" name="updatepassword.password" onclick="onclickShowStyleOfNewPassword()" onblur="onblurValidateNewPassword('newPassword')"></input><span style="display:none" class="errorTs2"></span></td>
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
                                                                            输入长度为6-16位由数字英文及"_"组成的新密码
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
						<th scope="row" class="gray6">确认密码：</th>
						<td><input type="password" class="PY_input" id="confirmPassword" name="confirmpasswprd" onclick="onclickShowStyleOfConfirmPassword()" onblur="onblurValidateConfirmPassword('confirmPassword')"></input><span style="display:none" class="errorTs2"></span></td>
						<td node-type="tip">
                                                        	<div class="setup_info" style="display: none;" id="successConfirmPassword">
                                                                <div class="info_tip2">
                                                                    <div class="tipicon tip3" title="">
                                                                    </div>
                                                                </div>
                                                                <div class="info_tip1">
                                                                </div>
                                                            </div>
                                                            <table class="cudTs" style="display:none" id="inputConfirmPassword1">
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
                                                            <table class="cudTs3" style="display:none;" id="errorConfirmPassword2">
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
                                                                           与新密码不同，请重新输入
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

                        <th scope="row"></th>

                        <td>

                            <div class="MIB_btn">

                            <a href="javascript:validateEditPasswordSubmit('updatepassword')" id="submit_password" class="newabtngrn"><em>保存</em></a>

                            </div>

 

                      </tr>

                    </tbody>

                    </table>
				</div>
				
				</form>

            </div>
        <!--/个人资料--> 

         </div>

	 </div>

	 <!--/我的账号-->

  </div>

  <!--/正文-->
  </div>   

</div> 

</div>
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