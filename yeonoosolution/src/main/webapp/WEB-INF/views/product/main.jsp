<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style type="text/css">
	.container {
		display: flex;
		width: 100%;
	}
	
	.content {
		display: inline-block;
		margin: 0 auto;
		width: 80%;
		height: 80%;
	}
	
	.chart-area {
		display: inline-block;
	}
	
	.side-bar {
		border: 1px solid #ddd;
		padding: 20px;
		float: left;
		height: auto;
	}
	
	.info {
		width: 90%;
	    height: 300px;
	    background-color: #f8f8f8;
	    border: 1px solid #ddd;
	    display: inline-block;
	    margin: 0 auto;
	    border-radius: 10px;
	    margin-left: 55px;
	    margin-bottom: 20px;
	    margin-top: 20px;
	}
	
	.chart-area {
		display: flex;
	}
	
	#chartContainer, #bar-chart-container {
		border: 1px solid #ddd;
		border-radius: 10px;
		text-align: center;
	}
	
	label {
		border: 1px solid #ddd;
		border-radius: 5px;
		padding: 5px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="container">
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
	
	<c:forEach var="main" items="${mainPageMap.mainPageDtoList}">
		<input type="hidden" class="product-type" value="${main.productType}">
		<input type="hidden" class="work-order-count" value="${main.workOrderCount}">
	</c:forEach>
	
	<div class="content">
		<div class="info">
			<h2>안녕하세요 ${mainPageMap.memberDto.memberName}님!</h2>
			<p><label>현재 접속한 ID</label>${mainPageMap.memberDto.memberId}</p>
			<p><label>부서 코드</label>${mainPageMap.memberDto.deptCode}</p>
			<p><label>직책 코드</label>${mainPageMap.memberDto.jobCode}</p>
			<p><label>회사 코드</label>${mainPageMap.memberDto.companyCode}</p>
			<p><label>권한</label>${mainPageMap.memberDto.memberRole}</p>
			
		</div>	
		<div class="chart-area">
		
			<div id="chartContainer" style="width: 40%; height: auto; display: block; margin: 0 auto;">
			<h4>금일 작업 지시 현황</h4>
				<!--차트가 그려질 부분-->
				<canvas id="myChart" style="display: block; margin: 0 auto;"></canvas>
			</div>
			
			<div id="bar-chart-container" style="width: 40%; height: auto; display: block; margin: 0 auto;">
			<h4>금일 작업 완료 건</h4>
				<canvas id="my-bar-chart" style="margin: 0 auto; display: block; width: 80%; height: 31%"></canvas>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	let productType = $(".product-type").map(function() {
		  return $(this).val();
		}).get();
	
	let workOrderCount = $(".work-order-count").map(function() {
		return $(this).val();
	}).get();
	
	console.log("productType : " + productType + ", workOrderCount : " + workOrderCount);
	 
	const ctx = document.getElementById('myChart').getContext('2d');
	const myChart = new Chart(ctx, {
	    type: 'doughnut',
	    data: {
	        labels: productType,
	        datasets: [{
	            label: '금일 작업 지시 현황',
	            data: workOrderCount,
	            backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)'],
	            borderColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)'],
	            borderWidth: 3
	        }]
	    },
	    options: {
	        scales: {
	            y: {
	                beginAtZero: true
	            }
	        }
	    }
	}
 );
	
	
	const context = document.getElementById('my-bar-chart').getContext('2d');
	const myBarChart = new Chart(context, {
	    type: 'bar',
	    data: {
	        labels: ["1", "2", "3"],
	        datasets: [{
	            label: '금일 작업 완료 건',
	            data: ["10", "20", "30"],
	            backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)'],
	            borderColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)'],
	            borderWidth: 3
	        }]
	    },
	    options: {
	    	responsive: false,
	        scales: {
	            y: {
	                beginAtZero: true
	            }
	        }
	    }
	}
 );
</script>
</html>