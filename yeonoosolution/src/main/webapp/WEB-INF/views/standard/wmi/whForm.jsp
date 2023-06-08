<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="whAll">

	<div class="WhFormDiv"> 

		<div style="display: flex;">
			<div style="margin-right: 5px;">창고코드</div>
			<input id="wh_code_search" type="text" style="margin-right: 20px;">		
			<div style="margin-right: 5px;">창고명</div>
			<input id="wh_name_search" type="text">
			<button onclick="searchWhList()" style="margin-left: 10px;">조회</button>
		</div>
		<p>
		
		<div style="display: flex; ">
			<button onclick="openInsertWhWindow()">등록</button>
			<button onclick="modifyWhInfo(1)">수정</button>
			<button onclick="modifyWhInfo(2)">삭제</button>
		</div>
		<p>
		
		<span style="font-size: 20px; font-weight: 650;">창고</span><br>
		<table id="warehouseTable" border="1">
			<tr>
				<th>번호</th>
				<th>
					<input type="checkbox" id="AllCheckBox" onclick="checkBoxAllCheck()">
				</th>
				<th>창고코드</th>
				<th>창고명</th>
				<th>사용여부</th>
				<th>등록일시</th>
				<th>등록자</th>
				<th>수정일시</th>
				<th>수정자</th>
				<th>비고</th>
			</tr>
			<c:forEach var="whList" items="${listWarehouse }" varStatus="status">
				<tr>
					<td>${whList.rn }</td>
					<td>
						<input type="checkbox" name="tableCheckBox" id="checkBox${status.index }">
					</td>
					<td class="whCodeTd">
						<input type="hidden" id="whCode${status.index }" value="${whList.whCode }">
						${whList.whCode }
					</td>
					<td class="whNameTd">
						<input id="whName${status.index }" type="text" value="${whList.whName }">
					</td>
					<td class="useYnTd">
						<select id="useYn${status.index }">
							<option value="Y" ${whList.useYn == 'Y' ? 'selected="selected"' : '' }>Y</option>
							<option value="N" ${whList.useYn == 'N' ? 'selected="selected"' : '' }>N</option>
						</select>
	 				</td>
					<td class="regDateTd">${whList.regDate }</td>
					<td class="regUserNameTd">${whList.regUserName }</td>
					<td class="updateDateTd">${whList.updateDate }</td>
					<td class="updateUserNameTd">
						<input type="hidden" id="updateUser${status.index }" value="${whList.updateUser }">
						${whList.updateUserName }
					</td>
					<td class="memoTd">
						<input id="memo${status.index }" type="text" value="${whList.memo }">
					</td>
				</tr>
			</c:forEach>
		</table>
		
	</div>
		
</div>