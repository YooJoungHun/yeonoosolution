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
			
			var editWindow = window.open(editUrl, "edit_window", "width=400, height=500");
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
	
	<style type="text/css">
		
		.stOutAll {
			display: flex;
		}
		
		.stOutFormDiv{
			margin: 30px;
		}
		
		input {
			height: 1.6rem;
		}
		
		#stOutTable {
    		border-collapse: collapse;
			background-color: #F8F8F8;
			padding: 20px;
			width: 120%;
			text-align: center;
		}
		
		#stOutDetailTable {
    		border-collapse: collapse;
			background-color: #F8F8F8;
			padding: 20px;
			width: 120%;
			text-align: center;
		}
		
		th {
			background-color: #909090;
		}
		
		tr:nth-child(even) {
			background-color: #D8D8D8;
		}
		
		tr:hover {
			background-color: #7C96C9;
		}
		
		.side-bar {
			border: 1px solid #ddd;
			padding: 20px;
			float: left;
			height: 100vh;
		}
		
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

<div class="stOutAll">

	<div class="side-bar">
	
       <a href="/standard/warehouseLists/">창고관리</a><p>
       <a href="/product/somStOutLists/">기타출고</a><p>
		
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
       
       <!-- product/smm -->
       <a href="/product/stockMoveRegistration">재고 이동등록</a><p>
       <a href="/product/stockMoveStatus">재고 이동현황</a><p>
       
       <!-- sales -->
       <a href="/sales/receive-order">수주서 관리</a><p>
       <a href="/sales/analysis-of-materials">자제요소분석</a><p>
       <a href="/sales/order">구매</a><p>
       <a href="/sales/stock-in">구매입고등록</a><p>
       
       <!-- standard -->
       <a href="/standard/login">로그인</a><p>
       <a href="/standard/user-admin">사용자 계정관리</a><p>
       <a href="/standard/imi">품목 관리 및 등록</a><p>
       <a href="/standard/ipi">품목 단가 관리</a><p>
       <a href="/standard/pmi">품목 관리 정보</a><p>
       
       <!-- standard bi -->
          기본정보<p>
        <a href="/standard/companyInfo/">회사정보</a><p>
        <a href="/standard/customerInfo/">거래처정보</a><p>
        <!-- standard um -->
          사용자관리<p>
        <a href="/standard/myPage/">개인정보수정</a><p>
        <a href="/standard/dept/">부서등록 및 확인</a><p>
        <a href="/standard/job/">직급등록 및 확인</a><p>
       
       <!-- 로그아웃 -->
       <c:if test="${sessionScope.member != null}">
          <form action="/standard/logout" method="POST">
             <button type="submit">로그아웃</button>
          </form>
       </c:if>            
       
    </div>
    
    <div class="stOutFormDiv">
	
		<div style="display: flex;">
			<button onclick="openInsertStOutWindow()">등록</button>
			<button onclick="deleteStOut()">삭제</button>
		</div>
		<p>
		
		<span style="font-size: 20px; font-weight: 650;">기타출고</span><br>
		<table id="stOutTable" border="1">
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
				<th>순번</th>
				<th>제품코드</th>
				<th>제품명</th>
				<th>창고코드</th>
				<th>출고수량</th>
				<th>비고</th>
			</tr>
		</table>
	
	</div>

</div>
	
</body>
</html>