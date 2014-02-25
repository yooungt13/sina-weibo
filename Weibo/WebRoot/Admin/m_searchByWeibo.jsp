<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>微博搜索</title>
		<link rel="shortcut icon" href="/Weibo/css/img/v.png"/>
		<link href="/Weibo/css/srch_mbl.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/skin.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/connect.css" type="text/css" rel="stylesheet" />
		<link href="/Weibo/css/right_module.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="/Weibo/js/system_manage.js"></script>
		<script type="text/javascript" src="/Weibo/js/index.js"></script>
	</head>
	<body>
		<div class="MIB_bloga">
			<div class="MIB_blogb">
				<!--顶托盘-->
				<div class="tsina_gnbarea" id="WB_box_1318070134145">
					<div class="bg_gnbarea">
						&nbsp;
					</div>
					<div id="WB_weiboTop_1318070134145" class="tsina_gnb">
						<ul class="gnb_r">
							<li><a href="/Weibo/Admin/initManage.action">管理员</a> </li>
							<li><a href="/Weibo/Admin/noticeList.action?pageNumber=1">通知</a> </li>
							<li><a href="/Weibo/exitLogin.action">退出</a> </li>
						</ul>
					</div>
				</div>
				<div class="header">
				     <div class="head_menu app"> 
				     	<div class="search" id="m_search"> 
							<input type="text" id="m_keyword" autocomplete="off" title="搜索微博、找人" accesskey="3"/>
							<a class="submit" href="javascript:weiboSearch('m_keyword',1);" id="m_submit">搜索</a>
				     	</div> 
				     </div> 
					 <div id="m_keyword_tip" class="resultTip" style="display:none">
					 </div> 
			    </div>
				<!--/顶托盘-->
				<!--正文-->
				<div class="MIB_blogbody">								
					<div class="MIB_mblogbgr ">
					<div class="MIB_mblogbgl ">
						<div class="mainR MIB_200 MIB_txtar MIB_linkar"> <div class="cetUsIn">
						<div class="user_head">
							<div class="picborder_r">
								<a href=""><img src="/Weibo/Images/Faces/manager.jpg"/></a>
							</div>
							<div class="lf">
								<p class="font_14"><a href="/Weibo/Admin/initManage.action">管理员</a></p>
								<p><em>湖南</em><em>长沙</em></p>
							</div>
						</div>
						</div>
						<div class="cetUsLtTit">
							<h3></h3>
							<div class="linedot">
							</div>
						</div>
						<div class="cetUsLtTit">
							<h3>
								<a href="/Weibo/Admin/initManage.action">管理微博</a>
							</h3>
							<div class="linedot">
							</div>
						</div>
						<div class="cetUsLtTit">
							<h3>
								<a href="/Weibo/Admin/noticeList.action?pageNumber=1">发布通知</a>
							</h3>
						</div>
						<div class="linedot"></div>
					</div>
			  		<!--/右栏内容 -->
						<div class="mainL MIB_600 MIB_txtal MIB_linkal fps_wrap">
							<!--搜索-->
							<div class="srch_con">
								<div class="srch_kind">
									<strong>微博</strong>
									<a href="javascript:userSearch('sInput',1);">找人</a>
								</div>
								<div class="srch_form lf">
									<div class="srch_form_r rt">
									</div>
									<div class="srch_form_l lf">
									</div>
									<div class="srch_form_c lf">
										<div class="srch_arrow">
											<div class="srch_form_cr rt">
											</div>
											<div class="srch_form_cl lf">
											</div>
											<input id="sInput" class="font_14 txt_srch" type="text" value="${profContent}" maxlength="40"/>
										</div>
									</div>
									<a class="srch_btn lf" href="javascript:weiboSearch('sInput',1);" id="search">
										搜索
									</a>
								</div>
								<div class="srch_tag">
									<span id="errKeyword"></span>
									<c:if test="${pageBean.totalPosts != 0}">
										<p class="srch_rs_total">找到${pageBean.totalPosts}条结果</p>
									</c:if>
								</div>
								<!-- 零数据  -->
								<c:if test="${pageBean.totalPosts == 0}">
									<div style="padding-top:30px;padding-left:5px;">
										<span class="srch_rs_total" >
											抱歉，没有找到<span style="color: #FF0000;">"${profContent}"</span>相关结果
										</span>
										<p style="padding-top:10px;color:#999;">建议：</p>
										<p style="color:#999;">请尽量输入常用词</p>
										<p style="color:#999;">请尽量使用简洁的关键词</p>
									</div>
								</c:if>
								<!-- /零数据  -->
							</div>
							<!--/搜索-->
								
							<div class="MIB_main_cont lf_vline">
								<div class="srch_main_con lf">
									<div class="box_lbWrap">
										<div class="srch_hotWrap" id="hotUserList" style="display:none;">
										</div>
										<c:if test="${pageBean.totalPosts != 0}">
										<ul class="tab_top_new">
											<li class="current">
												<span>全部</span>
											</li>
										</ul>
										</c:if>
										<!--列表-->
										<ul class="MIB_feed onlytxt" id="feed_list">
											<c:forEach items="${profList}" var="prof">
											<li class="MIB_linedot_l" id="myProf_${prof.profId}">			
											  	<div class="head_pic">
											  		<a href="" >
											  			<img title="${prof.publishName}" src="${prof.publishFace}"/>
											  		</a>
												</div>
												<div class="MIB_feed_c">     
													<p class="sms" mid="" type="3">
														<a namecard="true" href="" title="${prof.publishName}">${prof.publishName}</a>：${prof.publishContent}
													</p>
													<!-- 转发微博内容 -->
													<input type="hidden" id="tcId_${prof.profId}" value="${prof.tcId}"/>
													<input type="hidden" id="profContent_${prof.profId}" value="${prof.profContent}"/>
													<input type="hidden" id="publishName_${prof.profId}" value="${prof.publishName}"/>
													<input type="hidden" id="publishId_${prof.profId}" value="${prof.userinfo.userId}"/>
													<input type="hidden" id="tsmit_${prof.profId}" value="${(prof.tsmit == null)?0:1}"/>
													<c:if test="${prof.tcId != 0}"> 							
								    				<div class="MIB_assign">
								  						<div class="MIB_asarrow_l"></div>
								  						<div class="MIB_assign_t"></div>
								  						<div class="MIB_assign_c MIB_txtbl">
								  						<c:choose>
								  							<c:when test="${prof.tsmit == null}">
								  							<p class="source" mid="" type="2">
														    	<span>该微博已被原作者删除！</span>
															</p>
								  							</c:when>
								  							<c:otherwise> 
														    <p class="source" mid="" type="2">
														    	<a href="" namecard="true" uid="">@${prof.tsmit.publishName}:</a>
														    	<span>${prof.tsmit.publishContent}</span>
															</p>
								    						<c:if test="${prof.tsmit.imageRef != null}">
																<div class="feed_preview" id="">
																	<div class="feed_img">
																		<a onclick="" href="javascript:;">
																			<img src="/Weibo/Images/Refrences/${prof.tsmit.imageRef}" class="imgicon" style="max-width:240px; max-height:180px;" onload="previewImage(this);" />
																		</a>
																	</div>
																	<div class="clear"></div>
																</div>
															</c:if>
															<div class="feed_att MIB_linkbl MIB_txtbl">
																<div class="lf">
																	<cite><a href=""  onclick=""><strong>${prof.tsmit.subTime}</strong></a></cite> 
																	<strong>来自</strong><cite><a href="">${prof.tsmit.publishName}</a></cite>
																</div>
																<div class="rt">																
																</div>
															</div>
															</c:otherwise>
															</c:choose>
								     					</div>
								  						<div class="MIB_assign_b"></div>
													</div>
													</c:if>
													<!-- /转发微博内容结束 -->
													<c:if test="${prof.imageRef != null}">
														<div class="feed_preview" id="">
															<div class="feed_img">
																<a onclick="" href="javascript:;">
																	<img src="/Weibo/Images/Refrences/${prof.imageRef}" class="imgicon" style="max-width:240px; max-height:180px;" onload="previewImage(this);" />
																</a>
															</div>
															<div class="clear"></div>
														</div>
													</c:if>										
													<div class="feed_att MIB_linkbl MIB_txtbl">
														<div class="lf">
															<cite><a href="" onclick=""><strong>${prof.subTime}</strong></a></cite>
															<strong lang="CL1006">来自</strong><cite><a href="myProfPage.action?pageNumber=1">${prof.publishName}</a></cite>
														</div>
														<div class="rt">						
															<strong>							
																<a href="javascript:void(0);" onclick="deleteWeibo(${prof.profId});">
																	<strong>删除</strong>
																</a>
																<span class="MIB_line_l">|</span>
															</strong>											
														</div>
					    							</div>
					    							<div id=""></div>
												</div>
											</li>
											</c:forEach>
										</ul>
										<!--/列表-->	
										<!--翻页-->
										<div class="MIB_bobar">
											<c:if test="${pageBean.totalPosts != 0}">
											<div class="fanye MIB_txtbl" style="float:right;" id="page">
											    <a href="javascript:weiboSearch('sInput',1);" class="btn_num btn_numWidth"><em>首页</em></a>
											    <c:if test="${pageNumber>1}">  
											        <a href="javascript:weiboSearch('sInput',${pageNumber-1});" class="btn_num btn_numWidth"><em>上一页</em></a>
											    </c:if>     
											    <c:forEach begin="1" end="5" step="1" var="pageIndex">  
					 								<c:if test="${pageNumber-(6-pageIndex) >=1}">   
											            <a class="btn_num" href="javascript:weiboSearch('sInput',${pageNumber+pageIndex-6});"><em>${pageNumber+pageIndex-6}</em></a>
											        </c:if>  
												</c:forEach>
												<span>${pageNumber}</span>
												<c:forEach begin="1" end="5" step="1" var="pageIndex">  
					 								<c:if test="${pageNumber+pageIndex <= pageBean.totalPages}">  
											            <a class="btn_num"  href="javascript:weiboSearch('sInput',${pageNumber+pageIndex});"><em>${pageNumber+pageIndex}</em></a>
											        </c:if>  
												</c:forEach>  
											    <c:if test="${pageNumber < pageBean.totalPages}">  
											        <a  href="javascript:weiboSearch('sInput',${pageNumber+1});" class="btn_num btn_numWidth"><em>下一页</em></a>
											    </c:if>    
											    <a  href="javascript:weiboSearch('sInput',${pageBean.totalPages});" class="btn_num btn_numWidth"><em>末页</em></a>
											</div>
											</c:if>
										</div>
										<!--/翻页-->
									</div>
								</div>				
							</div>						
						</div>
						<div style="clear:both;"></div>
					</div>
					</div>
				<!--/正文-->
				<!--尾-->
				<!--/尾-->
				</div>
			</div>
		</div>
		<!-- 网站信息 -->
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
