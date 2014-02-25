var a = 1;
var b = 1;
var c = 1;
var d = 1;
var e = 1;
var f = 1;
var validateNum = 0;

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

//判断邮箱格式
function isEmail(str){ 
	var reg=/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/; 
    if (reg.test(str)){ 
    	return (true); 
    	}
    else{ 
    	return(false);
    	} 
}

//判断QQ格式
function isQQ(str){ 
	var reg=/^[1-9]\d{5,8}$/; 
    if (reg.test(str)){ 
    	return (true); 
    	}
    else{ 
    	return(false);
    	} 
}

//提示输入昵称
function onclickShowStyleOfNickName(){
	document.getElementById("successNickName").style.display="none";
	document.getElementById("errorNickName2").style.display="none";
	document.getElementById("errorNickName3").style.display="none";
	document.getElementById("inputNickName1").style.display="block";
}

//验证输入的昵称
function onblurValidateNickName(id){
	var user = document.getElementById(id).value;
	
	if(user.length >= 1 && user.length <=12){
		if( isChinese(user) ){
			validateNickName("validateNickName.action?user.nickName=" + encodeURI(encodeURI(user)));
		}
		else{
			a = 0;
			document.getElementById("successNickName").style.display="none";
			document.getElementById("inputNickName1").style.display="none";
			document.getElementById("errorNickName2").style.display="block";
			document.getElementById("errorNickName3").style.display="none";
		}
	}
	else{
		a = 0;
		document.getElementById("successNickName").style.display="none";
		document.getElementById("errorNickName2").style.display="block";
		document.getElementById("inputNickName1").style.display="none";
		document.getElementById("errorNickName3").style.display="none";
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
				
				a = 1;
				document.getElementById("inputNickName1").style.display = "none";
				document.getElementById("errorNickName2").style.display = "none";
				document.getElementById("errorNickName3").style.display = "none";
				document.getElementById("successNickName").style.display = "block";
			}else{
				// 提示框3
				
				a = 0;
				document.getElementById("successNickName").style.display = "none";
				document.getElementById("inputNickName1").style.display = "none";
				document.getElementById("errorNickName2").style.display = "none";
				document.getElementById("errorNickName3").style.display = "block";
			}
		}
	}
}

//提示输入真实姓名
function onclickShowStyleOfTrueName(){
	document.getElementById("successTrueName").style.display = "none";
	document.getElementById("errorTrueName2").style.display = "none";
	document.getElementById("inputTrueName1").style.display = "block";
}

function onblurValidateTrueName(id){
	var user = document.getElementById(id).value;
	if(user.length == 0){
		b = 1;
		document.getElementById("errorTrueName2").style.display = "none";
		document.getElementById("inputTrueName1").style.display = "none";
		document.getElementById("successTrueName").style.display = "none";
	}
	else{
		if( user.length >=2 && user.length <=12 ){
			if( isChinese(user) ){
			b = 1;
			document.getElementById("errorTrueName2").style.display = "none";
			document.getElementById("inputTrueName1").style.display = "none";
			document.getElementById("successTrueName").style.display = "block";
			}
			else{
				b = 0;
				document.getElementById("errorTrueName2").style.display = "block";
				document.getElementById("inputTrueName1").style.display = "none";
				document.getElementById("successTrueName").style.display = "none";
			}
		}
		else{
			b = 0;
			document.getElementById("errorTrueName2").style.display = "block";
			document.getElementById("inputTrueName1").style.display = "none";
			document.getElementById("successTrueName").style.display = "none";
		}
	}
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

//年月日三级联动

function initDate(){
	strYYYY = document.user.birthday_y.outerHTML;
	strMM = document.user.birthday_m.outerHTML;
	strDD = document.user.birthday_d.outerHTML;
	MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

//先给年下拉框赋内容
	var y = new Date().getFullYear();
	var str = strYYYY.substring(0, strYYYY.length - 9);
	//以今年为准，前30年，后30年
	for (var i = (y-100); i <= y; i++){ 
		str += "<option value='" + i + "'> " + i + "</option>\r\n";
	}
	document.user.birthday_y.outerHTML = str +"</select>";

	//赋月份的下拉框
	var str = strMM.substring(0, strMM.length - 9);
	for (var i = 1; i < 13; i++){
		if(i<10){
			str += "<option value='0" + i + "'> 0" + i + "</option>\r\n";
		}
		else{
			str += "<option value='" + i + "'> " + i + "</option>\r\n";
		}
	}
	document.user.birthday_m.outerHTML = str +"</select>";
	
	document.user.birthday_y.value = y;
	document.user.birthday_m.value = new Date().getMonth() + 1;
	var n = MonHead[new Date().getMonth()];
	if (new Date().getMonth() ==1 && IsPinYear(YYYYvalue)) n++;
	writeDay(n); //赋日期下拉框
	document.user.birthday_d.value = new Date().getDate();
	}

function YYYYMM(str) //年发生变化时日期发生变化(主要是判断闰平年)
{
var MMvalue = document.user.birthday_m.options[document.user.birthday_m.selectedIndex].value;
if (MMvalue == ""){birthday_d.outerHTML = strDD; return;}
var n = MonHead[MMvalue - 1];
if (MMvalue ==2 && IsPinYear(str)) n++;
writeDay(n);
}
function MMDD(str) //月发生变化时日期联动
{
var YYYYvalue = document.user.birthday_y.options[document.user.birthday_y.selectedIndex].value;
if (str == ""){birthday_d.outerHTML = strDD; return;}
var n = MonHead[str - 1];
if (str ==2 && IsPinYear(YYYYvalue)) n++;
writeDay(n);
}
function writeDay(n) //据条件写日期的下拉框
{
var s = strDD.substring(0, strDD.length - 9);
for (var i = 1; i <(n+1); i++)
	if( i < 10 ){
		s += "<option value='0" + i + "'> 0" + i + "</option>\r\n";
		}
	else{
		s += "<option value='" + i + "'> " + i + "</option>\r\n";
	}
		document.user.birthday_d.outerHTML = s +"</select>";
}
function IsPinYear(year){//判断是否闰平年
 return(0 == year%4 && (year%100 !=0 || year%400 == 0));
	}

//提示输入邮箱
function onclickShowStyleOfEmail(){
	document.getElementById("successEmail").style.display = "none";
	document.getElementById("errorEmail2").style.display = "none";
	document.getElementById("inputEmail1").style.display = "block";
}

//验证输入的邮箱
function onblurValidateEmail(id){
	var user = document.getElementById(id).value;
	if( user.length == 0){
		c = 1;
		document.getElementById("successEmail").style.display = "none";
		document.getElementById("errorEmail2").style.display = "none";
		document.getElementById("inputEmail1").style.display = "none";
	}
	else{
		if(isEmail(user)){
			c = 1;
			document.getElementById("errorEmail2").style.display = "none";
			document.getElementById("inputEmail1").style.display = "none";
			document.getElementById("successEmail").style.display = "block";
			}
		else{
			c = 0;
			document.getElementById("successEmail").style.display = "none";
			document.getElementById("errorEmail2").style.display = "block";
			document.getElementById("inputEmail1").style.display = "none";
		}
	}
}

//提示输入QQ
function onclickShowStyleOfQQ(){
	document.getElementById("successQQ").style.display = "none";
	document.getElementById("errorQQ2").style.display = "none";
	document.getElementById("inputQQ1").style.display = "block";
}
//验证输入的QQ
function onblurValidateQQ(id){
	var user = document.getElementById(id).value;
	if( user.length == 0){
		d = 1;
		document.getElementById("successQQ").style.display = "none";
		document.getElementById("errorQQ2").style.display = "none";
		document.getElementById("inputQQ1").style.display = "none";
	}
	else{
		if(isQQ(user)){
			d = 1;
			document.getElementById("errorQQ2").style.display = "none";
			document.getElementById("inputQQ1").style.display = "none";
			document.getElementById("successQQ").style.display = "block";
			}
		else{
			d = 0;
			document.getElementById("successQQ").style.display = "none";
			document.getElementById("errorQQ2").style.display = "block";
			document.getElementById("inputQQ1").style.display = "none";
		}
	}
}

//提示输入MSN
function onclickShowStyleOfMSN(){
	document.getElementById("successMSN").style.display = "none";
	document.getElementById("errorMSN2").style.display = "none";
	document.getElementById("inputMSN1").style.display = "block";
}

//验证输入的MSN
function onblurValidateMSN(id){
	var user = document.getElementById(id).value;
	if( user.length == 0){
		e = 1;
		document.getElementById("successMSN").style.display = "none";
		document.getElementById("errorMSN2").style.display = "none";
		document.getElementById("inputMSN1").style.display = "none";
	}
	else{
		if(isEmail(user)){
			e = 1;
			document.getElementById("errorMSN2").style.display = "none";
			document.getElementById("inputMSN1").style.display = "none";
			document.getElementById("successMSN").style.display = "block";
			}
		else{
			e = 0;
			document.getElementById("successMSN").style.display = "none";
			document.getElementById("errorMSN2").style.display = "block";
			document.getElementById("inputMSN1").style.display = "none";
		}
	}
}

//提示输入一句话介绍
function onclickShowStyleOfIntroduce(){
	document.getElementById("successIntroduce").style.display = "none";
	document.getElementById("errorIntroduce2").style.display = "none";
	document.getElementById("inputIntroduce1").style.display = "block";
}

//验证输入的一句话介绍
function onblurValidateIntroduce(id){
	var user = document.getElementById(id).value;
	if( user.length == 0 ){
		f = 1;
		document.getElementById("successIntroduce").style.display = "none";
		document.getElementById("errorIntroduce2").style.display = "none";
		document.getElementById("inputIntroduce1").style.display = "none";
	}
	else{
		if( user.length >= 1 && user.length <= 70){
			f = 1;
			document.getElementById("errorIntroduce2").style.display = "none";
			document.getElementById("inputIntroduce1").style.display = "none";
			document.getElementById("successIntroduce").style.display = "block";
		}
		else{
			f = 0;
			document.getElementById("inputIntroduce1").style.display = "none";
			document.getElementById("successIntroduce").style.display = "none";
			document.getElementById("errorIntroduce2").style.display = "block";
		}
	}
}


function validateUserSubmit(id){
	validateNum = a * b * c * d * e * f;
	
	if(validateNum == 1){
		var myform = document.getElementById(id);
		
		var msgBox = document.createElement("div");
		msgBox.setAttribute("id","profile_favs");
		var styleData = "position: fixed; clear: both; z-index: 1000; left: 634px; top: 380px; width: 100px; height: 77px;visibility: visible;";

		msgBox.style.cssText = styleData;
		msgBox.innerHTML = "";
		msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:100px;"><div class="txt1 gray6"><img class="tipicon tip3" src="/Weibo/css/img/PY_ib.gif"><div>保存成功</div>';
		
		document.body.appendChild(msgBox); 
		centerDiv('profile_favs');
		
		function removeChild(){
			document.body.removeChild(msgBox); 
			myform.submit();
		}
		setInterval(removeChild,1000);		
	}
}

//为性别初始化
function onloadCheckSex(sex){
	//window.alert(sex);
	if( sex == 1){
		document.getElementById("man").checked = "checked";
	}
	else{
		document.getElementById("woman").checked = "checked";
	}
	initDate();
}


function createMsgBox(){
	var msgBox = document.createElement("div");
	msgBox.setAttribute("id","profile_favs");
	var styleData = "position: fixed; clear: both; z-index: 1000; left: 634px; top: 380px; width: 100px; height: 77px;visibility: visible;";

	msgBox.style.cssText = styleData;
	msgBox.innerHTML = "";
	msgBox.innerHTML += '<div><div class="miniPopLayer" style="width:100px;"><div class="txt1 gray6"><img class="tipicon tip3" src="/Weibo/css/img/PY_ib.gif"><div>保存成功</div>';
	
	document.body.appendChild(msgBox); 
	centerDiv('profile_favs');
	
	function removeChild(){
		document.body.removeChild(msgBox); 
	}
	setInterval(removeChild,1500);
}