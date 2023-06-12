<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   
	<form name="form2" method="get" action="${pageContext.request.contextPath }/sales/stock/detail/">
	
				<select name="customerCode" id="customerCode" onchange="showSelect()" style="width:130px;height:30px;border-radius: 10px; ">
					<option value="" selected >&nbsp;&nbsp;거래처코드 찾기</option>
						<c:forEach var="C" items="${companyCodeList}">
							<option value="${C.companyCode}">${C.companyCode}</option>
						</c:forEach>
				</select>
				
				
				<button type="submit" class="all-button" style="margin-top: 50px;">
					  <img src="/images/stout-search-icon.png" alt="" class="button-icon">
					  검색
				</button>
				
				<button type="button" onclick="location.href='/sales/stock/detail/'" class="all-button">
					 <img src="/images/stout-reset-icon.png" alt="" class="button-icon">
					 초기화
				</button><p>
			
	<div class="stout-with-item-table-div" id="table-size">
	<table class="stout-with-item-table" style="table-layout: fixed;"> 
				<tr>
					<th></th>
					<th>상태</th>
					<th>거래처코드</th>
					<th>거래처명</th>
					<th>수주번호</th>
					<th>출고번호</th>
					<th>출고일자</th>
					<th>출고<br/>등록자</th>
					<th>등록일자</th>
					<th>제품명</th>
					<th>제품번호</th>
					<th>수량</th>
					<th>단가</th>
					<th>총액</th>
					<th>비고(물품)</th>
				</tr>
				<c:forEach var="OD" items="${outListWithDetail}" varStatus="status">
				<c:choose>
					<c:when test="${OD.deleteStatus == 'N' }">
					<tr>
						<td style="text-align:center; width: 20px;"><c:out value ="${status.count}"/><input type="hidden" value="${OD.outCode}" id="idoutCode${status.count}"></td>
						<td style="text-align:center; width: 40px;"  class="listColor1"><c:out 	value ="${OD.outType}"/></td>
						<td style="width: 80px;" class="listColor2"><c:out 	value ="${OD.customerCode}"/></td>
						<td style="width: 90px;" class="listColor1"><c:out 	value ="${OD.companyName}"/></td>
						<td style="width: 70px;" class="listColor1"><c:out 	value ="${OD.orderCode}"/></td>
						<td style="width: 90px;" class="listColor1"><c:out 	value ="${OD.outCode}" /></td> 
						<td style="width: 80px;" class="listColor2"><c:out 	value ="${OD.outDate}"/></td>
						<td style="text-align:center; width: 60px;" class="listColor2"><c:out 	value ="${OD.regUser}" /></td>
						<td style="width: 150px;" class="listColor1"><c:out 	value ="${OD.regDate}" /></td>
						<td style="text-align:center; width: 100px;"  class="listColor2"><c:out 	value ="${OD.itemName}" /></td>
						<td style="width: 50px;" class="listColor2"><c:out 	value ="${OD.itemCode}" /></td>
						<td style="text-align:center; width: 30px;" class="listColor1"><c:out 	value ="${OD.outQuantity}" /></td>
						<td style="text-align:center; width: 60px;" class="listColor3"><c:out 	value ="${OD.salesPrice}" /></td>
						<td style="text-align:center; width: 75px;" class="listColor4"><c:out 	value ="${OD.totalPrice}" /></td>
						<td style="width: 120px;" class="listColor1"><c:out 	value ="${OD.memo2}" /></td>
					</tr>
					</c:when>	
				</c:choose>
				
				
				</c:forEach>			
				<c:if test="${empty outListWithDetail}">
					<tr>
			        	<td colspan="16" rowspan="3" style="width: 1150px; text-align: center; font-size:20px; ">검색내역이 없습니다.</td>
			        </tr>
				</c:if>
				
		</table>  
		</div>

</form>
