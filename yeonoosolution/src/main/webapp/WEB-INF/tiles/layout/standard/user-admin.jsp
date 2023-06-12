<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.main-container {
	overflow: auto !important;
}

.user-admin-body{
	display: flex;
}

#user-admin-content {
	height: 1000px;
	margin-top: 30px;
}

#user-admin-search-div {
	display: flex;
	justify-content: center;
}

#user-admin-search-div div {
    margin: 5px;
    font-size: larger;
    font-weight: bold;
    font-style: italic;
}

#user-admin-btn-div{
	display: flex;
    align-items: center;
    justify-content: center;
}

#user-admin-btn-div button{
	background-color: #F8F8FF !important;
	color : black !important;
	margin-right: 10px;
	border: none !important;
    font-weight: bold;
	box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
	transition: all 0.3s cubic-bezier(.25,.8,.25,1);
    width: 200px;
    height: 40px;
}

#user-admin-btn-div button:hover{
	box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
}

#user-admin-btn-div, #user-admin-search-div, #user-admin-member-list {
	margin: 10px;
}

.user-admin-search-member{
	position: relative;
	width: 300px;
}

.user-admin-search-member input{
	width: 100%;
	border: 1px solid #bbb;
	border-radius: 8px;
	padding: 10px 12px;
	font-size: 14px;
}

.user-admin-search-member img{
	position : absolute;
	width: 17px;
	top: 12px;
	right: 12px;
	margin: 0;
}

#user-admin-member-list{
	height : 80%;
	overflow: auto;
	white-space: nowrap;
    width: 100%;
    margin-left: 6%;
}

.user-admin-tuigrid-header {
	display: flex;
    justify-content: flex-start;
    margin-left: 6%;
    font-weight: bold;
    font-size: large;
    font-style: italic;
}

.user-admin-member-btn-group{
	display: flex;
	justify-content: flex-end;
	margin-right: 10px !important;
}

.user-admin-member-tables td, .user-admin-member-tables th {
	border: 1px solid;
	padding: 5px;
	text-align: center;
	white-space: nowrap !important; /* 셀 내용이 넘칠 경우 줄바꿈 방지 */
	overflow: hidden !important; /* 셀 내용이 넘칠 경우 가리기 */
	text-overflow: ellipsis !important; /* 셀 내용이 넘칠 경우 말줄임표(...) 표시 */
}

.user-admin-member-tables tr, .user-admin-member-tables td {
	border-top: none;
}

.user-admin-member-tables thead{
	margin: 0 auto;
	border-collapse: collapse;
	white-space: nowrap;
	table-layout: fixed !important;
}

.user-admin-member-tables-hearder {
	position: sticky;
	top: 0;
	background-color: #f2f2f2;
}
.user-admin-member-tables tr{
	height: 24px;
}

.user-admin-tuigrid-header>* {	
	margin: 5px 5px;
}

.user-admin-member-checkbox {
	min-width: 50px;
	max-width: 50px;
}

.user-admin-dept-code, .user-admin-job-code, 
.user-admin-company-code, .user-admin-member-name,
.user-admin-member-tel, .user-admin-member-role {
	min-width: 160px;
	max-width: 160px;
}

.user-admin-member-id, .user-admin-member-address{
	min-width: 250px;
	max-width: 250px;
}

#user-admin-member-list-table tr.user-admin-update-row{
	border: 3px solid #d12626;
}

#user-admin-member-list-table-body td{
	text-align: center;
}

#user-admin-member-list-table tbody tr:hover td{
	background-color: #8C8C8C;
}

#user-admin-member-list-table td > input{
	border: none;
	outline: none;
	background-color: inherit;
}

#user-admin-member-list-table td > select{
	border: none;
	outline: none;
	width: 135px;
	color: black !important;
	opacity: 1 !important;
	background-color: inherit;
}

.user-admin-bg-gray {
	background-color: #D9D9D9;
}

.user-admin-bg-orange {
	background-color: #FFFFCC;
}

.user-admin-bg-blue {
	background-color: #E6F2FF;
}

select:not(:-internal-list-box) {
	overflow: visible;
}

:where([aria-disabled="true" i], [disabled]) {
    cursor: auto;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	const loginMemberUid = '<%= session.getAttribute("memberUid") %>';
	const loginMemberId = '<%= session.getAttribute("memberId") %>';
	const loginMemberCompanyCode = '<%= session.getAttribute("memberCompanyCode") %>';
	
	/**
	* 페이지 로드완료시 member의 company에 속한 memberList 출력
	*/
	function handleError(status){
		let locationUrl = "/standard/not-authorized";
		if(status === 403){
			location.href = locationUrl;
		}
	}
	
	/**
	* 페이지 로드완료시 member의 company에 속한 memberList 출력
	*/
	function printMember(member, printLocation){
		let memberRow = $('<tr>').append($('<input>').addClass('user-admin-member-yn').attr({'type': 'hidden', 'value': member.memberYn}))
								 .append($('<td>').addClass('user-admin-member-checkbox user-admin-bg-gray').append($('<input>').attr({'name': 'editing', 'type': 'checkbox', 'value': member.memberUid})))
								 .append($('<td>').addClass('user-admin-dept-code user-admin-bg-blue').append($('<select>').attr('disabled', 'disabled').append($('<option>').attr({'value': member.deptCode, 'selected': 'selected'}).text(member.deptName))))
								 .append($('<td>').addClass('user-admin-job-code user-admin-bg-blue').append($('<select>').attr('disabled', 'disabled').append($('<option>').attr({'value': member.jobCode, 'selected': 'selected'}).text(member.jobName))))
								 .append($('<td>').addClass('user-admin-company-code user-admin-bg-blue').append($('<select>').attr('disabled', 'disabled').append($('<option>').attr({'value': member.companyCode, 'selected': 'selected'}).text(member.companyName))))
								 .append($('<td>').addClass('user-admin-member-id user-admin-bg-orange').append($('<input>').attr({'name': 'memberId', 'type': 'text', 'value': member.memberId, 'readonly': 'readonly'})))
								 .append($('<td>').addClass('user-admin-member-name user-admin-bg-orange').append($('<input>').attr({'name': 'memberName', 'type': 'text', 'value': member.memberName, 'readonly': 'readonly'})))
								 .append($('<td>').addClass('user-admin-member-address user-admin-bg-orange').append($('<input>').attr({'name': 'address', 'type': 'text', 'value': member.address, 'readonly': 'readonly'})))
								 .append($('<td>').addClass('user-admin-member-tel user-admin-bg-orange').append($('<input>').attr({'name': 'tel', 'type': 'text', 'value': member.tel, 'readonly': 'readonly'})))
								 .append($('<td>').addClass('user-admin-member-role user-admin-bg-gray').append($('<select>').attr('disabled', 'disabled').append($('<option>').attr({'value': member.memberRole, 'selected': 'selected'}).text(member.memberRole))));
		
		printLocation.append(memberRow);
	}
	
	function getMemberList(printLocation){
		$.ajax({
			type : "GET",
			url : "/standard/members/company-code/" + loginMemberCompanyCode,
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
		let printLocation = $('#user-admin-member-list-table-body');
		getMemberList(printLocation);
	});
	
	/**
	* 수정 체크박스 클릭시 company selectbox에 전체 company name 추가
	*/
	function getCompanyList(printLocation){
		$.ajax({
			type : "GET",
			url : "/standard/companies",
			dataType : 'json',
			success : function(companyList, textStatus, xhr){
				if(xhr.status === 200){
					let myCompanyCode = printLocation.closest('tr').find('.user-admin-company-code select option:selected').val();
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
	
	$(document).on('change', '.user-admin-member-checkbox input[name="editing"]', function(){
		let $this = $(this);
		let $tr = $this.closest('tr');
		let printLocation = $tr.find('.user-admin-company-code select');
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
			url : "/standard/departments",
			dataType : 'json',
			success : function(deptList, textStatus, xhr){
				if(xhr.status === 200){
					let myDeptCode = printLocation.closest('tr').find('.user-admin-dept-code select option:selected').val();
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
	
	$(document).on('change', '.user-admin-member-checkbox input[name="editing"]', function(){
		let $this = $(this);
		let $tr = $this.closest('tr');
		let printLocation = $tr.find('.user-admin-dept-code select');
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
			url : "/standard/jobs",
			dataType : 'json',
			success : function(jobList, textStatus, xhr){
				if(xhr.status === 200){
					let myJobCode = printLocation.closest('tr').find('.user-admin-job-code select option:selected').val();
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
	
	$(document).on('change', '.user-admin-member-checkbox input[name="editing"]', function(){
		let $this = $(this);
		let $tr = $this.closest('tr');
		let printLocation = $tr.find('.user-admin-job-code select');
		if($this.is(':checked')){
			getJobList(printLocation);	
		}
	});
	
	/**
	* 수정 체크박스 클릭시 role selectbox에 전체 role 추가
	*/
	function getRoleList(printLocation){
		let myRoleCode = printLocation.closest('tr').find('.user-admin-member-role select option:selected').val();
		let roleList= ["ADMIN", "MANAGER", "USER"];
		printLocation.empty();
		$.each(roleList, function(index, role){
			if(myRoleCode === role){
				printLocation.append($('<option>').attr({'value': role, 'selected': 'selected'}).text(role));	
			} else {
				printLocation.append($('<option>').attr('value', role).text(role));
			}
		});
	}
	
	$(document).on('change', '.user-admin-member-checkbox input[name="editing"]', function(){
		let $this = $(this);
		let $tr = $this.closest('tr');
		let printLocation = $tr.find('.user-admin-member-role select');
		if($this.is(':checked')){
			getRoleList(printLocation);	
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
			$tr.addClass('user-admin-update-row');
		} else {
			$tr.find('td input').attr('readonly', 'readonly');
			$tr.find('td select').attr('disabled', 'disabled');
			if ($tr.hasClass('user-admin-update-row')) {
				$tr.removeClass('user-admin-update-row');
			}
		}
	}
	
	$(document).on('change', '.user-admin-member-checkbox input', handleCheckboxChange);
	
	/**
	* 초기화 버튼
	* 클릭시 체크박스 체크를 해제하고, memberList를 비운 뒤 memeberList 다시 조회
	*/
	$(document).on('click', '#user-admin-member-init-btn', function(){
		let printLocation = $('#user-admin-member-list-table-body');
		$('.user-admin-member-checkbox input').prop('checked', false);
		printLocation.empty();
		getMemberList(printLocation);
	});
	
	/**
	* null or space validation
	* 
	*/
	function isNullOrWhitespace(value) {
		return value === null || value.trim() === '';
	}
	
	/**
	* +(member-add) 버튼
	* 
	*/
	$(document).on('click', '#user-admin-member-add', function(){
		let member = {};
		let printLocation = $('#user-admin-member-list-table-body');
		printMember(member, printLocation);
		let $newRow = $('#user-admin-member-list-table-body tr:last');
		$newRow.addClass('user-admin-new-row');
		$newRow.find('.user-admin-member-checkbox input').focus();
		$newRow.find('.user-admin-member-checkbox input').click();
	});
	
	/**
	* 저장 버튼
	* 
	*/
	$(document).on('click', "#user-admin-member-save-btn", function(){
		if(confirm('저장하시겠습니까?')){
			let checkedRows = $('.user-admin-member-checkbox input[type="checkbox"]:checked').closest('tr');
			let hasNull = false;
			let memberList = [];

			checkedRows.each(function() {
				let memberYn = $(this).find('input[type="hidden"]').val();
				let memberUid = $(this).find('.user-admin-member-checkbox input[type="checkbox"]').val();
				let deptCode = $(this).find('.user-admin-dept-code select').val();
				let jobCode = $(this).find('.user-admin-job-code select').val();
				let companyCode = $(this).find('.user-admin-company-code select').val();
				let memberId = $(this).find('.user-admin-member-id input[type="text"]').val();
				let memberName = $(this).find('.user-admin-member-name input[type="text"]').val();
				let address = $(this).find('.user-admin-member-address input[type="text"]').val();
				let tel = $(this).find('.user-admin-member-tel input[type="text"]').val();
				let memberRole = $(this).find('.user-admin-member-role select').val();
				
				if(memberUid === 'on'){
					memberUid = null;
				}
				
			    if (isNullOrWhitespace(deptCode) || isNullOrWhitespace(jobCode) || isNullOrWhitespace(companyCode) ||  
			    	isNullOrWhitespace(memberId) || isNullOrWhitespace(memberName) || isNullOrWhitespace(address) || isNullOrWhitespace(tel)) {
			    	hasNull = true;
					return;
			    }
				
				let member = {
					memberUid: memberUid,
					deptCode: deptCode,
					jobCode: jobCode,
					companyCode: companyCode,
					memberId: memberId,
					memberName: memberName,
					address: address,
					tel: tel,
					updateUser: loginMemberId,
					memberRole: memberRole,
					memberYn: memberYn
				};
				
				memberList.push(member);
				
			});
			
			if(hasNull){
				alert('입력되지 않은 값이 있습니다');
				return;
			}
			
			$.ajax({
				type : "PATCH",
				url : "/standard/members",
				dataType : 'json',
				contentType: 'application/json',
				data: JSON.stringify(memberList),
				success : function(textStatus, xhr, result){
					console.log('result : ' + result.responseText);
					if(result.responseText > 0){
						let $printLocation = $('#user-admin-member-list-table-body');
						alert('저장이 완료되었습니다');
						$printLocation.empty();
						getMemberList($printLocation);
					} else {
						alert('사용중인 아이디입니다. 아이디를 확인해주세요.');
					}
					
				},
				error : function(xhr, textStatus){
					handleError(xhr.status);
				}
			});
		}
		
	});
	
	/**
	* -(member-delete) 버튼
	* 
	*/
	$(document).on('click', '#user-admin-member-delete', function(){
		let $checkedRows = $('.user-admin-member-checkbox input[type="checkbox"]:checked').closest('tr');
		$checkedRows.each(function(){
			//+버튼을 눌러서 나온 입력 form인 경우
			if($(this).find('.user-admin-member-checkbox input[type="checkbox"]').val() === 'on'){
				$(this).remove();
			} else{
				$(this).find('input[type="hidden"]').val('N');
				$(this).css('display', 'none');
			} 
		});
		
	});
	
	/**
	 * id, name 검색 통합 요청
	 * keyup시마다 ajax요청으로 member 조회
	 */
	$(document).on('keyup', '#user-admin-search-member-name, #user-admin-search-member-id', function(){
		let $nameKeyword = $('#user-admin-search-member-name').val();
		let $idKeyword = $('#user-admin-search-member-id').val();
		let data = {
			nameKeyword: $nameKeyword,
			idKeyword: $idKeyword,
			companyCode: loginMemberCompanyCode
		};
		
		if($nameKeyword.trim() == ''){
			$nameKeyword = ' ';
		}
		
		if($idKeyword.trim() == ''){
			$idKeyword = ' ';
		}
		
		let url = '/standard/members/keyword?'+ 'nameKeyword=' + encodeURIComponent($nameKeyword)
									          + '&idKeyword=' + encodeURIComponent($idKeyword)
									          + '&companyCode=' + encodeURIComponent(loginMemberCompanyCode);
		
		$.ajax({
			type : "GET",
			url : url,
			dataType : 'json',
			success : function(memberList, textStatus, xhr){
				let $printLocation = $('#user-admin-member-list-table-body');
				$printLocation.empty();
				$.each(memberList, function(index, member){
					printMember(member, $printLocation);
				});
			},
			error : function(xhr){
				console.log("error");
			}
		});
	});
</script>