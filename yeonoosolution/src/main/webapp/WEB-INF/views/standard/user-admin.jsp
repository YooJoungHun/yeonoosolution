<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 계정 관리</title>
<style type="text/css">
#content {
	border: 1px solid;
	height: 1000px;
	margin-top: 30px;
}

#search-div {
	display: flex;
}

#search-div div {
	margin: 5px;
}

#btn-div{
	margin-left: auto;
}

#btn-div, #search-div, #order-list, #order-detail {
	border: 1px solid;
	margin: 10px;
}

#member-list, #member-detail {
	height: 300px;
}

#member-list, #member-detail {
	overflow: auto;
	white-space: nowrap;
}

.tuigrid-header {
	display: flex;
}

.member-btn-group{
	margin-left: auto !important;
	margin-right: 10px !important;
}

.member-tables td, .member-tables th {
	border: 1px solid;
	padding: 5px;
	text-align: center;
	white-space: nowrap; /* 셀 내용이 넘칠 경우 줄바꿈 방지 */
	overflow: hidden; /* 셀 내용이 넘칠 경우 가리기 */
	text-overflow: ellipsis; /* 셀 내용이 넘칠 경우 말줄임표(...) 표시 */
}

.member-tables tr, .member-tables td {
	border-top: none;
}

.member-tables {
	border-collapse: collapse;
	white-space: nowrap;
	table-layout: fixed !important;
}

.member-tables-hearder {
	position: sticky;
	top: 0;
	background-color: #f2f2f2;
}
.member-tables tr{
	height: 24px;
}
#member-list-table {
	max-height: 280px;
}

.tuigrid-header>* {	
	margin: 5px 5px;
}

.member-radio {
	min-width: 50px;
}

.member-number {
	min-width: 60px;
}

.dept-code {
	min-width: 70px;
}

.dept-name {
	min-width: 100px;
}

.job-code {
	min-width: 110px;
}

.job-name {
	min-width: 120px;
}

.company-code {
	min-width: 130px;
}

.company-name {
	min-width: 220px;
}

.member-id {
	min-width: 120px;
}

.member-name {
	min-width: 80px;
}

.member-address {
	min-width: 100px;
}

.member-tel {
	min-width: 170px;
}

.member-role {
	min-width: 80px;
}

</style>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
</head>
<body>
	<div id="contain">
		<div id="content">
			<div id="btn-div">
				<button id="member-search-btn">조회</button>
				<button id="member-save-btn">저장</button>
				<button class="member-delete-btn member-status-update-btn">삭제</button>
				<button id="member-init-btn">초기화</button>
			</div>
			<div id="search-div">
				<div>
					<span>사용자명</span>
					<input type="text" class="form-contorl" id="search-member-name">
				</div>
				<div>
					<span>사용자 ID</span>
					<input type="text" class="form-contorl" id="search-member-id">
				</div>
			</div>
			<div class="tuigrid-header">
				<div>사용자목록</div>
				<div class="member-btn-group">
					<button type="button" id="member-add">+</button>
					<button type="button" id="member-delete">-</button>
				</div>
			</div>
			<div id="member-list">
				<table id="member-list-table-heder"
					class="member-list-table member-tables member-tables-hearder">
					<thead>
						<tr>
							<th class="member-number"></th>
							<th class="member-radio"></th>
							<th class="dept-code">부서 코드</th>
							<th class="dept-name">부서</th>
							<th class="job-code">직책 코드</th>
							<th class="job-name">직책</th>
							<th class="company-code">회사 코드</th>
							<th class="company-name">회사</th>
							<th class="member-id">아이디</th>
							<th class="member-name">이름</th>
							<th class="member-address">주소</th>
							<th class="member-tel">연락처</th>
							<th class="member-role">권한</th>
						</tr>
					</thead>
				</table>
				<table id="member-list-table" class="member-list-table member-tables">
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
	<!-- contain -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</html>