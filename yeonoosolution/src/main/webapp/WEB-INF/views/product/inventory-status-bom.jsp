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
		
		<!-- sales -->
		<a href="/sales/analysis-of-materials">자제소요분석</a><p>
		<a href="/sales/receive-order">수주서 관리</a><p>
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
	
	<div class="content">
		<table>
			<tr>
				<td>
					<span>상위 품목명</span>
					<input type="text" class="item-name">
				</td>
				<td>
					<span>하위 품목 구분</span> 
					<select class="item-type">
						<option selected disabled>---- 하위 품목의 타입을 선택하세요 ----</option>
						<option>반제품</option>
						<option>원자재</option>
					</select> 
				</td>
				<td>
					<input class="btn search-btn" type="button" value="조회">
				</td>
			</tr>
		</table>
	</div>
	<br>	
	<div>
		<h2>BOM별 재고 현황</h2>
		<table class="bom-table">
			<tr>
				<th>하위 품목 코드</th>
				<th>하위 품목 명</th>
				<th>창고 코드</th>
				<th>창고 명</th>
				<th>양품 수량</th>
				<th>불량 수량</th>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript">
	$(".search-btn").on("click", function(){
		let itemName = $(".item-name").val();
		let itemType = $(".item-type").val();
		
		console.log("itemName : " + itemName + ", itemType : " + itemType);
		
		if(itemName === null || itemName == "") {
			alert("상위 품목명을 입력 해주세요");
			$(".item-name").focus();
			return false;
		} else if(itemType === null) {
			alert("하위 품목 구분을 선택 해주세요");
			$(".item-type").focus();
			return false;
		}
		
		$.ajax({
			url : "/product/is/bom/" + itemName,
			method : "GET",
			data : {itemName : itemName, itemType : itemType},
			dataType : "json",
			success : function(bomList) {
				console.log(bomList);
				
				if(bomList.length == 0) {
					alert("검색하신 내용의 데이터가 없습니다.");
					return;
				} else {
					let table = $(".bom-table");
					table.empty();
					
					let headTr = $("<tr>");
					let headLowItemCode = $("<th>").text("하위 품목 코드");
					let headLowItemName = $("<th>").text("하위 품목 명");
					let headWhCode = $("<th>").text("창고 코드");
					let headWhName = $("<th>").text("창고 명");
					let headGoodQuantity = $("<th>").text("양품 수량");
					let headBadQuantity = $("<th>").text("불량 수량");
					
					headTr.append(headLowItemCode).append(headLowItemName).append(headWhCode)
						  .append(headWhName).append(headGoodQuantity).append(headBadQuantity);
					
					table.append(headTr);
					
					bomList.forEach(function(bom){
						let tr = $("<tr>").addClass("bom-data");
						let lowItemCode = $("<td>").text(bom.lowItemCode);
						let lowItemName = $("<td>").text(bom.itemName);
						let whCode = $("<td>").text(bom.whCode);
						let whName = $("<td>").text(bom.whName);
						let goodQuantity = $("<td>").text(bom.goodQuantity);
						let badQuantity = $("<td>").text(bom.badQuantity);
						
						tr.append(lowItemCode).append(lowItemName).append(whCode).append(whName)
						  .append(goodQuantity).append(badQuantity);
						
						table.append(tr);
					});
				}
			}
		});
	});
</script>
</html>