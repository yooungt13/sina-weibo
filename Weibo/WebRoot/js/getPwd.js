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

//判断用户名是否为数字字母下滑线      
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

//提示输入要找回帐号的登录名
function onclickShowStyleOfLoginName(){
	document.getElementById("inputLoginName1").style.display="block";
	document.getElementById("errorLoginName2").style.display="none";
}

//验证输入的登录名是否合法
function onblurValidateLoginName(id){
	var loginName=document.getElementById("loginName").value;
	if( notChinese(loginName) && loginName.length >=6 && loginName.length <= 12){
		document.getElementById("inputLoginName1").style.display="none";
		document.getElementById("errorLoginName2").style.display="none";
	}
	else{
		document.getElementById("inputLoginName1").style.display="none";
		document.getElementById("errorLoginName2").style.display="block";
	}
}

//提示输入要找回的帐号绑定的身份证号
function onclickShowStyleOfID(){
	document.getElementById("inputID1").style.display="block";
	document.getElementById("errorID2").style.display="none";
}

//验证输入的身份证号是否正确
function onblurValidateID(id){
	var ID=document.getElementById("identifier").value;
	if( IdCardValidate(ID) && (ID.length == 15 || ID.length == 18)){
		document.getElementById("inputID1").style.display="none";
		document.getElementById("errorID2").style.display="none";
	}
	else{
		document.getElementById("inputID1").style.display="none";
		document.getElementById("errorID2").style.display="block";
	}
}