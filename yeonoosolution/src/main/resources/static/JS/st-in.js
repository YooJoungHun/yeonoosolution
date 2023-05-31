/**
 * 
 */
const contextPath = window.location.pathname.split('/')[0];
//let inCode, orderType, orderCode, inDate, customerCode, companyName, regUser, regDate, memo;
let previousRow, row, stIn;
$(()=> {
	$(document).on('click', '.stInRow', tableRowClick);
	$(document).on('dblclick', '.stInDetailRow', openModal);
});

// 모달 창
function openModal(e){
	$('.myModal').css('display', 'flex');
}

// 테이블 행 클릭 이벤트
function tableRowClick(e){

	stIn = $(e.target).closest('tr');
	let inDate = formatDateMinus(new Date(stIn.find('.inDate').text()));
	let regDate = formatDateMinus(new Date(stIn.find('.regDate').text()));
	
	let orderType = stIn.find('.orderType').text();
	if(orderType == '구매입고'){
		$('#orderType').val(1);
	}
	if(orderType == '기타입고'){
		$('#orderType').val(0);
	}

	$('#inType').val(stIn.find('.inType').text());
	$('#inCode').val(stIn.find('.inCode').text());
	$('#inType').val(stIn.find('.inType').text());
	$('#orderCode').val(stIn.find('.orderCode').text());
	$('#inDate').val(inDate);
	$('#customerCode').val(stIn.find('.customerCode').text());
	$('#companyName').val(stIn.find('.companyName').text());
	$('#regUser').val(stIn.find('.regUser').text());
	$('#regDate').val(regDate);
	$('#memo').val(stIn.find('.memo').text());
	
	$('#inCode, #orderCode, #orderType').attr('disabled', true);
	
	
	row = $(e.target).closest('tr').next('tr').attr('class');
	checkBox = $(e.target).closest('tr').find('.checkBox');

	if(previousRow != null && previousRow != row){
		$(`.${previousRow}`).hide();
		previousCheckBox.prop('checked', false);
	}

	$(`.${row}`).toggle();
	checkBox.prop('checked', (_, checked)=> {return !checked;});
	
	
	if(previousRow != null || previousRow != row){
		previousRow = row;
		previousCheckBox = checkBox;
	}
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
		orderType: $('#orderType').val(),
		orderCode: $('#orderCode').val(),
		inDate: $('#inDate').val(),
		customerCode: $('#customerCode').val(),
		companyName: $('#companyName').val(),
		regUser: $('#regUser').val(),
		regDate: $('#regDate').val(),
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
    find: [`${contextPath}/find`, 'get'],
    save: [`${contextPath}/save`, 'put'],
    delete: [`${contextPath}/delete`, 'delete'],
    fix: [`${contextPath}/fix`, 'patch'],
    cancel: [`${contextPath}/cancel`, 'patch']
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

$(()=>{
	
});