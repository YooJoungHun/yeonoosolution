<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
	
	<style type="text/css">
		button {
			background-color: #F5F5F5;
			border: 1px solid #D6DAE2;
			outline: none;
			border-radius: 5px;
			padding: 0 12px;
			height: 32px;
		}
		
		button:not(:last-child) {
			margin-right: 4px;
		}
		
		button:hover {
			background-color: #8EA8DB;
		}
	</style>
	
</head>
<body>
	
	<h2>창고등록</h2><p>
	
	<form class="row g-3">
		<div class="col-12">
		  	<label for="wh_name_insert" class="form-label">창고명</label>
		  	<input type="text" class="form-control" id="wh_name_insert">
		</div>
		<div class="col-12">
			<label for="useYn_insert" class="form-label">사용여부</label>
			<select id="useYn_insert" class="form-select">
			    <option value="Y">Y</option>
			    <option value="N">N</option>
			</select>
		</div>
		<div class="col-12">
		  	<label for="regDate_insert" class="form-label">등록일시</label>
		  	<input type="date" class="form-control" id="regDate_insert">
		</div>
		<div class="col-12">
		 	<label for="memo_insert" class="form-label">비고</label>
		 	<input type="text" class="form-control" id="memo_insert">
		</div>
		<div>
			<button onclick="insertWh()">등록</button>
		</div>
	</form>
	
</body>
</html>