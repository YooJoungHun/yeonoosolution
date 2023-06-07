<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style type="text/css">
	
	.customerInfoContainer{
		width: 100%;
		height:auto;
		margin: 0;
		display: flex;
	} 
	.side-bar {
	   	width: 200px;
	   	background-color: #f2f2f2;
	   	border: 1px solid #ddd;
	   	padding: 20px;
	   	float: left;
	   	height: auto;
	}
	
	.content{
		margin:0 auto;
		width: 75%;
		display: inline-block;
	}
	
	.filter {
	  	display: flex;
	  	flex-wrap: wrap;
	  	margin-bottom: 10px;
	}
	
	.form-data, .tableTitle{
	  	margin-right: 10px;
	  	width: 120px;
	  	height: 2rem;
	  	border: 1px solid black;
	  	display: flex;
	  	justify-content: center; /* 수평 가운데 정렬 */
	  	align-items: center; /* 수직 가운데 정렬 */
	  	border-radius: 5px;
	  	font-weight: bold;
	
	}
	
	#orderType, option{
	  	width: 90px;
	  	text-align: center;
	  
	}
	
	#companyName{
	  	width: 185px;
	  	height: 28px;
	}
	
	.form-content {
	 	flex: 1 1 auto;
	}
	
	.tableHeader {
	  	display: flex;
	  	flex-wrap: wrap;
	  	justify-content: space-between;
      	align-items: center;
      	margin-bottom: 10px;
	}
 	#filterCompanyName{
	  	height: 32px;
	    border: 1px solid black;
	  	border-radius: 5px;
	}
	#filterOrderType{
		width: 169px;
		height: 32px;
	    border: 1px solid black;
	  	border-radius: 5px;
	}
	.crudBtn{
	   	display: flex; 
	   	margin-bottom: 10px;
	   	margin-top: 10px;
	}
	.crudBtn button{
	    width: 70px;
		height: 30px;
		font-weight: bold;
		font-size:13px;
		background-color: white;
		border: 1px solid #D6DAE2;
		outline: none;
		border-radius: 5px;
		padding: 0 12px;
		margin-right: 5px;
	  
	}
	#customerInfoTable{
		min-width: 977px;
	}
	
	#customerInfoTable td, th{
		margin: auto;
		border : 1px solid black;
		border-collapse: collapse;
		text-align: center;
		padding: 2px;
		
		
	}
	#customerInfoTable, td, input{
		text-align: center;
		font-size: 16px;
	}
	#customerInfoTable tr th {
		height: 40px;
		background-color: #F6F6F6;
		width: 10px;
	}
	/* 테이블에 있는 input 태그를 클릭시.  */
	#customerInfoTable input[type="text"]:focus {
	  	border: 1px solid #000; 
	  	background-color: white;
	}
	#customerInfoTable input{
		border: none;
		outline: none;
		
	}
	#customerInfoTable select:focus {
	  	appearance: auto;
	  	border: 1px solid #000; /* 나타낼 border 스타일 설정 */
	  	background-color: white;
	}
	#customerInfoTable select:focus option{
	  	appearance: auto;
	  	border: 1px solid #000; /* 나타낼 border 스타일 설정 */
	  	background-color: white;
	}
	#customerInfoTable select{
		appearance: none;
		border: none;
		outline: none
	}
	
	.rowCount, #allCheck{
		width: 30px;
	}
	.customerInfo {
	  	height: auto;
	  	overflow-y: auto;
	  	overflow-x: auto;
	}

	.bg-yellow{
		background-color: #ffffcc;
		width: 200px;
	}
	.bg-gray{
		background-color: #EAEAEA
	}
	#customerInfoTbody tr:hover td ,	
	#customerInfoTbody tr:hover td input,	
	#customerInfoTbody tr:hover td select	
	{
		background-color: #6799FF;
	}
	#searchName{
		font-size: 18px;
		font-weight: bold;
	}
	#searchOrderType{
		font-size: 18px;
		font-weight: bold;
		color: red;
	}
</style>
</head>
<body>
	<div class = "customerInfoContainer">
		<div class="side-bar">
		      <!-- product/ds -->
		      <a href="/product/status/defect">불량현황</a><p>
		      <!-- product/ps -->
		      <a href="/product/status/production">생산현황 검색</a><p>
		      <!-- product/pr -->
		      <!-- product -->
		      <a href="/product/is/item">품목별 재고 현황</a><p>
		      <a href="/product/is/bom">BOM별 재고 현황</a><p>
		      <a href="/product/is/wh">창고별 재고 현황</a><p>
		      <a href="/product/is/wh/">창고별 재고 현황 상세</a><p>
		      <a href="/item/search">제품 검색</a><p>
		      <a href="/product/sim">입고</a><p>
		      <a href="/wo">제품 생산 지시</a><p>
		      
		      <!-- sales -->
		      <a href="/sales/receive-order">수주서 관리</a><p>
		      <a href="/sales/analysis-of-materials">자제요소분석</a><p>
		      <a href="/sales/order">구매</a><p>
		      <a href="/sales/stock-in">구매입고등록</a><p>
		      
		      <!-- standard -->
		      <a href="/standard/login">로그인</a><p>
		      <a href="/standard/user-admin">사용자 계정관리</a><p>
		      <a href="/standard/imi">품목 관리 및 등록</a><p>
		      <a href="/standard/ipi">품목 단가 관리</a><p>
		      <a href="/standard/pmi">품목 관리 정보</a><p>
		      
		              기본정보<p>
			  <a href="/standard/companyInfo/">회사정보</a><p>
 			  <a href="/standard/customerInfo/">거래처정보</a><p>
 			    사용자관리<p>
 			  <a href="/standard/myPage/">개인정보수정</a><p>
 			  <a href="/standard/dept/">부서등록 및 확인</a><p>
 			  <a href="/standard/job/">직급등록 및 확인</a><p>
		      
		      <!-- 로그아웃 -->
		      <c:if test="${sessionScope.member != null}">
		         <form action="/standard/logout" method="POST">
		            <button type="submit">로그아웃</button>
		         </form>
		      </c:if>
		      
		</div>
 		<div class = "content">
 		
			<div class = "crudBtn">
				<button id = "searchBtn" onclick="searchCompanyInfo()">조회</button>
				<button id = "insertBtn" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop">등록</button>
				<button id = "saveBtn" onclick="modifyCompanyInfoBtn('1')">저장</button>
				<button id = "deleteBtn" onclick="modifyCompanyInfoBtn('2')">삭제</button>
				<button id = "resetBtn" onclick="resetCompanyInfo()">초기화</button>
			</div>
		
			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-scrollable">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="staticBackdropLabel">신규 거래처 입력</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form action="">
			        	  <div class="mb-3">
				            <label for="recipient-name" class="col-form-label">거래처명:</label>
				            <input type="text" class="form-control" id="modalCompanyName" name="companyName" required="required">
				          </div>
			        	  <div class="mb-3">
				            <label for="recipient-name" class="col-form-label">사업자등록번호:</label>
				            <input type="text" id="modalBusinessCode" class="form-control" name="businessCode" required="required" placeholder="###-##-#####">
				          </div>
			        	  <div class="mb-3">
				            <label for="recipient-name" class="col-form-label">대표명:</label>
				            <input type="text" id="modalOwnerName" class="form-control" name="ownerName" required="required">
				          </div>
			        	  <div class="mb-3">
				            <label for="recipient-name" class="col-form-label">사업자구분:</label>
				            <select id="modalBusinessType" name="businessType" required="required">
								<option value="--" 	selected="selected">--
								<option value="개인" >개인사업자
								<option value="법인" >법인사업자
							</select>
				          </div>
			        	  <div class="mb-3">
				            <label for="recipient-name" class="col-form-label">거래처주소:</label>
				            <input type="text" id="modalAddress" name="address" class="form-control"  required="required">
				          </div>
			        	  <div class="mb-3">
				            <label for="recipient-name" class="col-form-label">수/발주:</label>
				            <select id="modalOrderType" name="orderType">
								<option value="--" selected="selected">--
								<option value="수주">수주
								<option value="발주">발주
							</select>
				          </div>
			        	  <div class="mb-3">
				            <label for="recipient-name" class="col-form-label">전화번호:</label>
				            <input type="text" id="modalTel" class="form-control" name="tel" required="required" placeholder="##-####-#### or ###-####-####">
				          </div>
				          <button type="reset" class="btn btn-primary" >초기화</button>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-primary" onclick="insertCompanyInfo()">등록</button>
			      </div>
			    </div>
			  </div>
			</div>
			
	 		
	 		<div class = "filter">
	
	 			<div class = "form-data">거래처명</div>
	 			
	 			<div class = "form-content">
	 				<input type="text" name="companyName" id ="filterCompanyName">
	 			</div>
	 			
	 			<div class = "form-data">수/발주</div>
	 			
	 			<div class = "form-content">
	 				<select id="filterOrderType" name="orderType">
	 					<option value="--" 	selected="selected">--
						<option value="수주">수주
						<option value="발주">발주
					</select>
	 			</div>
	 			
	 		</div>
	 		
 		
 		
 			<div class = "tableHeader">
	 			<div class = "tableTitle">
	 				거래처목록
	 			</div>		
 			</div>
 			
 			<div class = "customerInfo">
 				<table id = "customerInfoTable">
 					<tr>
 						<th class="rowCount"></th>
 						<th><input type="checkbox" id="allCheck" onclick ="checkBoxAllCheck()"></th>
 						<th>회사코드</th>
 						<th>거래처명</th>
 						<th>사업자구분</th>
 						<th>거래처주소</th>
 						<th>수/발주</th>
 						<th>사업자등록번호</th>
 						<th>전화번호</th>
 						<th>대표</th>
 						<th>사용여부</th>
 					</tr>
					<tbody id = "customerInfoTbody">
	 					<c:forEach  var="customerList" items="${customerLists}" varStatus="status">
		 					<tr>
		 						<td class = "rowCount">
		 							<input type="text" class ="rowCount" value="${status.count }">
		 						</td>
		 						<td>
		 							<input type="checkbox" name="tableCheckBox" id="tableCheckBox${status.index }">
		 						</td>
		 						<td class ="bg-gray">
		 							<input type="text" name="companyCode" id="companyCode${status.index }"	value="${customerList.companyCode }" disabled="disabled">
		 						</td>
		 						<td class ="bg-yellow">
		 							<input class ="bg-yellow" type="text" name="companyName" id="companyName${status.index }"	value="${customerList.companyName }" required="required">
		 						</td>
		 						<td class ="bg-yellow">
		 							<select class ="bg-yellow" id="businessType${status.index }" name="businessType" required="required">
										<option value="" 	${customerList.businessType == null ? 'selected = selected' : '' }>--
										<option value="개인" ${customerList.businessType == '개인' ? 'selected = selected' : '' }>개인사업자
										<option value="법인" ${customerList.businessType == '법인' ? 'selected = selected' : '' }>법인사업자
									</select>
		 						</td>
		 						<td class ="bg-yellow">
		 							<input class ="bg-yellow" type="text" name="address" 	  id="address${status.index }" 	value="${customerList.address }" required="required">
		 						</td>
		 						<td class ="bg-yellow">
		 							<select class ="bg-yellow" id="orderType${status.index }" name="orderType" required="required">
										<option value="" 	${customerList.orderType == null ? 'selected = selected' : '' }>--
										<option value="수주" ${customerList.orderType == '수주' ? 'selected = selected' : '' }>수주
										<option value="발주" ${customerList.orderType == '발주' ? 'selected = selected' : '' }>발주
									</select>
		 						</td>
		 						<td class ="bg-yellow">
		 							<input class ="bg-yellow" type="text" name="businessCode" 	id="businessCode${status.index }"	value="${customerList.businessCode }" required="required">
		 						</td>
		 						<td class ="bg-yellow">
		 							<input class ="bg-yellow" type="text" name="tel" id="tel${status.index }"	value="${customerList.tel }" required="required">
		 						</td>
		 						<td class ="bg-yellow">
		 							<input class ="bg-yellow" type="text" name="ownerName"  id="ownerName${status.index }"	value="${customerList.ownerName }" required="required">
		 						</td>
		 						<td class ="bg-gray">
		 							<input type="text" name="useYn"  id="useYn${status.index }"	 value="${customerList.useYn }" disabled="disabled" required="required">
		 						</td>
		 					</tr>
	 					</c:forEach>
 					</tbody>
 				</table>
 			</div>
 		</div>
	</div>
	
<script type="text/javascript">

 	// 전부 로딩완료가 되면 실행되게 하기
   $(document).ready(function(){
	 // 테이블 로우 클릭하면 체크박스가 체크되게 하기
	 $("table tr").not("tr th").click(function(event){
		 // 이벤트 버블링 방지. 이거 안하면 이벤트가 겹쳐서 될때가 있고 안될 때가 있음.
		 // 체크박스를 직접 누를 때 체크가 되는 이벤트와 테이블 로우를 눌렀을 때 체크되는 이벤트가 겹치게 됨.
		 // stopPropagation()를 이용해서 겹치게 안할 수 있음. 
		 event.stopPropagation();
		 
		 // 클릭한 엘리먼트가 th인 경우 처리하지 않음
		 // this = $("table tr").not("tr th").click
		 // this를 했을 때 th가 발견 되는 것이 0개보다 크면 체크하지 말아라
        if ($(this).find('th').length > 0) {
            return false;
        }
		 
		 // 클릭 된 로우의 체크박스 체크되게 하기 
		 // this = $("table tr").not("tr th").click
		 var checkbox = $(this).find('input[type = "checkbox"]');
		 
		 // 체크박스의 체크 상태 변경
		 // 체크 박스를 체크했을 때                 체크가 안되어 있다면 체크를 해줘라 
		 checkbox.prop('checked', !checkbox.prop('checked'));
	 });
	 
	 // 진짜 체크박스를 클릭하면 체크가 되게
	 $("table input[type = 'checkbox']").click(function(event){
		 // 이벤트 중복 금지되게
		 event.stopPropagation();
		 
	 });
	 
   });
	
	// 가장 상단 체크박스 누르면 전부 체크되게 하기
	function checkBoxAllCheck(){
		
		var checkBoxes = document.querySelectorAll("input[name='tableCheckBox']");
		var allCheck = document.getElementById("allCheck");
		
		for(var i = 0; i < checkBoxes.length; i++){
			// allcheck가 체크가 되면 check박스 전부 체크해라
			checkBoxes[i].checked = allCheck.checked;
		} 
	}
	
	function getCheckBoxData(rowIndex, kindNumber){
		var companyCode 	= document.getElementById("companyCode"+rowIndex).value;
		var companyName 	= document.getElementById("companyName"+rowIndex).value;
		var businessType 	= document.getElementById("businessType"+rowIndex).value;
		var address 		= document.getElementById("address"+rowIndex).value;
		var orderType 		= document.getElementById("orderType"+rowIndex).value;
		var businessCode 	= document.getElementById("businessCode"+rowIndex).value;
		var tel 			= document.getElementById("tel"+rowIndex).value;
		var ownerName 		= document.getElementById("ownerName"+rowIndex).value;
		var useYn		 	= document.getElementById("useYn"+rowIndex).value;
		var kind 			= kindNumber;
		
		var checkBoxRowData = {
				companyCode  : companyCode,
				companyName  : companyName,
				businessType : businessType,
				address 	 : address,
				orderType 	 : orderType,
				businessCode : businessCode,
				tel 		 : tel,
				ownerName 	 : ownerName,
				useYn 		 : useYn,
				kind		 : kind
		};
		
		return checkBoxRowData;
	}
	
	function modifyCompanyInfo(kindStatus){		
		// number 파라미터 1 = 수정
		// number 파라미터 2 = 삭제
		var kindNumber = kindStatus;
		/* if(kindNumber == 1){
			alert("수정시작");
		}else{
			alert("삭제시작");
		} */
		 
	
		// 체크 박스를 2개 체크했으면 length가 2가 된다.
		var checkBoxes = document.querySelectorAll('input[name="tableCheckBox"]:checked');
		console.log(checkBoxes.length);
		
		// 체크 된게 없으면 길이가 0, 고로 리턴 false
		if(checkBoxes.length == 0){
			alert("품목을 선택해 주세요");
			return false;
		} 
		
		// 최종 업데이트할 때만  alert뜨게 하기 위해서 사용 
		var updateCount = 0;
	
		
		for(var i = 0; i<checkBoxes.length; i++){
			// rowindex는 1부터 시작하므로 -1을 해주어야 ${status.index}와 맞출 수 잇다.
			// 체크 된 체크 박스가 몇번째 테이블 로우 인지 알아내는 법
			var rowIndex = (checkBoxes[i].parentNode.parentNode.rowIndex)-1;
			console.log("로우 인덱스 -> "+rowIndex);
			
			var companyDto 		= getCheckBoxData(rowIndex, kindNumber);
			var companyCode 	= document.getElementById("companyCode"+rowIndex).value;
			
			$.ajax({
				url : "/standard/customerInfo/"+companyCode,
				dataType : "json",
				type : "PUT",
				data : companyDto,
				success : data =>{
					updateCount++;
					if(updateCount == checkBoxes.length && data === 1 && kindNumber == 1){
						alert("수정되었습니다.")
						location.reload();
					} else if(updateCount == checkBoxes.length && data != 1 && kindNumber == 1){
						alert("수정에 실패하였습니다.")
					}
					if(updateCount == checkBoxes.length && data === 1 && kindNumber == 2){
						alert("삭제되었습니다.")
						location.reload();
					} else if(updateCount == checkBoxes.length && data != 1 && kindNumber == 2){
						alert("삭제 실패하였습니다.")
					}
					location.reload();
				}
			}); 
		}		
	}
	// 컨펌을 사용하기 위해 모듈화.
	function modifyCompanyInfoBtn(kindStatus){
		// kindStatus 파라미터 1 = 수정
		// kindStatus 파라미터 2 = 삭제
		var result = false;
		
		if(kindStatus == 1){
			result = confirm("수정하시겠습니까?");
			if(result){
				modifyCompanyInfo(kindStatus);
			}else{
				return false;
			}
		}else if(kindStatus == 2){
			result = confirm("삭제하시겠습니까?");
			if(result){
				modifyCompanyInfo(kindStatus);
			}else{
				return false;
			}
		}
	}
	
	function resetCompanyInfo(){
		location.reload();
	}
	
	function insertCompanyInfo(){
		var result = confirm("등록하시겠습니까?");
		
		if(result){
			
			var companyName = $("#modalCompanyName").val().trim();
			var businessCode = $("#modalBusinessCode").val().trim();
			var ownerName = $("#modalOwnerName").val().trim();
			var businessType = $("#modalBusinessType").val();
			var address = $("#modalAddress").val().trim();
			var orderType = $("#modalOrderType").val();
			var tel = $("#modalTel").val().trim();
			if(companyName == "" || companyName == null){
				alert("거래처명을 입력해주세요");
				return false;
			}
			if (businessCode == "" || businessCode == null) {
			    alert("사업자등록번호를 입력해주세요");
			    return false;
			} else {
			    var regBusinessCode = /^\d{3}-\d{2}-\d{5}$/; // 사업자 등록번호 정규식표현: 123-12-12345
			    if (!regBusinessCode.test(businessCode)) {
			        alert("올바른 사업자등록번호 형식이 아닙니다.");
			        return false;
			    }
			}
			if(ownerName == "" || ownerName == null){
				alert("대표명을 입력해주세요");
				return false;
			}
			if(businessType == "--"){
				alert("사업자 구분을 선택해주세요");
				return false;
			}
			if(address == "" || address == null){
				alert("거래처주소 입력해주세요");
				return false;
			}
			if(orderType == "--"){
				alert("수/발주를 선택해주세요");
				return false;
			}
			if(tel == "" || tel == null){
				alert("거래처 번호를 입력해주세요");
				return false;
			} else {
				var regTel = /^\d{2,3}-?\d{3,4}-?\d{4}$/;
				if(!regTel.test(tel)){
					alert("올바른 전화번호 형식이 아닙니다.");
					return false;
				}
			}
			
			var customerData = {
					companyName : companyName,
					businessCode: businessCode,
					ownerName	: ownerName,
					businessType: businessType,
					address		: address,
					orderType	: orderType,
					tel			: tel
			}
			
			$.ajax({
				url : "/standard/customerInfo/",
				dataType : "json",
				type : "POST",
				data : customerData,
				success : data =>{
					if(data == 1){
						alert("등록되었습니다.");
						location.reload();
					}else{
						alert("등록실패하였습니다.");
					}
				}
			});
			
		}else{
			return false;
		}
	}
	
	function searchCompanyInfo() {
		  /* alert("검색시작"); */

		  var html = "";
		  var companyName = $("#filterCompanyName").val().trim();
		  var orderType = $("#filterOrderType").val();
		  /* alert("회사이름-> " + companyName);
		  alert("수발주-> " + orderType); */

		  if (companyName == null || companyName == "") {
		    companyName = "";
		  }
		  if (orderType == "--") {
		    orderType = null;
		  }

		  $.ajax({
		    url: "/standard/customerInfo/search/",
		    dataType: "json",
		    type: "GET",
		    data: {
		      companyName	: companyName,
		      orderType		: orderType
		    },
		    success: function(data) {
		    	/* 없는 이름으로 검색한 경우에만 데이터가 없다는 것을 표시하기 위함.  */
		    	if(companyName != "" && data == null || data.length == 0){
		    		html += "<tr><td colspan = '11'><span id='searchName'>'"+companyName+"',</span>";
		    		html += "<span id = 'searchOrderType'> '"+(orderType || "--")+"'</span> 검색결과가 없습니다.</td></tr>";
		    		$("#customerInfoTbody").html(html);
		    	}else{
		    		
			      $(data).each(function(index) {
			        html += "<tr>";
			        html += "<td class ='rowCount'><input type='text' class ='rowCount' value='"+(index+1)+"'></td>";
			        html += "<td><input type='checkbox' name='tableCheckBox' id='tableCheckBox"+index+"'></td>";
			        html += "<td class ='bg-gray'><input type='text' class ='bg-gray' name='companyCode' id='companyCode"+index+"' value='"+this.companyCode+"' disabled='disabled'></td>";
			        html += "<td class ='bg-yellow'><input type='text' class ='bg-yellow' name='companyName' id='companyName"+index+"' value='"+this.companyName+"' required='required'></td>";
			        html += "<td class ='bg-yellow'><select id='businessType"+index+"' class ='bg-yellow' name='businessType' required='required'>";
			        html += "<option value='' " + (this.businessType == null ? "selected='selected'" : "") + ">--";
			        html += "<option value='개인' " + (this.businessType == '개인' ? "selected='selected'" : "") + ">개인사업자";
			        html += "<option value='법인' " + (this.businessType == '법인' ? "selected='selected'" : "") + ">법인사업자";
			        html += "</select></td>";
			        html += "<td class ='bg-yellow'><input type='text' class ='bg-yellow' name='address' id='address"+index+"' value='"+this.address+"' required='required'</td>";
			        html += "<td class ='bg-yellow'><select id='orderType"+index+"' class ='bg-yellow' name='orderType' required='required'>";
			        html += "<option value='' " + (this.orderType == null ? "selected='selected'" : "") + ">--";
			        html += "<option value='수주' " + (this.orderType == '수주' ? "selected='selected'" : "") + ">수주";
			        html += "<option value='발주' " + (this.orderType == '발주' ? "selected='selected'" : "") + ">발주";
			        html += "</select></td>"; 
			        html += "<td class ='bg-yellow'><input type='text' class ='bg-yellow' name='businessCode' id='businessCode"+index+"' value='"+this.businessCode+"' required='required'</td>";
			        html += "<td class ='bg-yellow'><input type='text' class ='bg-yellow' name='tel' id='tel"+index+"' value='"+this.tel+"' required='required'</td>";
			        html += "<td class ='bg-yellow'><input type='text' class ='bg-yellow' name='ownerName' id='ownerName"+index+"' value='"+this.ownerName+"' required='required'</td>";
			        html += "<td class ='bg-gray'><input type='text' class ='bg-gray' name='useYn' id='useYn"+index+"' value='"+this.useYn+"' required='required'</td>";
			        html += "</tr>";
			      });
		    	}
		      $("#customerInfoTbody").html(html);
		    }
		  });
		}
</script>
</body>
</html>