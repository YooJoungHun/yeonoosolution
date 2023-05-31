<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


			function showSelect() { // 검색 거래처 코드 드롭다운 (지정이 없을 땐 "거래처코드 검색"이 보이도록)
				var selectElement = document.getElementById("customerCode");
				var selectedOption = selectElement.options[selectElement.selectedIndex];
				var selectedValue = selectedOption.value;
			
					if (selectedValue === "") {
					} else {
					}
				} 

</script>
</head>
<body>
<form name="form2" method="get" action="${pageContext.request.contextPath }/new">

			<select name="customerCode"  id="customerCode" onchange="showSelect()">
				<option value="" selected>거래처코드 찾기</option>
				<c:forEach var="C" items="${companyCodeList}">
					<option value="${C.companyCode}">${C.companyCode}</option>
				</c:forEach>
			</select>
					<input type="submit" value="검색">
					<button type="button" onclick="location.href='/new'">초기화</button><p>

<table border="1" class="table1"> 

			<tr>
				<th></th>
				<th>상태</th>
				<th>거래처코드</th>
				<th>거래처명</th>
				<th>수주번호</th>
				<th>출고번호</th>
				<th>출고일자</th>
				<th>출고등록자</th>
				<th>등록일자</th>
				<th>제품명</th>
				<th>제품번호</th>
				<th>수량</th>
				<th>단가</th>
				<th>총액</th>
				<th>비고(출고)</th>
				<th>비고(제품)</th>
			</tr>
			<c:forEach var="OD" items="${outListWithDetail}" varStatus="status">
			<c:choose>
				<c:when test="${OD.deleteStatus == 'N' }">
				<tr>
					<td><c:out value ="${status.count}"/><input type="hidden" value="${OD.outCode}" id="idoutCode${status.count}"></td>
					<td><c:out 	value ="${OD.outType}"/></td>
					<td><c:out 	value ="${OD.customerCode}"/></td>
					<td><c:out 	value ="${OD.companyName}"/></td>
					<td><c:out 	value ="${OD.orderCode}"/></td>
					<td><c:out 	value ="${OD.outCode}" /></td> 
					<td><c:out 	value ="${OD.outDate}"/></td>
					<td><c:out 	value ="${OD.regUser}" /></td>
					<td><c:out 	value ="${OD.regDate}" /></td>
					<td><c:out 	value ="${OD.itemName}" /></td>
					<td><c:out 	value ="${OD.itemCode}" /></td>
					<td><c:out 	value ="${OD.outQuantity}" /></td>
					<td><c:out 	value ="${OD.salesPrice}" /></td>
					<td><c:out 	value ="${OD.totalPrice}" /></td>
					<td><c:out 	value ="${OD.memo}" /></td>
					<td><c:out 	value ="${OD.memo2}" /></td>
				</tr>
				</c:when>	
			</c:choose>
			</c:forEach>			
			
	</table>  
</form>
</body>
</html>