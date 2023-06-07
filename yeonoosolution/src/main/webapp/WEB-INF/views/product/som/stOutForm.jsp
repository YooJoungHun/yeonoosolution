<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="stOutAll">
    <div class="stOutFormDiv">
	
		<div style="display: flex;">
			<button onclick="openInsertStOutWindow()">등록</button>
			<button onclick="deleteStOut()">삭제</button>
		</div>
		<p>
		
		<span style="font-size: 20px; font-weight: 650;">기타출고</span><br>
		<table id="stOutTable" border="1">
			<tr>
				<th>순번</th>
				<th></th>
				<th>출고번호</th>
				<th>출고유형</th>
				<th>출고상태</th>
				<th>출고날짜</th>
				<th>등록자</th>
				<th>등록일시</th>
				<th>수정자</th>
				<th>수정일시</th>
				<th>비고</th>
			</tr>
			<c:forEach var="stOutList" items="${stOutList }" varStatus="status">
				<tr>
					<td><c:out value ="${status.count}"/></td>
					<td><input type="radio" name="selectRadio" onclick="stOutRadioCheck(${status.index})"></td>
					<td>
						<input type="hidden" value="${stOutList.outCode}" id="idOutCode${status.index}">
						<c:out value ="${stOutList.outCode}" />
					</td> 
					<td><c:out value ="${stOutList.orderCode != null ? '판매출고' : '기타출고'}"/></td>
					<td><c:out value ="${stOutList.outType}"/></td>
					<td><c:out value ="${stOutList.outDate}"/></td>
					<td><c:out value ="${stOutList.regUser}"/></td>
					<td><c:out value ="${stOutList.regDate}" /></td>
					<td><c:out value ="${stOutList.updateUser}"/></td>
					<td><c:out value ="${stOutList.updateDate}" /></td>
					<td><c:out value ="${stOutList.memo}"/></td>
				</tr>
			</c:forEach>
		</table>
		
		<h2>세부항목</h2>
		<table id="stOutDetailTable" border="1">
			<tr>
				<th>순번</th>
				<th>제품코드</th>
				<th>제품명</th>
				<th>창고코드</th>
				<th>출고수량</th>
				<th>비고</th>
			</tr>
		</table>
	
	</div>

</div>