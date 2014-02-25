<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登陆微博-</title>

<link href="css/tlogin_1.css" type="text/css" rel="stylesheet" />
<link href="css/layout.css" type="text/css" rel="stylesheet" />
<link href="css/regv4.css" type="text/css" rel="stylesheet" />

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
    <div style="display:none;" id="notice_tommail" class="notice1"><i></i>TOM邮件服务器故障，您有可能收不到来自新浪微博的激活信。<a href="javascript:void(0);" id="changemail">换个邮箱</a></div>

        <div class="new_construct">

          <div class="new_item">

            <div class="tit"><em>*</em>我的邮箱</div>

            <div class="bdmain">

              <div positionleft="7" class="jh_yanzheng"><strong>

			  <input name="fromip" type="hidden" value="113.246.116.15" />

              <input name="inviteCode" type="hidden" value="" />

              <input name="r" id="r" type="hidden" value="" />

              <input name="entry" id="entry" type="hidden" value="" />

              <input name="param" id="param" type="hidden" value="" />

              <input name="mcode" id="mcode" type="hidden" value="" />

              <input type="hidden" value="eb1063187ff03487c1276e62bd8826fe" id="sinaId" name="sinaId">

              <input name="lang" id="lang" type="hidden" value="zh-cn" />

              <input type="text" class="textinp" id="reg_username" style="width: 230px; color: rgb(153, 153, 153);" name="username" autocomplete="off" />

              <input type="hidden" name="4db79cafb5c0cd07b3cf69758c68ef27" value="6cf33b24de2cfa81aa9667ba0647f34c">

<input type="hidden" name="d851485931ab61c61fe30406470b6e58" value="a72ccf4111181dabf2acb2f9edd450a0">

<input type="hidden" name="475a81faf09ae29d2c4fef71850cc2e2" value="81deff9b4f709401ad6def9c4c77d440">

<input type="hidden" name="7637c4856ed857b33fd0f3e4d6ba5cc2" value="62300f24c4d089ea10101263f025228a">

<input type="hidden" name="3b4725a0513b6bfafd5625edd5acbb1b" value="cfa38b27e816861c5fb272eb864da81e">

<input type="hidden" name="1c9b977074a6ca027401d58b5d60b341" value="f58f01e43182000e5a0d1023888e914a">

<input type="hidden" name="8d6d6afd4ffce79ec32c6ae36f943e50" value="6209eb2f960c0d3ec4e30289ccfa62ed">

<input type="hidden" name="regtime" value="1318081767">

<input type="hidden" name="decfc05b4e177e4e2cca5a63270e7cfb" value="8">              </strong></div>

            </div>

            <div class="new_plus" id="red_reg_username">

              <p class="plus_a"><a target="_blank" href="http://mail.sina.com.cn/cnmail/login.html" id="nomail">我没有邮箱</a></p>

            </div>

          </div>

          <div class="new_item">

            <div class="tit"><em>*</em>创建密码</div>

            <div class="bdmain">

              <div positionleft="7" class="jh_yanzheng"><strong>

                <input type="password" class="textinp" id="reg_password" style="width: 230px; color: rgb(153, 153, 153);" name="password">

                </strong></div>

            </div>

			<div id="red_reg_password" class="new_plus"></div>

            <div class="new_plus">

              <div class="pw_weight" id="red_password_weight"><span class="w0"></span></div>

            </div>

          </div>

          <div class="new_item">

            <div class="tit"><em>*</em>昵称</div>

            <div class="bdmain">

              <div positionleft="7" class="jh_yanzheng"><strong>

                <input type="text" class="textinp" id="nickname" style="width: 230px; color: rgb(153, 153, 153);" name="nickname" autocomplete="off" />

                </strong></div>
            </div>

            <div class="new_plus" id="red_nickname"></div>

			<div id="use_name"></div>

          </div>

          <div class="new_item">

            <div class="tit"><em>*</em>性别</div>

            <div class="bdmain" id="gender">

              <div class="fragm">

                <label>

                  <input type="radio" value="1" name="gender" id="rdoboy" class="ra" checked="checked" />

                  男</label>

              </div>

              <div class="fragm">

                <label>

                  <input type="radio" value="2" name="gender" id="rdogirl" class="ra" />

                  女</label>

              </div>

            </div>

            <div class="new_plus" id="red_gender"></div>

          </div>

          <div class="new_item">

            <div class="tit"><em>*</em>所在地</div>

            <div class="bdmain">

              <div class="fakesel"> <strong>

                <select class="nob" truevalue="43" id="province" name="province">

                </select>

                </strong> </div>

              <div class="fakesel"> <strong>

                <select class="nob" truevalue="1" id="city" name="city">

                  <option></option>

                </select>

                </strong> </div>

            </div>

            <div class="new_plus" id="red_province">

            </div>

          </div>

          <div class="new_item">

        		<div class="tit"><em>*</em>验证码</div>

        		<div class="bdmain">

	          	<div positionleft="185" class="jh_yanzheng"><strong><input type="text" class="textinp" name="basedoor" id="door" style="color: rgb(153, 153, 153);" autocomplete="off" /></strong></div>

	          	<div class="jh_yanzhimg"><img width="100" height="35" src="/signup/pincode/pin1.php?r=20111008211946&lang=zh" style="" id="check_img"><span class="noti1"><a onclick="App.refreshCheckCode()" href="javascript:void(0);">换一换</a></span></div>

	          </div>   

          	 <div style="" id="red_door" class="new_plus"></div>

       	  </div>

        </div>

      <div class="reg_bt" ><a href="javascript:void(0);" id="submit" class="btn2" title="立即开通"></a></div>
		
      </div>
     
    <div class="login_r">
      <div class="login_item">
        <div class="loginform" id="login_form">
          <div class="input_bg">
            <div align="center">已有微博帐号？ </div>
          </div>

		  <div id="door_p" style='display:none'>
		  <div class="inputcodeM"  >
            <span class="input_code"><input type="text" id="door"></span><img height="32" width="80" id="door_img" src="">
          </div>
		  <div class="inputcodeM_sett" >
             <a href="javascript:void(0)" id="door_change">看不清，换一换</a>
          </div>
		  </div>
		  <div class="signin"><a href="login.html" class="sp" id="login_submit_btn"  title="新浪微博登录" tabindex="5"></a></div>
        </div>
      </div>
      
    </div>
    <div class="clearit"></div>
  </div>
  
 
</div>
</body>
</html>
