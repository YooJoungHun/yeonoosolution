<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">

.main-container {
	overflow: auto !important;
}

.main-content {
	width: 100%;
	height: 651px;
	margin: 0px auto;
	overflow: auto;
	border: 1px solid #ddd;
	margin-top: 8px;
	
}

.btn-group1 {
	width: 520px;
	margin: 3px;
}


.input-info {
	width: 100%;
	height: 210px;
	margin: 0px auto;
	padding: 16px;
    border-radius: 10px;
    margin-top: 8px;
    background-color: #F8F8F8;
}

.input-info label {
	display: inline-block;
    width: 100px;
    border-radius: 5px;
    border: 1px solid #E8EBF0;
    padding: 0;
    font-size: 14px;
    font-weight: bold;
    text-align: center;
    line-height: 30px;
    background-color: #9BABB8;
    margin-bottom: 15px;
}

.input-info input {
	display: inline-block;
    width: 150px;
    border-radius: 5px;
    border: 1px solid #E8EBF0;
    padding: 0px;
    font-size: 14px;
    text-align: center;
    line-height: 30px;
}

.input-info select {
	display: inline-block;
    width: 100px;
    height: 30px;
    border-radius: 5px;
    border: 1px solid #E8EBF0;
    padding: 0px;
    font-size: 14px;
    line-height: 30px;
}

.btn-group1 button {
	display: inline-block;
	border: 1px solid #D6DAE2;
    outline: none;
    border-radius: 5px;
    padding: 0 12px;
    height: 30px;
	
}

.input-info button:hover {
	background-color: #D6D2C4;
}


#content-table th {
	background-color: #9BABB8;
	font-weight: bold;
}

#content-table th, #content-table td {
	white-space: nowrap;
	padding: 8px;
	text-align: center;
	border: 1px solid #B3B3B3;
}


#content-table tr {
	height: 24px;
}

#content-table {
	width: 1305px;
	border-collapse: collapse;
	white-space: nowrap;
	font-size: 15px;
}


#content-table tr:hover {
  	background-color: #f5f5f5;
}


#content-table input[type="checkbox"] {
 	margin: 0;
}

	
/* 모달 창 */
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.5);
}

/* 모달 창 컨텐츠 */
.modal-content {
  background-color: #fff;
  margin: 10% auto;
  padding: 20px;
  border: 1px solid #ccc;
  max-width: 450px;
  width: 100%;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

/* 모달 창 닫기 버튼 */
.close {
  color: #aaa;
  float: right;
  font-size: 20px;
  font-weight: bold;
  cursor: pointer;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

/* 리스트 아이템 */

.modal-content h2 {
	text-align: center;
	margin: 0px auto;
	margin-bottom: 20px;
}

#wh-table th {
	background-color: #9BABB8;
	font-weight: bold;
}

#wh-table th, #wh-table td {
	white-space: nowrap;
	padding: 8px;
	text-align: center;
	border: 1px solid #B3B3B3;
}

#wh-table {
	width: 400px;
	border: 2px solid #ddd;
	border-collapse: collapse;
	white-space: nowrap;
	font-size: 15px;
}


#wh-list td {
	cursor: pointer; 
	padding: 5px;
}


#wh-list tr {
	height: 24px;
}

#wh-list tr:hover {
	background-color: #f5f5f5; /* 호버 상태 배경색 변경 */
}



#company-table th {
	background-color: #9BABB8;
	font-weight: bold;
}

#company-table th, #company-table td {
	white-space: nowrap;
	padding: 8px;
	text-align: center;
	border: 1px solid #B3B3B3;
}

#company-table {
	width: 400px;
	border: 2px solid #ddd;
	border-collapse: collapse;
	white-space: nowrap;
	font-size: 15px;
}


#company-list td {
	cursor: pointer; /* 마우스 커서를 포인터로 변경 */
	padding: 5px;
}


#company-list tr {
	height: 24px;
}

#company-list tr:hover {
	background-color: #f5f5f5; /* 호버 상태 배경색 변경 */
}



@media (max-width: 480px) {
  /* 작은 화면에서 모달 창의 너비 조정 */
  .modal-content {
    width: 90%;
  }
}

</style>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	
	$(document).ready(function () {
		defaultItemList();
		getNow();
	});
	
	
	// 현재 날짜 가져오기
	function getNow() {
		let today = new Date();
		// 날짜를 yyyy/mm/dd 형식으로 변환
		let year = today.getFullYear();
		let month = String(today.getMonth() + 1).padStart(2, '0');
		let day = String(today.getDate()).padStart(2, '0');
		// 등록/수정일자 input에 오늘 날짜 설정
		$('#reg-date').val(year + '/' + month + '/' + day);
	};
	
	
	// 검색
	function search() {
		let searchKeyWord = $('#search-input').val();
		let table = $('#content-table');
		let tbody = table.find('tbody');
		if (searchKeyWord === "") {
			tbody.empty();
			defaultItemList();
		} else {
			$.ajax({
				url : '/standard/imi/search/' + searchKeyWord,
				type : 'GET',
				data : { searchKeyWord: searchKeyWord },
				success : function (searchResultList) {
					if (!tbody.length) {
					  tbody = $('<tbody></tbody>');
					  table.append(tbody);
					}
			        tbody.empty();
			        console.log(searchResultList);

					for (var i = 0; i < searchResultList.length; i++) {
						let item = searchResultList[i];
						let row =
							'<tr>' +
							'<td>' + (i + 1) + '</td>' +
							'<td><input type="radio" name="item-radio"></td>' +
					        '<td style="background-color: #FFFFCC">' + item.whCode	 + '</td>' +
					        '<td style="background-color: #FFFFCC">' + item.companyCode + '</td>' +
					        '<td style="background-color: #D9D9D9">' + item.itemCode + '</td>' +
					        '<td style="background-color: #E6F2FF">' + item.itemName + '</td>' +
					        '<td style="background-color: #E6F2FF">' + item.itemType + '</td>' +
					        '<td style="background-color: #E6F2FF">' + item.stockUnit + '</td>' +
					        '<td>' + item.memo + '</td>' +
					        '<td style="background-color: #FFFFCC">' + item.startDate.substring(0, 10) + '</td>' +
					        '<td style="background-color: #FFFFCC">' + item.endDate.substring(0, 10) + '</td>' +
					        '<td style="background-color: #E6F2FF">' + item.regUser + '</td>' +
					        '<td style="background-color: #D9D9D9">' + item.regDate.substring(0, 10) + '</td>' +
					        '<td style="background-color: #E6F2FF">' + item.updateUser + '</td>' +
					        '<td style="background-color: #D9D9D9">' + item.updateDate.substring(0, 10) + '</td>' +
					        '</tr>';
							table.append(row);
					}
				},
				error: function (xhr, status, error) {
				    console.log('Error:', error);
				}
		    });
		}
	}

	$(document).on('click', '#search-btn', function () {
		search();
	});

	$(document).on('keydown', '#search-input', function (event) {
		if (event.keyCode === 13) {
			event.preventDefault();
			search();
		}
	});
	
	
	
	// 창고 모달 창 
	$(document).on('dblclick', '#wh-code', function() {
	  	$('#wh-modal').show();
	  	
	  	$.ajax({
	  		url : '/standard/imi/wh',
	  		type : 'GET',
	  		dataType : 'json',
	  		success : function(whList) {
	  			let tbody = $('#wh-list');
	  	      	tbody.empty();

				for (var i = 0; i < whList.length; i++) {
					let wh = whList[i];
					let row = 
					'<tr>' +
				  	'<td>' + wh.whCode2 + '</td>' +
				  	'<td>' + wh.whName + '</td>' +
				  	'</tr>';
					tbody.append(row);
				}
				// 테이블 행 클릭 시 데이터 설정 및 모달 숨김
				$('#wh-table tbody tr').on('click', function() {
				  	let selectedRow = $(this);
				  	let whCode = selectedRow.find('td:eq(0)').text();
				  	$('#wh-code').val(whCode);
                    $('#wh-modal').hide();
				});
	  		},
	  		error: function(xhr, status, error) {
			      console.log('Error:', error);
			}
	  	});
	});

	
	// 창고 모달 창 닫기
	$(document).on('click', '#wh-modal .close', function() {
	  	$('#wh-modal').hide();
	});
	
	
	// 거래처 모달 창 
	$(document).on('dblclick', '#company-code', function() {
	  	$('#company-modal').show();
	  	
	  	$.ajax({
	  		url : '/standard/imi/companys',
	  		type : 'GET',
	  		dataType : 'json',
	  		success : function(companyList) {
	  			let tbody = $('#company-list');
	  	      	tbody.empty();

				for (var i = 0; i < companyList.length; i++) {
					let company = companyList[i];
					let row = 
					'<tr>' +
				  	'<td>' + company.companyCode + '</td>' +
				  	'<td>' + company.orderType + '</td>' +
				  	'<td>' + company.companyName + '</td>' +
				  	'</tr>';
					tbody.append(row);
				}
				// 테이블 행 클릭 시 데이터 설정 및 모달 숨김
				$('#company-table tbody tr').on('click', function() {
				  	let selectedRow = $(this);
				  	let companyCode = selectedRow.find('td:eq(0)').text();
				  	$('#company-code').val(companyCode);
                    $('#company-modal').hide();
				});
	  		},
	  		error: function(xhr, status, error) {
			      console.log('Error:', error);
			}
	  	});
	});
	
	// 거래처 모달 창 닫기
	$(document).on('click', '#company-modal .close', function() {
	  	$('#company-modal').hide();
	});
	
	
	// 제품 등록
	$(document).on('click', '#item-insert', function(){
		if  ($('#reg-user').val() === "" || $('#company-code').val() === "" || $('#start-date').val() === "" || $('#end-date').val() === "" || $('#item-name').val() === "") {
			alert("필수 정보를 입력해주세요.");
		} else {
			$.ajax({
				url : '/standard/imi/item',
				type : 'POST',
				dataType : 'json',
				contentType : 'application/json',
				data : JSON.stringify({
					whCode 		: $('#wh-code').val(),
					companyCode : $('#company-code').val(),
					itemName 	: $('#item-name').val(),
					itemType 	: $('#item-type').val(),
					stockUnit 	: $('#stock-unit').val(),
					memo 		: $('#memo').val(),
					startDate 	: $('#start-date').val(),
					endDate 	: $('#end-date').val(),
					regUser 	: $('#reg-user').val(),
					regDate 	: $('#reg-date').val(),
					updateUser  : $('#reg-user').val(),
					updateDate  : $('#reg-date').val()
				}),
				success : function(itemInsert){
					if(itemInsert == 1){
						alert("제품 등록이 완료되었습니다.");
					} else if (itemInsert == -1 ){
						alert("중복 아이템은 등록 불가능합니다. 제품명을 확인해주세요.");
					} else {
						alert("제품 등록에 실패하였습니다. 잠시 후 다시 시도해주세요.")
					}
					location.reload();
				},
				error: function(xhr, status, error) {
				      console.log('Error:', error);
				}
			});
		}
	});
	
	
	// 열 클릭시 라디오 박스 체크
	$(document).on('click', '#content-table tbody tr', function() {
		$(this).toggleClass('checked-row');
	});

	
	// 제품 삭제 및 수정(업데이트)
	$(document).on('click', '#item-delete, #item-update', function() {
		let itemCode = $('#item-code').val();
		let action = $(this).data('action');
		
		if(itemCode === "") {
			alert("제품을 먼저 선택 해주세요.");
		} else {
			console.log(action);
			console.log(itemCode);
			
			$.ajax({
				url : '/standard/imi/' + itemCode,
				type : 'PUT',
				dataType : 'json',
				contentType : 'application/json',
				headers: {
				    'action': action
				},
				data : JSON.stringify({
					whCode 		: $('#wh-code').val(),
					companyCode : $('#company-code').val(),
					itemCode    : itemCode,
					itemName 	: $('#item-name').val(),
					itemType 	: $('#item-type').val(),
					stockUnit 	: $('#stock-unit').val(),
					memo 		: $('#memo').val(),
					startDate 	: $('#start-date').val(),
					endDate 	: $('#end-date').val(),
					updateUser  : $('#reg-user').val(),
					updateDate  : $('#reg-date').val(),
				}),
				success : function(resultMap){
					if (action === 'delete') {
						if (resultMap.itemRemove === 1) {
							alert("삭제가 완료되었습니다.");
						} else {
							alert("에러가 발생하였습니다. 잠시 후 다시 시도해주세요.");
						}
					} else if (action === 'update') {
						if (resultMap.itemUpdate === 1) {
							alert("수정이 완료되었습니다.");
						} else {
							alert("에러가 발생하였습니다. 잠시 후 다시 시도해주세요.");
						}
					}
					location.reload();
				},
				error: function(xhr, status, error) {
				      console.log('Error:', error);
				}
			});
		}
	});

	
	// 제품 디폴트 리스트
	function defaultItemList() {
		$.ajax({
		    url : '/standard/imi/items',
		    type : 'GET',
		    dataType : 'json',
		    success : function(itemList) {
		      let table = $('#content-table');
	
		      for (var i = 0; i < itemList.length; i++) {
			      let item = itemList[i];
			      let row = 
			      '<tr>' +
			      '<td>' + (i + 1) + '</td>' +
		          '<td><input type="radio" name="item-radio"></td>' +
		          '<td style="background-color: #FFFFCC">' + item.whCode	 + '</td>' +
		          '<td style="background-color: #FFFFCC">' + item.companyCode + '</td>' +
		          '<td style="background-color: #D9D9D9">' + item.itemCode + '</td>' +
		          '<td style="background-color: #E6F2FF">' + item.itemName + '</td>' +
		          '<td style="background-color: #E6F2FF">' + item.itemType + '</td>' +
		          '<td style="background-color: #E6F2FF">' + item.stockUnit + '</td>' +
		          '<td>' + item.memo + '</td>' +
		          '<td style="background-color: #FFFFCC">' + item.startDate.substring(0, 10) + '</td>' +
		          '<td style="background-color: #FFFFCC">' + item.endDate.substring(0, 10) + '</td>' +
		          '<td style="background-color: #E6F2FF">' + item.regUser + '</td>' +
		          '<td style="background-color: #D9D9D9">' + item.regDate.substring(0, 10) + '</td>' +
		          '<td style="background-color: #E6F2FF">' + item.updateUser + '</td>' +
		          '<td style="background-color: #D9D9D9">' + item.updateDate.substring(0, 10) + '</td>' +
		          '</tr>';
		      	  table.append(row);
		      }
		    },
		    error: function(xhr, status, error) {
		      console.log('Error:', error);
		    }
		});
	}
	
	
	// 체크 된 아이템 정보 가져오기
	function updateInputFields(selectedRow) {
		let whCode = selectedRow.find('td:eq(2)').text();
		let companyCode = selectedRow.find('td:eq(3)').text();
		let itemCode = selectedRow.find('td:eq(4)').text();
		let itemName = selectedRow.find('td:eq(5)').text();
		let itemType = selectedRow.find('td:eq(6) select').val();
		let stockUnit = selectedRow.find('td:eq(7)').text();
		let memo = selectedRow.find('td:eq(8)').text();
		let startDate = selectedRow.find('td:eq(9)').text();
		let endDate = selectedRow.find('td:eq(10)').text();
		let regUser = selectedRow.find('td:eq(11)').text();
		
		$('#wh-code').val(whCode);
		$('#company-code').val(companyCode);
		$('#item-code').val(itemCode);
		$('#item-name').val(itemName);
		$('#item-type-select').val(itemType).trigger('change');
		$('#stock-unit').val(stockUnit);
		$('#memo').val(memo);
		$('#start-date').val(startDate);
		$('#end-date').val(endDate);
		$('#reg-user').val(regUser);
		
		let radioInput = selectedRow.find('td:eq(1) input[type="radio"]');
		radioInput.prop('checked', true);
		
		let selectedItemType = selectedRow.find('td:eq(6) select').val();
		$('#item-type > select').val(selectedItemType).trigger('change');
	}
	
	
	// 입력 폼에서 값 수정 시  리스트 값 실시간 변동
	$(document).on('input', '#item-name', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(5)').text($(this).val());
	});
	
	$(document).on('input', '#stock-unit', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(7)').text($(this).val());
	});
	
	$(document).on('input', '#memo', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(8)').text($(this).val());
	});
	
	$(document).on('input', '#start-date', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(9)').text($(this).val());
	});
	
	$(document).on('input', '#end-date', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(10)').text($(this).val());
	});
	
	// 체크 된 값 입력폼 업데이트
	$(document).on('click', '#content-table tr', function () {
		let radioInput = $(this).find('td:eq(1) input[type="radio"]');
		radioInput.prop('checked', true);
		let selectedRow = $(this);
		updateInputFields(selectedRow);
	});

	
	// 초기화 버튼
	$(document).on('click', '#reset-btn', function(){
		$('#wh-code').val('').attr('placeholder', '더블 클릭하여 창고 선택').prop('readonly', true);
		$('#company-code').val('').attr('placeholder', '더블 클릭하여 거래처 선택').prop('readonly', true);
		$('#item-code').val('').attr('placeholder', '자동 생성').prop('readonly', true);
		$('#item-name').val('');
		$('#item-type').val('완제품');
		$('#stock-unit').val('');
		$('#memo').val('');
		$('#start-date').val('').prop('required', true);
		$('#end-date').val('').prop('required', true);
		$('#reg-user').val('');
		$('#content-table tr input[type="radio"]:checked').prop('checked', false);
		$('#content-table tr.checked-row').removeClass('checked-row');
		if ($('#search-input').val() !== '') {
			let table = $('#content-table');
			let tbody = table.find('tbody');
			tbody.empty();
			defaultItemList();
			$('#search-input').val('');
		}
	});
</script>