<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>stock-move-registration</title>
<style type="text/css">
	
	.stockMoveRegistrationTable, .stockMoveDetailTable{
		display: black;
		width: 100%;
		border-collapse: collapse;
		text-align: center;
	}
	
	.divTable{
		height: 184px;
		overflow: auto;
	}
	
	.stockMoveRegistrationTable thead, .stockMoveDetailTable thead{
		position: sticky;
		top: 0;
		background: lightgray;
	}
	
	.stockMoveRegistrationTable td , .stockMoveDetailTable td{
		border: 1px solid darkgray;
		padding: 5px;
	}
	
	.stockMoveDetailTable tr[data-status='add'] .itemCode{
		cursor: pointer;
	}
	
	#saveBtn, #moveConfirmationBtn{
		cursor: pointer;
	}
	
	.buttons{
		display: block;
	}
	
	.selected-row{
		background-color: #D4F4FA;
	}
	
	.moveDate, .moveMemo, .itemCode, .whCodeIn, .moveQuantity{
		background-color: #D4F4FA;
	}
	
	#itemTable {
		width: 100% !important;
	}
	
	#itemTable tbody tr:hover {
		background-color: #D4F4FA;
		cursor: pointer;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<div class="container">
		<h4>재고이동 등록</h4>
		<div class="buttons">
			<button id="saveBtn">저장</button>
			<button id="resetBtn">초기화</button>
			<button id="moveConfirmationBtn">이동 확정</button>
		</div>
		<div id="registrationBtns">
			<button class="plus"><i class="xi-plus"></i></button>
			<button class="minus"><i class="xi-minus"></i></button>
		</div>
		<div class="divTable">
			<table class="stockMoveRegistrationTable">
				<thead>
					<tr>
						<th>No.</th>
						<th><input type="checkbox" class="checkAll"></th>
						<th>이동번호</th>
						<th>이동일자</th>
						<th>이동상태</th>
						<th>등록일자</th>
						<th>등록자</th>
						<th>수정일자</th>
						<th>수정자</th>
						<th class="stockMoveMemoValue">비고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="move" items="${stockMoveRegistration}" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td><input type="checkbox" class="checkItem"></td>
							<td class="moveCode">${move.moveCode }</td> <!-- 이동번호 -->
							<td class="moveDate">${move.moveDate }</td> <!-- 이동일자 -->
							<td class="moveType">${move.moveType }</td>
							<td>${move.regDate }</td>
							<td>${move.regUser }</td>
							<td>${move.updateDate }</td>
							<td>${move.updateUser}</td>
							<td class="moveMemo">${move.memo }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	
		<h4>세부내역</h4>
		<div id="detailBtns">
			<button class="plus"><i class="xi-plus"></i></button>
			<button class="minus"><i class="xi-minus"></i></button>
		</div>
		<div class="divTable">
			<table class="stockMoveDetailTable">
				<thead>
					<tr>
						<th>No.</th>
						<th><input type="checkbox" class="checkAll"></th>
						<th>제품코드</th>
						<th>품명</th>
						<th>재고수량</th>
						<th>출고창고</th>
						<th>입고창고</th>
						<th>이동수량</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<!-- itemList Modal  HTML-->
	
	
	<!-- 부트스트랩 모달 -->
	<div class="modal fade" id="itemModal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">제품코드</h5>
				</div>
				<div class="modal-body">
					<div id="itemTableContainer">
						<table id="itemTable">
							<thead>
								<tr>
									<th>제품코드</th>
									<th>제품명</th>
									<th>창고코드</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		// "전체" 체크박스 클릭
		function toggleCheckAll(tableId) {
			$('.' + tableId + ' .checkAll').click(function() {
				$('.' + tableId + ' .checkItem').prop('checked', $(this).prop('checked'));
			});
		}

        // "개별" 체크박스 클릭
        function toggleCheckItem(tableId){
        	$(document).on('click', '.' + tableId + ' .checkItem', function(){
	            if ($(this).prop("checked") == false) {
	                $('.' + tableId + ' .checkAll').prop('checked', false);
	            }
	            // 개별체크박스 checked된 length와 체크박스 갯수가 같으면 전체체크박스 checked 변경
	            if ($('.' + tableId + ' .checkItem:checked').length == $('.' + tableId + ' .checkItem').length) {
	                $('.' + tableId + ' .checkAll').prop('checked', true);
	            }
        	});
        }
 
        // 로우 클릭시 체크박스 (이동등록)
        function toggleRowClick(tableId){
        	$(document).on('click', '.' + tableId + ' tbody tr', function(){
        		
        		let moveCode = $(this).find('.moveCode').text();
	        	let checkbox = $(this).find('.checkItem');
	        	checkbox.prop('checked', !checkbox.prop('checked'));
	        	
	        	// 모든 로우의 배경색을 초기화하고 선택 된 로우만 색상 변경
	        	if ($(this).hasClass('selected-row')){
	        		$(this).removeClass('selected-row');
	        	} else{
		        	$('.' + tableId + ' tr').removeClass('selected-row');
		        	$(this).addClass('selected-row');
	        	}
	        	
	        	// 모든 체크박스
	        	if($('.' + tableId + ' .checkItem:checked').length == $('.' + tableId + ' .checkItem').length) {
	        		$('.' + tableId + ' .checkAll').prop('checked', true);
	        	} else{
	        		$('.' + tableId + ' .checkAll').prop('checked', false);
	        	}
	        	
	        	// 세부내역
	        	if(tableId === 'stockMoveRegistrationTable'){
	        		$.ajax({
						url: '/product/stockMoveDetailList/' + moveCode,
						type: 'GET',
						success: function(data){
							$(".stockMoveDetailTable tbody").empty();
			                $.each(data, function(index, item) {
		            			var row = $("<tr>");
		            			row.append($("<td>").text(index + 1));
		            			
		            			var checkbox = $('<input>').attr('type', 'checkbox').addClass('checkItem');
		            			row.append($("<td>").append(checkbox));
		            			
		                        row.append($("<td class='itemCode'>").text(item.itemCode));
		                        row.append($("<td class='itemName'>").text(item.itemName));
		                        row.append($("<td class='StockQuantity'>").text(item.stockQuantity));
		                        row.append($("<td class='whCodeOut'>").text(item.whCodeOut));
		                        row.append($("<td class='whCodeIn'>").text(item.whCodeIn));
		                        row.append($("<td class='moveQuantity'>").text(item.moveQuantity));
		                        row.append($("<td class='moveMemo'>").text(item.memo));
		                        row.append($("</tr>"));

		                        $(".stockMoveDetailTable tbody").append(row);
			                });
						}
					});
	        	}
	        });
        }
        	
      //스크롤처리
        function scrollToBottom(){
        	const divTable = document.querySelectorAll('.divTable');
        	divTable.forEach(divTable => {
	        	divTable.scrollTop = divTable.scrollHeight;
        	});
        }
        
		// 플러스 버튼
		function addButtonClick(tableId, btnId){
			$(document).on('click', '#' + btnId + ' .plus', function(){
				
	        	// 모든 체크박스 해제
	        	$('.' + tableId + ' .checkItem').prop('checked', false);
	        	
	        	// rowCount
	        	let rowCount = $('.' + tableId + ' tr').length;
	        	console.log("row카운터->",rowCount);
	        	
	        	if(btnId === 'registrationBtns'){
		        	let moveDateId = 'datepicker' + rowCount;
		        	
		        	$('.' + tableId + ' tbody').append(`
	        			<tr data-status="add">
	        				<td>${rowCount}</td>
							<td><input type="checkbox" class="checkItem" checked></td>
							<td class="moveCode"></td> //이동번호
							<td class="moveDate"><input type="text" id="${moveDateId}" value="${moveDate}"></td> //이동일자(달력)
							<td class="moveType">저장</td> //이동상태
							<td></td> //등록일자
							<td>company1.admin@yeonoo.com</td> //등록자
							<td></td>   //수정일자
							<td></td>  //수정자
							<td class="moveMemo"><input type="text"></td> //메모
	        			</tr>
					`);
		        	
		        	$('#' + moveDateId).datepicker({
		        		dateFormat: "yy-mm-dd"
		        	}).attr("readonly", "readonly");
		        	scrollToBottom();
	        	} else if(btnId === 'detailBtns'){
    	        	$('.' + tableId + ' tbody').append(`
            			<tr data-status='add'>
            				<td>${rowCount}</td>
    						<td><input type="checkbox" class="checkItem" checked></td>
    						<td class="itemCode"></td> //제품코드
    						<td class="itemName"></td> //품명
    						<td class="stockQuantity"></td> //재고수량
    						<td class="whCodeOut"></td> //출고창고
    						<td class="whCodeIn"></td> //입고창고
    						<td class="moveQuantity"></td> //이동수량
    						<td class="moveMemo"></td> //비고
            			</tr>
					`);
	        	}
		        	scrollToBottom();
			
	        });
			
			// 이동일자 선택 시 달력창
			$(document).on('focus', '.moveDate input', function(){
				$(this).datepicker({
					dateFormat: "yy-mm-dd",
					onSelect: function(dateText){
						$(this).val(dateText);
					}
				}).attr("readonly","readonly");
			});
			
		}
	
		// 마이너스 버튼
		function removeButtonClick(tableId, btnId){
			$(document).on('click', '#' + btnId + ' .minus', function(){
	        	$('.' + tableId + ' tr').has('.checkItem:checked').remove();
	        });
		}
		
		// 초기화 버튼
		function resetBtn(){
			$('.stockMoveRegistrationTable .checkAll, .stockMoveRegistrationTable .checkItem').prop('checked', false);
			$('.stockMoveDetailTable .checkAll, .stockMoveDetailTable .checkItem').prop('checked', false);
			$('.stockMoveRegistrationTable tr').removeClass('selected-row');
			$('.stockMoveDetailTable tbody tr').remove();
			$('tr[data-status="add"]').remove();
		}
		
		// 이동등록 isnert
		function stockMoveRegistrationInsert(){
			let addedRows = $("tr[data-status='add']");
			let promises = []; // saveBtn 담을 배열
			
			addedRows.each(function(){
				let moveDate = $(this).find('.moveDate input').val();
				let moveMemo = $(this).find('.moveMemo input').val();
				
				let ajaxReq = $.ajax({
						url: '/product/stockMoveRegistrationAdd',
						type: 'POST',
						data: {
							moveDate: moveDate,
							moveMemo: moveMemo
						}
				});
				promises.push(ajaxReq);
			});
			
			return promises; 
		}
		
		
		// 이동등록 update
		// 이동등록 세부내역 insert
		// 이동등록 세부내역 update
		// 이동등록 세부내역 delete
		
		$(document).ready(function(){
			// 체크박스 클릭 시 이벤트 중복 방지
			$(document).on('click', '.checkItem', function(event){
	        	event.stopPropagation();
			});
			
			//이동등록,세부내역에 대한 전체,개별 체크박스
			toggleCheckAll("stockMoveRegistrationTable");
			toggleCheckAll("stockMoveDetailTable");
			toggleCheckItem("stockMoveRegistrationTable");
			toggleCheckItem("stockMoveDetailTable");
			
			//이동등록,세부내역에 대한 로우 클릭시 체크박스
			toggleRowClick("stockMoveRegistrationTable");
			toggleRowClick("stockMoveDetailTable");
			
			//이동등록,세부내역에 대한 플러스, 마이너스
			addButtonClick("stockMoveRegistrationTable", "registrationBtns");
			addButtonClick("stockMoveDetailTable", "detailBtns");
			removeButtonClick("stockMoveRegistrationTable", "registrationBtns");
			removeButtonClick("stockMoveDetailTable", "detailBtns");
			
			// 이동확정 클릭 -> "확정"
			$('#moveConfirmationBtn').click(function(){
				let moveCode = null;
				let alreadyConfirmed = false;
				let checkedCount = 0;
				let selectedRow = null;
				
				$('.stockMoveRegistrationTable tr').each(function(){
					let checkbox = $(this).find('.checkItem');
					let currentMoveCode = $(this).find('.moveCode');
					let moveType = $(this).find('.moveType');
					
					//체크된 얘만 처리
					if(checkbox.prop('checked')){
						checkedCount++; // 체크 된 로우의 갯수
						selectedRow = $(this); //체크된 얘 저장하고 ajax에서 사용 예정
						
						if(moveType.text() === '확정'){
							alreadyConfirmed = true;
						} else if(moveType.text() === '저장'){
							moveCode = currentMoveCode.text();
						}
					}
				});
				
				if(checkedCount > 1) {
					alert("한 건에 대해서만 이동 가능합니다.");
					return false;
				}
				
				if(alreadyConfirmed) {
					alert("이미 이동이 확정되었습니다.");
					return false;
				} else if(moveCode === null){
					alert("이동을 확정 할 데이터를 선택하세요.");
					return false;
				} else {
					let confirmAction = confirm("정말로 이동을 확정하시겠습니까?");
					if(confirmAction) {
						$.ajax({
							url: '/product/stockMoveConfirmation/' + moveCode,
							type: 'PATCH',
							success: function(data){
								alert("이동 확정이 되었습니다.");
								selectedRow.find('.moveType').text('확정');
								
							}
						});
					}
				}
			});
			
			// 초기화버튼 resetBtn
			$(document).on('click', '#resetBtn', function(){
				resetBtn();
			});
			
			// 메모 더블클릭 수정
			$(document).on('dblclick', 'tr .moveMemo', function(){
			    let input = $('<input>', {type: 'text', value: $(this).text()});

			    $(this).html(input).attr('data-status', 'edit');
			    
			    // 입력 필드에 포커스를 설정하고 텍스트를 모두 선택
			    input.focus().select();
			});

			// 저장 버튼 saveBtn
			$(document).on('click', '#saveBtn', function(){
				let hasEmptyMoveDate = false;
				
				// 이동일자 선택 안했을 때
				$("tr[data-status='add']").each(function(){
					let moveDateValue = $(this).find('.moveDate input').val();
					if(!moveDateValue) {
						hasEmptyMoveDate = true;
						return false;
					}
				});
				
				if(hasEmptyMoveDate){
					alert('이동일자를 선택하세요.');
					return; // 함수 종료
				}
				
			    Promise.allSettled([
			    	...stockMoveRegistrationInsert()
			    ]).then(() => {
			    	location.reload();
			    }).catch((error) => {
			        console.error(`saveBtn ${error}-> ${error}`);
			    });
			});
			
			// 제품코드 DataTable
			let table = $('#itemTable').DataTable({
				ajax: {
					url: '/product/itemCodeList',
					type: 'GET',
					dataSrc: ''
				},
				columns: [
					{data: 'itemCode' },
					{data: 'itemName'},
					{data: 'whCode'}
				]
			});
			
			// 선택한 행을 저장할 변수
			let selectedRow;
			// 제품코드 모달
			$(document).on('dblclick', '.stockMoveDetailTable .itemCode', function(){
				if($(this).parents('tr').data('status') === 'add'){
					$('#itemModal').modal('show');
					selectedRow = $(this).closest('tr');  // 선택한 행을 저장
				}
			});
			
			// 제품코드 클릭 시 행 기입
			$(document).on('click', '#itemTable tbody tr', function(){
				let data = table.row(this).data();
				
				$.ajax({
					url: '/product/itemCodeRowDataList',
					type: 'GET',
					data: {
						itemCode: data.itemCode
					},
					success: function(data){
			            // 기존 행에 기입
			            selectedRow.find('.itemCode').text(data[0].itemCode);
						selectedRow.find('.itemName').text(data[0].itemName);
						selectedRow.find('.whCodeOut').text(data[0].whCode);
						selectedRow.find('.stockQuantity').text(data[0].stockQuantity);
			
			            $('#itemModal').modal('hide'); // 모달 닫기
			        }
				});
			});
			
			// 입고창고 모달
			
			
		});
		
   	</script>
</body>
</html>