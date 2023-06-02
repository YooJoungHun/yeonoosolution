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
<style type="text/css">
	span {
		border: 1px solid #E8EBF0;
		border-radius: 5px;
		padding: 5px 10px;
		font-weight: bold;
		text-align: center;
	}
	
	table {
		background-color: #F8F8F8;
		padding: 20px;
		margin: 0 auto;
		width: 80%;
	}
	
	input {
		height: 1.6rem;
	}
	
	select {
		height: 1.9rem;
	}
	
	.side-bar {
		border: 1px solid #ddd;
		padding: 20px;
		float: left;
		height: 100vh;
	}
	
	.whStockDetail th, td {
		border: 1px solid #ddd;
		padding: 10px 20px;
	}
	
	h2 {
		margin: 0 auto;
		display: inline-block; 
		padding-left: 55px;
	}
	
</style>
<title>Insert title here</title>
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

	
	<div class="content">
		<table>
			<tr>
				<td>
					<span>품목 구분</span>
					<select class="itemType">
						<option selected disabled>---- 품목을 선택하세요 ----</option>
						<option>완제품</option>
						<option>반제품</option>
						<option>원자재</option>
					</select> 
				</td>
				<td>
					<span>품명</span>
				 	<input class="itemName" type="text">
					<input type="button" class="btn btn-search" value="조회">
				</td>
			</tr>
		</table>
	</div>
	<br>
	
	<div>
		<h2>품목별 재고 현황</h2>
		<table class="whStockDetail">
			<tr>
				<th>품명</th>
				<th>제품 코드</th>
				<th>창고 코드</th>
				<th>양품 수량</th>
				<th>불량 수량</th>
				<th>저장 단위</th>
				<th>입고 근무자</th>
			</tr>
		</table>
	</div>
	
</body>
<script type="text/javascript">
$(document).ready(function() {
	$(".btn-search").on("click", function() {
		let itemType = $(".itemType").val();
		let itemCode = $(".itemCode").val();
		let searchItemName = $(".itemName").val();
		
		if(itemType === null) {
			alert("품목 유형을 선택해주세요");
			$(".itemType").focus();
			return false;
			
		} else if(searchItemName === null || searchItemName === ""){
			alert("품명을 입력해주세요");
			$(".itemName").focus();
			return false;
		}
		
		console.log("itemType : " + itemType + ", itemName : " + searchItemName);
		
		$.ajax({
			url : "/product/is/item/" + itemCode,
			method : "GET",
			data : {
					 itemType : itemType,
					 itemName : searchItemName
					},
			dataType : "json",
			success : function(data) {
				console.log(data.length);
				
				if(data.length == 0) {
					alert("검색하신 내용의 데이터가 없습니다. 품목명과 품목 구분을 정확히 입력해 주세요");
				} else {
					let whStockDetailDto = data;
					console.log("Dto : " + whStockDetailDto);
					
					let table = $(".whStockDetail");
					table.empty();
					
					let headTr = $("<tr>");
					let headItemName = $("<th>").text("품명");
					let headItemCode = $("<th>").text("제품 코드");
					let headWhCode = $("<th>").text("창고 코드");
					let headGoodQuantity = $("<th>").text("양품 수량");
					let headBadQuantity = $("<th>").text("불량 수량");
					let headStockUnit = $("<th>").text("저장 단위");
					let headUpdateUser = $("<th>").text("입고 근무자");
					
					headTr.append(headItemName).append(headItemCode).append(headWhCode).append(headGoodQuantity)
						  .append(headBadQuantity).append(headStockUnit).append(headUpdateUser);
					
					table.append(headTr);
					
					whStockDetailDto.forEach(function(wh) {
						let tr = $("<tr></tr>").addClass("stock-list");
						var itemName = $("<td></td>").text(wh.itemName);
						var itemCode = $("<td></td>").text(wh.itemCode);
						var whCode = $("<td></td>").text(wh.whCode);
						var goodQuantity = $("<td></td>").text(wh.goodQuantity);
						var badQuantity = $("<td></td>").text(wh.badQuantity);
						var stockUnit = $("<td></td>").text(wh.stockUnit);
						var updateUser = $("<td></td>").text(wh.updateUser);
							
						tr.append(itemName).append(itemCode).append(whCode).append(goodQuantity)
						  .append(badQuantity).append(stockUnit).append(updateUser);
							
						table.append(tr);
					});
				}
			}
		});
	});
});
</script>
</html>