//비밀번호 정규식
$("#password").change(function(){

	const $pw = $("#password");
	const pw = $pw.val();
	const pwReg = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,20}$/;

	if(pwReg.test(pw) == false) {
		$(".pw_checked").text("비밀번호는 숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.").css("color","red");
		//alert("비밀번호는 숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.");
		$pw.focus();
		return false;
	} else {
		$(".pw_checked").text("사용 가능합니다").css("color","green");
	}

});


//비밀번호 일치 확인
$("#pw_confirm").change(function(){
	const $pw = $("#password");
	const pw = $pw.val();
	
	const $pwc = $("#pw_confirm");
	const pwc = $pwc.val();
	
	if(pw != pwc){
		$(".pw_confirm_checked").text("비밀번호가 일치하지 않습니다.").css("color","red");
		$pwc.focus();
	} else {
		$(".pw_confirm_checked").text("비밀번호가 일치 합니다.").css("color","green");
	}
		
})


$("#reg_btn").click(function(){
	$(".form_memberReg").submit();
});




