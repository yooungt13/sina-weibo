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
    var provinceCity=city[sltProvince.selectedIndex - 1];

    //清空城市下拉框，仅留提示选项
    sltCity.length=1;

    //将城市数组中的值填充到城市下拉框中
    for(var i=0;i<provinceCity.length;i++){
        sltCity[i+1]=new Option(provinceCity[i],provinceCity[i]);
    }
}

//提示输入公司名称
function onclickShowStyleOfWorkPlace(){
	document.getElementById("inputWorkPlace1").style.display="block";
	document.getElementById("errorWorkPlace2").style.display="none";
	document.getElementById("successWorkPlace").style.display="none";
}

//验证公司名称
function onblurValidateWorkPlace(id){
	var workinfo = document.getElementById(id).value;
	if( workinfo.length == 0 ){
		document.getElementById("inputWorkPlace1").style.display="none";
		document.getElementById("errorWorkPlace2").style.display="none";
		document.getElementById("successWorkPlace").style.display="none";
	}
	else{
		if( workinfo.length >= 1 && workinfo.length <= 20 ){
			document.getElementById("inputWorkPlace1").style.display="none";
			document.getElementById("errorWorkPlace2").style.display="none";
			document.getElementById("successWorkPlace").style.display="block";
		}
		else{
			document.getElementById("inputWorkPlace1").style.display="none";
			document.getElementById("errorWorkPlace2").style.display="block";
			document.getElementById("successWorkPlace").style.display="none";
		}
	}
}

//验证工作年份
function onchangeValidateWorkTime(id){
	var workFrom = document.getElementById("workTimeFrom").value;
	var workTo = document.getElementById(id).value;
	if( workTo = ""){
		document.getElementById("errorWorkTimeTO2").style.display="none";
		document.getElementById("successWorkTimeTo").style.display="none";
	}
	else{
		if( workFrom <= workTo ){
			document.getElementById("errorWorkTimeTO2").style.display="none";
			document.getElementById("successWorkTimeTo").style.display="block";
		} 
		else{
			document.getElementById("errorWorkTimeTO2").style.display="block";
			document.getElementById("successWorkTimeTo").style.display="none";
		}
	}
}

//提示输入职位
function onclickShowStyleOfDepartment(){
	document.getElementById("inputDepartment1").style.display="block";
	document.getElementById("errorDepartment2").style.display="none";
	document.getElementById("successDepartment").style.display="none";
}
//验证输入职位
function onblurValidateDepartment(id){
	var workinfo = document.getElementById(id).value;
	if( workinfo.length == 0 ){
		document.getElementById("inputDepartment1").style.display="none";
		document.getElementById("errorDepartment2").style.display="none";
		document.getElementById("successDepartment").style.display="none";
	}
	else{
		if( workinfo.length >=1 && workinfo.length <=20 ){
			document.getElementById("inputDepartment1").style.display="none";
			document.getElementById("errorDepartment2").style.display="none";
			document.getElementById("successDepartment").style.display="block";
		}
		else{
			document.getElementById("inputDepartment1").style.display="none";
			document.getElementById("errorDepartment2").style.display="block";
			document.getElementById("successDepartment").style.display="none";
		}
	}
}