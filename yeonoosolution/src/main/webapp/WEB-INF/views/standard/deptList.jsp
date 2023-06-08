<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="deptListContainer">


	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">신규 부서 입력</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="">
						<div class="mb-3">
							<label for="modalDeptName" class="col-form-label">부서명:</label> <input
								type="text" class="form-control" id="modalDeptName"
								name="deptName" required="required">
						</div>
						<button type="reset" class="btn btn-primary">초기화</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary"
						onclick="insertDeptList()">등록</button>
				</div>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="crudBtn">
			<button id="searchBtn" onclick="searchDeptList()">조회</button>
			<button id="insertBtn" type="button" data-bs-toggle="modal"
				data-bs-target="#staticBackdrop">등록</button>
			<button id="saveBtn" onclick="modifyDeptListBtn('1')">저장</button>
			<button id="deleteBtn" onclick="modifyDeptListBtn('2')">삭제</button>
			<button id="resetBtn" onclick="resetDeptList()">초기화</button>
		</div>

		<div class="filter">

			<div class="form-data">부서명</div>

			<div class="form-content">
				<input type="text" name="deptName" id="filterDeptName">
			</div>

		</div>


		<div class="deptList">
			<div class="deptTableTitle">부서 리스트</div>
			<div class="deptListInfo">
				<table id="deptListTable">
					<tr>
						<th id="rowCount"></th>
						<th><input type="checkbox" id="allCheck"
							onclick="checkBoxAllCheck()"></th>
						<th>부서코드</th>
						<th>부서이름</th>
						<th>등록일자</th>
						<th>등록자</th>
						<th>수정일자</th>
						<th>수정자</th>
						<th>사용여부</th>
					</tr>
					<c:set var="rn" value="1" />
					<tbody id="deptTableTbody">
						<c:forEach var="deptList" items="${deptDepartmentDtoList }"
							varStatus="status">
							<tr onclick="showMemberOfDept(${status.index})">
								<td><input type="text" class="rowCount"
									value="${status.count }" disabled="disabled"></td>
								<td><input type="checkbox" class="tableCheckBox"
									id="tableCheckBox${status.index }" name="tableCheckBox">
								</td>
								<td class="bg-gray"><input type="text" class="bg-gray"
									id="deptCode${status.index }" name="deptCode"
									value="${deptList.deptCode }" disabled="disabled"></td>
								<td class="bg-yellow"><input type="text" class="bg-yellow"
									id="deptName${status.index }" name="deptName"
									value="${deptList.deptName }"></td>
								<td class="bg-yellow"><input type="text" class="bg-yellow"
									id="regDate${status.index }" name="regDate"
									value="${deptList.regDate }"></td>
								<td class="bg-yellow"><input type="text" class="bg-yellow"
									id="regUser${status.index }" name="regUser"
									value="${deptList.regUser }"></td>
								<td class="bg-yellow"><input type="text" class="bg-yellow"
									id="updateDate${status.index }" name="updateDate"
									value="${deptList.updateDate }"></td>
								<td class="bg-yellow"><input type="text" class="bg-yellow"
									id="updateUser${status.index }" name="updateUser"
									value="${deptList.updateUser }"></td>
								<td class="bg-gray"><input type="text" class="bg-gray"
									id="deptYn${status.index }" name="deptYn"
									value="${deptList.deptYn }" disabled="disabled"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="deptMember"></div>
		</div>
	</div>
</div>
