/**
 * 
 */
var menuList = [
	{
		name: '기준정보',
	 	value: [
	  		{
	  			name: '기본정보',
	  			value: [ 
	  				{ name: '회사정보', value: '' },
	  				{ name: '거래처정보', value: '' },
	  				{ name: '배송지정보', value: '' }
	  			]
	  		},
	  		{
	  			name: '사용자관리',
	  			value: [
	  				{ name: '개인정보수정', value: '' },
	  				{ name: '부서등록', value: '' },
	  				{ name: '직급코드', value: '' },
	  				{ name: '조직도', value: '' },
	  				{ name: '사용자계정관리', value: '' }
	  			]
	  		},
	  		{
	  			name: '품목관리정보',
	  			value: [
		  			{ name: '품목등록(제품)', value: '' },
		  			{ name: '품목등록(반제품)', value: '' },
		  			{ name: '품목등록(원자재)', value: '' }
	  			]
	  		},
	  		{
	  			name: '품목단가정보',
	  			value: [
	  				{ name: '품목단가관리', value: '' }
	  			]
	  		},
	  		{
	  			name: '창고관리정보',
	  			value: [
	  				{ name: '창고등록', value: '' },
	  				{ name: '창고조회', value: '' }
	  			]
	  		},
	  		{
	  			name: '생산관리정보',
	  			value: [
		  			{ name: '공정코드등록', value: '' },
		  			{ name: '품목별공정등록', value: '' },
		  			{ name: '생산라인등록', value: '' },
		  			{ name: 'BOM 등록', value: '' }
	  			]
	  		}
	  	]
	},
	{
		name: '영업관리',
		value: [
			{
				name: '수주관리',
				value: [
					{ name: '견적서 등록', value: '' },
					{ name: '수주서 관리', value: '' },
					{ name: '자재소요분석', value: '' }
				]
			},
			{
				name: '출하(납품)관리',
				value: [
					{ name: '출하(납품) 등록', value: '' },
					{ name: '출하(납품) 라벨출력', value: '' },
					{ name: '출하(납품) 조회', value: '' }
				]
			}
		]
	},
	{
		name: '구매관리',
		value: [
			{ name: '구매발주', value: '' },
			{ name: '구매입고 등록', value: '' },
			{ name: '구매입고 라벨발행', value: '' },
			{ name: '구매입고 내역조회', value: '' }
		]
	},
	{
		name: '생산관리',
		value: [
			{
				name: '작업지시',
				value: [
					{ name: '작업지시', value: '/product/wo' },
					{ name: '작업지시현황', value: '/product/currentWo' },
					{ name: '작업지시서 출력', value: '' }
				]
			},
			{
				name: '실적등록',
				value: [
					{ name: '생산실적등록-OFFICE MODE', value: '/product/productResult' }
				]
			},
			{
				name: '생산현황',
				value: [
					{ name: '생산실적조회', value: '' },
					{ name: '전표출력', value: '' },
					{ name: '제품라벨출력', value: '' },
					{ name: '작업일보현황', value: '' },
					{ name: '제품별생산현황', value: '' },
					{ name: '라인별생산현황', value: '' },
					{ name: '품목별불량현황', value: '' }
				]
			}
		]
	},
	{
		name: '재고관리',
		value: [
			{
				name: '이동관리',
				value: [
					{ name: '이동등록', value: '' },
					{ name: '이동현황', value: '' }
				]
			},
			{
				name: '기타입고관리',
				value: [
					{ name: '기타입고등록', value: '' },
					{ name: '기타입고 라벨발행', value: '' },
					{ name: '기타입고현황', value: '' }
				]
			},
			{
				name: '기타출고관리',
				value: [
					{ name: '기타출고등록', value: '' },
					{ name: '기타출고현황', value: '' }
				]
			},
			{
				name: '재고현황',
				value: [
					{ name: '품목별 재고현황', value: '' },
					{ name: 'BOM 재고현황', value: '' },
					{ name: '창고별 재고현황', value: '' }
				]
			},
			{
				name: '자동차감창고관리',
				value: [
					{ name: '자동차감창고등록', value: '' },
					{ name: '자동차감창고 설비연결', value: '' },
					{ name: '자동차감창고 자재투입', value: '' }
				]
			},
			{
				name: '재고실사',
				value: [
					{ name: '재고실사관리', value: '' }
				]
			}
		]
	}
];

const arrangeMenu = (menuData, depth = 0) => {
	let virtual = $('<div></div>');
	for (let data of menuData) {
		let label = data.name;
		let btn = $('<button type="button"></button>');
		let inner = $('<div></div>');
		$(inner).text(label);
		$(btn).append($(inner));
		$(virtual).append($(btn));
		if (Array.isArray(data.value)) {
			$(btn).attr({
				'class': 'list-item list-header',
				'data-depth': depth,
				'data-target': label,
				'data-toggle': 'false'
			});
			
			let arrow = $('<svg viewBox="0 0 512 512"><path /></svg>');
			$(inner).append($(arrow));
			
			let section = $('<div></div>');
			$(virtual).append($(section));
			$(section).attr({
				'class': 'menu-list-section',
				'data-section': label
			});
			$(section).append(arrangeMenu(data.value, depth + 1));
		} else if (typeof data.value == 'string') {
			$(btn).attr({
				'class': 'list-item list-button',
				'data-depth': depth,
				'data-path': data.value
			});
		}
	}
	return $(virtual).html();
};

$(document).on('click', 'button.logout-button', e => {
	location.href = location.protocol + '//' + location.host + '/standard/logout';
});

$(document).on('click', 'button.list-header', e => {
	let elem = $(e.target).closest('button.list-header');
	let target = $(elem).attr('data-target');
	let toggled = $(elem).attr('data-toggle') == 'true';
	$(elem).attr('data-toggle', toggled ? 'false' : 'true');
	let display = $('div[data-section="' + target + '"]').css('display');
	let value = display == 'none' ? 'flex' : 'none';
	$('div[data-section="' + target + '"]').css('display', value);
});

$(document).on('click', 'button.list-button', e => {
	let elem = $(e.target).closest('button.list-button');
	let path = $(elem).attr('data-path');
	location.href = location.protocol + '//' + location.host + path;
});

$(document).on('click', 'button.left-plus', e => {
	let elem = $(e.target).closest('button.left-plus');
	let toggled = $(elem).attr('data-toggle') == 'true';
	$(elem).attr('data-toggle', toggled ? 'false' : 'true');
	$('button.list-header[data-toggle="' + (toggled ? 'true' : 'false') + '"]').click();
});

const extractMenu = (data) => {
	let dataList = [];
	for (let datum of data) {
		if (typeof datum.value == 'string') dataList[dataList.length] = datum.name;
		else dataList = dataList.concat(extractMenu(datum.value));
	}
	return dataList;
};

// 실제 메뉴 목록
var dataList = [];

$(() => {
	$('#hideBtn').on('click', e => {
		let elem = $('#hideBtn');
		if (elem[0].classList.contains('active')) {
			elem[0].classList.remove('active');
			$('.contents-main').find('.left-menu').show('slide', { direction: 'left', duration: 150 });
		} else {
			elem[0].classList.add('active');
			$('.contents-main').find('.left-menu').hide('slide', { direction: 'left', duration: 150 });
		}
	});
	$('div#menu-list-group').html(arrangeMenu(menuList));
	
	// 자동완성 목록 삽입
	dataList = extractMenu(menuList);
	let virtualDataList = $('<datalist></datalist>');
	for (let data of dataList) {
		let option = $('<option>');
		$(option).attr('value', data);
		$(virtualDataList).append($(option));
	}
	$('datalist#menu-search-list').html($(virtualDataList).html());
	
	// 현재 페이지에 맞는 메뉴 오픈
	let currentMenu = $('button.list-button[data-path="' + location.pathname + '"]');
	if (currentMenu.toArray().length > 0) {
		$(currentMenu).css('background-color', '#FFFFCC');
		while (true) {
			currentMenu = $(currentMenu).closest('div.menu-list-section');
			let section = $(currentMenu).attr('data-section');
			currentMenu = $('button.list-header[data-target="' + section + '"]');
			$(currentMenu).click();
			if ($(currentMenu).attr('data-depth') == '0') break;
		}
	}
});