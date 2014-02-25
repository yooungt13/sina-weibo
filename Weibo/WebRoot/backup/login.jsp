<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登陆微博-</title>

<link href="css/tlogin_1.css" type="text/css" rel="stylesheet" />
<link href="css/layout.css" type="text/css" rel="stylesheet" />
<link href="css/regv4.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/index.js"></script> 

</head>
<body>
<div class="MB_wrap">
  <div class="login_top"></div>
  <div class="login_body">
    <div class="login_l">

<div class="tit"></div>

      <div class="talking"> <strong class="">正在热议：</strong>
        <div class="coverl"></div>
        <div class="coverr"></div>
      </div>
      <div class="talking_list">
        <div class="clearit"></div>
      </div>
    </div>
    <div class="reg_left">
    <div style="display:none;" id="notice_tommail" class="notice1"></div>

        <div class="talking_list">

      	<div class="tList_mdu1">

        <dl class="manlist">

          <dt>这些人正在用微博</dt>

          <dd>

            <ul class="userlist">
				<li><a onclick='' href="" target="_blank"><img uid= imgtype="head" pop="ture" title="用户A"/></a>

<a onclick='' href="otherProfile.html" title="用户A" target="_blank">用户A</a>



</li>

<li><a onclick='' href="" target="_blank"><img uid= imgtype="head" pop="ture" title="用户B"/></a>

<a onclick='' href="" title="用户B" target="_blank">用户B</a>
</li>

<li><a onclick='' href="" target="_blank"><img uid= imgtype="head" pop="ture" title="用户C"/></a>

<a onclick='' href="" title="用户C" target="_blank">用户C</a>

</li>
<img src="" style="width:0px;height:0px;" alt="" /> 

</ul>
</dd>
</dl>
<dl class="manlist">
<dt>有趣的人</dt>
<dd>
			<ul class="userlist">
				<li>
					<a href="otherProfile"><img imgtype="head" uid="1594705951" title="" pop="true" /></a>
					<a href="" title="用户A" target="_blank">用户A</a>
				</li>
				<li>
					<a href="" target="_blank"><img imgtype="head" uid="1656146592" title="" pop="true" /></a>
					<a href="" title="用户B" target="_blank">用户B</a>
				</li>
				<li>
					<a href="" target="_blank"><img imgtype="head" uid="1749766274" title="" pop="true" /></a>
					<a href="" title="用户C" target="_blank">用户C</a>
				</li>
             </ul>

          </dd>

        </dl>

        </div>

      	<div class="tList_mdu2">

        <dl class="twit_list">

          <dt>大家正在说</dt>

          <dd>
            <div class="maincontent" id="txtBoxCon">

                <div class="itemt"></div>
        <div class="itemt">
    <div class="twit_item MIB_linedot2">
      <div class="twit_item_pic"><a href="" target="_blank"><img imgtype="head" uid="1881097184" title="用户A" pop="true" /></a></div>
      <div class="twit_item_content"> <a href="otherProfile" uid="" target="_blank" title="用户A">用户A</a>：金汉斯真好吃  <div class="twit_item_time">4分钟前</div></div>
    </div>
    </div>
        <div class="itemt">
    <div class="twit_item MIB_linedot2">
      <div class="twit_item_pic"><a href="" target="_blank"><img imgtype="head" uid="" title="用户B" pop="true" /></a></div>
      <div class="twit_item_content"> <a href="" uid="" target="_blank" title="用户B">用户B</a>：跑跑求虐<div class="twit_item_time">3分钟前</div></div>
    </div>
    </div>
        <div class="itemt">
    <div class="twit_item MIB_linedot2">
      <div class="twit_item_pic"><a href="" target="_blank"><img imgtype="head" uid="" title="用户C" pop="true" /></a></div>
      <div class="twit_item_content"> <a href="" uid="" target="_blank" title="用户C">用户C</a>：@用户A 等发了奖学金再请<div class="twit_item_time">4分钟前</div></div>
    </div>
    </div>
</div>

          </dd>

        </dl>

        </div>

        <div class="clearit"></div>

      </div>
  </div>
     
    <div class="login_r">
      <div class="login_item">
      <div class="regtop"> <a href="regist.jsp" target="_blank" class="regbtn"  title="立即注册微博" tabindex="7"></a>

        </div>
        <form id="login" action="Login.action" method="post" name="login">
        <div class="loginform" id="login_form">
          <div class="input_bg">
            <input type="text" id="loginname" name="login.loginName" title="登录名" tabindex="1" autocomplete="off"/>
          </div>
          <div class="input_bg">
            <input type="password" id="password" name="login.password" title="密码" tabindex="2"/>
			<input type="text" id="password_text" style="display:none;"/>
          </div>

		  <div id="door_p" style='display:none'>
		  <div class="inputcodeM"  >
            <span class="input_code"><input type="text" id="door"></span><img height="32" width="80" id="door_img" src="">
          </div>
		  <div class="inputcodeM_sett" >
             <a href="javascript:void(0)" id="door_change">看不清，换一换</a>
          </div>
		  </div>

          <div class="setting">
         <span class="lf"> <input type="checkbox" class="labelbox" id="remusrname"  tabindex="3"  checked />
              <label  for="remusrname">下次自动登录</label></span><a class="rt" href="http://login.sina.com.cn/cgi/getpwd/getpwd0.php?entry=sso" target="_blank" tabindex="4">找回密码</a>
          </div>
     
          <div class="signin"><a href="javascript:toSubmit('login')" class="sp" id="login_submit_btn"  title="" tabindex="5"></a></div>
        <div align="center">
        <br><br><br>
        <p>${sessionScope.error}</p>
        </div>
        </div>
        </form>
        
        
      </div>
      
    </div>
    <div class="clearit"></div>
  </div>
  
</div>
</body>
</html>
