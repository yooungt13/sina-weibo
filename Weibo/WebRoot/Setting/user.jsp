<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>
            个人资料
        </title>
        <link rel="shortcut icon" href="/Weibo/css/img/v.png"/>
        <link href="/Weibo/css/setup.css" type="text/css" rel="stylesheet" />
        <link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="/Weibo/js/index.js">
        </script>
        <script type="text/javascript" src="/Weibo/js/validateUserInfo.js">
        </script>
    </head>
    
    <body background="img/background.jpg" onload="refreshCount();onloadCheckSex(${sessionScope.user.sex});">
        <div class="MIB_bloga" >
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
                                                <div class="PY_tago">
                                                    <span class="bold">
                                                        个人资料
                                                    </span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="PY_tagn">
                                                    <span>
                                                        <a href="/Weibo/Setting/myface.jsp">
                                                            修改头像
                                                        </a>
                                                    </span>
                                                </div>
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
                                    <div id="system_information" style="display:none">
                                    </div>
                                    <!--个人资料-->
                                    <div class="setup_main">
                                        <div class="infoTop">
                                            <div class="infoTop_nav">
                                                <span class="edutop_cur">
                                                    基本信息
                                                </span>
                                                <span class="navBorder gray9">
                                                    |
                                                </span>
                                                <span>
                                                    <a href="/Weibo/Setting/editpassword.jsp">
                                                        修改密码
                                                    </a>
                                                </span>
                                                <span class="navBorder gray9">
                                                    |
                                                </span>
                                                <span>
                                                    <a href="/Weibo/Setting/educationinfo.jsp">
                                                        教育信息
                                                    </a>
                                                </span>
                                                <span class="navBorder gray9">
                                                    |
                                                </span>
                                                <span>
                                                    <a href="/Weibo/Setting/workinfo.jsp">
                                                        职业信息
                                                    </a>
                                                </span>
                                                <span class="navBorder gray9">
                                                    |
                                                </span>
                                                <span>
                                                    <a href="/Weibo/Setting/tag.jsp">
                                                        个人标签
                                                    </a>
                                                </span>
                                            </div>
                                        </div>
                                        <form id="update" action="updateUser.action" method="post" name="user">
                                            <div class="info_tab01" id="information_box">
                                                <table style="width: 645px;">
                                                    <tr>
                                                        <th width="148" class="gray6">
                                                            登录名：
                                                        </th>
                                                        <td class="font_12" colspan="2">
                                                            <div>
                                                                <span>
                                                                    <em>
                                                                        ${sessionScope.user.login.loginName}
                                                                    </em>
                                                                </span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th class="gray6">
                                                            <em class="error_color">
                                                                *
                                                            </em>
                                                            昵&nbsp;&nbsp;称：
                                                        </th>
                                                        <td width="245">
                                                            <input type="text" class="PY_input" autocomplete="off" value="${sessionScope.user.nickName}" name="user.nickName" id="nickname" onclick="onclickShowStyleOfNickName()" onblur="onblurValidateNickName('nickname')">
                                                            </input>
                                                        </td>
                                                        <td id="red_nickname">
                                                            <div class="setup_info" style="display: none;" id="successNickName">
                                                                <div class="info_tip2">
                                                                    <div class="tipicon tip3" title="">
                                                                    </div>
                                                                </div>
                                                                <div class="info_tip1">
                                                                </div>
                                                            </div>
                                                            <table class="cudTs" style="display:none" id="inputNickName1">
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
                                                                            可输入1-12位，包含数字、英文或中文
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
                                                            <table class="cudTs3" style="display:none;" id="errorNickName2">
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
                                                                            支持中英文、数字、“_”或减号
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
                                                            <table class="cudTs3" style="display:none;" id="errorNickName3">
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
                                                                            此昵称太火了，换换，亲
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
                                                        <th class="gray6">
                                                            真实姓名：
                                                        </th>
                                                        <td>
                                                            <input type="text" class="PY_input" name="user.trueName" id="truename" autocomplete="off" value="${sessionScope.user.trueName}" onclick="onclickShowStyleOfTrueName();" onblur="onblurValidateTrueName('truename');" />
                                                            <input type="hidden" class="PY_input" name="oldrealname" value="" />
                                                        </td>
                                                        <td id="red_realname">
                                                            <div class="setup_info" style="display: none;" id="successTrueName">
                                                                <div class="info_tip2">
                                                                    <div class="tipicon tip3" title="">
                                                                    </div>
                                                                </div>
                                                                <div class="info_tip1">
                                                                </div>
                                                            </div>
                                                            <table class="cudTs" style="display:none;" id="inputTrueName1">
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
                                                                            请填写真实姓名，方便我们联系你
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
                                                            <table class="cudTs3" style="display:none;" id="errorTrueName2">
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
                                                                            请填写真实姓名
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
                                                        <th class="gray6">
                                                            <em class="error_color">
                                                                *
                                                            </em>
                                                            所在地：
                                                        </th>
                                                        <td class="info_tab_vm">
                                                            <select name="user.province" id="province" onchange="getCity()">
                                                                <option value="直辖市" selected="selected">
                                                                   直辖市
                                                                </option>

                                                                <option value="河北">
                                                                    河北
                                                                </option>
                                                                <option value="山西">
                                                                    山西
                                                                </option>
                                                                <option value="内蒙古">
                                                                    内蒙古
                                                                </option>
                                                                <option value="辽宁">
                                                                    辽宁
                                                                </option>
                                                                <option value="吉林">
                                                                    吉林
                                                                </option>
                                                                <option value="黑龙江">
                                                                    黑龙江
                                                                </option>
                                                                <option value="江苏">
                                                                    江苏
                                                                </option>
                                                                <option value="浙江">
                                                                    浙江
                                                                </option>
                                                                <option value="安徽">
                                                                    安徽
                                                                </option>
                                                                <option value="福建">
                                                                    福建
                                                                </option>
                                                                <option value="江西">
                                                                    江西
                                                                </option>
                                                                <option value="山东">
                                                                    山东
                                                                </option>
                                                                <option value="河南">
                                                                    河南
                                                                </option>
                                                                <option value="湖北">
                                                                    湖北
                                                                </option>
                                                                <option value="湖南">
                                                                    湖南
                                                                </option>
                                                                <option value="广东">
                                                                    广东
                                                                </option>
                                                                <option value="广西">
                                                                    广西
                                                                </option>
                                                                <option value="海南">
                                                                    海南
                                                                </option>
                                                                <option value="四川">
                                                                    四川
                                                                </option>
                                                                <option value="贵州">
                                                                    贵州
                                                                </option>
                                                                <option value="云南">
                                                                    云南
                                                                </option>
                                                                <option value="西藏">
                                                                    西藏
                                                                </option>
                                                                <option value="陕西">
                                                                    陕西
                                                                </option>
                                                                <option value="甘肃">
                                                                    甘肃
                                                                </option>
                                                                <option value="青海">
                                                                    青海
                                                                </option>
                                                                <option value="宁夏">
                                                                    宁夏
                                                                </option>
                                                                <option value="新疆">
                                                                    新疆
                                                                </option>
                                                                <option value="台湾">
                                                                    台湾
                                                                </option>
                                                            </select>
                                                            <select name="user.city" id="city">
                                                                <option selected="北京" value="北京">北京</option>
										                		<option value="上海">上海</option>
										                		<option value="天津">天津</option>
										                		<option value="重庆">重庆</option>
										                		<option value="香港">香港</option>
										                		<option value="澳门">澳门</option>
                                                            </select>
                                                            <span class="co_kd2" style="display:none">
                                                            </span>
                                                        </td>
                                                        <td id="red_prov">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th class="gray6">
                                                            <em class="error_color">
                                                                *
                                                            </em>
                                                            性&nbsp;&nbsp;别：
                                                        </th>
                                                        <td class="info_tab_vm">
                                                            <input id="man" name="user.sex" type="radio" value="1" class="info_radio01"  />
                                                            <label for="man">
                                                                男
                                                            </label>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <input id="woman" name="user.sex" type="radio" value="2" class="info_radio01"/>
                                                            <label for="woman">
                                                                女
                                                            </label>
                                                            <span style="display:none" class="co_kd2" id="">
                                                            </span>
                                                        </td>
                                                        <td>
                                                        <table class="cudTs3" style="display:none;" id="errorMSN2">
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
                                                                            请选择性别
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
                                                        <th class="gray6">
                                                            生日：
                                                        </th>
                                                        <td class="info_tab_vm birthDay" id="birthday">
                                                            <select name="birthday_y" id="birthday_y" onchange="YYYYDD(this.value)">
                                                            </select>
                                                            <em>
                                                                年
                                                            </em>
                                                            <select name="birthday_m" id="birthday_m" onchange="MMDD(this.value)">
                                                            </select>
                                                            <em>
                                                                月
                                                            </em>
                                                            <select name="birthday_d" id="birthday_d">
                                                            </select>
                                                            <em>
                                                                日
                                                            </em>
                                                        </td>
                                                        <td id="birthdaytip">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                    </tr>
                                                    <tr>
                                                        <th class="gray6">
                                                            联系邮箱：
                                                        </th>
                                                        <td>
                                                            <input type="text" class="PY_input" value="${sessionScope.user.email}" name="user.email" id="email" autocomplete="off" onclick="onclickShowStyleOfEmail()" onblur="onblurValidateEmail('email')">
                                                            </input>
                                                        </td>
                                                        <td id="red_email" style="vertical-align: top;">
                                                            <div class="setup_info" style="display: none;" id="successEmail">
                                                                <div class="info_tip2">
                                                                    <div class="tipicon tip3" title="">
                                                                    </div>
                                                                </div>
                                                                <div class="info_tip1">
                                                                </div>
                                                            </div>
                                                            <table class="cudTs" style="display:none;" id="inputEmail1">
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
                                                                            如:736646709@qq.com
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
                                                            <table class="cudTs3" style="display:none" id="errorEmail2">
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
                                                                            请输入正确的邮箱
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
                                                        <th class="gray6">
                                                            QQ：
                                                        </th>
                                                        <td>
                                                            <input type="text" id="qq" name="user.qq" value="${sessionScope.user.qq}" autocomplete="off" class="PY_input" onclick="onclickShowStyleOfQQ()" onblur="onblurValidateQQ('qq')" />
                                                            <span class="co_kd2" style="display:none">
                                                            </span>
                                                        </td>
                                                        <td id="red_qq" style="vertical-align:top;">
                                                            <div class="setup_info" style="display: none;" id="successQQ">
                                                                <div class="info_tip2">
                                                                    <div class="tipicon tip3" title="">
                                                                    </div>
                                                                </div>
                                                                <div class="info_tip1">
                                                                </div>
                                                            </div>
                                                            <table class="cudTs" style="display:none;" id="inputQQ1">
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
                                                                            如:736646709
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
                                                            <table class="cudTs3" style="display:none;" id="errorQQ2">
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
                                                                            请输入正确的QQ
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
                                                   
                                                        <th class="gray6">
                                                            一句话介绍：
                                                        </th>
                                                        <td>
                                                            <textarea name="user.introduce" id="introduce" class="info_txtarea" onclick="onclickShowStyleOfIntroduce();" onblur="onblurValidateIntroduce('introduce');">${sessionScope.user.introduce}</textarea>
                                                            <span class="co_kd2" style="display:none">
                                                            </span>
                                                        </td>
                                                        <td id="red_mydesc">
                                                            <div class="setup_info" style="display: none;" id="successIntroduce">
                                                                <div class="info_tip2">
                                                                    <div class="tipicon tip3" title="">
                                                                    </div>
                                                                </div>
                                                                <div class="info_tip1">
                                                                </div>
                                                            </div>
                                                            <table class="cudTs" style="display:none;" id="inputIntroduce1">
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
                                                                            请不要超过70个字
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
                                                            <table class="cudTs3" style="display:none" id="errorIntroduce2">
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
                                                                        <td class="tdCon">你输入的个人简介超过了70个字
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
                                                        <th>
                                                        </th>
                                                        <td>
                                                            
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                        </th>
                                                        <td class="info_tabTip02 gray6">
                                                            以下信息，可作为取回帐号的依据
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th class="gray6">
                                                            证件号码：
                                                        </th>
                                                        <td>
                                                            <input type="hidden" name="user.identifier" value="${sessionScope.user.identifier}"/>
                                                            <input type="text" id="idcard" class="PY_input" readonly="readonly" value="${sessionScope.user.hiddenID}"/>
                                                        </td>
                                                        <td id="red_idcard">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                        </th>
                                                        <td>
                                                            <div class="MIB_btn">
                                                                <a href="javascript:validateUserSubmit('update')" id="submit" class="newabtngrn">
                                                                    <em>
                                                                        保存
                                                                    </em>
                                                                </a>
                                                            </div>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </form>
                                    </div>
                                    <!--/个人资料-->
                                </div>
                            </div>
                        </div>
                        <iframe frameborder="0" scrolling="no" width="800" src="/Weibo/Template/Copyright.jsp"></iframe>
                        <!--/找朋友-->
                    </div>
                    <!--/正文-->
                </div>
            </div>
          
    </body>

</html>