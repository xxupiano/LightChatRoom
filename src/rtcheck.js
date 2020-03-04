//电话号码验证
var oTel = document.getElementById("phoneNum");
var oTelId = document.getElementById("ckphoneNum");
oTel.onblur = function() {
	var valtel = oTel.value;
	var reg = /^1\d{10}$/;
	if(valtel==""){
		oTelId.focus();
		oTelId.innerHTML = "电话号码必填!";
		oTelId.style.color="red";
		return false;
	}
	else if (!reg.test(valtel)) {
		oTelId.innerHTML = "电话号码格式不正确！";
		oTelId.style.color="red";
		return false;
	} else {
		oTelId.style.color = "#0f0";
		oTelId.innerHTML = "格式正确";
		return true;
	}
}
//用户名验证
var oTxt1 = document.getElementById("username");
var oName = document.getElementById("ckusername");
oTxt1.onchange = function() {
	var valn = oTxt1.value;
	var reg = /^[a-zA-Z]\w{4,14}$/;
	if(valn==""){
		oName.innerHTML = "用户名不能为空!";
		oName.style.color = "red";
		return false;
	}
	else if(!reg.test(valn)) {
		oName.innerHTML = "由英文字母、数字、下划线组成，长度为5-15个字符，并且以英文字母开头";
		oName.style.color = "red";
		return false;
	} else {
		oName.innerHTML = "格式正确";
		oName.style.color = "#0f0";
		return true;
	}
}
//密码验证
var oPsw = document.getElementById("password");
var oPwd = document.getElementById("ckpassword");
oPsw.onchange = function() {
	var valp = oPsw.value;
	var reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*?[#?!@$%^&*-]).{6,}$/;
	if(valp == ""){
		oPwd.innerHTML = "密码不能为空!";
		oPwd.style.color = "red";
		return false;
	}
	else if (!reg.test(valp)) {
		oPwd.innerHTML = "最少6位，至少包括一个大写字母、一个小写字母、一个数字、一个特殊字符(#?!@$%^&*-)";
		oPwd.style.color = "red";
		return false;
	} else {
		oPwd.style.color = "#0f0";
		var length=valp.length;
		if(length<=10){
			oPwd.innerHTML = "密码强度:弱";
		}
		else if(length<=15){
			oPwd.innerHTML = "密码强度:中";
		}
		else{
			oPwd.innerHTML = "密码强度:强";
		}
		return true;
	}
}
//重输密码
var oPsw1 = document.getElementById("cfpassword");
var oPwd1 = document.getElementById("ckcfpassword");
oPsw1.onchange=function(){
	var valp = oPsw.value;
	var valp1 = oPsw1.value;
	if (valp != valp1) {
		oPwd1.innerHTML = "两次输入不一致";
		oPwd1.style.color = "red";
	} else {
		oPwd1.innerHTML = "";
	}
}
//邮箱验证
var oTxtemail = document.getElementById("email");
var oEmail = document.getElementById("ckemail");
oTxtemail.onblur = function() {
	var valemail = this.value;
	var reg = /[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
	if(valemail==""){
		oEmail.innerHTML = "邮箱必填!";
		oEmail.style.color = "#f00";
	}
	else if (reg.test(valemail)) {
		oEmail.innerHTML = "格式正确";
		oEmail.style.color = "#0f0";

	} else {
		oEmail.innerHTML = "请输入：如jhon@163.com";
		oEmail.style.color = "#f00";
	}
}

function validate_form() {
	validity = true;
	//用户名
	if(!check_username(document.regForm.username.value)) {
		validity = false;
		alert('用户名不符合要求，请重新输入');
	}
	
	//密码
	else if(!check_password(document.regForm.password.value)) {
		validity = false;
		alert('密码不符合要求，请重新输入');
	}
	
	//重复密码
	else if(!passwordcof(document.regForm.password.value,
						 document.regForm.cofpassword.value)) {
		validity = false;
		alert('对不起，两次输入的密码不一样！');
	}
	
	//邮箱
	else if(!check_email(document.regForm.useremail.value)) {
		validity = false;
		alert('邮箱格式不正确，请输入正确的Email地址');
	}
	
	//电话
	else if(!check_tel(document.regForm.usertel.value)) {
		validity = false;
		alert('手机号码不正确，请输入正确的手机号');
	}
	return validity;
}
//用户名检验
function check_username(text) {
	var reg = /^[a-zA-Z]\w{4,14}$/;
	return reg.test(text);
}

//密码检验
function check_password(text) {
	var reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*?[#?!@$%^&*-]).{6,}$/;
	return reg.test(text);
}

//重复密码检验
function passwordcof(text1, text2) {
	return(text1==text2);
}

//邮箱检验
function check_email(text) {
	var reg = /[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/
	return reg.test(text);
}

//手机号检验
function check_tel(text) {
	var reg = /^1\d{10}$/;
	return reg.test(text);
}


