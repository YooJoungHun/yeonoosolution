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
                 { name: '회사정보', value: '/standard/companyInfo' },
                 { name: '거래처정보', value: '/standard/customerInfo' }
              ]
           },
           {
              name: '사용자관리',
              value: [
                 { name: '개인정보수정', value: '/standard/myPage' },
                 { name: '부서등록 및 조회', value: '/standard/dept' },
                 { name: '직급등록 및 조회', value: '/standard/job' },
                 { name: '사용자 계정 관리', value: '/standard/user-admin' }
              ]
           },
           {
              name: '품목관리정보',
              value: [
                 { name: '품목 등록', value: '/standard/imi' },
               
              ]
           },
           {
              name: '품목 단가 정보',
              value: [
                 { name: '품목 단가 관리', value: '/standard/ipi' }
              ]
           },
           {
              name: '창고관리정보',
              value: [
                 { name: '창고 등록 및 조회', value: '/standard/warehouseLists/' }
              ]
           },
           {
              name: '생산관리정보',
              value: [
                 { name: 'BOM 등록', value: '/standard/pmi' }
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
               { name: '수주서 관리', value: '/sales/receive-order' },
               { name: '자재요소분석', value: '/sales/analysis-of-materials' }
            ]
         },
         {
            name: '출고(납품)관리',
            value: [
               { name: '출고(납품) 등록', value: '/sales/stock/' },
               { name: '출고(납품) 조회', value: '/sales/stock/detail/' }
            ]
         }
      ]
   },
   {
      name: '구매관리',
      value: [
         { name: '구매발주', value: '/sales/order' },
         { name: '구매입고 등록', value: '/sales/stock-in' }
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
               { name: '생산 현황', value: '/product/status/production' },
               { name: '불량품 현황', value: '/product/status/defect' },
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
               { name: '이동등록', value: '/product/stockMoveRegistration' },
               { name: '이동현황', value: '/product/stockMoveStatus' }
            ]
         },
         {
            name: '기타 입고 관리',
            value: [
               { name: '기타 입고 등록', value: '/product/sim/register' },
               { name: '기타 입고 현황', value: '/product/sim/status' }
            ]
         },
         {
            name: '기타 출고 관리',
            value: [
               { name: '기타 출고 등록 및 현황', value: '/product/somStOutLists/' }
            ]
         },
         {
            name: '재고현황',
            value: [
               { name: '품목별 재고현황', value: '/product/is/item' },
               { name: 'BOM 재고현황', value: '/product/is/bom' },
               { name: '창고별 재고현황', value: '/product/is/wh' }
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

const findMenu = (data) => {
	let dataList = [];
	for (let datum of data) {
		if (typeof datum.value == 'string') dataList[dataList.length] = datum;
		else dataList = dataList.concat(findMenu(datum.value));
	}
	return dataList;
};
$(document).on('blur', '#menusearch', e => {
	let target = $('#menusearch').val();
	let datum = findMenu(menuList).filter(data => data.name == target)[0];
	if (!(!datum) && location.pathname != datum.value) {
		location.href = location.protocol + '//' + location.host + datum.value;
	}
});
$(document).on('keydown', '#menusearch', e => {
	if (e.keyCode == 13) $('#menusearch').blur();
});

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