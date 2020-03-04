function validate_form() {
	validity = true;
	//电话
	if(!check_tel(document.regForm.phoneNum.value)) {
		validity = false;
		alert('手机号码不正确，请输入正确的手机号');
	}
	//用户名
	else if(!check_username(document.regForm.username.value)) {
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
						 document.regForm.cfpassword.value)) {
		validity = false;
		alert('对不起，两次输入的密码不一样！');
	}
	
	//邮箱
	else if(!check_email(document.regForm.email.value)) {
		validity = false;
		alert('邮箱格式不正确，请输入正确的Email地址');
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