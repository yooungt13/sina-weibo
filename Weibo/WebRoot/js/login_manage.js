function clearLogin(id){
	var obj = document.getElementById(id);
	if( obj.value == '请输入登陆名称')
		obj.value='';
	obj.style.cssText = "color: #000;";
}

function clearPassword(){
	var tx = document.getElementById("password_text");
	var pwd = document.getElementById("password");

	if(tx.value != "请输入密码") return;
	tx.style.display = "none";
	pwd.style.display = "block";
	pwd.value = "";
	pwd.style.cssText = "color: #000;";
	
	pwd.focus();
}

function recoverPassword(){
	var tx = document.getElementById("password_text");
	var pwd = document.getElementById("password");

	if(pwd.value != "") return;
	pwd.style.display = "none";
	tx.style.display = "";
	tx.value = "请输入密码";
}

function keyLogin(evt){

	evt = (evt) ? evt : ((window.event) ? window.event : "")
	keyCode = evt.keyCode ? evt.keyCode : (evt.which ? evt.which : evt.charCode);

	 //回车键的键值为13
	if (keyCode==13){
		//调用登录按钮的登录事件
		toSubmit('login');  
	}	
}