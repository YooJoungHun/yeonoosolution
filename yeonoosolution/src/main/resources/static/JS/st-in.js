/**
 * 
 */
const contextPath = window.location.pathname.split('/')[0];
//let inCode, orderType, orderCode, inDate, customerCode, companyName, regUser, regDate, memo;
let previousRow, row, stIn, previousCheckBox;
$(()=> {
	$(document).on('click', '.stInRow', tableRowClick);
	$(document).on('dblclick', '.stInDetailRow', openModal);
	$(document).on('click', '.myModal', closeModal);
});

// 모달 창
function openModal(){
	$('.myModal').css('display', 'flex');
}
function closeModal(e){
	if($(e.target).is('.myModal')){
	$('.myModal').css('display', 'none');
	}
}

// 체크 이벤트
$(()=>{
	console.log($('.checkBox').is('checked'));
});


// 테이블 행 클릭 이벤트
function tableRowClick(e){
	stIn = $(e.target).closest('tr');
	
	
	

	
	let orderType = stIn.find('.orderType').val();
	if(orderType == '구매입고'){
		$('#orderType').val(1);
	}
	if(orderType == '기타입고'){
		$('#orderType').val(0);
	}




	row = $(e.target).closest('tr').next('tr').attr('class');
	checkBox = $(e.target).closest('tr').find('.checkBox');

	if(previousCheckBox != null && previousCheckBox != checkBox){
		//$(`.${previousRow}`).hide();
		previousCheckBox.prop('checked', false).trigger('change');
	}
	
	//$(`.${row}`).toggle();
	
	//if(!$(e.target).is('input[type="checkbox"]'))
	checkBox.prop('checked', (_, checked)=> {return !checked;}).trigger('change');

	if(previousCheckBox != null || previousCheckBox != checkBox){
		//previousRow = row;
		previousCheckBox = checkBox;
	}
	
	// if(stIn.find('.checkBox').is(':checked')){
	// 	$('#inCode').val(stIn.find('.inCode').val());
	// 	$('#orderCode').val(stIn.find('.orderCode').val());
	// 	$('#customerCode').val(stIn.find('.customerCode').val());
	// 	$('#inDate').val(inDate);
	// 	$('#regDate').val(regDate);
	// 	$('#regUser').val(stIn.find('.regUser').val());
	// 	$('#updateUser').val(stIn.find('.updateUser').val());
	// 	$('#updateDate').val(updateDate);
	// 	$('#inType').val(stIn.find('.inType').val());
	// 	$('#companyName').val(stIn.find('.companyName').val());
	// 	$('#memo').val(stIn.find('.memo').val());
	// 	$('#inCode, #orderCode, #orderType').attr('disabled', true);
	// }
}


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
		}
	});
});



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
    cancel: [`${contextPath}/product/sim/cancel`, 'patch']
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

