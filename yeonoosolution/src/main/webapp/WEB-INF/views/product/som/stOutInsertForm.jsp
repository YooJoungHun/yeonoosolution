<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		function insertStOut() {
			if(confirm("등록하시겠습니까?")){
				var selOutDate		= $('#outDate_insert').val();
				var selWhCode		= document.getElementById("wh_insert").value;
				var selItemCode		= document.getElementById("item_insert").value;
				var selOutQuantity	= document.getElementById("outQuantity_insert").value;
				var selMemo			= $('memo_insert').val();
				
				
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
</head>
<body>
	<div>
		출고날짜
		<input id="outDate_insert" type="date" required="required">
		비고
		<input id="memo_insert" type="text">
		창고
		<select id="wh_insert" required="required">
			<c:forEach var="stOutWh" items="${stOutWhList }">
				<option value="${stOutWh.whCode }">${stOutWh.whName }</option>
			</c:forEach>
		</select>
		제품
		<select id="item_insert" required="required">
			<c:forEach var="stOutItem" items="${stOutItemList }">
				<option value="${stOutItem.itemCode }">${stOutItem.itemName }</option>
			</c:forEach>
		</select>
		출고수량
		<input id="outQuantity_insert" type="number" required="required">
		<button onclick="insertStOut()">등록</button>
	</div>
</body>
</html>