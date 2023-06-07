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
	<script defer src="/js/standard/wmi/whForm.js"></script>
	<script type="text/javascript">		
	</script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/standard/wmi/whFormStyle.css"/>
	
</head>
<body>
	
<div class="whAll">
	<%-- <div class="side-bar">
	
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
       
    </div> --%>


	<div class="WhFormDiv"> 

		<div style="display: flex;">
			<div style="margin-right: 5px;">창고코드</div>
			<input id="wh_code_search" type="text" style="margin-right: 20px;">		
			<div style="margin-right: 5px;">창고명</div>
			<input id="wh_name_search" type="text">
			<button onclick="searchWhList()" style="margin-left: 10px;">조회</button>
		</div>
		<p>
		
		<div style="display: flex; ">
			<button onclick="openInsertWhWindow()">등록</button>
			<button onclick="modifyWhInfo(1)">수정</button>
			<button onclick="modifyWhInfo(2)">삭제</button>
		</div>
		<p>
		
		<span style="font-size: 20px; font-weight: 650;">창고</span><br>
		<table id="warehouseTable" border="1">
			<tr>
				<th>번호</th>
				<th>
					<input type="checkbox" id="AllCheckBox" onclick="checkBoxAllCheck()">
				</th>
				<th>창고코드</th>
				<th>창고명</th>
				<th>사용여부</th>
				<th>등록일시</th>
				<th>등록자</th>
				<th>수정일시</th>
				<th>수정자</th>
				<th>비고</th>
			</tr>
			<c:forEach var="whList" items="${listWarehouse }" varStatus="status">
				<tr>
					<td>${whList.rn }</td>
					<td>
						<input type="checkbox" name="tableCheckBox" id="checkBox${status.index }">
					</td>
					<td>
						<input type="hidden" id="whCode${status.index }" value="${whList.whCode }">
						${whList.whCode }
					</td>
					<td>
						<input id="whName${status.index }" type="text" value="${whList.whName }">
					</td>
					<td>
						<select id="useYn${status.index }">
							<option value="Y" ${whList.useYn == 'Y' ? 'selected="selected"' : '' }>Y</option>
							<option value="N" ${whList.useYn == 'N' ? 'selected="selected"' : '' }>N</option>
						</select>
	 				</td>
					<td>${whList.regDate }</td>
					<td>${whList.regUserName }</td>
					<td>${whList.updateDate }</td>
					<td>
						<input type="hidden" id="updateUser${status.index }" value="${whList.updateUser }">
						${whList.updateUserName }
					</td>
					<td>
						<input id="memo${status.index }" type="text" value="${whList.memo }">
					</td>
				</tr>
			</c:forEach>
		</table>
		
	</div>
		
</div>
	
</body>
</html>