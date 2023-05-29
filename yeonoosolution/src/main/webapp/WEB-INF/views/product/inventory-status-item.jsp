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
		<a href="/product/is/item">품목별 재고 현황</a><p>
		<a href="/product/is/bom">BOM별 재고 현황</a><p>
		<a href="/product/is/wh">창고별 재고 현황</a><p>
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
					<span>ITEM 코드</span>
					<input class="itemCode" type="text">
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
		} else if(itemCode === null || itemCode === "") {
			alert("품목 Code를 입력해주세요");
			$(".itemCode").focus();
		} else if(searchItemName === null || searchItemName === ""){
			alert("품명을 입력해주세요");
			$(".itemName").focus();
		}
		
		console.log("itemType : " + itemType + ", itemCode : " + itemCode + ", itemName : " + searchItemName);
		
		$.ajax({
			url : "/product/is/item/" + itemCode,
			method : "GET",
			data : {
					 itemCode : itemCode,
					 itemType : itemType,
					 itemName : searchItemName
					},
			dataType : "json",
			success : function(data) {
				let whStockDetailDto = data;
				console.log("Dto : " + whStockDetailDto);
				
				let table = $(".whStockDetail");
				let tr = $("<tr></tr>").addClass("stock-list");
				var itemName = $("<td></td>").text(whStockDetailDto.itemName);
				var itemCode = $("<td></td>").text(whStockDetailDto.itemCode);
				var whCode = $("<td></td>").text(whStockDetailDto.whCode);
				var goodQuantity = $("<td></td>").text(whStockDetailDto.goodQuantity);
				var badQuantity = $("<td></td>").text(whStockDetailDto.badQuantity);
				var stockUnit = $("<td></td>").text(whStockDetailDto.stockUnit);
				var updateUser = $("<td></td>").text(whStockDetailDto.updateUser);
					
				tr.append(itemName).append(itemCode).append(whCode).append(goodQuantity)
				  .append(badQuantity).append(stockUnit).append(updateUser);
					
				table.append(tr);
			}
		});
	});
});
</script>
</html>