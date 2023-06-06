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
<style type="text/css">
		.side-bar {
				  flex: 0 0 210px;
			      border: 1px solid #ddd;
			      padding: 20px;
			      float: left;
			      height: 100vh;
			      margin-right: 30px;}

		.all-button {
					    display: inline-flex;
					    align-items: center;
					    padding: 5px 10px;
					    background-color: #FFFFFF;
					    border: 1px solid;
					    border-radius: 5px;
					    border-color: #BDBDBD;
					 	}

		.button-icon {
					  width: 16px;
					  height: 16px;
					  margin-right: 5px;
					 }
		.all-button:hover {
						   background-color: #FFFFD2;
						   border-color: #888888;
						  }



		
		
		
		
		.stout-with-item-table {
				 		   		border-collapse: collapse;}
		.stout-with-item-table th { 	
							 	  border-collapse: collapse;
							 	  position: sticky; top: 0; 
							 	  font-size: 13px;
							 	  }
		.stout-with-item-table 	td { 
									 font-size: 14px;
							 		 border: 1px solid #F6F6F6;
							 		 height: 35px;}
						 		 
		.stout-with-item-table-div {
									 height: 400px;
									 overflow-y: auto;
									 overflow-x: auto;}
		.stout-with-item-table-div	th {
										background-color: #F6F6F6;}
				
		.stout-with-item-table-div tr:hover td{
		   								   	   background-color: #8C8C8C;}
		.stout-with-item-table-div {border:1px solid #9E9E9E; width: 1200px;}
		
		.listColor1 { background-color: #E6E6E6;}
		.listColor2 { background-color: #E6F5FF;}
		.listColor3 { background-color: #FAF2C8;}
		.listColor4 { background-color: #FFC19E;}

</style>
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
<body >

<div class="side-bar">
      <!-- product/ds -->
      <a href="/product/status/defect">불량현황</a><p>
      <!-- product/ps -->
      <a href="/product/status/production">생산현황 검색</a><p>
      <!-- product/pr -->
      <!-- product -->
      <a href="/product/is/item">품목별 재고 현황</a><p>
      <a href="/product/is/bom">BOM별 재고 현황</a><p>
      <a href="/product/is/wh">창고별 재고 현황</a><p>
      <a href="/product/is/wh/">창고별 재고 현황 상세</a><p>
      <a href="/item/search">제품 검색</a><p>
      <a href="/product/sim">입고</a><p>
      <a href="/wo">제품 생산 지시</a><p>
      
      <!-- sales -->
      <a href="/sales/analysis-of-materials">자제소요분석</a><p>
      <a href="/sales/receive-order">수주서 관리</a><p>
      <a href="/sales/stock/">출고 등록</a><p>
      <a href="/sales/stock/detail/">출고 조회</a><p>
      <a href="/sales/order">구매</a><p>
      <a href="/sales/stock-in">구매입고등록</a><p>
      
      <!-- standard -->
      <a href="/standard/login">로그인</a><p>
      <a href="/standard/user-admin">사용자 계정관리</a><p>
      <a href="/standard/imi">품목 관리 및 등록</a><p>
      <a href="/standard/ipi">품목 단가 관리</a><p>
      <a href="/standard/pmi">품목 관리 정보</a><p>
      
      <!-- 로그아웃 -->
      <c:if test="${sessionScope.member != null}">
         <form action="/standard/logout" method="POST">
            <button type="submit">로그아웃</button>
         </form>
      </c:if>
      
   </div>
   
	<form name="form2" method="get" action="${pageContext.request.contextPath }/sales/stock/detail/">
	
				<select name="customerCode" id="customerCode" onchange="showSelect()" style="width:130px;height:30px;border-radius: 10px; ">
					<option value="" selected >&nbsp;&nbsp;거래처코드 찾기</option>
						<c:forEach var="C" items="${companyCodeList}">
							<option value="${C.companyCode}">${C.companyCode}</option>
						</c:forEach>
				</select>
				
				
				<button type="submit" class="all-button" style="margin-top: 50px;">
					  <img src="/images/stout-search-icon.png" alt="" class="button-icon">
					  검색
				</button>
				
				<button type="button" onclick="location.href='/sales/stock/detail/'" class="all-button">
					 <img src="/images/stout-reset-icon.png" alt="" class="button-icon">
					 초기화
				</button><p>
			
	<div class="stout-with-item-table-div" id="table-size">
	<table class="stout-with-item-table" style="table-layout: fixed;"> 
				<tr>
					<th></th>
					<th>상태</th>
					<th>거래처코드</th>
					<th>거래처명</th>
					<th>수주번호</th>
					<th>출고번호</th>
					<th>출고일자</th>
					<th>출고<br/>등록자</th>
					<th>등록일자</th>
					<th>제품명</th>
					<th>제품번호</th>
					<th>수량</th>
					<th>단가</th>
					<th>총액</th>
					<th>비고(출고)</th>
					<th>비고(물품)</th>
				</tr>
				<c:forEach var="OD" items="${outListWithDetail}" varStatus="status">
				<c:choose>
					<c:when test="${OD.deleteStatus == 'N' }">
					<tr>
						<td style="text-align:center; width: 20px;"><c:out value ="${status.count}"/><input type="hidden" value="${OD.outCode}" id="idoutCode${status.count}"></td>
						<td style="text-align:center; width: 40px;"  class="listColor1"><c:out 	value ="${OD.outType}"/></td>
						<td style="width: 80px;" class="listColor2"><c:out 	value ="${OD.customerCode}"/></td>
						<td style="width: 90px;" class="listColor1"><c:out 	value ="${OD.companyName}"/></td>
						<td style="width: 70px;" class="listColor1"><c:out 	value ="${OD.orderCode}"/></td>
						<td style="width: 90px;" class="listColor1"><c:out 	value ="${OD.outCode}" /></td> 
						<td style="width: 80px;" class="listColor2"><c:out 	value ="${OD.outDate}"/></td>
						<td style="text-align:center; width: 60px;" class="listColor2"><c:out 	value ="${OD.regUser}" /></td>
						<td style="width: 150px;" class="listColor1"><c:out 	value ="${OD.regDate}" /></td>
						<td style="text-align:center; width: 100px;"  class="listColor2"><c:out 	value ="${OD.itemName}" /></td>
						<td style="width: 50px;" class="listColor2"><c:out 	value ="${OD.itemCode}" /></td>
						<td style="text-align:center; width: 30px;" class="listColor1"><c:out 	value ="${OD.outQuantity}" /></td>
						<td style="text-align:center; width: 60px;" class="listColor3"><c:out 	value ="${OD.salesPrice}" /></td>
						<td style="text-align:center; width: 75px;" class="listColor4"><c:out 	value ="${OD.totalPrice}" /></td>
						<td style="width: 60px;" class="listColor1"><c:out 	value ="${OD.memo}" /></td>
						<td style="width: 60px;" class="listColor1"><c:out 	value ="${OD.memo2}" /></td>
					</tr>
					</c:when>	
				</c:choose>
				</c:forEach>			
				
		</table>  
		</div>
		<script type="text/javascript">
			
		const container = document.getElementById('table-size');
		
		const tbody = container.querySelector('tbody');
		
		const rows = tbody.getElementsByTagName('tr');

		const table = container.querySelector('table');
		
		
		let rowsHeight = 0;
		for (let i = 0; i < rows.length; i++) {
		  rowsHeight += rows[i].clientHeight;
		}
		
		const tableWidth = table.clientWidth;
		
		const newHeight = Math.min(rowsHeight, 400);
		
		const newWidth = Math.min(tableWidth, 1500); 
		
		container.style.height = newHeight + 'px';
		container.style.width = newWidth + 'px'; 
			
		
		
			/* const container = document.getElementById('table-size');
			
			const tbody = container.querySelector('tbody');
		
			const rows = tbody.getElementsByTagName('tr');
		
			let rowsHeight = 0;
			for (let i = 0; i < rows.length; i++) {
			  rowsHeight += rows[i].clientHeight;
			}
		
			const newHeight = Math.min(rowsHeight, 400);
		
			container.style.height = newHeight + 'px';  */
		</script> 
</form>
</body>
</html>