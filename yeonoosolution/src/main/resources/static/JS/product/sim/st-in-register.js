/**
 * 
 */

$(function() {
//	$(document).on('click', '#customerCode, #companyName', openCompanyList);
//	$(document).on('click', '.myModal', closeCompanyList);

	// Modal
	$('#modal-company').DataTable({
		"ajax": {
			"url": `${contextPath}/product/sim/findCompany`,
			"dataSrc": ""
		},
		"columns": [
			{"data": "companyCode"},
			{"data": "companyName"},
			{"data": "businessType"},
			{"data": "ownerName"},
			{"data": "tel"},
			{"data": "address"}
		],
		"pageLength": 5,
		"initComplete": function(settings, json) {
			$('#modal-company_wrapper').css({'max-width':'100%','overflow-x':'auto'})
	}});


	$('#modal-company').on('shown.bs.modal', function () {
        $.fn.dataTable.tables({ visible: true, api: true }).columns.adjust();
    });
});
// Company List Modal
function openCompanyList(){
	//$('.myModal').css('display', 'block');
	// 데이터 테이블
	// $('.myModal').DataTable();
	// $('.myModal').DataTable({"pageLength": 50});
}
// Modal outside click close
function closeCompanyList(e){
	if($(e.target).is('.myModal')){
	$('.myModal').css('display', 'none');
	}
}


//let inCode, orderType, orderCode, inDate, customerCode, companyName, regUser, regDate, memo;
// let previousRow, inRow, inDetailRow, previousCheckBox;
// $(()=> {
// 	$(document).on('click', '.stInRow', tableRowClick);
// 	$(document).on('click', '.stInDetailRow', detailTableRowClick);
// 	$(document).on('dblclick', '.stInDetailRow', openModal);
// 	$(document).on('click', '.myModal', closeModal);

// 	$(document).on('dblclick', '.stInRow', rowModify);
// 	$(document).on('focusout', 'tbody input[type="text"]', inputFocusout);
// 	$(document).on('keydown', 'tbody input', inputEnter);
// 	$(document).on('keyup', '#inCode', inCodeEvent);

// 	$(document).on('change', '.checkBox', checkBoxEvent);
// 	$(document).on('change', '.allCheck', checkBoxEvent);
// });

// // 입고 번호 입력
// function inCodeEvent(){
// 	let inCode = $('#inCode').val();
// 	$('.stInDetailRow').css('display', 'none');
// 	$(`.stInDetailRow input[value="${inCode}"]`).closest('tr').toggle();
// }


// // 포커스 아웃 이벤트
// function inputFocusout(e){
// 	$(this).prop('disabled', true);
// 	tableRowClick(e);
// }
// // 엔터 이벤트
// function inputEnter(e){
// 	if(e.keyCode === 13){
// 		$(this).prop('disabled', true);
// 		tableRowClick(e);
// 	}
// }

// // 더블 클릭시 행 수정
// function rowModify(e){
// 	let rowTd = $(e.target).closest('td');
// 	let tdInput = $(e.target).closest('td').find('input');

// 	console.log($(e.target).closest('tr').find('.inType').val());

// 	if($(e.target).closest('tr').find('.inType').val()!='확정'){
// 		if(!tdInput.is('disabled', 'disabled')){
// 			tdInput.prop('disabled', false);
// 			rowTd.css('background-color', 'white');
// 		}
// 	}
// }





// // 테이블 행 클릭 이벤트
// function tableRowClick(e){
// 	if(e.target.type != 'checkbox')
// 		$(e.target).closest('tr').find('.checkBox').prop('checked', (_, checked)=> {return !checked;}).trigger('change');
// 	if($('.stInRow input:checked').length == 0){
// 		resetEvent();
// 	}
		
// 	// inRow = $(e.target).closest('tr');

// 	// let rowId = inRow.attr('id');
// 	// let checkBox = inRow.find('.checkBox');

	
// 	//if ($(e.target).is(':checked'));
// 	//let inCode = inRow.find('.inCode').val();

	

// 	//$(e.target).closest('tr').find('.checkBox:checked').val();

// 	// if(previousRow != null && previousRow != inRow){
// 	// 	previousCheckBox.prop('checked', false);
// 	// }
// 	// if(rowId == previousRow){
// 	// 	checkBox.prop('checked', false).trigger('change');
// 	// 	previousRow = null;
// 	// }else{
// 	// 	checkBox.prop('checked', true).trigger('change');
// 	// 	previousRow = rowId;
// 	// 	previousCheckBox = checkBox;
// 	// }
		
		
// 		//$(`.stInDetailRow input[value="${$(this).attr('id')}"]`).closest('tr').toggle();
// 		//$(`.stInDetail input:checked`).closest('tr').toggle();
// 		//console.log($(`.stInRow input:checked`).closest('tr').attr('id'));
// 		//$('.stInRow input:checked').each(()=>{console.log($(this));});
// 		//rows.toggle();
// 	// let rows = [];
// 	// $("tr.stInRow input[type=checkbox]:checked").closest("tr.stInRow").each(function() {rows.push($(this).attr("id"));});
// 	// console.log(rows);

// 	// console.log($('.stInRow input:checked').closest('tr'));

// 	//let columns = document.querySelectorAll('.stInRow input:checked');
// 	//let columns1 = Array.from(document.querySelectorAll('input:checked')).map(input => input.closest('.stInRow'));
	

// 	//let rows = Array.from(columns).map(rows => rows.parentNode.id);
// 	//console.log(columns1);
// 	//$('.stInRow input:checked').closest('tr').each(()=>{rows.push(this);});
// 	//rows = $('.stInRow input:checked');

// 	//console.log(rows);
// 	// let a = $('.stInRow input:checked').closest('tr');
// 	// console.log(typeof a);
	
// 	// Array.forEach(function(a){
// 	// 	console.log(a);
// 	// });
// 	//console.log($('.stInRow input:checked').closest('tr').attr('id'));
// }

// // 상세 페이지 클릭 이벤트
// function detailTableRowClick(e){
// 	if(e.target.type != 'checkbox')
// 		$(e.target).closest('tr').find('.dtCheckBox').prop('checked', (_, checked)=> {return !checked;});
// }

// // 체크시 값 입력
// function checkBoxEvent(e){
// 	// 다른 row 클릭시 inCode에 맞는 Detail행 출력
// 	$('.stInDetailRow').css('display', 'none');
// 	$('.stInRow input:checked').closest('tr').each(function(){$(`.stInDetailRow input[value="${$(this).find('.inCode').val()}"]`).closest('tr').toggle();});
// 	let trRow = $(e.target).closest('tr');

// 	let inCode = trRow.find('.inCode').val();
// 	let orderCode = trRow.find('.orderCode').val();
// 	let customerCode = trRow.find('.customerCode').val();
// 	let inDate = trRow.find('.inDate').val();
// 	let regDate = trRow.find('.regDate').val();
// 	let regUser = trRow.find('.regUser').val();
// 	let updateUser = trRow.find('.updateUser').val();
// 	let updateDate = trRow.find('.updateDate').val();
// 	let inType = trRow.find('.inType').val();
// 	let companyName = trRow.find('.companyName').val();
// 	let memo = trRow.find('.memo').val();
// 	let orderType =trRow.find('.orderType').val();


// 	inDate = formatDateMinus(new Date(inDate));
// 	regDate = formatDateMinus(new Date(regDate));
// 	updateDate = formatDateMinus(new Date(updateDate));

// 	if ($(e.target).is(':checked')) {
// 		$('#inCode').val(inCode);
// 		$('#orderCode').val(orderCode);
// 		$('#customerCode').val(customerCode);
// 		$('#inDate').val(inDate);
// 		$('#regDate').val(regDate);
// 		$('#regUser').val(regUser);
// 		$('#updateUser').val(updateUser);
// 		$('#updateDate').val(updateDate);
// 		$('#inType').val(inType);
// 		$('#companyName').val(companyName);
// 		$('#memo').val(memo);
// 		if(orderType == '구매입고'){
// 			$('#orderType').val(1);
// 		}else if(orderType == '기타입고'){
// 			$('#orderType').val(0);
// 		}
// 	} else {
// 		//resetEvent();
// 	}
// }


// // 리셋 버튼
// function resetEvent(){
// 	$('#inCode').val('');
// 	$('#orderCode').val('');
// 	$('#customerCode').val('');
// 	$('#inDate').val('');
// 	$('#regDate').val('');
// 	$('#regUser').val('');
// 	$('#updateUser').val('');
// 	$('#updateDate').val('');
// 	$('#inType').val('');
// 	$('#companyName').val('');
// 	$('#memo').val('');
// 	$('.checkBox').prop('checked', false);
// 	$('.stInDetailRow').css('display', '');
// 	//Event.stopPropagation();
// }
// // 등록 버튼
// function regEvent(){
// 	console.log('d');
// }

// // 입고 유형
// function orderTypeEvent(select){
// 	let selectValue = $(select).val();

// 	if(selectValue == 1){
// 		$('#orderCode').attr('disabled', true);
// 	}else if(selectValue == 2){
// 		$('#orderCode').attr('disabled', true).removeAttr('placeholder').val('');
// 	}
// }



// // 파라미터 값
// function getParam() {
// 	const params = {
// 		inCode: $('#inCode').val(),
// 		orderCode: $('#orderCode').val(),
// 		orderType: $('#orderType').val(),
// 		customerCode: $('#customerCode').val(),
// 		inDate: $('#inDate').val(),
// 		regDate: $('#regDate').val(),
// 		regUser: $('#regUser').val(),
// 		updateUser: $('#updateUser').val(),
// 		updateDate: $('#updateDate').val(),
// 		inType: $('#inType').val(),
// 		companyName: $('#companyName').val(),
// 		memo: $('#memo').val()
// 	};
// 	return params;
// }


// function getParams() {
// 	if ($('.stInRow input:checked').length > 0) {
// 		const paramsList = [];
// 		$('.stInRow input:checked').each(function () {
// 			const params = {};
// 			const row = $(this).closest('tr');
// 			params.inCode = row.find('.inCode').val();
// 			params.orderCode = row.find('.orderCode').val();
// 			params.orderType = row.find('.orderType').val();
// 			params.customerCode = row.find('.customerCode').val();
// 			params.inDate = formatDateMinus(new Date(row.find('.inDate').val()));
// 			params.regDate = formatDateMinus(new Date(row.find('.regDate').val()));
// 			params.regUser = row.find('.regUser').val();
// 			params.updateUser = row.find('.updateUser').val();
// 			params.updateDate = formatDateMinus(new Date(row.find('.updateDate').val()));
// 			params.inType = row.find('.inType').val();
// 			params.companyName = row.find('.companyName').val();
// 			params.memo = row.find('.memo').val();
// 			paramsList.push(params);
// 	  	});
// 	  	return paramsList;
// 	}else{
// 		console.log('no value');
// 		return null;
// 	}
// }

// // // 파라미터 값
// // function getParams() {
// //     if ($('.stInRow input:checked').length > 0) {
// //         const params = {
// //             inCode: $('.inCode').val(),
// //             orderCode: $('.orderCode').val(),
// //             orderType: $('.orderType').val(),
// //             customerCode: $('.customerCode').val(),
// //             inDate: formatDateMinus(new Date($('.inDate').val())),
// //             regDate: formatDateMinus(new Date($('.regDate').val())),
// //             regUser: $('.regUser').val(),
// //             updateUser: $('.updateUser').val(),
// //             updateDate: formatDateMinus(new Date($('.updateDate').val())),
// //             inType: $('.inType').val(),
// //             companyName: $('.companyName').val(),
// //             memo: $('.memo').val()
// //         };
// //         return params;
// //     } else {
// //         console.log("값 없음");
// //         return null;
// //     }
// // }





// 	// // JSON 변환
// 	// let objJson = JSON.stringify(obj);
// 	// // 객체 생성
// 	// let data = new FormData();
// 	// data.append('params', objJson);


// // JavaScript로 form submit
// function findGet(url, method) {
// 	let form = document.createElement('form');
// 	form.setAttribute('method', method);
// 	form.setAttribute('action', url);
// 	params = getParam();

// 	for (let key in params) {
// 		let field = document.createElement('input');
// 		field.setAttribute('type', 'hidden');
// 		field.setAttribute('name', key);
// 		field.setAttribute('value', params[key]);
// 		form.appendChild(field);
// 		console.log(field)
// 	}
// 	document.body.appendChild(form);
// 	form.submit();
// }


// // 버튼 이벤트 맵
// // const btnMap = {
// //     find: [`${contextPath}/product/sim/find`, 'get'],
// //     save: [`${contextPath}/product/sim/save`, 'put'],
// //     delete: [`${contextPath}/product/sim/delete`, 'delete'],
// //     fix: [`${contextPath}/product/sim/fix`, 'patch'],
// //     cancel: [`${contextPath}/product/sim/cancel`, 'patch'],
// // 	reset: resetEvent()
// // };

// // Ajax 이벤트
// function btnAction(url, method) {
// 	let obj;
// 	if(method == 'get'){
// 		findGet(url, method);
// 		return;
// 	}else{
// 		obj = getParams();
// 	}
// 	if (!obj) return;
// 	console.log(obj);

// 	// AJAX
// 	let xhr = new XMLHttpRequest();
// 	xhr.open(method, url);
// 	xhr.setRequestHeader('Content-Type', 'application/json');
// 	xhr.send(JSON.stringify(obj));
// 	xhr.onload = function () {
// 		if (xhr.status === 200) {
// 			console.log(xhr.responseText);
// 		}
// 	}
// }

// const btnMap =  {
// 	find: { url: `${contextPath}/product/sim/find`, 		method: 'get' },
// 	update: { url: `${contextPath}/product/sim/ajax/save`, 	method: 'put' },
// 	delete: { url: `${contextPath}/product/sim/ajax/delete`,method: 'delete' },
// 	fix: { url: `${contextPath}/product/sim/ajax/fix`, 		method: 'patch' },
// 	cancel: { url: `${contextPath}/product/sim/ajax/cancel`,method: 'patch' },
// 	save: { url: `${contextPath}/product/sim/ajax/register`,method: 'post' },
// 	reset: { fn: resetEvent }
// 	//register: { fn: regEvent }
// };

// // 버튼 이벤트
// function btnEvent(event){
// 	const btn = btnMap[event];
// 	if(btn.url && btn.method)
// 		btnAction(btn.url,btn.method);
// 	else if(btn.fn)
// 		btn.fn();
// }
// // 	findGet(btn[0],btn[1]);
// // }


// // Date 포멧
// function formatDateMinus(date) {
// 	let year = date.getFullYear();
// 	let month = String(date.getMonth()+1).padStart(2,'0');
// 	let day = String(date.getDate()).padStart(2,'0');
// 	return (`${year}-${month}-${day}`);
// }

