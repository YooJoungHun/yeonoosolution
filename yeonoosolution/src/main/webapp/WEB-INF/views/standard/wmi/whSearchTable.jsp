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
		
		#warehouseTable2 th {
			background-color: #909090;
		}
					
		#warehouseTable2 tr:nth-child(even) {
			background-color: #D8D8D8;
		}
		
		#warehouseTable2 tr:nth-child(even) select{
			background: #D8D8D8;
		}
						
		#warehouseTable2 tr:nth-child(even) input{
			background: #D8D8D8;
		}
		
		#warehouseTable2 tr:hover {
			background-color: #7C96C9;
		}
		
		#warehouseTable2 tr:hover select {
			background-color: #7C96C9;
		}
		
		#warehouseTable2 tr:hover input {
			background-color: #7C96C9;
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
				<td>
					<input type="hidden" id="whCode${status.index }" value="${whList.whCode }">
					${whList.whCode }
				</td>
				<td>
					<input id="whName${status.index }" type="text" value="${whList.whName }">
				</td>
				<td>
					<select id="useYn${status.index }">
						<option value="Y" ${whList.useYn == 'Y' ? 'selected="selected"' : '' }>Y</option>
						<option value="N" ${whList.useYn == 'N' ? 'selected="selected"' : '' }>N</option>
					</select>
 				</td>
				<td>${whList.regDate }</td>
				<td>${whList.regUserName }</td>
				<td>${whList.updateDate }</td>
				<td>
					<input type="hidden" id="updateUser${status.index }" value="${whList.updateUser }">
					${whList.updateUserName }
				</td>
				<td>
					<input id="memo${status.index }" type="text" value="${whList.memo }">
				</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>