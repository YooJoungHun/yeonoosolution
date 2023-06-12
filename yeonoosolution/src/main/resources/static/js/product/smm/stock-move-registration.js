/** stock-move-registration page scripts
 * 
 */
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
		
		//새로운 행에 대해서 AJAX요청 보내지 않음
		if(!moveCode){
			return;
		}
		
		$.ajax({
			url: '/product/stockMoveDetailList/' + moveCode,
			type: 'GET',
			success: function(data){
				$(".stockMoveDetailTable tbody").empty();
				$.each(data, function(index, item) {
					var row = $("<tr>");
					row.append($("<td class='moveCount'>").text(index + 1));
					
					var checkbox = $('<input>').attr('type', 'checkbox').addClass('checkItem');
					row.append($("<td>").append(checkbox));
					
					row.append($("<td class='itemCode'>").text(item.itemCode));
					row.append($("<td class='itemName'>").text(item.itemName));
					row.append($("<td class='stockQuantity'>").text(item.stockQuantity));
					row.append($("<td class='whCodeOut'>").text(item.whCodeOut));
					row.append($("<td class='whCodeIn'>").text(item.whCodeIn));
					row.append($("<td class='moveQuantity'>").text(item.moveQuantity));
					row.append($("<td class='moveMemo'>").text(item.memo));
					row.attr('data-move-code', item.moveCode);
					row.attr('data-sorder', item.sorder);
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
		
		if(btnId === 'registrationBtns'){
			
			$('.' + tableId + ' tbody').append(`
				<tr data-status="stMoveRegistrationAdd">
					<td>${rowCount}</td>
					<td><input type="checkbox" class="checkItem" checked></td>
					<td class="moveCode"></td> //이동번호
					<td class="moveDate"><input type="text"></td> //이동일자(달력)
					<td class="moveType">저장</td> //이동상태
					<td class="moveRegDate"></td> //등록일자
					<td class="moveRegUser"></td> //등록자
					<td class="moveUpdateDate"></td>   //수정일자
					<td class="moveUpdateUser"></td>  //수정자
					<td class="moveMemo"><input type="text"></td> //메모
				</tr>
			`);
			
			scrollToBottom();
		} else if(btnId === 'detailBtns'){
			let moveStatus = $('.stockMoveRegistrationTable .selected-row').find('.moveType').text();
			
			//확정이면 플러스로 행 추가 불가
			if(moveStatus === '확정'){
				alert('이동상태가 확정이면 세부내역에 대해 추가 또는 삭제가 불가능합니다');
				return;
			} else{
				let moveCode = $('.stockMoveRegistrationTable .selected-row').find('.moveCode').text();
			
				// 재고이동 선택안하고 세부내역 등록할 때
				if(!moveCode){
					alert('먼저 이동등록을 선택하세요');
					return;
				}
	
				$('.' + tableId + ' tbody').append(`
					<tr data-status='stMoveDetailAdd'>
						<td>${rowCount}</td>
						<td><input type="checkbox" class="checkItem" checked></td>
						<td class="itemCode"></td> //제품코드
						<td class="itemName"></td> //품명
						<td class="stockQuantity"></td> //재고수량
						<td class="whCodeOut"></td> //출고창고
						<td class="whCodeIn"></td> //입고창고
						<td class="moveQuantity"><input type="text"></td> //이동수량
						<td class="moveMemo"><input type="text"></td> //비고
					</tr>
				`);
			}
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
		if(btnId === 'registrationBtns'){
			$('.' + tableId + ' tr').has('.checkItem:checked').each(function(){
				if($(this).attr('data-delete-status') === 'delete-registration') {
					$(this).removeAttr('data-delete-status');
				} else{
					$(this).attr('data-delete-status', 'delete-registration');
				}
			});
		} else if(btnId === 'detailBtns') {
		
			let moveStatus = $('.stockMoveRegistrationTable .selected-row').find('.moveType').text();
			
			if(moveStatus === '확정'){
				alert('이동상태가 확정이면 세부내역에 대해 추가 또는 삭제가 불가능합니다');
				return;
			} else{
				$('.' + tableId + ' tr').has('.checkItem:checked').each(function(){
					if($(this).attr('data-delete-status') === 'delete-detail'){
						$(this).removeAttr('data-delete-status');
					} else{
						$(this).attr('data-delete-status', 'delete-detail');
					}
				});
			}
		}
	});
}

// 초기화 버튼
function resetBtn(){
	location.reload();
}

// 이동등록 등록
function insertStockMoveRegistration(){
	let addedRows = $("tr[data-status='stMoveRegistrationAdd']");
	let promises = []; // saveBtn 담을 배열
	
	addedRows.each(function(){
		let moveDate = $(this).find('.moveDate input').val();
		let moveMemo = $(this).find('.moveMemo').text();
		
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

// 세부내역 등록
function insertStockMoveDetail(moveCode){
	let addedRows = $("tr[data-status='stMoveDetailAdd']");
	let promise = Promise.resolve(); // 프로미스 선언
	
	addedRows.each(function(){
		let itemCode = $(this).find('.itemCode').text();
		let whCodeOut = $(this).find('.whCodeOut').text();
		let whCodeIn = $(this).find('.whCodeIn').text();
		let moveQuantity = $(this).find('.moveQuantity input').val();
		let moveMemo = $(this).find('.moveMemo').text();
		
		let stMoveDetailDto = {
			moveCode: moveCode,
			itemCode: itemCode,
			whCodeOut: whCodeOut,
			whCodeIn: whCodeIn,
			moveQuantity: moveQuantity,
			memo: moveMemo
		}
		
		promise = promise.then(function() {
			return new Promise(function(resolve) {
				$.ajax({
					url: '/product/stockMoveDetailAdd',
					type: 'POST',
					contentType: 'application/json',
					data: JSON.stringify(stMoveDetailDto), // JSON변환
					success: function(data){
						updateStockMoveRegistrationDateAndUser(moveCode);
						resolve();
					}
				});
			});
		});
	});
	
	return promise; 
}

// 이동등록 비고수정
function updateStockMoveRegistration() {
	let editRows = $("tr[data-edit-status='edit-registration']");
	let promises = [];
	
	editRows.each(function(){
		let moveCode = $(this).find('.moveCode').text();
		let moveMemo = $(this).find('.moveMemo').text();
		
		let ajaxReq = $.ajax({
			url: '/product/stockMoveRegistrationModify',
			type: 'PATCH',
			data:{
				moveCode: moveCode,
				moveMemo: moveMemo
			},
			success: function(data){
				updateStockMoveRegistrationDateAndUser(moveCode);
			}
		});
		promises.push(ajaxReq);
	});

	return promises;
	
}

// 이동등록 삭제 ('delYN' = 'Y' 수정)
function deleteStockMoveRegistration() {
	let deleteRows = $("tr[data-delete-status='delete-registration']");
	let promises = [];

	deleteRows.each(function(){
		let moveCode = $(this).find('.moveCode').text();

		let ajaxReq = $.ajax({
			url: '/product/stockMoveRegistrationDeleteStatusModify',
			type: 'PATCH',
			data: {
				moveCode: moveCode
			}
		});
		promises.push(ajaxReq);
	});

	return promises;
}

// 세부내역 비고수정
function updateStockMoveDetail() {
	let editRows = $("tr[data-edit-status='edit-detail']");
	let promises = [];
	
	editRows.each(function(){
		let moveCode = $(this).data('move-code') || "";  // data값 null이면 빈공백 전송
		let sorder = $(this).data('sorder') || "";
		let moveMemo = $(this).find('.moveMemo').text();
		
		let ajaxReq = $.ajax({
			url: '/product/stockMoveDetailModify',
			type: 'PATCH',
			data:{
				moveCode: moveCode,
				sorder: sorder,
				moveMemo: moveMemo
			},
			success: function(data){
				updateStockMoveRegistrationDateAndUser(moveCode);
			}
		});
		promises.push(ajaxReq);
	});

	return promises;
	
}

// 세부내역 삭제
function deleteStockMoveDetail() {
	let deleteRows = $("tr[data-delete-status='delete-detail']");
	let promises = [];

	deleteRows.each(function(){
		let moveCode = $(this).data('move-code') || ""; // data값 null이면 빈공백 전송
		let sorder = $(this).data('sorder') || "";

		let ajaxReq = $.ajax({
			url: '/product/stockMoveDetailRemove',
			type: 'DELETE',
			data: {
				moveCode: moveCode,
				sorder: sorder,
			},
			success: function(data){
				updateStockMoveRegistrationDateAndUser(moveCode);
			}
		});
		promises.push(ajaxReq);
	});

	return promises;
}

// 세부내역 등록,수정,삭제 시 이동등록에 수정일자 및 수정자 변경 (모듈)
function updateStockMoveRegistrationDateAndUser(moveCode){
	$.ajax({
		url: '/product/stockMoveRegistrationDateAndUserModify',
		type: 'PATCH',
		data: {
			moveCode: moveCode
		}
	});
}

// memo 수정 시 data-edit-status 모듈
function moveMemoDataSetStatus(element, editStatus) {
	let input = $('<input>', {type: 'text', value: $(element).text()});
	$(element).html(input);
	
	// 해당 tr에 'edit' 추가
	$(element).closest('tr').attr('data-edit-status', editStatus);
	
	// 입력 필드에 포커스를 설정하고 텍스트를 모두 선택
	input.focus().select();
	
	// 포커스 벗어나면 입력한 텍스트 기입
	input.on('focusout', function(){
		$(this).parent().text($(this).val());
	});
}

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
						location.reload();
					}
				});
			}
		}
	});
	
	// 초기화버튼 resetBtn
	$(document).on('click', '#resetBtn', function(){
		resetBtn();
	});
	
	// 이동등록 비고 클릭(수정) 시
	$(document).on('click', '.stockMoveRegistrationTable tr .moveMemo', function(){
		moveMemoDataSetStatus(this, 'edit-registration');
	});
	
	// 세부내역 비고 클릭(수정) 시
	$(document).on('click', '.stockMoveDetailTable tr .moveMemo', function(){
		moveMemoDataSetStatus(this, 'edit-detail');
	});

	// 저장 버튼 saveBtn
	$(document).on('click', '#saveBtn', function(){
		let moveCode = $('.stockMoveRegistrationTable .selected-row').find('.moveCode').text(); //sorder 기입용 moveCode
		let hasEmptyItemCode = false; // 제품코드 입력안했을때 종료시키는 변수
		let hasEmptyWhCodeIn = false; // 입고창고 입력안했을때 종료시키는 변수
		let hasEmptyMoveDate = false; // 이동일자 입력안했을때 종료시키는 변수
		let hasEmptyMoveQuantity = false; // 이동일자 입력안했을때 종료시키는 변수
		let hasExceededStockQuantity = false; // 재고수량보다 이동수량이 많을때 종료시키는 변수
		let hasInvalidMoveQuantity = false; // 숫자가 아닌 이동수량 입력했을때 종료시키는 변수

		// 이동일자 선택 안했을 때
		$("tr[data-status='stMoveRegistrationAdd']").each(function(){
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
		
		$("tr[data-status='stMoveDetailAdd']").each(function(){
			let itemCodeValue = $(this).find('.itemCode').text();
			let WhCodeInValue = $(this).find('.whCodeIn').text();
			let stockQuantityValue = $(this).find('.stockQuantity').text();
			let moveQuantityValue = $(this).find('.moveQuantity input').val();
			let stockQuantity = parseInt(stockQuantityValue, 10);
			let moveQuantity = parseInt(moveQuantityValue, 10);
			
			// 제품코드 선택 안했을 때
			if(itemCodeValue.length === 0){
				hasEmptyItemCode = true;
				return;
			}

			// 입고창고 선택 안했을 때
			if(WhCodeInValue.length === 0){
				hasEmptyWhCodeIn = true;
				return;
			}
			
			// 이동수량 입력 안했을 때 (공백포함)
			if(moveQuantityValue.trim().length === 0){
				hasEmptyMoveQuantity = true;
				return;
			}
			
			// 재고수량보다 이동수량 많을 때
			if(stockQuantity < moveQuantity){
				hasExceededStockQuantity = true;
				return;
			}
			
			// 이동수량 숫자 아닌거 입력했을 때
			if(isNaN(moveQuantityValue )){
				hasInvalidMoveQuantity = true;
				return;
			}
			
		});
		
		if(hasExceededStockQuantity){
			alert('재고수량보다 이동수량이 더 많습니다.');
			return;
		} 
		
		if(hasInvalidMoveQuantity){
			alert('이동수량은 숫자만 입력할 수 있습니다.');
			return;
		} 
		
		if(hasEmptyMoveQuantity){
			alert('이동수량을 입력하세요.');
			return;
		} 
		
		if(hasEmptyItemCode){
			alert('제품코드를 입력하세요.');
			return;
		} 
		
		if(hasEmptyWhCodeIn){
			alert('입고창고를 입력하세요.');
			return;
		}
		
		Promise.allSettled([
			...insertStockMoveRegistration(),    //이동등록 등록
			insertStockMoveDetail(moveCode),  //세부내역 등록
			...updateStockMoveRegistration(),    //이동등록 수정
			...deleteStockMoveRegistration(),    //이동등록 삭제
			...updateStockMoveDetail(),          //세부내역 수정
			...deleteStockMoveDetail()           //세부내역 삭제
		]).then(() => {
			location.reload();
			alert("저장되었습니다.");
		}).catch((error) => {
			alert('저장이 실패되었습니다.');
			console.error(`saveBtn ,${error}`);
		});
		
	});
	
	// 1. 제품코드 DataTable
	let itemCodeTable = $('#itemCodeTable').DataTable({
		ajax: {
			url: '/product/itemCodeList',
			type: 'GET',
			dataSrc: ''
		},
		order: [[ 0, 'asc' ]],
		columns: [
			{data: 'itemCode' },
			{data: 'itemName'},
			{data: 'whCode'}
		]
	});
	
	// 1. 입고창고 DataTable
	let whCodeInTable = $('#whCodeInTable').DataTable({
		ajax: {
			url: '/product/whCodeList',
			type: 'GET',
			dataSrc: ''
		},
		order: [[ 1, 'asc' ]],
		columns: [
			{data: 'whName'},
			{data: 'whCode'}
		]
	});
	
	// 선택한 행을 저장할 변수
	let selectedRow; 
	// 2. 제품코드 모달
	$(document).on('click', '.stockMoveDetailTable .itemCode', function(){
		if($(this).parents('tr').data('status') === 'stMoveDetailAdd'){
			$('#itemCodeModal').modal('show');
			selectedRow = $(this).closest('tr');  // 선택한 행을 저장
		}
	});
	
	// 2. 입고창고코드 모달
	$(document).on('click', '.stockMoveDetailTable .whCodeIn', function(){
		if($(this).parents('tr').data('status') === 'stMoveDetailAdd'){
			$('#whCodeModal').modal('show');
			selectedRow = $(this).closest('tr');  // 선택한 행을 저장
		}
	});
	
	// 3. 제품코드 클릭 시 행 기입
	$(document).on('click', '#itemCodeTable tbody tr', function(){
		let data = itemCodeTable.row(this).data();
		
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
	
				$('#itemCodeModal').modal('hide'); // 모달 닫기
			}
		});
	});
	
	// 3. 입고창고 클릭 시 행 기입
	$(document).on('click', '#whCodeInTable tbody tr', function(){
		let data = whCodeInTable.row(this).data();
		
		selectedRow.find('.whCodeIn').text(data.whCode);
		
		$('#whCodeModal').modal('hide'); // 모달 닫기
	});
	
});