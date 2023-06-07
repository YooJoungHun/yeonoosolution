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
	    border: 1px solid #ddd;
	    display: inline-block;
	    margin: 0 auto;
	    border-radius: 10px;
	    margin-left: 55px;
	    margin-bottom: 20px;
	    margin-top: 20px;
	    overflow: auto;
	}
	
	label {
		border: 1px solid #ddd;
		border-radius: 5px;
		padding: 5px;
		margin-left: 100px;
	}
	
	.chart-area {
		display: flex;
	}
	
	#chartContainer, #bar-chart-container {
		border: 1px solid #ddd;
		border-radius: 10px;
		text-align: center;
	}
	
	.company-code {
		margin-left: 250px;
	}

	.loss-table {
		overflow: auto;
	}
	
	.loss-table th, td {
		padding: 10px 20px;
		text-align: center;
		border: 1px solid #b3b3b3;
	}
	
	.loss-table {
		border-collapse : collapse;
		padding: 20px;
		white-space: nowrap;
		table-layout: fixed;
		background-color: #f8f8f8;
	}
	
	h2 {
		margin-left: 55px;
	}
	
	.work-order-code, .item-code {
		background-color: #e6f2ff;
	}
	
	.sorder, .defective-loss-quantity {
		background-color: #ffffcc;
	}
	
	.reg-user, .reg-date, .defective-loss-date {
		background-color: #d9d9d9;
	}
	
	.loss-list:hover td {
		background-color: navy;
		color: white;
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
	
	<c:forEach var="orders" items="${mainPageMap.orders}">
		<input type="hidden" class="receive-or-place" value="${orders.receiveOrPlace}">
		<input type="hidden" class="orders-count" value="${orders.orderCount}">
	</c:forEach>
	
	<div class="content">
		<h2>안녕하세요 ${mainPageMap.memberDto.memberName}님! 좋은 하루 되세요!</h2>
		<div class="info">
			<div class="loss-table-div">
			<h3>LOSS 물품 현황</h3>
			<table class="loss-table">
				<tr>
					<th>작업 지시 코드 </th>
					<th>등록 순번 </th>
					<th>물품 코드 </th>
					<th>LOSS 수량 </th>
					<th>판별 일자 </th>
					<th>등록 근무자</th>
					<th>등록 일</th>
				</tr>
				<c:forEach var="loss" items="${mainPageMap.loss}">
				<tr class="loss-list">
					<td class="work-order-code">${loss.workOrderCode}</td>
					<td class="sorder">${loss.sorder}</td>
					<td class="item-code">${loss.itemCode}</td>
					<td class="defective-loss-quantity">${loss.defectiveLossQuantity}</td>
					<td class="defective-loss-date">${loss.defectiveLossDate}</td>
					<td class="reg-user">${loss.regUser}</td>
					<td class="reg-date">${loss.regDate}</td>
				</tr>
				</c:forEach>
			</table>
			</div>
		</div>
		<div class="chart-area">
		
			<div id="chartContainer" style="width: 40%; height: auto; display: block; margin: 0 auto;">
			<h4>금일 작업 지시 현황</h4>
				<!--차트가 그려질 부분-->
				<canvas id="myChart" style="display: block; margin: 0 auto;"></canvas>
			</div>
			
			<div id="bar-chart-container" style="width: 40%; height: auto; display: block; margin: 0 auto;">
			<h4>금일 수발주 건 수</h4>
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
	
	let receiveOrPlace = $(".receive-or-place").map(function() {
		return $(this).val();
	}).get();
	
	let ordersCount = $(".orders-count").map(function() {
		return $(this).val();
	}).get();
	
	if(productType.length == 0) {
		productType = ["일반", "재작업", "개발품(시제품)"];
		workOrderCount = ["0", "0", "0"];
	} else if(receiveOrPlace.length == 0) {
		workOrderCount = ["수주", "발주"];
		ordersCount = ["0", "0"];
	}
	
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
	
	console.log("receiveOrPlace : " + receiveOrPlace + ", ordersCount : " + ordersCount);
	
	const context = document.getElementById('my-bar-chart').getContext('2d');
	const myBarChart = new Chart(context, {
	    type: 'bar',
	    data: {
	        labels: receiveOrPlace,
	        datasets: [{
	            label: '금일 수발주 건 수',
	            data: ordersCount,
	            backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)'],
	            borderColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)'],
	            borderWidth: 3
	        }]
	    },
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true,
						fontSize : 14,
					}
				}]
			}
		}
	}
 );
</script>
</html>