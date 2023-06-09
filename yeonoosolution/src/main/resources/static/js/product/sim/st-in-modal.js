/**
 * 
 */

$(()=>{
	// CompanyModal 생성
	$('#modal-company').DataTable({
		// 데이터 가져오기
		'ajax': {
			'url': `${contextPath}/product/sim/modal/findCompany`,
			'dataSrc': ''
		},
		// 사용할 컬럼 저장
		'columns': [
			{'data': 'companyCode'},
			{'data': 'companyName'},
			{'data': 'businessType'},
			{'data': 'ownerName'},
			{'data': 'tel'},
			{'data': 'address'}
		],
		// 컬럼명 정의
		'columnDefs': [
			{'className': 'companyCode', 'targets': 0 },
			{'className': 'companyName', 'targets': 1 },
			{'className': 'businessType', 'targets': 2 },
			{'className': 'ownerName', 'targets': 3 },
			{'className': 'tel', 'targets': 4 }
		],
		// 페이징
		'pageLength': 5,
		// 크기 조정
		'initComplete': function(settings, json) {
			$('#modal-company_wrapper').css({'max-width':'100%','overflow-x':'auto'})
	}});

	// whModal 생성
	$('#modal-wh').DataTable({
		'ajax': {
			'url': `${contextPath}/product/sim/modal/findWh`,
			'dataSrc': ''
		},
		'columns': [
			{'data': 'whCode'},
			{'data': 'companyCode'},
			{'data': 'whName'},
			{'data': 'useYn'},
			{'data': 'memo'}
		],
		'columnDefs': [
			{'className': 'whCode', 'targets': 0 },
			{'className': 'companyCode', 'targets': 1 },
			{'className': 'whName', 'targets': 2 },
			{'className': 'useYn', 'targets': 3 },
			{'className': 'memo', 'targets': 4 }
		],
		'pageLength': 5,
		'initComplete': (setting, json)=>{$('#modal-wh_wrapper').css({'max-width':'100%','overflow-x':'auto'})}
	});


	// itemModal 생성
	$('#modal-item').DataTable({
		'ajax': {
			'url': `${contextPath}/product/sim/modal/findItem`,
			'dataSrc': ''
		},
		'columns': [
			{'data': 'itemCode'},
			{'data': 'whCode'},
			{'data': 'companyCode'},
			{'data': 'itemName'},
			{'data': 'itemType'},
			{'data': 'salesPrice'},
			{'data': 'useYn'},
			{'data': 'memo'}
		],
		'columnDefs': [
			{'className': 'itemCode', 'targets': 0 },
			{'className': 'whCode', 'targets': 1 },
			{'className': 'companyCode', 'targets': 2 },
			{'className': 'itemName', 'targets': 3 },
			{'className': 'itemType', 'targets': 4 },
			{'className': 'salesPrice', 'targets': 5 },
			{'className': 'useYn', 'targets': 6 },
			{'className': 'memo', 'targets': 7 }
		],
		'pageLength': 5,
		'initComplete': (setting, json)=>{$('#modal-item_wrapper').css({'max-width':'100%','overflow-x':'auto'})}
	});

	// ordersModal 생성
	$('#modal-order').DataTable({
		'ajax': {
			'url': `${contextPath}/product/sim/modal/findOrders`,
			'dataSrc': ''
		},
		'columns': [
			{'data': 'orderCode'},
			{'data': 'customerCode'},
			{'data': 'receiveOrderType'},
			{'data': 'orderEmpId'},
			{'data': 'deliveryPlan'},
			{'data': 'orderStatus'},
			{'data': 'dueDate'},
			{'data': 'memo'}
		],
		'columnDefs': [
			{'className': 'orderCode', 'targets': 0 },
			{'className': 'customerCode', 'targets': 1 },
			{'className': 'receiveOrderType', 'targets': 2 },
			{'className': 'orderEmpId', 'targets': 3 },
			{'className': 'deliveryPlan', 'targets': 4 },
			{'className': 'orderStatus', 'targets': 5 },
			{'className': 'dueDate', 'targets': 6 },
			{'className': 'memo', 'targets': 7 }
		],
		'pageLength': 5,
		'initComplete': (setting, json)=>{$('#modal-orders_wrapper').css({'max-width':'100%','overflow-x':'auto'})}
	});

	// Modal창 Open시 컬럼 사이즈 조정
	$('#modal-company, #modal-wh, #modal-item, #modal-orders').on('shown.bs.modal', function () {
		$.fn.dataTable.tables({ visible: true, api: true }).columns.adjust();
	});
});


// Modal창 Open 및 Close
// 축약형 표현 $(document).ready(function() {
$(function() {
	// comapnyModal Open
	$(document).on('click', '#customerCode, #companyName', ()=>{
		$('#companyModal').modal('show');
		$('#companyModal tbody tr').click((e)=>{
			let clickRow = $(e.target).closest('tr');
			$('#customerCode').val(clickRow.find('.companyCode').text());
			$('#companyName').val(clickRow.find('.companyName').text());
			$('#companyModal').modal('hide');
		});
	});
	
	// whModal Open
	$(document).on('click', '.addWhCode, .addWhName', (inputRow)=>{
		$('#whModal').modal('show');
		$('#whModal tbody tr').off('click').click((e)=>{

			let clickRow = $(e.target).closest('tr');
			let row = $(inputRow.target).closest('tr');

			row.find('.addWhCode').val(clickRow.find('.whCode').text());
			row.find('.addWhName').val(clickRow.find('.whName').text());
			$('#whModal').modal('hide');
		});
	});

	// itemModal Open
	$(document).on('click', '.addItemCode, .addInPrice', (inputRow)=>{
		$('#itemModal').modal('show');
		$('#itemModal tbody tr').off('click').click((e)=>{

			let clickRow = $(e.target).closest('tr');
			let row = $(inputRow.target).closest('tr');

			row.find('.addItemCode').val(clickRow.find('.itemCode').text());
			row.find('.addInPrice').val(clickRow.find('.salesPrice').text());
			$('#itemModal').modal('hide');
		});
	});

	// orderModal Open
	$(document).on('click', '#orderCode', ()=>{
		console.log('오더 모달 오픈');
		$('#orderModal').modal('show');
		$('#orderModal tbody tr').off('click').click((e)=>{
			$('#orderCode').val($(e.target).closest('tr').find('.orderCode').text());
			$('#orderModal').modal('hide');
		});
	});
	// Row 클릭시 값 입력
	//$(document).on('click', '#companyModal tbody tr', selectCompanyModal);
	//$(document).on('click', '#whModal tbody tr', selectWhModal);
	//$(document).on('click', '#itemModal tbody tr', selectItemModal);
	
	// 임시 확인용 /////////////////////////////
	$(document).on('click', '.table-in tbody', ()=>{
		console.log($('input[type="checkbox"]').is(':checked'));
	});

	
});

// Company Select Event
// function selectCompanyModal(e) {
// 	$(e.target).closest('tr').find('td').each((i, e)=>{
// 		if(i>1) {
// 			$('#companyModal').modal('hide');
// 			$('.table-in input[type="checkbox"]').prop('checked', false);
// 			return false;
// 		}
// 		$(`.stock-in-list input:eq(${i})`).val($(e).text());
// 	});
// }
// wh Select Event

// item Select Event
// function selectItemModal(e) {
// 	$(e.target).closest('tr').find('td').each((i, e)=>{
// 		if(i>1) {
// 			$('#itemModal').modal('hide');
// 			$('input[type="checkbox"]').prop('checked', false);
// 			return false;
// 		}
// 		$(`.stock-in-list input:eq(${i+5})`).val($(e).text());
// 	});
// }
