// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
/*$("#id").change(function() {
	const $id = $("#id");	//const는 중복불가 변수
	const id = $id.val();
	
	$.ajax({
		type: "POST",
		url: "${pageContext.request.contextPath}/member/register",
		data: {"id": id},
		success:function(isduplicate){
			if(isduplicate != 1) { //중복 사용자 없음 (사용 가능)
				$(".id_success").css("display","inline-block");
			} else {	//중복 사용자 존재 (사용 불가)
				$(".id_fail").css("display","inline-block");
			}
		}
		error : function(){
			alert("에러 입니다.")
		}
	});
});
*/
$("#reg_btn").click(function(){
	$(".form_memberReg").submit();
});