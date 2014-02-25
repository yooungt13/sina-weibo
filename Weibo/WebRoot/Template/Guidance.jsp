<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html xmlns="http://www.w3.org/1999/xhtml">
  
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>我的首页</title>

	<link href="/Weibo/css/index.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/layer.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/person_connect.css" type="text/css" rel="stylesheet" />
	<link href="/Weibo/css/right_module.css" type="text/css" rel="stylesheet" />
	
	<script type="text/javascript" src="/Weibo/js/index.js"></script>
	<script type="text/javascript" src="/Weibo/js/json.js"></script>
	<script type="text/javascript" src="/Weibo/js/comment.js"></script>
	<script type="text/javascript" src="/Weibo/js/favors_manage.js"></script>
	<script type="text/javascript" src="/Weibo/js/transmit_manage.js"></script>
	<script type="text/javascript" src="/Weibo/js/fans_manage.js"></script>

</head>
<body>
<div class="MIB_bloga">
	<div class="MIB_blogb">
		<div class="tsina_gnbarea" id="WB_box_1318070134145">
        	<div class="bg_gnbarea">&nbsp;</div>
            <div id="" class="tsina_gnb">
  				<ul class="gnb_r">
                	<li><a href="/Weibo/myProfPage.action?pageNumber=1" id="">${sessionScope.user.nickName }</a> </li>
                    <li><a href="/Weibo/MyBlog/Msglist.action">私信</a> </li>
                    <li><a href="systemNotice.html">通知</a> </li>
                    <li><a href="/Weibo/Setting/Setting.action">帐号设置</a> </li>
                    <li class="line">|</li>
					<li><a id="" href="/Weibo/login.jsp">退出</a> </li>
                </ul>
            </div>
        </div> 			
		
		
	</div>		
	<div id="ads_bottom_1"></div>
	</div>
</div>

</body>
</html>