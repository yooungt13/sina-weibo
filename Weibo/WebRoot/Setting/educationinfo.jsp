<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>
            教育信息
        </title>
        <link rel="shortcut icon" href="/Weibo/css/img/v.png"/>
        <link href="../css/setup.css" type="text/css" rel="stylesheet" />
        <link href="../css/skin.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="/Weibo/js/index.js">
        </script>
        <script type="text/javascript" src="/Weibo/js/validateEducationInfo.js">
        </script>
    </head>
    
    <body onload="refreshCount();">
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
		<div class="header">
		  <div class="head_menu">
				<span class="menu_l">&nbsp;</span>
				<div class="menu_c">
					<div class="bg_menu_c">&nbsp;</div>
					<ul>
						<li ><a href="/Weibo/Page.action?pageNumber=1">我的首页</a></li>
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
                                </ul>
                            </div>
                            <!--/页签-->
                            <!--个人资料-->
                            <div class="setup_main">
                                <div class="infoTop MIB_line1">
                                    <div class="infoTop_nav">
                                        <span>
                                            <a href="/Weibo/Setting/user.jsp">
                                                基本信息
                                            </a>
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
                                        <span class="edutop_cur">
                                            教育信息
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
                                <!-- 信息列表 -->
                              
                               
                                <div node-type="school_create">
                                    <div class="title MIB_linedot2 title1">
                                        <span class="fb">
                                            修改教育信息
                                        </span>
                                    </div>
                                    <form id="educationinfo" action="saveEducationinfo.action" method="post"
                                    name="educationinfo">
                                        <div class="info_tab01" node-type="formSchool_create">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <th class="gray6">
                                                            学校类型：
                                                        </th>
                                                        <td class="info_tab_vm">
                                                            <select node-type="school_type" name="educationinfo.schoolType">
                                                                <option value="1">
                                                                    大学
                                                                </option>
                                                                <option value="2">
                                                                    高中
                                                                </option>
                                                                <option value="3">
                                                                    中专技校
                                                                </option>
                                                                <option value="4">
                                                                    初中
                                                                </option>
                                                                <option value="5">
                                                                    小学
                                                                </option>
                                                            </select>
                                                           
                                        </div>
                                        </td>
                                        <td node-type="tip">
                                        </td>
                                        </tr>
                                        </table>
                                        <table>
                                            <tr>
                                                <th class="gray6">
                                                    <em class="error_color">
                                                        
                                                    </em>
                                                    学校名称：
                                                </th>
                                                
                                                <td>
                                                    <input node-type="school_name" name="educationinfo.schoolName" type="text" id="schoolName"
                                                    value="${session.user.schoolName}" class="PY_input gray9" onclick="onclickShowStyleOfSchoolName()" onblur="onblurValidateSchoolName('schoolName')">
                                                    </input>
                                                    <select node-type="start" name="educationinfo.schoolTime" class="setup_sel">
                                                        <option value="0">
                                                            请选择
                                                        </option>
                                                        <option value="2011">
                                                            2011
                                                        </option>
                                                        <option value="2010">
                                                            2010
                                                        </option>
                                                        <option value="2009">
                                                            2009
                                                        </option>
                                                        <option value="2008">
                                                            2008
                                                        </option>
                                                        <option value="2007">
                                                            2007
                                                        </option>
                                                        <option value="2006">
                                                            2006
                                                        </option>
                                                        <option value="2005">
                                                            2005
                                                        </option>
                                                        <option value="2004">
                                                            2004
                                                        </option>
                                                        <option value="2003">
                                                            2003
                                                        </option>
                                                        <option value="2002">
                                                            2002
                                                        </option>
                                                        <option value="2001">
                                                            2001
                                                        </option>
                                                        <option value="2000">
                                                            2000
                                                        </option>
                                                        <option value="1999">
                                                            1999
                                                        </option>
                                                        <option value="1998">
                                                            1998
                                                        </option>
                                                        <option value="1997">
                                                            1997
                                                        </option>
                                                        <option value="1996">
                                                            1996
                                                        </option>
                                                        <option value="1995">
                                                            1995
                                                        </option>
                                                        <option value="1994">
                                                            1994
                                                        </option>
                                                        <option value="1993">
                                                            1993
                                                        </option>
                                                        <option value="1992">
                                                            1992
                                                        </option>
                                                        <option value="1991">
                                                            1991
                                                        </option>
                                                        <option value="1990">
                                                            1990
                                                        </option>
                                                        <option value="1989">
                                                            1989
                                                        </option>
                                                        <option value="1988">
                                                            1988
                                                        </option>
                                                        <option value="1987">
                                                            1987
                                                        </option>
                                                        <option value="1986">
                                                            1986
                                                        </option>
                                                        <option value="1985">
                                                            1985
                                                        </option>
                                                        <option value="1984">
                                                            1984
                                                        </option>
                                                        <option value="1983">
                                                            1983
                                                        </option>
                                                        <option value="1982">
                                                            1982
                                                        </option>
                                                        <option value="1981">
                                                            1981
                                                        </option>
                                                        <option value="1980">
                                                            1980
                                                        </option>
                                                        <option value="1979">
                                                            1979
                                                        </option>
                                                        <option value="1978">
                                                            1978
                                                        </option>
                                                        <option value="1977">
                                                            1977
                                                        </option>
                                                        <option value="1976">
                                                            1976
                                                        </option>
                                                        <option value="1975">
                                                            1975
                                                        </option>
                                                        <option value="1974">
                                                            1974
                                                        </option>
                                                        <option value="1973">
                                                            1973
                                                        </option>
                                                        <option value="1972">
                                                            1972
                                                        </option>
                                                        <option value="1971">
                                                            1971
                                                        </option>
                                                        <option value="1970">
                                                            1970
                                                        </option>
                                                        <option value="1969">
                                                            1969
                                                        </option>
                                                        <option value="1968">
                                                            1968
                                                        </option>
                                                        <option value="1967">
                                                            1967
                                                        </option>
                                                        <option value="1966">
                                                            1966
                                                        </option>
                                                        <option value="1965">
                                                            1965
                                                        </option>
                                                        <option value="1964">
                                                            1964
                                                        </option>
                                                        <option value="1963">
                                                            1963
                                                        </option>
                                                        <option value="1962">
                                                            1962
                                                        </option>
                                                        <option value="1961">
                                                            1961
                                                        </option>
                                                        <option value="1960">
                                                            1960
                                                        </option>
                                                        <option value="1959">
                                                            1959
                                                        </option>
                                                        <option value="1958">
                                                            1958
                                                        </option>
                                                        <option value="1957">
                                                            1957
                                                        </option>
                                                        <option value="1956">
                                                            1956
                                                        </option>
                                                        <option value="1955">
                                                            1955
                                                        </option>
                                                        <option value="1954">
                                                            1954
                                                        </option>
                                                        <option value="1953">
                                                            1953
                                                        </option>
                                                        <option value="1952">
                                                            1952
                                                        </option>
                                                        <option value="1951">
                                                            1951
                                                        </option>
                                                        <option value="1950">
                                                            1950
                                                        </option>
                                                        <option value="1949">
                                                            1949
                                                        </option>
                                                        <option value="1948">
                                                            1948
                                                        </option>
                                                        <option value="1947">
                                                            1947
                                                        </option>
                                                        <option value="1946">
                                                            1946
                                                        </option>
                                                        <option value="1945">
                                                            1945
                                                        </option>
                                                        <option value="1944">
                                                            1944
                                                        </option>
                                                        <option value="1943">
                                                            1943
                                                        </option>
                                                        <option value="1942">
                                                            1942
                                                        </option>
                                                        <option value="1941">
                                                            1941
                                                        </option>
                                                        <option value="1940">
                                                            1940
                                                        </option>
                                                        <option value="1939">
                                                            1939
                                                        </option>
                                                        <option value="1938">
                                                            1938
                                                        </option>
                                                        <option value="1937">
                                                            1937
                                                        </option>
                                                        <option value="1936">
                                                            1936
                                                        </option>
                                                        <option value="1935">
                                                            1935
                                                        </option>
                                                        <option value="1934">
                                                            1934
                                                        </option>
                                                        <option value="1933">
                                                            1933
                                                        </option>
                                                        <option value="1932">
                                                            1932
                                                        </option>
                                                        <option value="1931">
                                                            1931
                                                        </option>
                                                        <option value="1930">
                                                            1930
                                                        </option>
                                                        <option value="1929">
                                                            1929
                                                        </option>
                                                        <option value="1928">
                                                            1928
                                                        </option>
                                                        <option value="1927">
                                                            1927
                                                        </option>
                                                        <option value="1926">
                                                            1926
                                                        </option>
                                                        <option value="1925">
                                                            1925
                                                        </option>
                                                        <option value="1924">
                                                            1924
                                                        </option>
                                                        <option value="1923">
                                                            1923
                                                        </option>
                                                        <option value="1922">
                                                            1922
                                                        </option>
                                                        <option value="1921">
                                                            1921
                                                        </option>
                                                        <option value="1920">
                                                            1920
                                                        </option>
                                                        <option value="1919">
                                                            1919
                                                        </option>
                                                        <option value="1918">
                                                            1918
                                                        </option>
                                                        <option value="1917">
                                                            1917
                                                        </option>
                                                        <option value="1916">
                                                            1916
                                                        </option>
                                                        <option value="1915">
                                                            1915
                                                        </option>
                                                        <option value="1914">
                                                            1914
                                                        </option>
                                                        <option value="1913">
                                                            1913
                                                        </option>
                                                        <option value="1912">
                                                            1912
                                                        </option>
                                                        <option value="1911">
                                                            1911
                                                        </option>
                                                        <option value="1910">
                                                            1910
                                                        </option>
                                                        <option value="1909">
                                                            1909
                                                        </option>
                                                        <option value="1908">
                                                            1908
                                                        </option>
                                                        <option value="1907">
                                                            1907
                                                        </option>
                                                        <option value="1906">
                                                            1906
                                                        </option>
                                                        <option value="1905">
                                                            1905
                                                        </option>
                                                        <option value="1904">
                                                            1904
                                                        </option>
                                                        <option value="1903">
                                                            1903
                                                        </option>
                                                        <option value="1902">
                                                            1902
                                                        </option>
                                                        <option value="1901">
                                                            1901
                                                        </option>
                                                        <option value="1900">
                                                            1900
                                                        </option>
                                                    </select>
                                                </td>
                                                <td>
                                                        	<div class="setup_info" style="display: none;" id="successSchoolName">
                                                                <div class="info_tip2">
                                                                    <div class="tipicon tip3" title="">
                                                                    </div>
                                                                </div>
                                                                <div class="info_tip1">
                                                                </div>
                                                            </div>
                                                            <table class="cudTs" style="display:none" id="inputSchoolName1">
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
                                                                            请输入名称，20个字以内
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
                                                            <table class="cudTs3" style="display:none;" id="errorSchoolName2">
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
                                                                           字数超过了20个
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
                                        </table>
                                        <table>
                                            <tr >
                                                <th class="gray6">
                                                    <span >
                                                        院系：
                                                    </span>
                                                </th>
                                                <td>
                                                    <input name="educationinfo.college" type="text"  id="college" value="${sessionScope.user.college}"
                                                    class="PY_input gray9" onclick="onclickShowStyleOfCollege()" onblur="onblurValidateCollege('college')"/>
                                                </td>
                                                <td node-type="tip">
                                                        	<div class="setup_info" style="display: none;" id="successCollege">
                                                                <div class="info_tip2">
                                                                    <div class="tipicon tip3" title="">
                                                                    </div>
                                                                </div>
                                                                <div class="info_tip1">
                                                                </div>
                                                            </div>
                                                            <table class="cudTs" style="display:none" id="inputCollege1">
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
                                                                            请输入名称，20个字以内
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
                                                            <table class="cudTs3" style="display:none;" id="errorCollege2">
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
                                                                           字数超过了20个
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
                                        </table>
                                        <table>
                                            <tr>
                                                <th>
                                                </th>
                                                <td>
                                                    <a class="newabtngrn" href="javascript:toSubmitChange('educationinfo')"
                                                    id="submit_education" class="newabtngrn">
                                                        <em>
                                                            保存
                                                        </em>
                                                    </a>
                                                    <a class="btn_normal btns" href="javascript:;">
                                                        <em>
                                                            取消
                                                        </em>
                                                    </a>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /信息列表 -->
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