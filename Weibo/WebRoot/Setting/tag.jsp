<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人标签</title>
<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>
<link href="../css/setup.css" type="text/css" rel="stylesheet" />
<link href="../css/skin.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/Weibo/js/index.js"></script>
                     
                  
                                     
</head>
<body onload="refreshCount();">
<div class="MIB_bloga">

  <div class="MIB_blogb">
  <!--顶托盘-->
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
    <!--/顶托盘-->
  <!--正文-->
  <div class="MIB_blogbody">

	 <!--找朋友-->
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
            <!--/页签-->
            
            <!--个人资料-->
            <div class="setup_main">
                <div class="infoTop">
                     <div class="infoTop_nav">
                        <span><a href="/Weibo/Setting/user.jsp">基本信息</a></span>


<span class="navBorder gray9">|</span>
<span><a href="/Weibo/Setting/editpassword.jsp">修改密码</a></span>

	<span class="navBorder gray9">|</span>
		<span><a href="/Weibo/Setting/educationinfo.jsp">教育信息</a></span>
		
	<span class="navBorder gray9">|</span>
		<span><a href="/Weibo/Setting/workinfo.jsp">职业信息</a></span>
	
<span class="navBorder gray9">|</span>
<span class="edutop_cur">个人标签</span>



	
	
		
	
                    </div>
                </div>   
                <div class="setupTag">
                	<p class="setup_tag1">添加描述自己职业、兴趣爱好等方面的词语，让更多人找到你，让你找到更多同类</p>
                    <div class="setupTag_box">
                    	<div class="setupTag_boxL">
                    	<form id="tag"  action="Tag.action" method="post" name="tag">
                        	<div class="setupTag_input">
                            	<input name="tag.tag" type="text" class="setupTag_txt" id="tag_input" value="" />
                            	<a id="add_tag" href="javascript:previousBox();" class="btn_normal"><em>添加标签</em></a>
                            </div>
                        </form>   
                            <div class="error_color" id="tip_or_error" style="display:none">含有非法字符，请修改</div>
                        </div>
                        <div class="setupTag_boxR">
                        	<p class="setupTag_tip2"><span class="rt lightblue"><a href="#">换一换</a></span>你可能感兴趣的标签：</p>
                            	                            	                            	  
                            		<div class="setupTag_list01" >
                            	                            		<a  title="添加标签" href="#" tagid="285"><em>+</em>音乐</a>
                            	                            	                            	                            	                            	                            		<a  title="添加标签" href="#" tagid="283"><em>+</em>电影</a>
                            	                            	                            	                            	                            	                            		<a  title="添加标签" href="#" tagid="2725"><em>+</em>听歌</a>
                            	                            	                            	                            	                            	                            		<a  title="添加标签" href="#" tagid="847"><em>+</em>80后</a>
                            	                            	                            	                            	                            	                            		<a  title="添加标签" href="#" tagid="1725"><em>+</em>90后</a>
                            	                            	                            	                            	                            	                            		<a  title="添加标签" href="#" tagid="464"><em>+</em>美食</a>
                            	                            	                            	                            	                            	                            		<a  title="添加标签" href="#" tagid="10"><em>+</em>旅游</a>
                            	                            	                            	                            	                            	                            		<a  title="添加标签" href="#" tagid="287"><em>+</em>时尚</a>
                            	                            	                            	                            	                            	                            		<a  title="添加标签" href="#" tagid="829"><em>+</em>旅行</a>
                            	                            	                            	                            	                            	                            		<a  title="添加标签" href="#" tagid="1029"><em>+</em>宅</a>
                            	                            	                            	                            	                            	                            		<a  title="添加标签" href="#" tagid="1501"><em>+</em>自由</a>
                            	                            	                            	                            	                            	                            		<a  title="添加标签" href="#" tagid="612"><em>+</em>学生</a>
                            	                            		</div>
                            	                            	                            	                            	                            	      
                            		<div class="setupTag_list01" style="display:none">
                            		                            		<a  title="添加标签" href="#" tagid="463" ><em>+</em>睡觉</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1033" ><em>+</em>上网</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="314" ><em>+</em>摄影</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="289" ><em>+</em>动漫</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="781" ><em>+</em>唱歌</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1728" ><em>+</em>看书</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="125" ><em>+</em>篮球</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="789" ><em>+</em>小说</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="3" ><em>+</em>宅女</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="797" ><em>+</em>交友</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1235" ><em>+</em>幽默</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1347" ><em>+</em>娱乐</a>
                            		                            		</div>
                            		                            	                            	                            	                            	      
                            		<div class="setupTag_list01" style="display:none">
                            		                            		<a  title="添加标签" href="#" tagid="692" ><em>+</em>天蝎座</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="684" ><em>+</em>运动</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="320" ><em>+</em>搞笑</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1686" ><em>+</em>乐观</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="922" ><em>+</em>游戏</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="290" ><em>+</em>吃</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1397" ><em>+</em>大学生</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="816" ><em>+</em>艺术</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="998" ><em>+</em>狮子座</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="2396" ><em>+</em>天秤座</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1661" ><em>+</em>生活</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="758" ><em>+</em>股票</a>
                            		                            		</div>
                            		                            	                            	                            	                            	      
                            		<div class="setupTag_list01" style="display:none">
                            		                            		<a  title="添加标签" href="#" tagid="1024" ><em>+</em>水瓶座</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="3140" ><em>+</em>网购</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="809" ><em>+</em>双鱼座</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="540" ><em>+</em>足球</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="977" ><em>+</em>射手座</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="493" ><em>+</em>设计</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="3374" ><em>+</em>善良</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="653" ><em>+</em>双子座</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="123" ><em>+</em>平常心</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="835" ><em>+</em>读书</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="4640" ><em>+</em>巨蟹座</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="788" ><em>+</em>美剧</a>
                            		                            		</div>
                            		                            	                            	                            	                            	      
                            		<div class="setupTag_list01" style="display:none">
                            		                            		<a  title="添加标签" href="#" tagid="2044" ><em>+</em>处女座</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1405" ><em>+</em>汽车</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1336" ><em>+</em>创业</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="9" ><em>+</em>偶稀饭睡觉觉</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1541" ><em>+</em>阅读</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1875" ><em>+</em>爱情</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="228" ><em>+</em>NBA</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1560" ><em>+</em>文学</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1015" ><em>+</em>摩羯座</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="954" ><em>+</em>A股</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="693" ><em>+</em>白羊座</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="13" ><em>+</em>美女</a>
                            		                            		</div>
                            		                            	                            	                            	                            	      
                            		<div class="setupTag_list01" style="display:none">
                            		                            		<a  title="添加标签" href="#" tagid="56" ><em>+</em>宅男</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="4" ><em>+</em>羽毛球</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1330" ><em>+</em>英语</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="59" ><em>+</em>好性格</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="5486" ><em>+</em>金牛座</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="624" ><em>+</em>新闻</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1264" ><em>+</em>浪漫</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="77463" ><em>+</em>偶喜欢玩</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="979" ><em>+</em>摄影爱好者</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="660" ><em>+</em>八卦</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="331" ><em>+</em>网络</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="286" ><em>+</em>微博</a>
                            		                            		</div>
                            		                            	                            	                            	                            	      
                            		<div class="setupTag_list01" style="display:none">
                            		                            		<a  title="添加标签" href="#" tagid="529" ><em>+</em>财经</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="2926" ><em>+</em>文字</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="774" ><em>+</em>手机</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="292" ><em>+</em>互联网</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="5395" ><em>+</em>紫色</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="544" ><em>+</em>历史</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="638" ><em>+</em>囧</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="631" ><em>+</em>体育</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="302" ><em>+</em>IT</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1358" ><em>+</em>电子商务</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="5194" ><em>+</em>玩儿</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="231" ><em>+</em>好书</a>
                            		                            		</div>
                            		                            	                            	                            	                            	      
                            		<div class="setupTag_list01" style="display:none">
                            		                            		<a  title="添加标签" href="#" tagid="802" ><em>+</em>营销</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="332" ><em>+</em>数码</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1395" ><em>+</em>写作</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="3375" ><em>+</em>自由职业</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="2411" ><em>+</em>校园</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="1811" ><em>+</em>大学</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="537" ><em>+</em>传媒</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="301" ><em>+</em>媒体</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="3810" ><em>+</em>亲情</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="545" ><em>+</em>广告</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href="#" tagid="937" ><em>+</em>语录</a>
                            		                            	                            	                            	                            	                                		<a  title="添加标签" href=" " tagid="859" ><em>+</em>博客</a>
                            		                            		</div>
                            		                            	                            	                        </div>
                    </div>
                	
                    
                    <div class="setupTag_tit MIB_linedot" id="mytagshow1" style="display:none"><a class="rt" href="javascript:void(0);" id="recommendtag">将我的标签推荐给朋友</a><em class="font_14">我已经添加的标签：</em></div>
                    
                    <div id="mytagshow2" class="setupTag_list02" style="display:none">
                    <ul id="tag_list" class="tagList">
						                    </ul>
                    <div class="clear"></div>
                    </div>
                    
                    <!-- 可能感兴趣的人 -->
                   	<div id="inter_root" style="display:none;">
	                   	<div class="setupTag_tit MIB_linedot">
	                   		<em class="font_14">可能感兴趣的人：</em>
	                   		<a class="MIB_linkbl" id="inter_refresh" href="#">换一换</a>
	                   	</div>
	                   	<div class="setup_list1">
							<div id="inter_cont"></div>
							<p class="more"><a href="">更多<em>&gt;&gt;</em></a></p>
						</div>
					</div>
                   	
                   <!--//可能感兴趣的人 -->
                   <!--可能感兴趣的微群 -->
                   	<div id="group_root" style="display:none;">
	                   	<div class="setupTag_tit MIB_linedot">
	                   		<em class="font_14">可能感兴趣的微群：</em>
	                   		<a class="MIB_linkbl" id="group_refresh" href="#">换一换</a>
	                   	</div>
	                   	<div class="setup_list1">
							<div id="group_cont"></div>
							<p class="more"><a href="">更多<em>&gt;&gt;</em></a></p>
						</div>
					</div>
                   
                   <!--//可能感兴趣的微群 -->
                    <div class="setupTag_tit gray6 MIB_linedot">关于标签：</div>
                    <div class="setupTag_txtList gray9">
                    <p>&middot;标签是自定义描述自己职业、兴趣爱好的关键词，让更多人找到你，让你找到更多同类。</p>
                    <p>&middot;已经添加的标签将显示在“我的微博”页面右侧栏中，方便大家了解你。</p>
                    <p>&middot;在此查看你自己添加的所有标签，还可以方便地管理，最多可添加10个标签。 </p>
                    <p>&middot;点击你已添加的标签，可以搜索到有同样兴趣的人。</p>
                    </div>
                </div>
            </div>
        </div>
        </div>

          
        <!--/个人资料-->  
         </div>
		 </div>
	 </div>
	<!--/找朋友-->
  
  </div>
  <!--/正文-->
  <!--尾--> 
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