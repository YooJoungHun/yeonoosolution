<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.side-bar {
	margin-right: 20px;
	border: 1px solid #ddd;
	padding: 20px;
	height: 100vh;
	display: flex;
	flex-direction: column;
}
.side-bar a, p {
	width: 170px;
	margin: 5 0px;
}
</style>
</head>
<body>
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
		<a href="/product/sim/register">입고 등록</a><p>
		<a href="/product/sim/status">입고 현황</a><p>
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
</body>
</html>