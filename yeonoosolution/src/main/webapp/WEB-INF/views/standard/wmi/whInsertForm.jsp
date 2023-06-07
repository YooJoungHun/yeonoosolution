<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script defer src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		function insertWh() {
			if(confirm("등록하시겠습니까?")){
				// 확인 버튼을 누른 경우 처리할 내용 작성
				var selWhName = $("#wh_name_insert").val();
				alert(selWhName);
				var selUseYn = $("#useYn_insert").val();
				alert(selUseYn);
				var selRegDate = $("#regDate_insert").val();
				alert(selRegDate);
				var selMemo = $("#memo_insert").val();
				
				var whDto = {
					whName  : selWhName,
					useYn : selUseYn,
					regDate : selRegDate,
					memo  : selMemo
				};
				
				$.ajax({
					url : "/standard/insertWh/",
					type : 'POST',
					data : whDto,
					dataType : 'text',
					success : function(data){
						alert("등록되었습니다")
						if(parseInt(data) == 1){
							window.close();
							if (window.opener) {
					            window.opener.location.reload(); // 원본 창 새로 고침
					        }
						}
					}
				});
			}
		}
	</script>
</head>
<body>
	<div>
		창고명
		<input id="wh_name_insert" type="text">
		사용여부
		<select id="useYn_insert">
			<option value="Y">Y</option>
			<option value="N">N</option>
		</select>
		등록일시
		<input id="regDate_insert" type="date">
		비고
		<input id="memo_insert" type="text">
		<button onclick="insertWh()">등록</button>
	</div>
</body>
</html>