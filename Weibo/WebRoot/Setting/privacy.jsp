<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>
            隐私设置
        </title>

        <link rel="shortcut icon" href="/Weibo/css/img/v.png"/>
        <link href="/Weibo/css/setup.css" type="text/css" rel="stylesheet" />
        <link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="/Weibo/js/index.js">
        <script type="text/javascript" src="/Weibo/js/json.js">
        </script>
    </head>
    
    <body onload="refreshCount();initializationOfPrivacy(${sessionScope.user.comPower},${sessionScope.user.msgPower},${sessionScope.user.searchPower });">
        <div class="MIB_bloga">
            <div class="MIB_blogb">
                <!--顶托盘-->
                <!--/顶托盘-->
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
                <!--/logo-->
                <!--正文-->
                <div class="MIB_blogbody">
                    <!--我的账号-->
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
                                            <div class="PY_tagn">
                                                <span>
                                                    <a href="/Weibo/Setting/myface.jsp">
                                                        修改头像
                                                    </a>
                                                </span>
                                            </div>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <div class="PY_tago">
                                                <span class="bold">
                                                    隐私设置
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
                                <div class="setup_main" id="setup_main">
                                    <div class="infoTop MIB_line1">
                                        <div class="infoTop_nav">
                                            <span class="edutop_cur">
                                                隐私设置
                                            </span>
                                            <span class="navBorder gray9">
                                                |
                                            </span>
                                            <span>
                                                <a href="">
                                                    黑名单
                                                </a>
                                            </span>
                                        </div>
                                    </div>
								<form id="power" action="powerSetting.action" method="post" name="power">
                                    <div class="ysSetup font_12">
                                        <div class="rb_t">
                                            <strong>
                                                评论
                                            </strong>
                                            <span class="font_12 gray9">
                                                设置谁可以评论我的微博
                                            </span>
                                        </div>
                                        <div class="tag_tips MIB_linedot2 iv_space1">
                                            <p class="pstyle gray6">
                                                <input id="allone" type="radio" name="power.comPower" value="true" checked="checked"/>
                                                <label for="allone">
                                                    所有人
                                                    <span class="font_12 gray9">
                                                        (不包括你的黑名单用户)
                                                    </span>
                                                </label>
                                            </p>
                                            <p class="pstyle gray6">
                                                <input id="allone2" type="radio" name="power.comPower" value="false"/>
                                                <label for="allone2">
                                                    我关注的人
                                                </label>
                                            </p>
                                        </div>
                                        <div class="rb_t">
                                            <strong>
                                                私信
                                            </strong>
                                            <span class="font_12 gray9">
                                                设置谁可以给我发私信/引荐关注
                                            </span>
                                        </div>
                                        <div class="tag_tips MIB_linedot2 iv_space1">
                                            <p class="pstyle gray6">
                                                <input id="allone3" type="radio" name="power.msgPower" value="true" checked="checked"/>
                                                <label for="allone3">
                                                    所有人
                                                    <span class="font_12 gray9">
                                                        (不包括你的黑名单用户；部分用户会受到反垃圾系統限制，依然不能给您发送私信)
                                                    </span>
                                                </label>
                                            </p>
                                            <p class="pstyle gray6">
                                                <input id="allone4" type="radio" name="power.msgPower" value="false"/>
                                                <label for="allone4">
                                                    我关注的人
                                                </label>
                                            </p>
                                        </div>
                                        <div class="rb_t">
                                                <strong>
                                                    搜索
                                                </strong>
                                                <span class="font_12 gray9">
                                                    是否允许别人搜索到我
                                                </span>
                                            </div>
                                        <div class="tag_tips MIB_linedot2 iv_space1">
                                            
                                           		<p class="pstyle gray6">
                                                    <input type="radio" name="power.searchPower" id="allone9" value="true" checked="checked"/>
                                                    <label for="allone9">
                                                        是
                                                    </label>
                                                </p>
                                                <p class="pstyle gray6">
                                                    <input type="radio" name="power.searchPower" id="allone9" value="false"/>
                                                    <label for="allone9">
                                                        否
                                                    </label>
                                                </p>
                                         </div>
                                            <div class="tag_tips iv_space1">

                                            
                                            <div class="btn">
                                                <a class="btn_normal" id="submit" href="javascript:toSubmitChange('power')">
                                                    <em>
                                                        保存
                                                    </em>
                                                </a>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!--/我的账号-->
                    </div>
                    <!--/正文-->
                </div>
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
    </body>

</html>