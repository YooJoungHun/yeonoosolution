<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script defer src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
	<script defer src="/js/standard/wmi/whForm.js"></script>
	<script type="text/javascript">
			
			
	</script>

</head>
<body>
	<div style="display: flex;">
		<div>창고코드</div>
		<input id="wh_code_search" type="text">		
		<div>창고명</div>
		<input id="wh_name_search" type="text">
		<button onclick="searchWhList()">조회</button>
	</div>
	
	<div style="display: flex;">
		<button onclick="openInsertWhWindow()">등록</button>
		<button onclick="modifyWhInfo(1)">수정</button>
		<button onclick="modifyWhInfo(2)">삭제</button>
	</div>
	
	
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