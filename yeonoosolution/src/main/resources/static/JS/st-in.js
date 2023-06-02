/**
 * 
 */
const contextPath = window.location.pathname.split('/')[0];
//let inCode, orderType, orderCode, inDate, customerCode, companyName, regUser, regDate, memo;
let previousRow, inRow, inDetailRow, previousCheckBox;
$(()=> {
	$(document).on('click', '.stInRow', tableRowClick);
	$(document).on('click', '.stInDetailRow', detailTableRowClick);
	$(document).on('dblclick', '.stInDetailRow', openModal);
	$(document).on('click', '.myModal', closeModal);

	$(document).on('dblclick', '.stInRow', rowModify);
	$(document).on('focusout', 'tbody input[type="text"]', inputFocusout);
	$(document).on('keydown', 'tbody input', inputEnter);
	$(document).on('keyup', '#inCode', inCodeEvent);
});

// 입고 번호 입력
function inCodeEvent(){
	let inCode = $('#inCode').val();
	$('.stInDetailRow').css('display', 'none');
	$(`.stInDetailRow input[value="${inCode}"]`).closest('tr').toggle();
}


// 포커스 아웃 이벤트
function inputFocusout(e){
	$(this).prop('disabled', true);
	tableRowClick(e);
}
// 엔터 이벤트
function inputEnter(e){
	if(e.keyCode === 13){
		$(this).prop('disabled', true);
		tableRowClick(e);
	}
}

// 더블 클릭시 행 수정
function rowModify(e){
	let rowTd = $(e.target).closest('td');
	let tdInput = $(e.target).closest('td').find('input');

	console.log($(e.target).closest('tr').find('.inType').val());

	if($(e.target).closest('tr').find('.inType').val()!='확정'){
		if(!tdInput.is('disabled', 'disabled')){
			tdInput.prop('disabled', false);
			rowTd.css('background-color', 'white');
		}
	}
}

// 모달 창
function openModal(){
	$('.myModal').css('display', 'flex');
}
function closeModal(e){
	if($(e.target).is('.myModal')){
	$('.myModal').css('display', 'none');
	}
}



// 테이블 행 클릭 이벤트
function tableRowClick(e){
	inRow = $(e.target).closest('tr');
	checkBox = $(e.target).closest('tr').find('.checkBox');

	if(previousRow != null && previousRow != inRow){
		previousCheckBox.prop('checked', false).trigger('change');
	}
	if($(inRow).attr('id') == $(previousRow).attr('id')){
		checkBox.prop('checked', false).trigger('change');
		previousRow = null;
	}else{
		checkBox.prop('checked', true).trigger('change');
		previousRow = inRow;
		previousCheckBox = checkBox;
	}

	//checkBox.prop('checked', (_, checked)=> {return !checked;}).trigger('change');
	// if(previousCheckBox == checkBox){
	// 	checkBox.prop('checked', false).trigger('change');
	// 	//previousCheckBox = null;
	// }else if(previousCheckBox != null){
	// 	//previousCheckBox.prop('checked', false).trigger('change');
	// }

	let orderType = inRow.find('.orderType').val();
	if(orderType == '구매입고'){
		$('#orderType').val(1);
	}
	if(orderType == '기타입고'){
		$('#orderType').val(0);
	}
	// inCode에 맞는 행 보여주기
	let inCode = $(e.target).closest('tr').find('.inCode').val();
	$('.stInDetailRow').css('display', 'none');
	$(`.stInDetailRow input[value="${inCode}"]`).closest('tr').toggle();
}

// 상세 페이지 클릭 이벤트
function detailTableRowClick(e){
	inDetailRow = $(e.target).closest('tr');
	inDetailRow.find('.dtCheckBox').prop('checked', (_, checked)=> {return !checked;});
}

// 체크시 값 입력
$(()=>{
	$('.checkBox').on('change', (e)=>{
		let inCode = $(e.target).closest('tr').find('.inCode').val();
		let orderCode = $(e.target).closest('tr').find('.orderCode').val();
		let customerCode = $(e.target).closest('tr').find('.customerCode').val();
		let inDate = $(e.target).closest('tr').find('.inDate').val();
		let regDate = $(e.target).closest('tr').find('.regDate').val();
		let regUser = $(e.target).closest('tr').find('.regUser').val();
		let updateUser = $(e.target).closest('tr').find('.updateUser').val();
		let updateDate = $(e.target).closest('tr').find('.updateDate').val();
		let inType = $(e.target).closest('tr').find('.inType').val();
		let companyName = $(e.target).closest('tr').find('.companyName').val();
		let memo = $(e.target).closest('tr').find('.memo').val();

		inDate = formatDateMinus(new Date(inDate));
		regDate = formatDateMinus(new Date(regDate));
		updateDate = formatDateMinus(new Date(updateDate));
	
		if ($(e.target).is(':checked')) {
			$('#inCode').val(inCode);
			$('#orderCode').val(orderCode);
			$('#customerCode').val(customerCode);
			$('#inDate').val(inDate);
			$('#regDate').val(regDate);
			$('#regUser').val(regUser);
			$('#updateUser').val(updateUser);
			$('#updateDate').val(updateDate);
			$('#inType').val(inType);
			$('#companyName').val(companyName);
			$('#memo').val(memo);
		} else {
			resetEvent();
		}
	});
});


// 리셋
function resetEvent(){
	$('#inCode').val('');
	$('#orderCode').val('');
	$('#customerCode').val('');
	$('#inDate').val('');
	$('#regDate').val('');
	$('#regUser').val('');
	$('#updateUser').val('');
	$('#updateDate').val('');
	$('#inType').val('');
	$('#companyName').val('');
	$('#memo').val('');
	$('.checkBox').prop('checked', false);
	$('.stInDetailRow').css('display', '');
	Event.stopPropagation();
}


// 입고 유형
function orderTypeEvent(select){
	let selectValue = $(select).val();

	if(selectValue == 1){
		$('#orderCode').attr('disabled', true);
	}else if(selectValue == 0){
		$('#orderCode').attr('disabled', true).removeAttr('placeholder').val('');
	}
}



// 파라미터 값
function getParams() {
	const params = {
		inCode: $('#inCode').val(),
		orderCode: $('#orderCode').val(),
		orderType: $('#orderType').val(),
		customerCode: $('#customerCode').val(),
		inDate: $('#inDate').val(),
		regDate: $('#regDate').val(),
		regUser: $('#regUser').val(),
		updateUser: $('#updateUser').val(),
		updateDate: $('#updateDate').val(),
		inType: $('#inType').val(),
		companyName: $('#companyName').val(),
		memo: $('#memo').val()
	};
	return params;
}


// url 파라미터
function findGet(url, method) {
	let form = document.createElement('form');
	form.setAttribute('method', method);
	form.setAttribute('action', url);
	params = getParams();

	console.log(params['regDate']);

	for (let key in params) {
		let field = document.createElement('input');
		field.setAttribute('type', 'hidden');
		field.setAttribute('name', key);
		field.setAttribute('value', params[key]);
		form.appendChild(field);
		console.log(field)
	}
	document.body.appendChild(form);
	form.submit();
}


// 버튼 이벤트 맵
const btnMap = {
    find: [`${contextPath}/product/sim/find`, 'get'],
    save: [`${contextPath}/product/sim/save`, 'put'],
    delete: [`${contextPath}/product/sim/delete`, 'delete'],
    fix: [`${contextPath}/product/sim/fix`, 'patch'],
    cancel: [`${contextPath}/product/sim/cancel`, 'patch'],
		//reset: resetEvent()
};

// 버튼 이벤트
function btnEvent(event){
	const btn = btnMap[event];
	findGet(btn[0],btn[1]);
}


// Date 포멧
function formatDateMinus(date) {
	let year = date.getFullYear();
	let month = String(date.getMonth()+1).padStart(2,'0');
	let day = String(date.getDate()).padStart(2,'0');
	return (`${year}-${month}-${day}`);
}

