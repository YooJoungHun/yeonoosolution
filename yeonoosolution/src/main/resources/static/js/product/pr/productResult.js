/** WO page scripts
 * 
 */
var tableData;
var subData;
var thirdData;

var searchWorkOrderCode = null;
 
// date 타입 input 값 초기화 버튼
$(document).on('click', '.reset-input', e => {
	let elem = $(e.target).closest('.reset-input');
	let box = $(elem).closest('.wo-header-item-group');
	$(box).find('input').val('');
});

// 체크박스 stopPropagation
$(document).on('click', 'tbody th input[type="checkbox"]', e => {
	e.stopPropagation();
});

// 전체 선택 및 선택 해제
$(document).on('change', 'thead input[type="checkbox"]', e => {
	let elem = $(e.target).closest('input[type="checkbox"]');
	let checked = $(elem).prop('checked');
	let tbody = $(elem).closest('table').find('tbody');
	$(tbody).find('input[type="checkbox"]').prop('checked', checked);
});

// ROW 선택 시 액션
$(document).on('change', 'table.data-table input[type="radio"]', e => {
	let count = $('table.data-table input[type="radio"]').closest(':checked').length;
	if (count < 1) {
		$('.wo-header-value').find('input[name="workOrderCode"]').val('')
					   .end().find('input[name="startDate"]').val('');
		return;
	}
	let tbody = $(e.target).closest('tbody');
	let dat = {
		code: $(tbody).find('th input[type="radio"]').closest(':checked').closest('tr').find('td[role="workOrderCode"]').text(),
		startDate: $(tbody).find('th input[type="radio"]').closest(':checked').closest('tr').find('input[name="startDate"]').val(),
		endDate: $(tbody).find('th input[type="radio"]').closest(':checked').closest('tr').find('input[name="endDate"]').val()
	};
	$('.wo-header-value').find('input[name="workOrderCode"]').val(dat.code)
				   .end().find('input[name="startDate"]').val(dat.startDate)
				   .end().find('input[name="endDate"]').val(dat.endDate);
	// Ajax 이용한 woDetail, bom 테이블 데이터 뽑아오기
	$.ajax({
		url: location.protocol + '//' + location.host + '/product/getWoDetails',
		type: 'post',
		data: JSON.stringify({ 'workOrderCode': dat.code }),
		dataType: 'json',
		contentType: 'application/json',
		success: data => {
			$('table.data-table[role="wo-detail"]').find('tbody').html(createTemplate(subtable, data.detail));
			subData = data.detail;
			$('table.data-table[role="wo-bom"]').find('tbody').html(createTemplate(thirdtable, data.bom));
			thirdData = data.bom;
			rowNumbering();
		}
	});
});

// 테이블 셀 값 변경 시 더블클릭으로
$(document).on('dblclick', 'table.data-table th, table.data-table td', e => {
	let elem = $(e.target).closest('table.data-table th, table.data-table td');
	if ($(elem).hasClass('readonly')) return;
	$(elem).children().css('pointer-events', 'auto');
	$(elem).find('select, input').focus();
});

// 테이블 셀 내부 선택 해제 시 원래대로 복귀
$(document).on('blur', 'table.data-table th *, table.data-table td *', e => {
	let elem = $(e.target).closest('table.data-table th, table.data-table td');
	$(elem).children().css('pointer-events', '');
});

// 테이블 행 넘버링
const rowNumbering = () => {
	let table = $('table.data-table').each((index, item) => {
		let tbody = $(item).find('tbody');
		$(tbody).find('th.numbering').each((ind, it) => {
			$(it).find('div').text(ind + 1);
		});
	});
};

/* Table Option
	header: 테이블명 & 'numbering', 'checkbox', 'radio' 시 예외적 생성
	name: input, select name 값
	width: colgroup col style width 값
	compType : null, 'editable', 'readonly', 'required'
	dataType : null, 'date', 'text', 'number', 'select', 'checkbox', 'radio', 'numbering'
	data : [데이터 값] or null => select인 경우 옵션으로...
		if select => [{value: 값, text: 지시글자, isSelect = 선택 여부(기본 false)}]
	styles : [{스타일 속성: 스타일 값}]
	compare : 데이터를 비교할 때 검사할 속성인지 여부
*/
var tableLayout = [
	{ header: 'numbering', name: null, width: '50px', compType: 'numbering', dataType: 'numbering', data: null, styles: [], compare: false },
	{ header: 'radio', name: 'woList', width: '50px', compType: 'radio', dataType: 'radio', data: null, styles: [], compare: false },
	{ header: '지시일', name: 'workOrderDate', width: '110px', compType: 'readonly', dataType: 'date', data: null, styles: [], compare: true },
	{ header: '지시번호', name: 'workOrderCode', width: '80px', compType: 'readonly', dataType: null, data: null, styles: [], compare: true },
	{ header: 'ITEM코드', name: 'item.itemCode', width: '155px', compType: 'readonly', dataType: 'text', data: null, styles: [], compare: true },
	{ header: '품명', name: 'item.itemName', width: '305px', compType: 'readonly', dataType: null, data: null, styles: [], compare: false },
	{ header: '지시수량', name: 'itemQuantity', width: '50px', compType: 'readonly', dataType: 'number', data: null, styles: [], compare: true },
	{ header: '시작시간', name: 'startDate', width: '110px', compType: 'editable', dataType: 'datetime-local', data: null, styles: [], compare: true },
	{ header: '종료시간', name: 'endDate', width: '110px', compType: 'editable', dataType: 'datetime-local', data: null, styles: [], compare: true },
	{ header: '양품실적', name: 'goodQuantity', width: '50px', compType: 'readonly', dataType: 'number', data: null, styles: [], compare: true },
	{ header: '불량실적', name: 'badQuantity', width: '50px', compType: 'readonly', dataType: 'number', data: null, styles: [], compare: true },
	{ header: '입고창고', name: 'wh.whName', width: '91px', compType: 'readonly', dataType: null, data: null, styles: [], compare: false }
];
var subtable = [
	{ header: 'numbering', name: null, width: '50px', compType: 'numbering', dataType: 'numbering', data: null, styles: [], compare: false },
	{ header: 'checkbox', name: null, width: '50px', compType: 'checkbox', dataType: 'checkbox', data: null, styles: [], compare: false },
	{ header: '작업순번', name: 'sorder', width: '60px', compType: 'readonly', dataType: 'number', data: null, styles: [], compare: false },
	{ header: '수량', name: 'workOrderQuantity', width: '100px', compType: 'readonly', dataType: 'number', data: null, styles: [], compare: false },
	{ header: '작업자', name: 'worker', width: '120px', compType: 'readonly', dataType: 'text', data: null, styles: [], compare: false },
	{ header: '불량여부', name: 'goodYn', width: '60px', compType: 'readonly', dataType: 'select', data: [{value: 'Y', text: 'Y'}, {value: 'N', text: 'N'}, {value: 'L', text: 'L'}], styles: [], compare: false }
];
var thirdtable = [
	{ header: 'numbering', name: null, width: '50px', compType: 'numbering', dataType: 'numbering', data: null, styles: [], compare: false },
	{ header: 'checkbox', name: null, width: '50px', compType: 'checkbox', dataType: 'checkbox', data: null, styles: [], compare: false },
	{ header: 'ITEM코드', name: 'lowItem.itemCode', width: '140px', compType: 'readonly', dataType: 'text', data: null, styles: [], compare: false },
	{ header: '품명', name: 'lowItem.itemName', width: '290px', compType: 'readonly', dataType: 'text', data: null, styles: [], compare: false },
	{ header: '자재창고', name: 'lowItem.wh.whName', width: '140px', compType: 'readonly', dataType: 'text', data: null, styles: [], compare: false },
	{ header: '수량', name: 'materialQuantity', width: '110px', compType: 'readonly', dataType: 'number', data: null, styles: [], compare: false }
];

// data 구조에 맞게 템플릿화해서 보여주는 함수
const createTemplate = (data, values = null) => {
	let htmlString = $('<tbody></tbody>');
	for (let val of (!values ? [null] : values)) {
		let row = $('<tr></tr>');
		for (let template of data) {
			let child = $(templateChild(template));
			if (val != null && $(child).is('[role]')) {
				let dest = $(child).attr('role');
				let output = val;
				let splited = dest.split('.');
				for (let k of splited) output = output[k];
				if ($(child).is(':parent')) {
					let target = $($(child).children()[0]);
					if ($(target).is('select')) {
						$(target).find('option[value="' + output + '"]').attr('selected', true);
					} else if ($(target).is('input[type="date"]') && !(!output)) {
						let date = new Date(output);
						let year = date.getFullYear();
						let month = date.getMonth() + 1;
						month = month < 10 ? '0' + month : month;
						let day = date.getDate();
						day = day < 10 ? '0' + day : day;
						$(target).attr('value', year + '-' + month + '-' + day);
					} else if ($(target).is('input[type="datetime-local"]') && !(!output)) {
						let date = new Date(output);
						let year = date.getFullYear();
						let month = date.getMonth() + 1;
						month = month < 10 ? '0' + month : month;
						let day = date.getDate();
						day = day < 10 ? '0' + day : day;
						let hour = date.getHours();
						hour = hour < 10 ? '0' + hour : hour;
						let minute = date.getMinutes();
						minute = minute < 10 ? '0' + minute : minute;
						$(target).attr('value', year + '-' + month + '-' + day + ' ' + hour + ':' + minute);
					} else {
						$(target).attr('value', output);
					}
				} else if (output != null) {
					$(child).text(output);
				}
			}
			row.append(child);
		}
		htmlString.append(row);
	}
	return htmlString.html();
};
const templateChild = (datum) => {
	let name = datum.name;
	let className = !datum.compType ? '' : ' class="' + datum.compType + '"';
	let roleName = !datum.name ? '' : ' role="' + datum.name + '"';
	const nameSetter = x => !x ? '' : ' name="' + x + '"';
	switch(datum.dataType) {
		case 'text': return '<td' + className + roleName + '><input' + nameSetter(name) + ' type="text"></td>';
		case 'number': return '<td' + className + roleName + '><input' + nameSetter(name) + ' type="number" min="1"></td>';
		case 'date': return '<td' + className + roleName + '><input' + nameSetter(name) + ' type="date"></td>';
		case 'datetime-local': return '<td' + className + roleName + '><input' + nameSetter(name) + ' type="datetime-local" pattern="yyyy-MM-dd HH:mm"></td>';
		case 'select':
			let selectString = '<td' + className + roleName + '><select' + nameSetter(name);
			let styleString = '';
			for (let style of datum.styles) {
				let keyNames = Object.keys(style);
				for (let key of keyNames) {
					styleString += key + ':' + style[key] + ';';
				}
			}
			if (!(!datum.styles) && datum.styles.length > 0) selectString += 'style="' + styleString + '"';
			selectString += '>';
			if (!(!datum.data) && datum.data.length > 0) {
				for (let d of datum.data) {
					let optionString = '<option value="' + d.value + '">' + d.text + '</option>';
					selectString += optionString;
				}
			}
			selectString += '</select></td>';
			return selectString;
		case 'numbering': return '<th' + className + roleName + '><div></div></th>';
		case 'checkbox': return '<th' + className + roleName + '><div><input type="checkbox"></div></th>';
		case 'radio': return '<th' + className + roleName + '><div><input type="radio" name="' + datum.name + '"></div></th>';
		case null: return '<td' + className + roleName + '></td>'
		default: return '';
	}
};

// 아이템 추가 버튼
$(document).on('click', 'button.add-item', e => {
	let table = $('table.data-table');
	let tbody = $(table).find('tbody');
	let elem = $(e.target).closest('button.add-item');
	let quantity = $(elem).closest('.wo-list-header-right').find('input.add-quantity').val();
	
	for (let i = 0; i < quantity; i++) $(tbody).prepend(createTemplate(tableLayout));
	rowNumbering();
});

// 아이템 삭제 버튼
$(document).on('click', 'button.remove-item', e => {
	let table = $('table.data-table');
	let tbody = $(table).find('tbody');
	let elem = $(e.target).closest('button.remove-item');
	$(tbody).find('th input[type="checkbox"]').closest(':checked').closest('tr').find('td[role="workStatus"]:empty').closest('tr').remove();
	let realDataList = $(tbody).find('th input[type="checkbox"]').closest(':checked').closest('tr').find('td[role="workStatus"]:not(:empty)').closest('tr');
	if (realDataList.length > 0) {
		let confirmed = confirm('삭제하시겠습니까?');
		if (confirmed) {
			let codes = $(realDataList).clone();
			let codeList = $(codes).find('td[role="workOrderCode"]').toArray().map(td => $(td).text());
			let dataObj = { workOrderCode: codeList };
			$.ajax({
				url: location.protocol + '//' + location.host + '/product/wo/removeWos',
				type: 'post',
				data: JSON.stringify(dataObj),
				dataType: 'json',
				contentType: 'application/json',
				success: data => {
					if (data.result != 0) {
						tableData = tableData.filter(row => $.inArray(row.workOrderCode, codeList) == -1);
						compareData = tableData;
						$('table.data-table').find('tbody').html(createTemplate(tableLayout, tableData));
						rowNumbering();
					}
				}
			});
		}
	}
	rowNumbering();
});

// 설정 버튼
$(document).on('click', 'button.setting', e => {
	let elem = $(e.target).closest('button.setting');
	
});

// 조회 버튼
$(document).on('click', 'button.select-item', e => {
	let items = $('div.wo-header-search').clone();
	let form = $('<form></form>');
	form.append(items);
	let dataObj = {};
	let formSerial = $(form).serializeArray();
	for (let data of formSerial) {
		if (!data.value) continue;
		dataObj[data.name] = data.value;
	}
	let sendData = JSON.stringify(dataObj);
	$.ajax({
		url: location.protocol + '//' + location.host + '/product/wo/searchFixed',
		type: 'post',
		data: sendData,
		dataType: 'json',
		contentType: 'application/json',
		success: data => {
			$('table.data-table[role="wo-list"]').find('tbody').html(createTemplate(tableLayout, data));
			tableData = data;
			rowNumbering();
			$('table.data-table[role="wo-detail"]').find('tbody').html(null);
			$('table.data-table[role="wo-bom"]').find('tbody').html(null);
		}
	});
});

// 초기화 버튼
$(document).on('click', 'button.reset-search', e => {
	let table = $('table.data-table');
	$(table).find('th input[type="radio"]').prop('checked', false);
	let box = $('.wo-header-value');
	$(box).find('input').val(null);
});

// 작업시작 버튼
$(document).on('click', 'button.start-item', e => {
	let table = $('table.data-table[role="wo-list"]');
	let startDate = $(table).find('input[type="radio"]:checked').closest('tr').find('input[name="startDate"]').val();
	let workOrderCode = $(table).find('input[type="radio"]:checked').closest('tr').find('td[role="workOrderCode"]').text();
	if (!startDate) {
		alert('작업 시작시간을 입력해주세요');
		return;
	} else if (!(!tableData.filter(data => data.workOrderCode == workOrderCode)[0].startDate)) {
		alert('작업이 이미 시작되었습니다');
		return;
	}
	let cf = confirm('작업 시작시간을 등록하시겠습니까?');
	if (!cf) return;
	$.ajax({
		url: location.protocol + '//' + location.host + '/product/setStartEndDate',
		type: 'post',
		data: JSON.stringify({ 'workOrderCode' : workOrderCode, 'date' : startDate, 'type' : 'start' }),
		dataType: 'json',
		contentType: 'application/json',
		success: data => {
			if (data.result < 1) return;
			alert('작업 시작시간이 등록되었습니다');
			$('button.select-item').click();
		}
	});
});

// 작업종료 버튼
$(document).on('click', 'button.end-item', e => {
	let table = $('table.data-table[role="wo-list"]');
	let startDate = $(table).find('input[type="radio"]:checked').closest('tr').find('input[name="startDate"]').val();
	let endDate = $(table).find('input[type="radio"]:checked').closest('tr').find('input[name="endDate"]').val();
	let workOrderCode = $(table).find('input[type="radio"]:checked').closest('tr').find('td[role="workOrderCode"]').text();
	if (!startDate) {
		alert('작업이 시작되지 않아 종료할 수 없습니다');
		return;
	} else if (!endDate) {
		alert('작업 종료시간을 입력해주세요');
		return;
	} else if (!(!tableData.filter(data => data.workOrderCode == workOrderCode)[0].endDate)) {
		alert('작업이 이미 종료되었습니다');
		return;
	}
	let cf = confirm('작업 종료시간을 등록하시겠습니까?');
	if (!cf) return;
	$.ajax({
		url: location.protocol + '//' + location.host + '/product/setStartEndDate',
		type: 'post',
		data: JSON.stringify({ 'workOrderCode' : workOrderCode, 'date' : endDate, 'type' : 'end' }),
		dataType: 'json',
		contentType: 'application/json',
		success: data => {
			if (data.result < 1) return;
			alert('작업 종료시간이 등록되었습니다');
			$('button.select-item').click();
		}
	});
});

// 양품/불량등록 버튼
$(document).on('click', 'button.good-item', e => {
	if (!(!(!$('table.data-table[role="wo-list"]').find('input[type="radio"]:checked').closest('tr').find('input[name="startDate"]').val()) && !$('table.data-table[role="wo-list"]').find('input[type="radio"]:checked').closest('tr').find('input[name="endDate"]').val())) {
		alert('작업지시 상태를 확인하세요');
		return;
	}
	// data-good Y or N 으로 값 넣기...
	let elem = $(e.target).closest('button.good-item');
	let table = $('table.data-table[role="wo-list"]');
	let startDate = $(table).find('input[type="radio"]:checked').closest('tr').find('input[name="startDate"]').val();
	let endDate = $(table).find('input[type="radio"]:checked').closest('tr').find('input[name="endDate"]').val();
	let workOrderCode = $(table).find('input[type="radio"]:checked').closest('tr').find('td[role="workOrderCode"]').text();
	// work variables
	let workerUid = $('div.wo-header-value').find('input[name="worker.memberUid"]').val();
	let workOrderQuantity = parseInt($('div.wo-header-value').find('input[name="workOrderQuantity"]').val());
	if (!workerUid || !workOrderQuantity) {
		if (!workerUid) alert('작업자코드를 입력해주세요');
		else alert('작업수량을 입력해주세요');
		return;
	}
	$.ajax({
		url: location.protocol + '//' + location.host + '/product/checkAndInsertWoDetail',
		type: 'post',
		data: JSON.stringify({
					'workOrderCode' : workOrderCode,
					'goodYn' : $(elem).attr('data-good'),
					'workOrderQuantity' : workOrderQuantity,
					'workerUid' : workerUid
			}),
		dataType: 'json',
		contentType: 'application/json',
		success: data => {
			if (data.result < 1) {
				if (data.result == -1) {
					alert('원자재 재고가 충분하지 않습니다');
				} else {
					alert('작업 진행 중 오류가 발생했습니다\n다음의 경우 에러가 발생합니다.\n1. 원자재가 2개 이상의 창고에 분산되어 있는 경우\n2. 원자재가 창고 재고 상세에 등록되어있지 않은 경우');
				}
				return;
			}
			let tbody = $(table.data-table[role="wo-list"]).closest('tbody');
			// Ajax 이용한 woDetail, bom 테이블 데이터 뽑아오기
			$.ajax({
				url: location.protocol + '//' + location.host + '/product/getWoDetails',
				type: 'post',
				data: JSON.stringify({ 'workOrderCode': workOrderCode }),
				dataType: 'json',
				contentType: 'application/json',
				success: datum => {
					$('table.data-table[role="wo-detail"]').find('tbody').html(createTemplate(subtable, datum.detail));
					subData = datum.detail;
					$('table.data-table[role="wo-bom"]').find('tbody').html(createTemplate(thirdtable, datum.bom));
					thirdData = datum.bom;
					rowNumbering();
				}
			});
		}
	});
});
$(document).on('click', 'button.bad-item', e => {
	// data-good Y or N 으로 값 넣기...
	let elem = $(e.target).closest('button.bad-item');
	let table = $('table.data-table[role="wo-list"]');
	let startDate = $(table).find('input[type="radio"]:checked').closest('tr').find('input[name="startDate"]').val();
	let endDate = $(table).find('input[type="radio"]:checked').closest('tr').find('input[name="endDate"]').val();
	let workOrderCode = $(table).find('input[type="radio"]:checked').closest('tr').find('td[role="workOrderCode"]').text();
	// work variables
	let workerUid = $('div.wo-header-value').find('input[name="worker.memberUid"]').val();
	let workOrderQuantity = parseInt($('div.wo-header-value').find('input[name="workOrderQuantity"]').val());
	if (!workerUid || !workOrderQuantity) {
		if (!workerUid) alert('작업자코드를 입력해주세요');
		else alert('작업수량을 입력해주세요');
		return;
	}
	$.ajax({
		url: location.protocol + '//' + location.host + '/product/checkAndInsertWoDetail',
		type: 'post',
		data: JSON.stringify({
					'workOrderCode' : workOrderCode,
					'goodYn' : $(elem).attr('data-good'),
					'workOrderQuantity' : workOrderQuantity,
					'workerUid' : workerUid
			}),
		dataType: 'json',
		contentType: 'application/json',
		success: data => {
			if (data.result < 1) {
				if (data.result == -1) {
					alert('원자재 재고가 충분하지 않습니다');
				} else {
					alert('작업 진행 중 오류가 발생했습니다');
				}
				return;
			}
			let tbody = $(table.data-table[role="wo-list"]).closest('tbody');
			// Ajax 이용한 woDetail, bom 테이블 데이터 뽑아오기
			$.ajax({
				url: location.protocol + '//' + location.host + '/product/getWoDetails',
				type: 'post',
				data: JSON.stringify({ 'workOrderCode': workOrderCode }),
				dataType: 'json',
				contentType: 'application/json',
				success: datum => {
					$('table.data-table[role="wo-detail"]').find('tbody').html(createTemplate(subtable, datum.detail));
					subData = datum.detail;
					$('table.data-table[role="wo-bom"]').find('tbody').html(createTemplate(thirdtable, datum.bom));
					thirdData = datum.bom;
					rowNumbering();
				}
			});
		}
	});
});
$(document).on('click', 'button.loss-item', e => {
	// data-good Y or N 으로 값 넣기...
	let elem = $(e.target).closest('button.loss-item');
	let table = $('table.data-table[role="wo-list"]');
	let startDate = $(table).find('input[type="radio"]:checked').closest('tr').find('input[name="startDate"]').val();
	let endDate = $(table).find('input[type="radio"]:checked').closest('tr').find('input[name="endDate"]').val();
	let workOrderCode = $(table).find('input[type="radio"]:checked').closest('tr').find('td[role="workOrderCode"]').text();
	// work variables
	let workerUid = $('div.wo-header-value').find('input[name="worker.memberUid"]').val();
	let workOrderQuantity = parseInt($('div.wo-header-value').find('input[name="workOrderQuantity"]').val());
	if (!workerUid || !workOrderQuantity) {
		if (!workerUid) alert('작업자코드를 입력해주세요');
		else alert('작업수량을 입력해주세요');
		return;
	}
	$.ajax({
		url: location.protocol + '//' + location.host + '/product/checkAndInsertWoDetail',
		type: 'post',
		data: JSON.stringify({
					'workOrderCode' : workOrderCode,
					'goodYn' : $(elem).attr('data-good'),
					'workOrderQuantity' : workOrderQuantity,
					'workerUid' : workerUid
			}),
		dataType: 'json',
		contentType: 'application/json',
		success: data => {
			if (data.result < 1) {
				if (data.result == -1) {
					alert('원자재 재고가 충분하지 않습니다');
				} else {
					alert('작업 진행 중 오류가 발생했습니다');
				}
				return;
			}
			let tbody = $(table.data-table[role="wo-list"]).closest('tbody');
			// Ajax 이용한 woDetail, bom 테이블 데이터 뽑아오기
			$.ajax({
				url: location.protocol + '//' + location.host + '/product/getWoDetails',
				type: 'post',
				data: JSON.stringify({ 'workOrderCode': workOrderCode }),
				dataType: 'json',
				contentType: 'application/json',
				success: datum => {
					$('table.data-table[role="wo-detail"]').find('tbody').html(createTemplate(subtable, datum.detail));
					subData = datum.detail;
					$('table.data-table[role="wo-bom"]').find('tbody').html(createTemplate(thirdtable, datum.bom));
					thirdData = datum.bom;
					rowNumbering();
				}
			});
		}
	});
});

// 실적취소 버튼
$(document).on('click', 'button.cancel-item', e => {
	if ($('table.data-table[role="wo-list"]').find('input[type="radio"]:checked').closest('tr').find('td[role="workOrderCode"]').toArray() == 0) {
		alert('선택된 작업지시 항목이 없습니다');
		return;
	}
	if (!(!(!$('table.data-table[role="wo-list"]').find('input[type="radio"]:checked').closest('tr').find('input[name="startDate"]').val()) && !$('table.data-table[role="wo-list"]').find('input[type="radio"]:checked').closest('tr').find('input[name="endDate"]').val())) {
		alert('이미 종료된 작업입니다');
		return;
	}
	let isConfirm = confirm('실적취소 하시겠습니까?');
	if (!isConfirm) return;
	let table = $('table.data-table[role="wo-detail"]');
	let tbody = $(table).find('tbody');
	let workOrderCode = $('table.data-table[role="wo-list"]').find('input[type="radio"]:checked').closest('tr').find('td[role="workOrderCode"]').text();
	let sorders = $(tbody).find('th.checkbox input[type="checkbox"]:checked').closest('tr').find('td[role="sorder"] > input[type="number"]').toArray().map(input => parseInt($(input).val()));
	if (sorders.length == 0) {
		alert('선택된 상세 항목이 없습니다');
		return;
	}
	let elem = $(e.target).closest('button.cancel-item');
	// AJAX 구문 들어갈 공간
	$.ajax({
		url: location.protocol + '//' + location.host + '/product/cancelResult',
		type: 'post',
		data: JSON.stringify({ workOrderCode: workOrderCode, sorders: sorders }),
		dataType: 'json',
		contentType: 'application/json',
		success: data => {
			//if (data.result < 1) return;
			// Ajax 이용한 woDetail, bom 테이블 데이터 뽑아오기
			$.ajax({
				url: location.protocol + '//' + location.host + '/product/getWoDetails',
				type: 'post',
				data: JSON.stringify({ 'workOrderCode': workOrderCode }),
				dataType: 'json',
				contentType: 'application/json',
				success: datum => {
					$('table.data-table[role="wo-detail"]').find('tbody').html(createTemplate(subtable, datum.detail));
					subData = datum.detail;
					$('table.data-table[role="wo-bom"]').find('tbody').html(createTemplate(thirdtable, datum.bom));
					thirdData = datum.bom;
					rowNumbering();
				}
			});
		}
	});
	//
});

// 데이터 ROW 선택
$(document).on('click', 'table.data-table tbody tr th:not([class="checkbox"]), table.data-table tbody tr td', e => {
	let elem = $(e.target).closest('table.data-table tbody tr');
	$(elem).closest('tbody').find('th input[type="checkbox"]').closest(':checked').not($(elem).find('input[type="checkbox"]')).prop('checked', false);
	$(elem).find('input[type="checkbox"]').prop('checked', true);
});
$(document).on('click', 'table.data-table[role="wo-list"] tbody tr th:not([class="radio"]), table.data-table[role="wo-list"] tbody tr td', e => {
	let elem = $(e.target).closest('table.data-table[role="wo-list"] tbody tr');
	$(elem).closest('tbody').find('th input[type="radio"]').closest(':checked').not($(elem).find('input[type="radio"]')).prop('checked', false);
	$(elem).find('input[type="radio"]').prop('checked', true);
	let tbody = $(e.target).closest('tbody');
	let data = {
		code: $(tbody).find('th input[type="radio"]').closest(':checked').closest('tr').find('td[role="workOrderCode"]').text(),
		startDate: $(tbody).find('th input[type="radio"]').closest(':checked').closest('tr').find('input[name="startDate"]').val(),
		endDate: $(tbody).find('th input[type="radio"]').closest(':checked').closest('tr').find('input[name="endDate"]').val()
	};
	$('.wo-header-value').find('input[name="workOrderCode"]').val(data.code)
				   .end().find('input[name="startDate"]').val(data.startDate)
				   .end().find('input[name="endDate"]').val(data.endDate);
	// Ajax 이용한 woDetail, bom 테이블 데이터 뽑아오기
	$.ajax({
		url: location.protocol + '//' + location.host + '/product/getWoDetails',
		type: 'post',
		data: JSON.stringify({ 'workOrderCode': data.code }),
		dataType: 'json',
		contentType: 'application/json',
		success: dat => {
			$('table.data-table[role="wo-detail"]').find('tbody').html(createTemplate(subtable, dat.detail));
			subData = dat.detail;
			$('table.data-table[role="wo-bom"]').find('tbody').html(createTemplate(thirdtable, dat.bom));
			thirdData = dat.bom;
			rowNumbering();
		}
	});
});

// memberUid 입력값에 따라 name 자동 입력
$(document).on('input', 'input[name="worker.memberUid"]', e => {
	let elem = $(e.target).closest('input[name="worker.memberUid"]');
	$.ajax({
		url: location.protocol + '//' + location.host + '/product/productResult/getMemberName',
		type: 'post',
		data: JSON.stringify({ memberUid: $(elem).val() }),
		dataType: 'json',
		contentType: 'application/json',
		success: data => {
			if (data != null) {
				$(elem).closest('div.wo-header-value').find('input[name="worker.memberName"]').val(data.memberName);
			} else {
				$(elem).closest('div.wo-header-value').find('input[name="worker.memberName"]').val('');
			}
		}
	});
});

// input blur when Press Return button(enter)
$(document).on('keydown', 'input', e => {
	let elem = $(e.target).closest('input');
	if (e.keyCode == 13) $(elem).blur();
});

// radio uncheck
$(document).on('mousedown', 'input[type="radio"]:checked', e => {
	e.preventDefault();
	let elem = $(e.target).closest('input[type="radio"]');
	$(elem).prop('checked', false);
});

// startDate remote setting value
$(document).on('change', 'div.wo-header-value input[name="startDate"]', e => {
	let elem = $(e.target).closest('input[name="startDate"]');
	let target = $('table.data-table[role="wo-list"]').find('th input[type="radio"]:checked');
	if ($(target).toArray().length == 0) return;
	let workOrderCode = $(target).closest('tr').find('td[role="workOrderCode"]').text();
	let targetData = tableData.filter(data => data.workOrderCode == workOrderCode)[0];
	if (!(!targetData.startDate)) return;
	$(target).closest('tr').find('input[name="startDate"]').val($(elem).val());
});
// endDate remote setting value
$(document).on('change', 'div.wo-header-value input[name="endDate"]', e => {
	let elem = $(e.target).closest('input[name="endDate"]');
	let target = $('table.data-table[role="wo-list"]').find('th input[type="radio"]:checked');
	if ($(target).toArray().length == 0) return;
	let workOrderCode = $(target).closest('tr').find('td[role="workOrderCode"]').text();
	let targetData = tableData.filter(data => data.workOrderCode == workOrderCode)[0];
	if (!(!targetData.endDate)) return;
	$(target).closest('tr').find('input[name="endDate"]').val($(elem).val());
});

$(() => {
	$('button.select-item').click();
});