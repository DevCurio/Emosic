//아이디 유효성 검사 & 아이디 중복 검사(1 = 중복 / 0 != 중복)
$("#id").change(function() {
	const $id = $("#id");	//const는 중복불가 변수
	const id = $id.val();
	const idReg = /^[a-z0-9_-]{5,15}$/;
	
	//debugger;
	$.ajax({
		type: "get",
		url: "member/id/duplicate",
		data: {"id": id},
		success:function(isduplicate){
			//debugger;
			if(idReg.test(id) == false) {
				$(".id_checked").text("5~15자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.").css("color","red");
				$id.focus();
				
			} else if(isduplicate != 1) {	//중복 사용자 없음 (사용 가능)
				$(".id_checked").text("사용 가능합니다.").css("color","green");
				
			} else if(isduplicate == 1) {	//중복 사용자 존재 (사용 불가)
				$(".id_checked").text("이미 존재하는 ID 입니다.").css("color","red");
				$id.focus();
			}
			
		},
		error : function(e){
			//debugger;
			alert("에러 입니다.")
		}
	});

});



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
	} else if(pwc == ''){
		alert('비밀번호 확인이 필요합니다.');
		$pwc.focus();
		return false;		
	} else {
		$(".pw_confirm_checked").text("비밀번호가 일치 합니다.").css("color","green");
	}
		
})


function submitCheck(){
	const id = $("#id").val();
	const pw = $("#password").val();
	const pwc = $("#pw_confirm").val();
	const nick = $("#nickName").val();
	
	if(id == ""){
		alert("아이디를 입력 해주세요.");
		return false;
	}else if(pw == ""){
		alert("비밀번호를 입력 해주세요.");
		return false;
	}else if(pwc == ""){
		alert("비밀번호 확인을 해주세요.");
		return false;
	}else if(nick == ""){
		alert("닉네임을 입력 해주세요.");
		return false;
	}
	
}

/*$("#reg_btn").click(function(){
	$(".form_memberReg").submit();
});*/


