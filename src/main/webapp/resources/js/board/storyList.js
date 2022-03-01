//목록 상세보기
$("tr[list-no]").click(function(){

	var $tr = $(event.target).parent();
	var no = $tr.data("no");
	
	location.href = '${pageContext.request.contextPath}/board/boardDetail.do?no=\${no}';


});