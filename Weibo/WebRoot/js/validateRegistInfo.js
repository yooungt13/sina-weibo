var validateNum;
var keepConfirmPwd;
var a = 0;
var b = 0;
var c = 0;
var d = 0;
var e = 0;
var f = 0;

// 创建请求
var http_request;
function createXMLHttpRequest(){
	http_request=false;
    if(window.XMLHttpRequest){
		http_request=new XMLHttpRequest();  //初始化http_request
		if(http_request.overrideMimeType){
			http_request.overrideMimeType("text/html");
		}
	}else if(window.ActiveXObject){      
		try{
			http_request=new ActiveXObject("Msxml2.XMLHTTP");  //在IE中创建XMLHttpRequest对象,新版IE
		}catch(e){
			try{
				http_request=new ActiveXObject("Microsoft.XMLHTTP");  //在IE中创建XMLHttpRequest对象旧版IE
			}catch(e){}
		}
	}
		
	if(!http_request){
		window.alert("不能创建XMLHttpRequest对象实例");
		return false;
	}
}

// 提示输入登录名
function onClickShowStyleOfLoginName(){
	// 直接显示提示框1
	//window.alert("直接显示提示框1");
	document.getElementById("errorLoginName2").style.display = "none";
	document.getElementById("errorLoginName3").style.display = "none";
	document.getElementById("inputLoginName1").style.display = "block";
	
//	msgBox = document.createElement("div");
//	msgBox.setAttribute("class", "errormt");
//	msgBox.setAttribute("id", "inputLoginName1");
//	msgBox.setAttribute("style", "color:green; background:white; width:auto; height:auto; z-index:9999;");
//	
//	var htmlList = '';
//	htmlList += '<strong>';
//	htmlList += '<span>请输入长度为6-12位由数';
//	htmlList += '<br>字英文字母及下划线组成的';
//	htmlList += '<br>登录名：如，ftym_520';
//	htmlList += '</span>';
//	htmlList += '</strong> ';
//	
//	msgBox.innerHTML = htmlList;
	
	//document.getElementById('red_reg_username').appendChild(msgBox);
	//window.alert(msgBox.id);
	//document.body.appendChild(msgBox);
}

// 验证登录名
function onClickValidateLoginName(id){	
	var login = document.getElementById(id).value;
	
	if(login.length >= 6 && login.length <= 12){
		if(notChinese(login)){				
			validateInfo("validateInfo.action?login.loginName=" + login);			
		}else{
			//提示框2
			a = 0;
			document.getElementById("inputLoginName1").style.display = "none";
			//document.getElementById('red_reg_username').removeChild(msgBox);
			document.getElementById("errorLoginName2").style.display = "block";	
		}
	}else{
		//window.alert("提示框2");
		//提示框2
		a = 0;
		document.getElementById("inputLoginName1").style.display = "none";
		document.getElementById("errorLoginName2").style.display = "block";
	}
}

// 判断用户名是否为数字字母下滑线      
function notChinese(str){ 
	var reg=/[^A-Za-z0-9_]/g; 
    if (reg.test(str)){ 
    	return (false); 
    	}
    else{ 
    	return(true);
    	} 
}

/**  
 * 身份证15位编码规则：dddddd yymmdd xx p   
 * dddddd：地区码   
 * yymmdd: 出生年月日   
 * xx: 顺序类编码，无法确定   
 * p: 性别，奇数为男，偶数为女  
 * <p />  
 * 身份证18位编码规则：dddddd yyyymmdd xxx y   
 * dddddd：地区码   
 * yyyymmdd: 出生年月日   
 * xxx:顺序类编码，无法确定，奇数为男，偶数为女   
 * y: 校验码，该位数值可通过前17位计算获得  
 * <p />  
 * 18位号码加权因子为(从右到左) Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2,1 ]  
 * 验证位 Y = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ]   
 * 校验位计算公式：Y_P = mod( ∑(Ai×Wi),11 )   
 * i为身份证号码从右往左数的 2...18 位; Y_P为脚丫校验码所在校验码数组位置  
 *   
 */  
  
var Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ];// 加权因子   
var ValideCode = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ];// 身份证验证位值.10代表X   
function IdCardValidate(idCard) {   
    idCard = trim(idCard.replace(/ /g, ""));   
    if (idCard.length == 15) {   
        return isValidityBrithBy15IdCard(idCard);   
    } else if (idCard.length == 18) {   
        var a_idCard = idCard.split("");// 得到身份证数组   
        if(isValidityBrithBy18IdCard(idCard)&&isTrueValidateCodeBy18IdCard(a_idCard)){   
            return true;   
        }else {   
            return false;   
        }   
    } else {   
        return false;   
    }   
}   

/**  
 * 判断身份证号码为18位时最后的验证位是否正确  
 * @param a_idCard 身份证号码数组  
 * @return  
 */  
function isTrueValidateCodeBy18IdCard(a_idCard) {   
    var sum = 0; // 声明加权求和变量   
    if (a_idCard[17].toLowerCase() == 'x') {   
        a_idCard[17] = 10;// 将最后位为x的验证码替换为10方便后续操作   
    }   
    for ( var i = 0; i < 17; i++) {   
        sum += Wi[i] * a_idCard[i];// 加权求和   
    }   
    valCodePosition = sum % 11;// 得到验证码所位置   
    if (a_idCard[17] == ValideCode[valCodePosition]) {   
        return true;   
    } else {   
        return false;   
    }   
}   
/**  
 * 通过身份证判断是男是女  
 * @param idCard 15/18位身份证号码   
 * @return 'female'-女、'male'-男  
 */  
function maleOrFemalByIdCard(idCard){   
    idCard = trim(idCard.replace(/ /g, ""));// 对身份证号码做处理。包括字符间有空格。   
    if(idCard.length==15){   
        if(idCard.substring(14,15)%2==0){   
            return 'female';   
        }else{   
            return 'male';   
        }   
    }else if(idCard.length ==18){   
        if(idCard.substring(14,17)%2==0){   
            return 'female';   
        }else{   
            return 'male';   
        }   
    }else{   
        return null;   
    }   
   
}   
 /**  
  * 验证18位数身份证号码中的生日是否是有效生日  
  * @param idCard 18位书身份证字符串  
  * @return  
  */  
function isValidityBrithBy18IdCard(idCard18){   
    var year =  idCard18.substring(6,10);   
    var month = idCard18.substring(10,12);   
    var day = idCard18.substring(12,14);   
    var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));   
    // 这里用getFullYear()获取年份，避免千年虫问题   
    if(temp_date.getFullYear()!=parseFloat(year)   
          ||temp_date.getMonth()!=parseFloat(month)-1   
          ||temp_date.getDate()!=parseFloat(day)){   
            return false;   
    }else{   
        return true;   
    }   
}   
  /**  
   * 验证15位数身份证号码中的生日是否是有效生日  
   * @param idCard15 15位书身份证字符串  
   * @return  
   */  
  function isValidityBrithBy15IdCard(idCard15){   
      var year =  idCard15.substring(6,8);   
      var month = idCard15.substring(8,10);   
      var day = idCard15.substring(10,12);   
      var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));   
      // 对于老身份证中的你年龄则不需考虑千年虫问题而使用getYear()方法   
      if(temp_date.getYear()!=parseFloat(year)   
              ||temp_date.getMonth()!=parseFloat(month)-1   
              ||temp_date.getDate()!=parseFloat(day)){   
                return false;   
        }else{   
            return true;   
        }   
  }   
//去掉字符串头尾空格   
function trim(str) {   
    return str.replace(/(^\s*)|(\s*$)/g, "");   
} 
// 判断是否为中文、数字、英文和下划线
function isChinese(str){ 
	var reg=/^[a-zA-Z0-9_\u4e00-\u9fa5]+$/; 
    if (reg.test(str)){ 
    	return (true); 
    	}
    else{ 
    	return(false);
    	} 
}

function validateInfo(url){	
	
	createXMLHttpRequest();
	// 指定处理函数 事件解发器！！！
	http_request.onreadystatechange=processValidateLoginName; 	
	http_request.open("GET",url,true);  
	http_request.send(null); 
}

function processValidateLoginName(){
	if(http_request.readyState==4){ 	
		if(http_request.status==200){
			
			// 通过request获取reponse里的值
			var isPass = http_request.responseText;
			if( isPass == "true"){
				
				// 提示框4
				a = 1 ;
				document.getElementById("inputLoginName1").style.display = "none";
				document.getElementById("errorLoginName2").style.display = "none";
				document.getElementById("errorLoginName3").style.display = "none";
				document.getElementById("successLoginName").style.display = "block";
			}else{
				// 提示框3
				a = 0;
				document.getElementById("inputLoginName1").style.display = "none";
				document.getElementById("errorLoginName2").style.display = "none";
				document.getElementById("errorLoginName3").style.display = "block";
				document.getElementById("successLoginName").style.display = "none";
			}
		}
	}
}

//提示输入密码
function onClickShowStyleOfLoginPassword(){
	document.getElementById("errorPassword2").style.display = "none";
	document.getElementById("inputPassword1").style.display = "block";	
}

function onClickValidateLoginPassword(id){	
	var login = document.getElementById(id).value;
	// 加入用来判断确认密码是否为空的变量
	var judgeConfirmpwd = document.getElementById('confirmpwd').value;
	
	if(login.length >= 6 && login.length <= 12){
		if(notChinese(login)){	
			b = 1;
			document.getElementById("inputPassword1").style.display = "none";
			document.getElementById("errorPassword2").style.display = "none";
			document.getElementById("successPassword").style.display = "block";
		}
		else{
			b = 0;
			document.getElementById("inputPassword1").style.display = "none";
			document.getElementById("errorPassword2").style.display = "block";
		}
	}else{
		//window.alert("提示框2");
		//提示框2
		b = 0;
		document.getElementById("inputPassword1").style.display = "none";
		document.getElementById("errorPassword2").style.display = "block";
	}
	
	if(judgeConfirmpwd.length > 0){
		onClickValidateConfirmPassword('confirmpwd');
	}
}

//提示确认密码的输入
function onClickShowConfirmPassword(){
	document.getElementById("errorConfirmPassword2").style.display = "none";
	document.getElementById("inputConfirmPassword1").style.display = "block";	
}

function onClickValidateConfirmPassword(id){
	var confirmpassword = document.getElementById(id).value;
	var password1 = document.getElementById('loginPassword').value;
//	window.alert("提示框2");
	if(confirmpassword.length >0){
		if(confirmpassword == password1){
			c = 1;
			document.getElementById("inputConfirmPassword1").style.display = "none";
			document.getElementById("errorConfirmPassword2").style.display = "none";
			document.getElementById("successConfirmPassword").style.display = "block";
		}
		else{
			c = 0;
			document.getElementById("inputConfirmPassword1").style.display = "none";
			document.getElementById("errorConfirmPassword2").style.display = "block";
		}
	}
	else{
		c = 0;
		document.getElementById("inputConfirmPassword1").style.display = "none";
		document.getElementById("errorConfirmPassword2").style.display = "block";
	}
}

//提示昵称的输入
function onClickShowStyleOfNickName(){
	// 直接显示提示框1
	//window.alert("直接显示提示框1");
	document.getElementById("errorNickName2").style.display = "none";
	document.getElementById("errorNickName3").style.display = "none";
	document.getElementById("inputNickName1").style.display = "block";
}

// 验证昵称
function onClickValidateNickName(id){	
	var login = document.getElementById(id).value;
//	window.alert("直接显示提示框1");
	if(login.length >= 1 && login.length <= 12){
		if( isChinese(login)){			
			validateNickName("validateNickName.action?userinfo.nickName=" + encodeURI(encodeURI(login)));			
		}else{
			//提示框2
			d = 0;
			document.getElementById("inputNickName1").style.display = "none";
			document.getElementById("errorNickName2").style.display = "block";	
		}
	}else{
		//window.alert("提示框2");
		//提示框2
		d = 0;
		document.getElementById("inputNickName1").style.display = "none";
		document.getElementById("errorNickName2").style.display = "block";
	}
}

function validateNickName(url){	
	
	createXMLHttpRequest();
	// 指定处理函数 事件解发器！！！
	http_request.onreadystatechange=processValidateNickName; 	
	http_request.open("GET",url,true);  
	http_request.send(null); 
}

function processValidateNickName(){
	if(http_request.readyState==4){ 		
		if(http_request.status==200){
			
			// 通过request获取reponse里的值
			var isPass = http_request.responseText;
			if( isPass == "true"){
				//window.alert("验证通过");
				// 提示框4
				d = 1;
				document.getElementById("inputNickName1").style.display = "none";
				document.getElementById("errorNickName2").style.display = "none";
				document.getElementById("errorNickName3").style.display = "none";
				document.getElementById("successNickName").style.display = "block";
			}else{
				// 提示框3
				d = 0;
				document.getElementById("inputNickName1").style.display = "none";
				document.getElementById("errorNickName3").style.display = "block";
			}
		}
	}
}

function createMsgBox(){
	
	//window.alert(msgBox.className);
	//msgBox.setAttribute(id, "inputLoginName1");
	//msgBox.setAttribute(style, "color:green; background:white; height:100px; z-index:9999;");
	return msgBox;
}

//省份城市二级联动
//定义了城市的二维数组，里面的顺序跟省份的顺序是相同的。通过selectedIndex获得省份的下标值来得到相应的城市数组
var city=[
["北京","天津","上海","重庆","香港","澳门"],
["石家庄","唐山","秦皇岛","邯郸","邢台","保定","张家口","承德","沧州","廊坊","衡水"],
["太原","大同","阳泉","长治","晋城","朔州","晋中","运城","忻州","临汾","吕梁"],
["呼和浩特","包头","乌海","赤峰","通辽","鄂尔多斯","呼伦贝尔","巴彦淖尔","乌兰察布","兴安","锡林郭勒","阿拉善"],
["沈阳","大连","鞍山","抚顺","本溪","丹东","锦州","营口","阜新","辽阳","盘锦","铁岭","朝阳","葫芦岛"],
["长春","吉林","四平","辽源","通化","白山","松原","白城","延边"],
["哈尔滨","齐齐哈尔","鸡西","鹤岗","双鸭山","大庆","伊春","佳木斯","七台河","牡丹江","黑河","绥化","大兴安岭"],
["南京","苏州","扬州","无锡","徐州","常州","南通","连云港","淮安","盐城","镇江","泰州","宿迁"],
["杭州","宁波","温州","嘉兴","湖州","绍兴","金华","衢州","舟山","台州","丽水"],
["合肥","芜湖","蚌埠","淮南","马鞍山","淮北","铜陵","安庆","黄山","滁州","阜阳","宿州","巢湖","六安","亳州","池州","宣城"],
["福州","宁德","南平","厦门","莆田","三明","泉州","漳州"],
["南昌","上饶","萍乡","九江","景德镇","新余","鹰潭","赣州","吉安","宜春","抚州"],
["济南","青岛","淄博","枣庄","东营","烟台","潍坊","威海","济宁","泰安","日照","莱芜","临沂","德州","聊城","滨州","菏泽"],
["郑州","开封","洛阳","平顶山","焦作","鹤壁","新乡","安阳","濮阳","漯河","许昌","三门峡","南阳","商丘","信阳","周口","驻马店"],
["武汉","十堰","襄樊","鄂州","黄石","荆州","宜昌","荆门","孝感","黄冈","咸宁","随州","恩施"],
["长沙","株洲","湘潭","岳阳","邵阳","常德","衡阳","张家界","益阳","郴州","永州","怀化","娄底","湘西"],
["广州","清远","潮州","东莞","珠海","深圳","汕头","韶关","佛山","江门","湛江","茂名","肇庆","惠州","梅州","汕尾","阳江","河源","中山","揭阳","云浮"],
["南宁","柳州","桂林","梧州","北海","防城港","钦州","贵港","玉林","百色","贺州","河池","来宾","崇左"],
["海口","三亚"],
["成都","自贡","攀枝花","泸州","德阳","绵阳","广元","遂宁","内江","乐山","南充","宜宾","广安","达州","眉山","雅安","巴中","资阳","阿坝","甘孜","凉山"],
["贵阳","六盘水","遵义","安顺","铜仁","毕节","黔西南","黔东南","黔南"],
["昆明","曲靖","玉溪","保山","昭通","丽江","普洱","临沧","文山","红河","西双版纳","楚雄","大理","德宏","怒江","迪庆"],
["拉萨","昌都","山南","日喀则","那曲","阿里","林芝"],
["西安","铜川","宝鸡","咸阳","渭南","延安","汉中","榆林","安康","商洛"],
["兰州","白银","定西","敦煌","嘉峪关","金昌","天水","武威","张掖","平凉","酒泉","庆阳","临夏","陇南","甘南"],
["西宁","海东","海北","黄南","海南","果洛","玉树","海西"],
["银川","石嘴山","吴忠","固原","中卫"],
["乌鲁木齐","克拉玛依","吐鲁番","哈密","和田","阿克苏","喀什","克孜勒苏柯尔克孜","巴音郭楞蒙古","昌吉","博尔塔拉蒙古","伊犁哈萨克","阿勒泰"],
["台北","高雄","基隆","台中","台南","新竹","嘉义"]
];

function getCity(){
    //获得省份下拉框的对象
    var sltProvince=document.forms[0].province;
    //获得城市下拉框的对象
    var sltCity=document.forms[0].city;
    
    //得到对应省份的城市数组
    var provinceCity=city[sltProvince.selectedIndex];

    //清空城市下拉框，仅留提示选项
    sltCity.length=1;
    sltCity[0]=new Option(provinceCity[0],provinceCity[0]);

    //将城市数组中的值填充到城市下拉框中
    for(var i=1;i<provinceCity.length;i++){
        sltCity[i]=new Option(provinceCity[i],provinceCity[i]);
    }
}

//验证身份证号正则表达式
function isID(str){ 
	var reg=/[\d{18} | \d{15}]/;
    if (reg.test(str)){ 
    	return (true); 
    	}
    else{ 
    	return(false);
    	} 
}

//提示输入身份证号
function onClickShowStyleOfID(){
	document.getElementById("errorID2").style.display = "none";
	document.getElementById("inputID1").style.display = "block";
}

//验证身份证号码
function onClickValidateID(id){
	var login = document.getElementById(id).value;
	if( login.length == 15 || login.length == 18 ){
		if( IdCardValidate(login)){
			e = 1;
			document.getElementById("errorID2").style.display = "none";
			document.getElementById("inputID1").style.display = "none";
			document.getElementById("successID").style.display = "block";
		}
		else{
			e = 0;
			document.getElementById("inputID1").style.display = "none";
			document.getElementById("errorID2").style.display = "block";	
		}
	}
	else{
		document.getElementById("errorID2").style.display = "block";
		document.getElementById("inputID1").style.display = "none";
		document.getElementById("successID").style.display = "none";
	}
}

//更换验证码图片
function onClickRefreshCheckCode(){
	var checkCode = document.getElementById('checkCodeImg');
	checkCode.src = "checkCode.action?t="+Math.random();
}

//验证输入验证码
function onClickValidateCheckCode(id){
	var checkCodeNumber = document.getElementById(id).value;	
	validateCheckCode("validateCheckcode.action?checkCodeNumber=" + checkCodeNumber);
}
function validateCheckCode(url){	
	
	createXMLHttpRequest();
	http_request.onreadystatechange=processValidateCheckCode; 	
	http_request.open("GET",url,true);  
	http_request.send(null); 
}

function processValidateCheckCode(){
	if(http_request.readyState==4){ 	
		if(http_request.status==200){;				
			
			// 通过request获取reponse里的值
			var isPass = http_request.responseText;
			if( isPass == "true"){
				f = 1;
				document.getElementById('errorCheckCode2').style.display="none";
				document.getElementById('successCheckCode').style.display="block";	
			}
			else{
				f = 0;
				document.getElementById('errorCheckCode2').style.display="block";
			}
		}
	}
}
