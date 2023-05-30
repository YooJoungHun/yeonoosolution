/**
 * 
 */
let previousRow, row, stIn;
$(()=> {
	$(document).on('click', '.stInRow', tableRowClick);
});

function tableRowClick(e){
	
	stIn = $(e.target).closest('tr');
	let date1 = new Date(stIn.find('.inDate').text());
	console.log(date1);
	formatDate(date1);
	
	$('#inCode').val(stIn.find('.inCode').text());
	$('#inType').val(stIn.find('.inType').text());
	$('#orderCode').val(stIn.find('.orderCode').text());
	$('#inDate').val(date1);
	$('#customerCode').val(stIn.find('.customerCode').text());
	$('#companyName').val(stIn.find('.companyName').text());
	$('#regUser').val(stIn.find('.regUser').text());
	$('#regDate').val(stIn.find('.regDate').val());
	$('#memo').val(stIn.find('.memo').text());
	
	row = $(e.target).closest('tr').next('tr').attr('class');
	
	if(previousRow != null && previousRow != row){
		$(`.${previousRow}`).hide();
	}

	$(`.${row}`).toggle();
	
	if(previousRow != null || previousRow != row){
		previousRow = row;
	}else{
		previousRow = null;
	}
}

// 입고 유형
function inTypeEvent(select){
	let selectValue = $(select).val();

	if(selectValue == 1){
		$('#orderCode').attr('disabled', false);
	}else if(selectValue == 0){
		$('#orderCode').attr('disabled', true).removeAttr('placeholder');
	}
}


const btnMap = {
    find: '.content-write',
    save: '.content-receiver',
    delete: '.content-sender',
    fix: '.content-storage',
    cancel: '.content-recycle'
};

function btnEvent(event){
	const btn = btnMap[event];
}

function formatDate(date) {
	let year = date.getFullYear();
	let month = String(date.getMonth()+1).padStart(2,'0');
	let day = String(date.getDate()).padStart(2,'0');
	console.log(`${year}/${month}/${day}`);
}

$(()=>{
	
});