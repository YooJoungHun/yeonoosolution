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

#btn-div, #search-div, #member-list {
	border: 1px solid;
	margin: 10px;
}

#member-list{
	height : 80%;
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
	white-space: nowrap !important; /* 셀 내용이 넘칠 경우 줄바꿈 방지 */
	overflow: hidden !important; /* 셀 내용이 넘칠 경우 가리기 */
	text-overflow: ellipsis !important; /* 셀 내용이 넘칠 경우 말줄임표(...) 표시 */
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

.tuigrid-header>* {	
	margin: 5px 5px;
}

.member-checkbox {
	min-width: 50px;
}

.dept-code, .dept-name, .job-code, 
.job-name, .company-code, .company-name,
.member-name, .member-tel, .member-role {
	min-width: 150px;
	max-width: 150px;
}

.member-id, .member-address{
	min-width: 250px;
	max-width: 250px;
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
				<table id="member-list-table" class="member-list-table member-tables member-tables-hearder">
					<thead>
						<tr>
							<th class="member-checkbox"></th>
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
					<tbody id="member-list-table-body">
					</tbody>
				</table>
			</div>
		</div>
	</div><!-- contain -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	const memberId = '<%= session.getAttribute("memberId") %>';
	const memberCompanyCode = '<%= session.getAttribute("memberCompanyCode") %>';
	console.log("memberID : " + memberId);
	console.log("memberCompanyCode : " + memberCompanyCode);
	
	function printMember(member){
		let memberRow = $('<tr>').append($('<td>').addClass('member-checkbox').append($('<input>').attr({'name': 'member-checkbox', 'type': 'checkbox', 'value': member.memberId})))
								 .append($('<td>').addClass('dept-code').text(member.deptCode))
								 .append($('<td>').addClass('dept-name').text(member.deptName))
								 .append($('<td>').addClass('job-code').text(member.jobCode))
								 .append($('<td>').addClass('job-name').text(member.jobName))
								 .append($('<td>').addClass('company-code').text(member.companyCode))
								 .append($('<td>').addClass('company-name').text(member.companyName))
								 .append($('<td>').addClass('member-id').text(member.memberId))
								 .append($('<td>').addClass('member-name').text(member.memberName))
								 .append($('<td>').addClass('member-address').text(member.address))
								 .append($('<td>').addClass('member-tel').text(member.tel))
								 .append($('<td>').addClass('member-role').text(member.memberRole));
		
		$('#member-list-table-body').append(memberRow);
	}
	
	$(function(){
		$.ajax({
			type : "GET",
			url : "/v1/standard/members/" + memberCompanyCode,
			contentType: 'application/json',
			dataType : 'json',
			success : function(memberList, textStatus, xhr){
				if(xhr.status === 200){
					$.each(memberList, function(index, member){
						printMember(member);
					});
				} else if (xhr.status === 204) {
				    
				}

			},
			error : function(xhr){
				console.log("error");
			}
		});
	});
</script>
</body>
</html>