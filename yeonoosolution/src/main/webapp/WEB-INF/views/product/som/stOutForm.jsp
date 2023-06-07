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
		
		function stOutRadioCheck(index) {	
			var selOut_code = $('#idOutCode' + index).val();
			
			//alert(selOut_code);
			
			$.ajax({
				url : '/product/somStOutDetailLists/',
				type : 'GET',
				data : { outCode: selOut_code },
				dataType : 'html',
				success: function(stOutDetail) {
					
					$('#stOutDetailTable').html(stOutDetail);
					
				},
				error: function(error) {
				  console.error('Error:', error);
				}
			});
		}
		
		function openInsertStOutWindow() {
			var editUrl = "/product/somStOutInsertForm/";
			
			var editWindow = window.open(editUrl, "edit_window", "wideth=200, heigt=100");
		}
		
		function deleteStOut(){
			if(confirm("삭제하시겠습니까?")){
				var radioBtns = document.querySelector('input[name="selectRadio"]:checked');
				
				var rowIndex = (radioBtns.parentNode.parentNode.rowIndex)-1;
				
				alert("라디오 로우인덱스 -> "+rowIndex);
				
				var DelOut_code = document.getElementById("idOutCode"+rowIndex).value;
				alert("출고번호 -> "+ DelOut_code);
				
				$.ajax({
					url : '/product/somStOutDelete/',
					type : 'Patch',
					data : { outCode: DelOut_code },
					dataType : 'text',
					success: function(data) {
						if(parseInt(data) == 1){
							alert("삭제되었습니다");
							location.reload();
						}
					},
					error: function(error) {
					  console.error('Error:', error);
					}
				});
				
				
			}
			
		}
		
		
	</script>
</head>
<body>
	<div style="display: flex;">
		<button onclick="openInsertStOutWindow()">등록</button>
		<button onclick="deleteStOut()">삭제</button>
	</div>
	<h2>기타출고</h2>
	<table id="warehouseTable" border="1">
		<tr>
			<th>순번</th>
			<th></th>
			<th>출고번호</th>
			<th>출고유형</th>
			<th>출고상태</th>
			<th>출고날짜</th>
			<th>등록자</th>
			<th>등록일시</th>
			<th>수정자</th>
			<th>수정일시</th>
			<th>비고</th>
		</tr>
		<c:forEach var="stOutList" items="${stOutList }" varStatus="status">
			<tr>
				<td><c:out value ="${status.count}"/></td>
				<td><input type="radio" name="selectRadio" onclick="stOutRadioCheck(${status.index})"></td>
				<td>
					<input type="hidden" value="${stOutList.outCode}" id="idOutCode${status.index}">
					<c:out value ="${stOutList.outCode}" />
				</td> 
				<td><c:out value ="${stOutList.orderCode != null ? '판매출고' : '기타출고'}"/></td>
				<td><c:out value ="${stOutList.outType}"/></td>
				<td><c:out value ="${stOutList.outDate}"/></td>
				<td><c:out value ="${stOutList.regUser}"/></td>
				<td><c:out value ="${stOutList.regDate}" /></td>
				<td><c:out value ="${stOutList.updateUser}"/></td>
				<td><c:out value ="${stOutList.updateDate}" /></td>
				<td><c:out value ="${stOutList.memo}"/></td>
			</tr>
		</c:forEach>
	</table>
	
	<h2>세부항목</h2>
	<table id="stOutDetailTable" border="1">
		<tr>
			<td>순번</td>
			<td>제품코드</td>
			<td>제품명</td>
			<td>창고코드</td>
			<td>출고수량</td>
			<td>비고</td>
		</tr>
	</table>

	
</body>
</html>