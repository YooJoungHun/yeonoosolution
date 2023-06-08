<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<div class="All">

<div class="AllWithoutSidebar">
<form name="form1" method="post" action="/sales/stock">

			<button type="submit" class="all-button">
				<img src="/images/stout-insert-icon.png" alt="" class="button-icon">
				저장
			</button>
		
			<button type="button" onclick="stOutDelete()" class="all-button">
				<img src="/images/stout-delete-icon.png" alt="" class="button-icon">
	  			삭제
  			</button>
			
			<button type="button" onclick="location.href='/sales/stock/'" class="all-button">
				<img src="/images/stout-reset-icon.png" alt="" class="button-icon">
				초기화
			</button>
			
			<button type="button" onclick="confirm()" class="all-button">
				<img src="/images/stout-confirm-icon.png" alt="" class="button-icon">
				출고확정
			</button>
			
			<button type="button" onclick="confirmCancel()" class="all-button">
				<img src="/images/stout-confirm-cancel-icon.png" alt="" class="button-icon">
				출고확정취소
			</button>
			
			<button type="button" onclick="location.href='/sales/receive-order'" class="all-button">
				<img src="/images/stout-order-find-icon.png" alt="" class="button-icon">
				수주서 찾기
			</button><p>
			
		
				
			
			
<div id="insertForm-background">

	
	<table  class="insertForm-table">
		<tr>
			<td colspan="2"><input type="button" value="필수입력" class="color-notice" style="border: 1px solid #F15F5F;">
							<input type="button" value="선택입력" class="color-notice" style="border: 1px solid #BDBDBD;"></td>
		</tr>
		<tr>
			<th class="insertForm-not-required">수주번호</th>
			<td><input type="text"   name="orderCode" style="width:90px;" > </td>
			
			<th class="insertForm-required">거래처코드</th>
			<td><select name="customerCode" style="width:110px; height:26px;" required="required"  onchange="showSelectedOption()">
					<option value="" selected >거래처코드 찾기</option>
						<c:forEach var="C" items="${companyCodeList }">
							<option value="${C.companyCode }" ${C.companyCode == OL.customerCode ? 'selected' : '' }>${C.companyCode }</option>
						</c:forEach>
			</select></td>
			
			
			<th class="insertForm-required" style="width: 5cm;" >기초기말 구분</th>
			<td><input type="number" name="beginEndInventory" required="required" placeholder="0또는1"  style="width:60px; " ></td> 
		</tr>
		<tr>
			<th class="insertForm-required">출고일</th>
			<td><input type="Date"  	 name="outDate"   required="required" style=" margin-right: 15px;"></td>
			<th class="insertForm-not-required">비고</th>
			<td><input type="text"       name="memo"  style=" margin-right: 15px;" ></td>
		</tr>
	</table>
			<input type="hidden"       name="regUser"   value="${memberName}">

</div>
</form>	



<form name="form2" method="get" action="${pageContext.request.contextPath }/sales/stock/">

 	 	<span style="font-size: 20px;	font-weight: 650; ">출고리스트</span>&nbsp;&nbsp;&nbsp;&nbsp;
 	

			<select name="customerCode" id="customerCode" onchange="showSelectedOption()" style="width:130px;height:30px;border-radius: 10px; ">
				<option value="" selected >&nbsp;&nbsp;거래처코드 찾기</option>
				<c:forEach var="C" items="${companyCodeList}">
					<option value="${C.companyCode}">${C.companyCode}</option>
				</c:forEach>
			</select>
		
		<button type="submit" class="all-button" style="margin-top: 50px;">
			  <img src="/images/stout-search-icon.png" alt="" class="button-icon">
			  검색
		</button>
		
		<a class="stOut-notice" style="line-height:300%;"> ⦁ 거래처 코드, 출고일자, 비고 수정가능합니다.</a>
		
</form>


<form name="form3" method="post" >
			<input type="hidden" name="_method" value="PATCH"> 
			
<div class="stOutTable-div" id="table-size">
	<table class="stOutTable-class"  style="table-layout: fixed;"> 
			<tr>
				<th></th>
				<th></th>
				<th>출고번호</th>
				<th>상태</th>
				<th>거래처코드</th>
				<th>거래처명</th>
				<th>출고일자</th>
				<th>수주번호</th>
				<th>출고<br/>등록자</th>
				<th>등록일자</th>
				<th>수정자</th>
				<th>수정일자</th>
				<th>비고</th>
				<th style="width: 65px;"></th>
			</tr>
			<c:forEach var="OL" items="${outList}" varStatus="status">
			
			
			<c:choose>
				<c:when test="${OL.deleteStatus == 'N' }">
				<tr>
					<td style="text-align:center;"><c:out value ="${status.count}"/><input type="hidden" value="${OL.outCode}" id="idoutCode${status.count}"></td>
					<td><input type="radio" name="rd1" onclick="itemList('${OL.outCode}')"></td> 
					<td class="listColor1"><c:out 	value ="${OL.outCode}" /></td> 
					<td style="width: 40px; text-align:center;" class="listColor1"><c:out 	value ="${OL.outType}"/></td>
					
					<td class="listColor2">
						<select name="customerCode" id="customerCode${status.count}" class="listColor2" style="border:none;">
							<c:forEach var="C" items="${companyCodeList }">
								<option value="${C.companyCode }" ${C.companyCode == OL.customerCode ? 'selected' : '' }>${C.companyCode }</option>
								
							</c:forEach>
						</select>
					</td>
					
					<td style="width: 100px;" class="listColor1"><c:out 	value ="${OL.companyName}"/></td>
					<td class="listColor2"><input  type="date" id="outDate${status.count}"  name="outDate" 	 value="${OL.outDate}" class="listColor2" style="border:none;"></td>
					<td class="listColor1"><c:out 	value ="${OL.orderCode}"/></td>
					<td style="width: 60px;" class="listColor2"><c:out 	value ="${OL.regUser}"/></td>
					<td style="width: 80px;" class="listColor1"><c:out 	value ="${OL.regDate}" /></td>
					<td style="width: 60px;" class="listColor1"><c:out 	value ="${OL.updateUser}"/></td> 
					<td style="width: 80px;" class="listColor1"><c:out 	value ="${OL.updateDate}" /></td> 
					<td><input  type="text" id="memo${status.count}"		name="memo" 	 value="${OL.memo}" style="border:none; height:25px;"></td>

					<td><button type="button" class="stOut-update-button" id="updateRow" onclick="goUpdateRow(${status.count})" >
				  		<img src="/images/stout-update-icon.png" alt="" class="stOut-update-button-icon">
				  		수정
					</button></td>
				
				
				</tr>
					<input  type="hidden" name="updateUser" 	 value="${memberName}">
				</c:when> 
			</c:choose>
			</c:forEach>	
					
				<c:if test="${empty outList}">
					<tr>
			        	<td colspan="14" rowspan="3" style="width: 1030px; text-align: center; font-size:20px; ">검색내역이 없습니다.</td>
			        </tr>
				</c:if>
			
			
	</table>
	</div>  
</form>

<pre>

</pre>


<form name="form4" method="post" action="/sales/stock/item"> 	



 	<span style="font-size: 20px;	font-weight: 650; line-height: 250%; ">품목리스트 조회 및 추가</span>&nbsp;&nbsp;&nbsp;&nbsp;
	
	<button type="submit" class="all-button" >
		<img src="/images/stout-insert-icon.png" alt="" class="button-icon">
		제품추가
	</button>
	
	<input type="hidden" name="deleteStatus" >
	<input type="hidden" name="sorder" 		 >
	
	
 	<table border="1" class="itemInsertForm" >
		<tr>
			<th>출고번호</th>
			<th>사용가능 창고번호</th>
			<th>아이템코드</th>
			<th>수량</th>
			<th>비고</th>
		</tr>
		<tr>
			<td><select name="outCode" required="required" style="border:none;">
				<option value="" selected>출고번호 찾기</option>
				<c:forEach var="OC" items="${outCodeList}">
					<option value="${OC.outCode}">${OC.outCode}</option>
				</c:forEach>
			</select></td>
			
			<td><select name="whCode" required="required" style="border:none;">
				<option value="" selected>창고번호 찾기</option>
				<c:forEach var="WC" items="${whCodeList}">
					<option value="${WC.whCode}">${WC.whCode}</option>
				</c:forEach>
			</select></td>
			
			<td><select name="itemCode" required="required" style="border:none;">
				<option value="" selected>제품번호 찾기</option>
				<c:forEach var="IC" items="${itemCodeList}">
					<option value="${IC.itemCode}">${IC.itemCode}</option>
				</c:forEach>
			</select></td>
			
			<td><input type="number"  name="outQuantity"   required="required" placeholder="입력" style="width:70px;  height:20px; border:none;  text-align:center;"> </td> 
			<td><input type="text"    name="memo2" 		  placeholder="입력" style="  height:20px; border:none;   text-align:center;" ></td>
		</tr>
	</table><p>
</form>



<a style="line-height:200%; margin-left:10px; font-size: 15px; color: #5D5D5D;"> ⦁ 수량, 비고 수정가능합니다.</a>
<form name="form5" method="post" >

			<input type="hidden" name="_method" value="PATCH"> 
	<table border="1" id="outDetailTable" class="itemTable" > 
			<thead>
			<tr>
				<th>순번</th>
				<th>제품번호</th>
				<th>제품명</th>
				<th>창고번호</th>
				<th>수량</th>
				<th>단가</th>
				<th>총액</th>
				<th>비고</th>
				<th colspan='2'></th>
			</tr>
			</thead>
			
			<tbody>
				
				
			</tbody>
	</table>
		
</form>
</div>
<pre>





</pre>

</div>

	
		