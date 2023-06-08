<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container">	
	<div class="content">
		<div class="input-div">
			<h2>BOM별 재고 현황</h2>
			<div>
				<label>하위 품목 구분</label>
					<select class="item-type">
						<option selected disabled>---- 하위 품목의 타입을 선택하세요 ----</option>
						<option>반제품</option>
						<option>원자재</option>
					</select>
		
				<label>상위 품목명</label>
				<input type="text" class="item-name">
				<input class="btn search-btn" type="button" value="조회">	
			</div>
		</div>
		
		<div class="bom-list">
			<table class="bom-table">
				<tr>
					<th>상위 품목 명</th>
					<th>하위 품목 코드</th>
					<th id="low-item-name">하위 품목 명</th>
					<th>창고 코드</th>
					<th>창고 명</th>
					<th>양품 수량</th>
					<th>불량 수량</th>
				</tr>
			</table>
		</div>
	</div>
</div>