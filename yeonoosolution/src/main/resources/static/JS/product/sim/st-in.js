/**
 * 
 */
const contextPath = window.location.pathname.split('/')[0];
//let inCode, orderType, orderCode, inDate, customerCode, companyName, regUser, regDate, memo;
let previousRow, inRow, inDetailRow, previousCheckBox;

// 버튼 클릭 이벤트 등록
const btnMap =  {
	find: { url: `${contextPath}/product/sim/btn/find`, 	method: 'GET' },
	update: { url: `${contextPath}/product/sim/btn/save`, 	method: 'PUT' },
	delete: { url: `${contextPath}/product/sim/btn/delete`,	method: 'DELETE' },
	fix: { url: `${contextPath}/product/sim/btn/fix`, 		method: 'PATCH' },
	cancel: { url: `${contextPath}/product/sim/btn/cancel`,	method: 'PATCH' },
	reset: { fn: resetEvent },
	register: { fn: regEvent },
	addDetail: { fn: addDetailEvent },
	removeDetail: { fn: removeDetailEvent },
	saveDetail: { fn: saveDetailEvent }
};
// 버튼 이벤트
function btnEvent(event){
	const btn = btnMap[event];
	if(btn.url && btn.method)
		findGet(btn.url,btn.method);
	else if(btn.fn)
		btn.fn();
}

// 이벤트 등록
$(()=> {
	$(document).on('click', '.stInRow', tableRowClick);
	$(document).on('click', '.stInDetailRow', detailTableRowClick);
	$(document).on('dblclick', '.stInDetailRow', openModal);
	$(document).on('click', '.myModal', closeModal);

	$(document).on('dblclick', '.stInRow', rowModify);
	$(document).on('focusout', 'content-header tbody input[type="text"]', inputFocusout);
	$(document).on('keydown', 'content-header tbody input', inputEnter);
	$(document).on('keyup', '#inCode', inCodeEvent);

	$(document).on('change', '.checkBox', checkBoxEvent);
	$(document).on('change', '.allCheck', allCheckEvent);
	
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

// ALL 체크 이벤트
function allCheckEvent(e){
	$(e.target).is(':checked') ? $('.stInDetailRow').show() : resetEvent();
}

// 테이블 행 클릭 이벤트
function tableRowClick(e){
	if(e.target.type != 'checkbox')
		$(e.target).closest('tr').find('.checkBox').prop('checked', (_, checked)=> {return !checked;}).trigger('change');
	if($('.stInRow input:checked').length == 0){
		resetEvent();
	}
		
	// inRow = $(e.target).closest('tr');

	// let rowId = inRow.attr('id');
	// let checkBox = inRow.find('.checkBox');

	
	//if ($(e.target).is(':checked'));
	//let inCode = inRow.find('.inCode').val();

	

	//$(e.target).closest('tr').find('.checkBox:checked').val();

	// if(previousRow != null && previousRow != inRow){
	// 	previousCheckBox.prop('checked', false);
	// }
	// if(rowId == previousRow){
	// 	checkBox.prop('checked', false).trigger('change');
	// 	previousRow = null;
	// }else{
	// 	checkBox.prop('checked', true).trigger('change');
	// 	previousRow = rowId;
	// 	previousCheckBox = checkBox;
	// }
		
		
		//$(`.stInDetailRow input[value="${$(this).attr('id')}"]`).closest('tr').toggle();
		//$(`.stInDetail input:checked`).closest('tr').toggle();
		//console.log($(`.stInRow input:checked`).closest('tr').attr('id'));
		//$('.stInRow input:checked').each(()=>{console.log($(this));});
		//rows.toggle();
	// let rows = [];
	// $("tr.stInRow input[type=checkbox]:checked").closest("tr.stInRow").each(function() {rows.push($(this).attr("id"));});
	// console.log(rows);

	// console.log($('.stInRow input:checked').closest('tr'));

	//let columns = document.querySelectorAll('.stInRow input:checked');
	//let columns1 = Array.from(document.querySelectorAll('input:checked')).map(input => input.closest('.stInRow'));
	

	//let rows = Array.from(columns).map(rows => rows.parentNode.id);
	//console.log(columns1);
	//$('.stInRow input:checked').closest('tr').each(()=>{rows.push(this);});
	//rows = $('.stInRow input:checked');

	//console.log(rows);
	// let a = $('.stInRow input:checked').closest('tr');
	// console.log(typeof a);
	
	// Array.forEach(function(a){
	// 	console.log(a);
	// });
	//console.log($('.stInRow input:checked').closest('tr').attr('id'));
}

// 상세 페이지 클릭 이벤트
function detailTableRowClick(e){
	if(e.target.type != 'checkbox')
		$(e.target).closest('tr').find('.sidCheckBox').prop('checked', (_, checked)=> {return !checked;});
}

// 체크시 값 입력
function checkBoxEvent(e){
	// 다른 row 클릭시 inCode에 맞는 Detail행 출력
	$('.stInDetailRow').css('display', 'none');
	$('.stInRow input:checked').closest('tr').each(function(){$(`.stInDetailRow input[value="${$(this).find('.inCode').val()}"]`).closest('tr').toggle();});
	let trRow = $(e.target).closest('tr');

	let inCode = trRow.find('.inCode').val();
	let orderCode = trRow.find('.orderCode').val();
	let customerCode = trRow.find('.customerCode').val();
	let inDate = trRow.find('.inDate').val();
	let regDate = trRow.find('.regDate').val();
	let regUser = trRow.find('.regUser').val();
	let updateUser = trRow.find('.updateUser').val();
	let updateDate = trRow.find('.updateDate').val();
	let inType = trRow.find('.inType').val();
	let companyName = trRow.find('.companyName').val();
	let memo = trRow.find('.memo').val();
	let orderType =trRow.find('.orderType').val();


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
		if(orderType == '구매입고'){
			$('#orderType').val(1);
		}else if(orderType == '기타입고'){
			$('#orderType').val(0);
		}
	} else {
		//resetEvent();
	}
}


// 리셋 버튼
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
	$('input:checked').prop('checked', false);
	$('.stInDetailRow').css('display', '');
	//Event.stopPropagation();
}


// 입고 유형
function orderTypeEvent(select){
	let selectValue = $(select).val();

	if(selectValue == 1){
		$('#orderCode').attr('disabled', true);
	}else if(selectValue == 2){
		$('#orderCode').attr('disabled', true).removeAttr('placeholder').val('');
	}
}



// 단일 파라미터 값
function getParam() {
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

// 다중 파라미터 값
function getParams() {
	if ($('.stInRow input:checked').length > 0) {
		const paramsList = [];
		$('.stInRow input:checked').each(function () {
			const params = {};
			const row = $(this).closest('tr');
			params.inCode = row.find('.inCode').val();
			params.orderCode = row.find('.orderCode').val();
			params.orderType = row.find('.orderType').val();
			params.customerCode = row.find('.customerCode').val();
			params.inDate = formatDateMinus(new Date(row.find('.inDate').val()));
			params.regDate = formatDateMinus(new Date(row.find('.regDate').val()));
			params.regUser = row.find('.regUser').val();
			params.updateUser = row.find('.updateUser').val();
			params.updateDate = formatDateMinus(new Date(row.find('.updateDate').val()));
			params.inType = row.find('.inType').val();
			params.companyName = row.find('.companyName').val();
			params.memo = row.find('.memo').val();
			paramsList.push(params);
	  	});
	  	return paramsList;
	}else{
		console.log('no value');
		return null;
	}
}











// 입고 등록 이벤트
function regEvent() {
	let obj = {
		'customerCode':$('#customerCode').val(),
		'inDate':$('#inDate').val(),
		'memo':$('#memo').val()
	};

	if(!obj.customerCode || !obj.inDate) return alert('값을 입력해주세요');

	$.ajax({
		url: `${contextPath}/product/sim/ajax/register`,
		type: 'post',
		dataType: 'text',
		contentType: 'application/json;',
		data: JSON.stringify(obj),
		success: (data)=>{
			alert(data);
			location.reload('div.stock-in-table');
		}
	});
}


// 데이터
function getDetailMap(index, code) {
  const detailMap = {
    sorder: `<td><input type="text" class="addSorder" name="sorder" value=${index}></td>`,
    dtCheckBox: `<td><input type="checkbox" class="addCheckBox"></td>`,
    inCode: `<td><input type="text" class="inCode" name="inCode" readonly="readonly" value=${code}></td>`,
    whCode: `<td><input type="text" class="addWhCode" name="whCode"></td>`,
    itemCode: `<td><input type="text" class="addItemCode" name="itemCode"></td>`,
    inQuantity: `<td><input type="number" class="addInQuantity" name="inQuantity" min="1"></td>`,
    inPrice: `<td><input type="text" class="addInPrice" name="inPrice"></td>`,
    whName: `<td><input type="text" class="addWhName" name="whName"></td>`,
    memo: `<td><input type="text" class="addMemo" name="memo"></td>`
  };
  return detailMap;
}

let rowIndex = 1;
let detailData = {};

// 추가
function addDetailEvent() {
  let checkInCode = $('.table-in input:checked');
  if (checkInCode.length !== 1) return alert('1개만 선택해 주세요');
  let code = checkInCode.closest('tr').find('.inCode').val();
  let detailMap = getDetailMap(rowIndex, code);

  // sorder 값 설정
  let sorder = getNextSorder(code);
  detailMap['sorder'] = `<td><input type="text" class="addSorder" name="sorder" value="${sorder}"></td>`;

  // 객체 저장
  detailData[rowIndex] = detailMap;
  rowIndex++;

  // 인덱스 업데이트
  updateIndex();
  // 객체 업데이트
  updateObject();
}

// 제거
function removeDetailEvent() {
  let checkRows = $('.table-in-detail tbody input:checked').closest('tr');
  if (checkRows.length === 0) return;

  checkRows.each(function () {
    let removeIndex = $(this).attr('id');

    // status 확인
    let status = getRowStatus(removeIndex);
    if (status === 'add') {
      delete detailData[removeIndex];
      $(this).remove();
    } else {
      $(this).attr('data-status', 'delete');
      $(this).css('display', 'none');
    }
  });

  updateIndex();
  updateObject();
}

// 행 상태 설정
function setRowStatus(index, status) {
  let row = $(`.table-in-detail tbody tr[id=${index}]`);
  row.attr('data-status', status);
}

// 행 상태 리턴
function getRowStatus(index) {
  let row = $(`.table-in-detail tbody tr[id=${index}]`);
  return row.attr('data-status');
}

// 객체 업데이트
function updateObject() {
  // 기존 행의 인덱스
  let oldIndex = $(".table-in-detail tbody tr").map(function () {
    return $(this).attr('id');
  }).get();

  // 객체 저장
  for (let index in detailData) {
    let data = detailData[index];

    // 존재하는 행은 업데이트
    if (oldIndex.includes(index)) {
      for (let key in data) {
        $(`#${index} .${key}`).html(data[key]);
      }
    } else {
      // 존재하지 않는 행이면 새로 추가
      let addTr = `<tr class="addInDetail" id=${index} data-status="add">`;
      for (let key in data) {
        addTr += data[key];
      }
      addTr += `</tr>`;
      $('.table-in-detail tbody').append(addTr);
    }
  }
}

// 인덱스 업데이트
function updateIndex() {
  let checkInCode = $('.table-in input:checked').closest('tr').find('.inCode').val();
  let currentIndex = $('.table-in-detail tbody tr .inCode').filter(function () {
    return $(this).val() === checkInCode;
  }).length + 1;

  for (let index in detailData) {
    let detailMap = detailData[index];

    // sorder 값 설정
    if (!detailMap.hasOwnProperty('sorder')) {
      detailMap['sorder'] = `<td><input type="text" class="addSorder" name="sorder" disabled="disabled" value=${currentIndex}></td>`;
      currentIndex++;
    }
  }
}

// inCode에 해당하는 sorder 값을 가져옴
function getNextSorder(inCode) {
  let sorder = 1;
  let sorderValues = Object.values(detailData).map(data => parseInt($(data['sorder']).find('input').val()));

  while (sorderValues.includes(sorder)) {
    sorder++;
  }

  return sorder;
}









// // sorder 추출 함수
// function getMaxSorder() {
//   return Math.max(...Object.values(detailData).map(detail => detail.sorder));
// }

// // 추가
// function addDetailEvent() {
//   let checkInCode = $('.table-in input:checked');
//   if(checkInCode.length != 1) return alert('1개만 선택해 주세요');
  
//   let inCode = checkInCode.closest('tr').find('.inCode').val();
//   let sorder = getMaxSorder() + 1;

//   // 객체 저장
//   detailData[sorder] = { inCode, sorder };  // 기타 필요한 필드를 여기에 추가하세요.

//   // 객체 업데이트
//   updateObject();
// }

// // 추가
// function addDetailEvent() {
//   let checkInCode = $('.table-in input:checked');
//   if (checkInCode.length !== 1) return alert('1개만 선택해 주세요');
//   let code = checkInCode.closest('tr').find('.inCode').val();
//   let detailMap = getDetailMap(rowIndex, code);

//   // sorder 값 설정
//   let sorder = getNextSorder(code);
//   detailMap['sorder'] = `<td><input type="text" class="addSorder" name="sorder" value="${sorder}"></td>`;

//   // 객체 저장
//   detailData[rowIndex] = detailMap;
//   rowIndex++;

//   // 인덱스 업데이트
//   updateIndex();
//   // 객체 업데이트
//   updateObject();
// }

// // 제거
// function removeDetailEvent() {
// 	let checkRows = $('.table-in-detail tbody input:checked').closest('tr');
// 	if (checkRows.length == 0) return;
  
// 	checkRows.each(function () {
// 		let removeIndex = $(this).attr('id');
  
// 		// status 확인
// 		let status = getRowStatus(removeIndex);
// 		if (status == 'add') {
// 			delete detailData[removeIndex];
// 			$(this).remove();
// 		}else {
// 			$(this).attr('data-status', 'delete');
// 			$(this).css('display', 'none');
// 		}
// 	});
  
// 	updateIndex();
// 	updateObject();
// }

// // 행 상태 설정
// function setRowStatus(index, status) {
// 	let row = $(`.table-in-detail tbody tr[id=${index}]`);
// 	row.attr('data-status', status);
// }
// // 행 상태 리턴
// function getRowStatus(index) {
// 	let row = $(`.table-in-detail tbody tr[id=${index}]`);
// 	return row.attr('data-status');
// }

// // 객체 업데이트
// function updateObject() {
// 	// 기존 행의 인덱스
// 	let oldIndex = $(".table-in-detail tbody tr").map(function() { return $(this).attr('id'); }).get();
	
// 	// 객체 저장
// 	for (let index in detailData) {
// 			let data = detailData[index];
			
// 			// 존재하는 행은 업데이트
// 			if(oldIndex.includes(index)) {
// 					for(let key in data) {
// 							$(`#${index} .${key}`).html(data[key]);
// 					}
// 			} else {
// 		// 존재하지 않는 행이면 새로 추가
// 					let addTr = `<tr class="addInDetail" id=${index} data-status="add">`;
// 					for (let key in data) {
// 							addTr += data[key];
// 					}
// 					addTr += `</tr>`;
// 					$('.table-in-detail tbody').append(addTr);
// 			}
// 	}
// }

// // 인덱스 업데이트
// function updateIndex() {
// 	let checkInCode = $('.table-in input:checked').closest('tr').find('.inCode').val();
// 	let currentIndex = $('.table-in-detail tbody tr .inCode').filter(function() {return $(this).val() === checkInCode;}).length+1;
// 	console.log(currentIndex);

// 	for (let index in detailData) {
// 		let detailMap = detailData[index];
// 		detailMap['sorder'] = `<td><input type="text" class="addSorder" name="sorder" disabled="disabled" value=${currentIndex}></td>`;
// 	}
// }

// 저장
// function saveDetailEvent() {
// 	let obj = [];
// 	let tbody = $('.table-in-detail tbody');

// 	tbody.find('tr').each(function () {
// 		let detailObj = {};
// 		$(this).find('input').each(function () {
// 			let key = $(this).attr('name');
// 			let value = $(this).val();
// 			detailObj[key] = value;
// 		});
// 		obj.push(detailObj);
// 	});
// 	console.log(obj);
// 	// for (let index in detailData) {
// 	// 	let detailMap = detailData[index];
// 	// 	let detailObj = {};

// 	// 	for (let key in detailMap) {
// 	// 		let value = $(`#${index} .${key}`).text();
// 	// 		detailObj[key] = value;
// 	// 	}
// 	// 	obj.push(detailObj);
// 	// }
// 	// console.log(obj);

// 	// AJAX
// 	let xhr = new XMLHttpRequest();
// 	xhr.open('post', `${contextPath}/product/sim/ajax/save`);
// 	xhr.setRequestHeader('Content-Type', 'application/json');
// 	xhr.send(JSON.stringify(obj));
// 	xhr.onload = function () {
// 		if (xhr.status === 200) {
// 			alert(xhr.responseText);
// 			location.reload('div.stock-in-table');
// 		}
// 	}
// }

// 저장
// function saveDetailEvent() {
// 	$('.table-in-detail input').prop('disabled', false).prop('readonly', false);


// 	let checkInCode = $('.table-in input:checked');
// 	if(checkInCode.length != 1) return alert('1개만 선택해 주세요');
// 	let inCode = checkInCode.closest('tr').find('.inCode').val();

	
	
// 	$('.table-in-detail tbody tr').each(function() {
// 		if($(this).find('.inCode').val() == inCode){
// 			let dataStatus = $(this).attr('data-status');
// 			if(dataStatus == 'add'){
// 				console.log($(this).find('input'));
// 				$.ajax({
// 					url: `${contextPath}/product/sim/ajax/save`,
// 					type: 'post',
// 					data: $(this).find('input').serialize(),
// 					contentType: 'application/json;',
// 					success: function(data) {
// 						console.log(data);
// 					}
// 				});
// 			}else if(dataStatus == 'delete'){
// 				console.log($(this).find('input'));
// 				$.ajax({
// 					url: `${contextPath}/product/sim/ajax/delete`,
// 					type: 'post',
// 					data: $(this).find('input').serialize(),
// 					contentType: 'application/json;',
// 					success: function(data) {
// 						console.log(data);
// 					}
// 				});
// 			}
// 		}
// 	});

// 	// 이어서 하기

// 	let obj = [];
// 	let tbody = $('.table-in-detail tbody');

// 	tbody.find('tr').each(function () {
// 		let detailObj = {};
// 		$(this).find('input').each(function () {
// 			let key = $(this).attr('name');
// 			let value = $(this).val();
// 			detailObj[key] = value;
// 		});
// 		obj.push(detailObj);
// 	});
// 	console.log(obj);


// }






// 상세 페이지 저장
function saveDetailEvent() {
  $('.table-in-detail input').prop('disabled', false).prop('readonly', false);

  let checkInCode = $('.table-in input:checked');
  if (checkInCode.length != 1) return alert('1개만 선택해 주세요');
  let inCode = checkInCode.closest('tr').find('.inCode').val();

	let addData = [];
	let deleteData = [];

	// 추가, 삭제 분리
  $('.table-in-detail tbody tr').each(function() {
    if($(this).find('.inCode').val() == inCode) {
      let dataStatus = $(this).attr('data-status');
      if(dataStatus == 'add' || dataStatus == 'delete') {
        let inputs = $(this).find('input');
        let dataToSend = {};

        inputs.each(function() {
          dataToSend[this.name] = $(this).val();
        });

				if(dataStatus == 'add') {
					addData.push(dataToSend);
				}else if(dataStatus == 'delete') {
					deleteData.push(dataToSend);
				}
      }
    }
  });
	// 추가 Ajax
	if(addData.length > 0) {
		$.ajax({
			url: `${contextPath}/product/sim/ajax/add`,
			type: 'post',
			data: JSON.stringify(addData),
			contentType: 'application/json; charset=utf-8',
			success: function(data) {
				console.log(data);
			}
		});
	}
	// 삭제 Ajax
	if(deleteData.length > 0) {
		$.ajax({
			url: `${contextPath}/product/sim/ajax/delete`,
			type: 'post',
			data: JSON.stringify(deleteData),
			contentType: 'application/json; charset=utf-8',
			success: function(data) {
				alert(data);
			}
		});
	}
}

// 버튼 이벤트
function findGet(url, method) {
	let form = document.createElement('form');
	form.setAttribute('method', method);
	form.setAttribute('action', url);
	params = getParam();


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

// Date 포멧
function formatDateMinus(date) {
	let year = date.getFullYear();
	let month = String(date.getMonth()+1).padStart(2,'0');
	let day = String(date.getDate()).padStart(2,'0');
	return (`${year}-${month}-${day}`);
}

