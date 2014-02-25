<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>加入微博 分享新鲜事</title>

	<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>
	<link href="css/tlogin_1.css" type="text/css" rel="stylesheet" />
	<link href="css/layout.css" type="text/css" rel="stylesheet" />
	<link href="css/regv4.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="js/index.js"></script> 
	<script type="text/javascript" src="js/validateRegistInfo.js"></script> 
</head>
<body>
<div class="MB_wrap">
  <div class="login_top"></div>
  <div class="login_body" style="height:auto;">
    <div class="login_l">

<div class="tit"></div>

      <div class="talking"> <strong class=""></strong>
        <div class="coverl"></div>
        <div class="coverr"></div>
      </div>
      <div class="talking_list">
        <div class="clearit"></div>
      </div>
    </div>
    
<form id="regist"  action="Regist.action" method="post" name="userinfo">
    <div class="reg_left" style="background: url(/Weibo/css/img/btbg.png) no-repeat bottom;">
		<div class="new_construct">
			<div class="new_item">
				<div class="tit"><em>*</em>登录名</div>
				<div class="bdmain">
	 				<div positionleft="7" class="jh_yanzheng">
	 				<strong>
              		<input type="text" autocomplete="off" class="textinp" id="loginName" style="width: 230px; color: rgb(153, 153, 153);" name="login.loginName" onclick="onClickShowStyleOfLoginName()" onblur="onClickValidateLoginName('loginName')"/>
              		</strong>
              		</div>
              	</div>
              	<div class="new_plus" id="red_reg_username">
              	 	<div style="display:none; color:green; background:rgb(244,255,212);width:auto; height:auto; z-index:9999;" class="errormt" id="inputLoginName1">
              			<strong>
              				<p style="line-height: 1.6em">请输入长度为6-12位由数</p>
              				<p style="line-height: 1.6em">字英文字母及下划线组成的</p>
              				<p style="line-height: 1.6em">登录名：如，ftym_520</p>
              				
              			</strong>                    
              		</div>
              	<!--</div>-->
              	<!--<div class="new_plus" id="red_reg_username" style="">-->
              		<div style="display:none" class="errormt" id="errorLoginName2"><i></i>
              			<strong>
              				<span>请输入合法的登录名</span>
              			</strong>                    
              		</div>
              		<div style="display:none" class="errormt" id="errorLoginName3"><i></i>
              			<strong>
              				<span>该登录名已存在</span>
              			</strong>                    
              		</div>
              		<div style="display:none" class="success" id="successLoginName"><i></i></div>
              	</div>
			</div>
           
			<div class="new_item">
				<div class="tit"><em>*</em>密码</div>
				<div class="bdmain">
					<div positionleft="7" class="jh_yanzheng">
					<strong>
					<input type="password" class="textinp" id="loginPassword" style="width: 230px; color: rgb(153, 153, 153);" name="login.password" onclick="onClickShowStyleOfLoginPassword()" onblur="onClickValidateLoginPassword('loginPassword')"/>
					</strong>
					</div>
				</div>
				<div id="red_reg_password" class="new_plus">
						<div style="display:none; color:green; background:rgb(244,255,212); height:auto; z-index:9999;" class="errormt" id="inputPassword1">
              			<strong>
              				<p style="line-height: 1.6em">请输入长度为6-16位由数字</p>
              				<p style="line-height: 1.6em">英文字母及下划线组成的密码</p>
              			</strong>                    
              		</div>
              		<div style="display:none" class="errormt" id="errorPassword2"><i></i>
              			<strong>
              				<span>请输入合法的密码</span>
              			</strong>                    
              		</div>
              		<!--<div style="display:none" class="errormt" id="errorPassword3"><i></i>
              			<strong>
              				<span>该登录名已存在</span>
              			</strong>                    
              		</div>-->
              		<div style="display:none" class="success" id="successPassword"><i></i></div>
              	</div>
				<div class="new_plus">
              		<div class="pw_weight" id="red_password_weight"><span class="w0"></span></div>
            	</div>
			</div>
			<div class="new_item" style="padding-bottom:30px;">
				<div class="tit"><em>*</em>确认密码</div>
				<div class="bdmain">
					<div class="jh_yanzheng">
						<strong>
							<input type="password" class="textinp" id="confirmpwd" style="width: 230px; color: rgb(153, 153, 153);" name="confirmpwd" onclick="onClickShowConfirmPassword()" onblur="onClickValidateConfirmPassword('confirmpwd')"/>
						</strong>
					</div>
				</div>
				<div class="new_plus" id="red_reg_username" style="">
              	 	<div style="display:none; color:green; background:rgb(244,255,212); z-index:9999;" class="errormt" id="inputConfirmPassword1">
              			<strong>
              				<span>再次输入创建的密码
              				</span>
              			</strong>                    
              		</div>
              	<!--</div>-->
              	<!--<div class="new_plus" id="red_reg_username" style="">-->
              		<div style="display:none" class="errormt" id="errorConfirmPassword2"><i></i>
              			<strong>
              				<span>与创建密码不符，重新输入</span>
              			</strong>                    
              		</div>
              		<div style="display:none" class="success" id="successConfirmPassword"><i></i></div>
              	</div>
			</div>		
		
			<div class="new_item">
				<div class="tit"><em>*</em>昵称</div>
				<div class="bdmain">
					<div positionleft="7" class="jh_yanzheng">
						<strong>
							<input type="text" class="textinp" id="nickname" style="width: 230px; color: rgb(153, 153, 153);" name="userinfo.nickName" autocomplete="off" onclick="onClickShowStyleOfNickName()" onblur="onClickValidateNickName('nickname')" />
						</strong>
					</div>
				</div>
				<div class="new_plus" id="red_nickname" style="">
              	 	<div style="display:none; color:green; background:rgb(244,255,212); z-index:9999;" class="errormt" id="inputNickName1">
              			<strong>
              				<span>可输入1-12位，包含数字、英文或中文
              				</span>
              			</strong>                    
              		</div>
              	<!--</div>-->
              	<!--<div class="new_plus" id="red_reg_username" style="">-->
              		<div style="display:none" class="errormt" id="errorNickName2"><i></i>
              			<strong>
              				<span>支持中英文、数字和"_"</span>
              			</strong>                    
              		</div>
              		<div style="display:none" class="errormt" id="errorNickName3"><i></i>
              			<strong>
              				<span>该昵称太火了，换换，亲</span>
              			</strong>                    
              		</div>
              		<div style="display:none" class="success" id="successNickName"><i></i>
              		</div>
              	</div>
			</div>
		
        <div class="new_item">
			<div class="tit"><em>*</em>性别</div>
			<div class="bdmain" id="gender">
				<div class="fragm">
					<label><input type="radio" value="1" name="userinfo.sex" id="rdoboy" class="ra" checked="checked" />男</label>
				</div>
				<div class="fragm">
					<label><input type="radio" value="2" name="userinfo.sex" id="rdogirl" class="ra" />女</label>
				</div>
			</div>
			<div class="new_plus" id="red_gender"></div>
		</div>

        <div class="new_item">

            <div class="tit"><em>*</em>所在地</div>

            <div class="bdmain">

              <div class="fakesel">
              	<strong>
					<select class="nob" id="province" name="userinfo.province" onChange="getCity()" >
	                	<option value="直辖市" selected="selected">直辖市</option>
	        
	       			 	<option value="河北">河北</option>
	        			<option value="山西">山西</option>
	          			<option value="内蒙古">内蒙古</option>
	            		<option value="辽宁">辽宁</option>
	          			<option value="吉林">吉林</option>
				        <option value="黑龙江">黑龙江</option>
				        <option value="江苏">江苏</option>
				        <option value="浙江">浙江</option>
				        <option value="安徽">安徽 </option>
				        <option value="福建">福建 </option>
				        <option value="江西">江西</option>
			            <option value="山东">山东</option>
			            <option value="河南">河南</option>
			            <option value="湖北">湖北</option>
			            <option value="湖南">湖南</option>
			            <option value="广东">广东</option> 
			            <option value="广西">广西</option>
			            <option value="海南">海南</option>
						<option value="四川">四川</option>
				        <option value="贵州">贵州</option>
				        <option value="云南">云南</option>
				        <option value="西藏">西藏</option>
				        <option value="陕西">陕西 </option>
				        <option value="甘肃">甘肃 </option>
						<option value="青海">青海</option>
				        <option value="宁夏">宁夏</option>
				        <option value="新疆">新疆</option>
				        <option value="台湾">台湾</option>  
					</select>
				</strong>
			</div>
			<div class="fakesel">
				<strong>
					<select class="nob"  id="city" name="userinfo.city">
                		<option selected="北京" value="北京">北京</option>
                		<option value="上海">上海</option>
                		<option value="天津">天津</option>
                		<option value="重庆">重庆</option>
                		<option value="香港">香港</option>
                		<option value="澳门">澳门</option>
                	</select>
                </strong>
            </div>
		</div>
            <div class="new_plus" id="red_province">

            </div>

          </div>


	<div style="position:relative; padding-top:20px;padding-bottom:10px;margin-left:115px;">以下信息，可作为取回帐号的依据</div>
		
		<div class="new_item" >
			<div class="tit"><em>*</em>身份证号</div>
			<div class="bdmain">
				<div positionleft="7" class="jh_yanzheng">
					<strong>
					<input type="text" class="textinp" autocomplete="off" id="ID" style="width: 230px; color: rgb(153, 153, 153);" name="userinfo.identifier" onclick="onClickShowStyleOfID()" onblur="onClickValidateID('ID')"/>
					</strong>
				</div>
			</div>
			<div id="red_reg_password" class="new_plus">
				<div style="display:none; color:green; background:rgb(244,255,212); height:auto; z-index:9999;" class="errormt" id="inputID1">
              		<strong>
              			<span>请输入证件号码</span>
              		</strong>                    
              	</div>
              	<div style="display:none" class="errormt" id="errorID2"><i></i>
              		<strong>
              			<span>请输入正确的证件号码</span>
              		</strong>                    
              	</div>
              	<div style="display:none" class="success" id="successID"><i></i></div>
             </div>			
		</div>
		
		<div class="new_item" style="padding-top:20px;">
			<div class="tit"><em>*</em>验证码</div>
			<div class="bdmain">
				<div positionleft="185" class="jh_yanzheng">
					<strong>
						<input type="text" class="textinp" name="door" id="checkCodeInput" style="color: rgb(153, 153, 153);" onblur="onClickValidateCheckCode('checkCodeInput')"/>
					</strong>
				</div>
				<div class="jh_yanzhimg">
					<img width="100" height="35" src="checkCode.action" id="checkCodeImg" style="padding-top:3px" />
					<span class="noti1">
						<a href="javascript:onClickRefreshCheckCode();">换一换</a>
					</span>
				</div>
			</div>   
        	<div style="" id="red_door" class="new_plus">
        		<div style="display:none" class="errormt" id="errorCheckCode2"><i></i>
              		<strong>
              			<span>输入的验证码错误</span>
              		</strong>                    
              	</div>
              	<div style="display:none" class="success" id="successCheckCode"><i></i>
              	</div>
        	</div>
		</div>
	</div>

		<div class="reg_bt" style="padding-bottom:80px; padding-top:20px;">
      <a href="javascript:validateRegistSubmit('regist')"  id="submit" class="btn2" title="立即开通"></a>
      </div>    

	  </div>

     
    <div class="login_r">
      <div class="login_item">
        <div class="loginform" id="login_form">
          <div style="margin-bottom: 10px;width: 194px;height: 31px;">
            <div align="center">已有微博帐号？ </div>
          </div>

		  <div class="signin"><a href="initLogin.action" class="sp" id="login_submit_btn"  title="微博登录" tabindex="5"></a></div>
        </div>
      </div>
      
    </div>
    <div class="clearit"></div>
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