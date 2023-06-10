<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script defer src="/js/standard/wmi/whForm.js"></script>
	<style type="text/css">
	
		#warehouseTable2 {
			border-collapse: collapse;
			background-color: #F8F8F8;
			padding: 20px;
			width: 100%;
			text-align: center;
		}
		
		#warehouseTable2 input {
			border: none;
		}
		
		#warehouseTable2 select {
			border: none;
		}
		
		.whCodeTd {
			background-color: #d9d9d9
		}
		.regDateTd,
		.regUserNameTd,
		.updateDateTd,
		.updateUserNameTd {
			background-color: #e6f2ff;
		}
		
		.whNameTd,
		.useYnTd,
		.memoTd {
			background-color: #ffffcc;
		}
		
		#warehouseTable2 tr:hover td,
		#warehouseTable2 tr:hover td select,
		#warehouseTable2 tr:hover td input {
			background-color: #8EA8DB;
		}
		
		
	</style>
	
</head>
<body>

	<table id="warehouseTable2" border="1">
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
		<c:forEach var="whList" items="${searchWHList }" varStatus="status">
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
	
</body>
</html>