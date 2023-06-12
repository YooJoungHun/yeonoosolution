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
	<script type="text/javascript">
		function insertStOut() {
			if(confirm("등록하시겠습니까?")){
				var selOutDate		= $('#outDate_insert').val();
				var selWhCode		= document.getElementById("wh_insert").value;
				var selItemCode		= document.getElementById("item_insert").value;
				var selOutQuantity	= document.getElementById("outQuantity_insert").value;
				var selMemo			= document.getElementById('memo_insert').value;
				
				
				var SOMStOutDto = {
					outDate 	: selOutDate,
					whCode		: selWhCode,
					itemCode	: selItemCode,
					outQuantity	: selOutQuantity,
					memo		: selMemo
				};
				
				$.ajax({
					url		: "/product/insertsomStOut/",
					type	: 'POST',
					data	: SOMStOutDto,
					dataType : 'text',
					success	: function(data){
						if(parseInt(data) == 2){
							alert("등록되었습니다")
							window.close();
							if(window.opener){
								window.opener.location.reload();
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
	
	<h2>기타출고등록</h2><p>
	
	<form class="row g-3">
		<div class="col-12">
		  	<label for="outDate_insert" class="form-label">출고날짜</label>
		  	<input type="date" class="form-control" id="outDate_insert">
		</div>
		<div class="col-12">
		 	<label for="memo_insert" class="form-label">비고</label>
		 	<input type="text" class="form-control" id="memo_insert">
		</div>
		<div class="col-12">
			<label for="wh_insert" class="form-label">창고</label>
			<select id="wh_insert" class="form-select">
				<c:forEach var="stOutWh" items="${stOutWhList}">
	     			<option value="${stOutWh.whCode}">${stOutWh.whName}</option>
	   			</c:forEach>
			</select>
		</div>
		<div class="col-12">
			<label for="item_insert" class="form-label">제품</label>
			<select id="item_insert" class="form-select">
			    <c:forEach var="stOutItem" items="${stOutItemList}">
		     		<option value="${stOutItem.itemCode}">${stOutItem.itemName}</option>
		   		</c:forEach>
			</select>
		</div>
		<div class="col-12">
		  	<label for="outQuantity_insert" class="form-label">출고수량</label>
		  	<input type="number" class="form-control" id="outQuantity_insert" required="required">
		</div>
		<div>
			<button onclick="insertStOut()">등록</button>
		</div>
	</form>
	
</body>
</html>