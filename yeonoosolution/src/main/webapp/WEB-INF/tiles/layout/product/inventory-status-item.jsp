<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">	
	.whStockDetail {
		border-collapse : collapse;
		padding: 20px;
		margin: 0 auto;
		white-space: nowrap;
		table-layout: fixed;
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
		height: auto;
	}
	
	.whStockDetail th, td {
		padding: 10px 20px;
		text-align: center;
		border: 1px solid #b3b3b3;
	}
	
	.content {	
		display: inline-block;
		width: 80%;
		margin: 0px auto;
		margin-left: 3%;
	}
	
 	.wh-stock-detail-list {
	    width: 100%; /* 원하는 가로 크기를 설정하세요 */
	    height: 400px; /* 원하는 세로 크기를 설정하세요 */
	    overflow: auto; /* 내용이 넘칠 경우 스크롤 표시 */
		border: 1px solid #ddd;
		margin: 0 auto;
		background-color: #f8f8f8;
	}
	
	.item-name, .good-quantity, .bad-quantity {
		background-color: #ffffcc;
	}
	
	.item-code, .wh-code, .update-user {
		background-color: #e6f2ff;
	}
	
	.stock-unit, .memo {
		background-color: #d9d9d9;
	}
	
	.stock-list:hover td {
		background-color: navy;
		color: white;
	}
	
	label {
		border: 1px solid #ddd;
		border-radius: 5px;
		padding: 5px;
	}
	
	.btn {
		background-color: white;
		border-radius: 5px;
		height: 30px;
		border: 1px solid navy;
		padding: 0 15px;
	}
	
	.btn:hover {
		background-color: navy;
		color: white;
		font-weight: bold;
	}
	
	#memo {
		width: 500px !important;
	}
	
	.input-div {
		display: flex;
		justify-content: space-between;
    	align-items: center;
	}
</style>

<script type="text/javascript">
$(function(){
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
			url : "/product/is/item/" + searchItemName,
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
					let headMemo = $("<th>").text("비고");
					
					headTr.append(headItemName).append(headItemCode).append(headWhCode).append(headGoodQuantity)
						  .append(headBadQuantity).append(headStockUnit).append(headUpdateUser).append(headMemo);
					
					table.append(headTr);
					
					whStockDetailDto.forEach(function(wh) {
						let tr = $("<tr>").addClass("stock-list");
						var itemName = $("<td>").text(wh.itemName).addClass("item-name");
						var itemCode = $("<td>").text(wh.itemCode).addClass("item-code");
						var whCode = $("<td>").text(wh.whCode).addClass("wh-code");
						var goodQuantity = $("<td>").text(wh.goodQuantity).addClass("good-quantity");
						var badQuantity = $("<td>").text(wh.badQuantity).addClass("bad-quantity");
						var stockUnit = $("<td>").text(wh.stockUnit).addClass("stock-unit");
						var updateUser = $("<td>").text(wh.updateUser).addClass("update-user");
						var memo = $("<td>").text(wh.memo).addClass("memo");
							
						tr.append(itemName).append(itemCode).append(whCode).append(goodQuantity)
						  .append(badQuantity).append(stockUnit).append(updateUser).append(memo);
							
						table.append(tr);
					});
				}
			}
		});
	});
});
</script>