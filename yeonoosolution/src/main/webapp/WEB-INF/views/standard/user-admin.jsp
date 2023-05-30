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

.dept-code, .job-code, 
.company-code, .member-name,
.member-tel, .member-role {
	min-width: 150px;
	max-width: 150px;
}

.member-id, .member-address{
	min-width: 250px;
	max-width: 250px;
}

td > input{
	border: none;
	outline: none;
}

.update-row {
	background-color: gray;
}


</style>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
</head>
<body>
	<div id="contain">
		<div id="content">
			<div id="search-div">
				<div>
					<span>사용자명</span>
					<input type="text" class="form-control" id="search-member-name">
				</div>
				<div>
					<span>사용자 ID</span>
					<input type="text" class="form-control" id="search-member-id">
				</div>
				<div id="btn-div">
					<button id="member-search-btn">조회</button>
					<button id="member-save-btn">저장</button>
					<button id="member-init-btn">초기화</button>
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
							<th class="dept-code">부서</th>
							<th class="job-code">직책</th>
							<th class="company-code">회사</th>
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
	
	
	/**
	* 페이지 로드완료시 member의 company에 속한 memberList 출력
	*/
	function printMember(member, printLocation){
		let memberRow = $('<tr>').append($('<td>').addClass('member-checkbox').append($('<input>').attr({'name': 'editing', 'type': 'checkbox', 'value': member.memberUid})))
								 .append($('<td>').addClass('dept-code').append($('<select>').attr('disabled', 'disabled').append($('<option>').attr({'value': member.deptCode, 'selected': 'selected'}).text(member.deptName))))
								 .append($('<td>').addClass('job-code').append($('<select>').attr('disabled', 'disabled').append($('<option>').attr({'value': member.jobCode, 'selected': 'selected'}).text(member.jobName))))
								 .append($('<td>').addClass('company-code').append($('<select>').attr('disabled', 'disabled').append($('<option>').attr({'value': member.companyCode, 'selected': 'selected'}).text(member.companyName))))
								 .append($('<td>').addClass('member-id').append($('<input>').attr({'name': 'memberId', 'type': 'text', 'value': member.memberId, 'readonly': 'readonly'})))
								 .append($('<td>').addClass('member-name').append($('<input>').attr({'name': 'memberName', 'type': 'text', 'value': member.memberName, 'readonly': 'readonly'})))
								 .append($('<td>').addClass('member-address').append($('<input>').attr({'name': 'address', 'type': 'text', 'value': member.address, 'readonly': 'readonly'})))
								 .append($('<td>').addClass('member-tel').append($('<input>').attr({'name': 'tel', 'type': 'text', 'value': member.tel, 'readonly': 'readonly'})))
								 .append($('<td>').addClass('member-role').append($('<input>').attr({'name': 'memberRole', 'type': 'text', 'value': member.memberRole, 'readonly': 'readonly'})));
		
		printLocation.append(memberRow);
	}
	
	function getMemberList(printLocation){
		$.ajax({
			type : "GET",
			url : "/v1/standard/members/" + memberCompanyCode,
			contentType: 'application/json',
			dataType : 'json',
			success : function(memberList, textStatus, xhr){
				if(xhr.status === 200){
					$.each(memberList, function(index, member){
						printMember(member, printLocation);
					});
				}
			},
			error : function(xhr){
				console.log("error");
			}
		});
	}

	$(function(){
		let printLocation = $('#member-list-table-body');
		getMemberList(printLocation);
	});
	
	/**
	* 수정 체크박스 클릭시 company selectbox에 전체 company name 추가
	*/
	function getCompanyList(printLocation){
		$.ajax({
			type : "GET",
			url : "/v1/standard/companies",
			dataType : 'json',
			success : function(companyList, textStatus, xhr){
				if(xhr.status === 200){
					let myCompanyCode = printLocation.closest('tr').find('.company-code select option:selected').val();
					printLocation.empty();
					$.each(companyList, function(index, company){
						if(myCompanyCode === company.companyCode){
							printLocation.append($('<option>').attr({'value': company.companyCode, 'selected': 'selected'}).text(company.companyName));	
						} else {
							printLocation.append($('<option>').attr('value', company.companyCode).text(company.companyName));
						}
					});
				}
			},
			error : function(xhr){
				console.log("error");
			}
		});
	}
	
	$(document).on('change', '.member-checkbox input[name="editing"]', function(){
		let $this = $(this);
		let $tr = $this.closest('tr');
		let printLocation = $tr.find('.company-code select');
		if($this.is(':checked')){
			getCompanyList(printLocation);	
		}
	});
	
	/**
	* 수정 체크박스 클릭시 dept selectbox에 전체 dept name 추가
	*/
	function getDeptList(printLocation){
		$.ajax({
			type : "GET",
			url : "/v1/standard/departments",
			dataType : 'json',
			success : function(deptList, textStatus, xhr){
				if(xhr.status === 200){
					let myDeptCode = printLocation.closest('tr').find('.dept-code select option:selected').val();
					printLocation.empty();
					$.each(deptList, function(index, dept){
						if(myDeptCode === dept.deptCode){
							printLocation.append($('<option>').attr({'value': dept.deptCode, 'selected': 'selected'}).text(dept.deptName));	
						} else {
							printLocation.append($('<option>').attr('value', dept.deptCode).text(dept.deptName));
						}
					});
				}
			},
			error : function(xhr){
				console.log("error");
			}
		});
	}
	
	$(document).on('change', '.member-checkbox input[name="editing"]', function(){
		let $this = $(this);
		let $tr = $this.closest('tr');
		let printLocation = $tr.find('.dept-code select');
		if($this.is(':checked')){
			getDeptList(printLocation);	
		}
	});
	
	/**
	* 수정 체크박스 클릭시 job selectbox에 전체 job name 추가
	*/
	function getJobList(printLocation){
		$.ajax({
			type : "GET",
			url : "/v1/standard/jobs",
			dataType : 'json',
			success : function(jobList, textStatus, xhr){
				if(xhr.status === 200){
					let myJobCode = printLocation.closest('tr').find('.job-code select option:selected').val();
					printLocation.empty();
					$.each(jobList, function(index, job){
						if(myJobCode === job.jobCode){
							printLocation.append($('<option>').attr({'value': job.jobCode, 'selected': 'selected'}).text(job.jobName));	
						} else {
							printLocation.append($('<option>').attr('value', job.jobCode).text(job.jobName));
						}
					});
				}
			},
			error : function(xhr){
				console.log("error");
			}
		});
	}
	
	$(document).on('change', '.member-checkbox input[name="editing"]', function(){
		let $this = $(this);
		let $tr = $this.closest('tr');
		let printLocation = $tr.find('.job-code select');
		if($this.is(':checked')){
			getJobList(printLocation);	
		}
	});
	
	/**
	* 체크박스 체크시, 수정가능으로 변경
	*/
	function handleCheckboxChange() {
		var $checkbox = $(this);
		var $tr = $checkbox.closest('tr');
		
		if ($checkbox.is(':checked')) {
			$tr.find('td input').removeAttr('readonly');
			$tr.find('td select').removeAttr('disabled');
			$tr.find('td input').addClass('update-row');
			$tr.addClass('update-row');
		} else {
			$tr.find('td input').attr('readonly', 'readonly');
			$tr.find('td select').attr('disabled', 'disabled');
			if ($tr.hasClass('update-row') || $tr.find('td input').hasClass('update-row')) {
				$tr.removeClass('update-row');
				$tr.find('td input').removeClass('update-row');
			}
		}
	}
	
	$(document).on('change', '.member-checkbox input', handleCheckboxChange);
	
	/**
	* 초기화 버튼
	* 클릭시 체크박스 체크를 해제하고, memberList를 비운 뒤 memeberList 다시 조회
	*/
	$(document).on('click', '#member-init-btn', function(){
		let printLocation = $('#member-list-table-body');
		$('.member-checkbox input').prop('checked', false);
		printLocation.empty();
		getMemberList(printLocation);
	});
	
	/**
	* +(member-add) 버튼
	* 
	*/
	$(document).on('click', '#member-add', function(){
		let member = {};
		let printLocation = $('#member-list-table-body');
		printMember(member, printLocation);
		let $newRow = $('#member-list-table-body tr:last');
		$newRow.find('td input').attr('required', 'required');
		$newRow.find('td select').attr('required', 'required');
		$newRow.find('td:first-child input, td:first-child select').focus();
		$newRow.find('.member-checkbox input').click();
	});
	
</script>
</body>
</html>