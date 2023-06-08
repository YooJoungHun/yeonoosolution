<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style type="text/css">
	.deptListContainer{
		width: 100%;
		display: flex;
	}
	.content{
		margin:0 auto;
		width: 100%;
		display: inline-block;
		margin-left: 30px;
	}
	
	.crudBtn{
	   	display: flex; 
	   	margin-bottom: 50px;
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
	#memberSearchBtn{
	  	width: 70px;
	  	height: 32px;
	  	font-weight: bold;
	  	font-size:13px;
	  	background-color: white;
	  	border: 1px solid #D6DAE2;
	  	outline: none;
	  	border-radius: 5px;
	  	padding: 0 12px;
	  	margin-left: 9px;
	}
	
	.filter {
	  	display: flex;
	  	flex-wrap: wrap;
	  	margin-bottom: 10px;
	}
	
	#filterDeptName, #filterMemberName{
	  	height: 32px;
	  	border: 1px solid black;
	  	border-radius: 5px;
	}
	
	.deptTableTitle, .form-data, .tableTitle{
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
	#deptListTable{
		min-width: 740px;
	}
	#deptListTable td, th,
	#memberSearchTable td, th{
		margin: auto;
		border : 1px solid black;
		border-collapse: collapse;
		text-align: center;
		padding: 2px;
		
		
	}
	#deptListTable, td, input,
	#memberSearchTable, td, input{
		text-align: center;
		font-size: 16px;
	}
	#deptListTable tr th,
	#memberSearchTable tr th {
		height: 40px;
		background-color: #F8F8F8;
		width: 10px;
	}
	
	#deptListTable input[type="text"]:focus,
	#memberSearchTable input[type="text"]:focus{
	  	border: 1px solid #000; /* 나타낼 border 스타일 설정 */
	  	background-color: white;
	}
	#deptListTable input,
	#memberSearchTable input{
		border: none;
		outline: none;
		
	}
	#deptListTable tr:hover td ,	
	#deptListTable tr:hover td input	
	{
		background-color: #6799FF;
	}
	
	.rowCount, .tableCheckBox{
		width: 30px;
	}
	
	.deptMember{
	 	margin-top: 20px;
	 	max-width: 500px; 
	}
	
	.deptListInfo {
	  	margin-top: 10px;
	  	height: auto;
	  	overflow-y: auto;
	  	overflow-x: auto;
	}
	.bg-yellow{
		background-color: #ffffcc;
		width: 200px;
	}
	.bg-gray{
		background-color: #d9d9d9
	}
	#searchName{
		font-size: 18px;
		font-weight: bold;
	}
</style>

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
 		 // 체크 박스가 체크를 햇을 때  체크가 안되어 있다면 체크를 해줘라 
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
		var deptCode = $("#deptCode"+rowIndex).val();
		var deptName = $("#deptName"+rowIndex).val();
		var deptYn	 = $("#deptYn"+rowIndex).val();
		var kind 	 = kindNumber;
		
		var checkBoxRowData = {
				deptCode  : deptCode,
				deptName  : deptName,
				deptYn 	  : deptYn,
				kind 	  : kind
		};
		
		return checkBoxRowData;
	}
 	
 	
 	function modifyDeptList(kindStatus){
 		var kindNumber = kindStatus;
 		/* if(kindNumber == 1){
 			alert("수정시작");
 		}else{
 			alert("삭제시작");
 		} */
 		
 		// 체크박스가 2개 체크되어있으면 length가 2
 		var checkBoxes = document.querySelectorAll('input[name="tableCheckBox"]:checked');
 		/* console.log("몇개선택함?-> "+ checkBoxes.length); */
 		
 		if(checkBoxes.length == 0){
 			alert("품목을 선택해 주세요");
 		}
 		
 		// for문에서 마지막 for문에서만 alert를 내기 위해 사용
 		var updateCount = 0;
 		
 		for(var i = 0; i<checkBoxes.length; i++){
 			// rowindex는 1부터 시작하므로 -1을 해주어야 ${status.index}와 맞출 수 잇다.
			// 체크 된 체크 박스가 몇번째 테이블 로우 인지 알아내는 법
			var rowIndex = (checkBoxes[i].parentNode.parentNode.rowIndex)-1;
 			/* console.log("로우 인덱스-> "+rowIndex); */
			
 			var departmentDto 	= getCheckBoxData(rowIndex, kindNumber);
 			var deptCode	= document.getElementById("deptCode"+rowIndex).value;
 			
 			$.ajax({
 				url 	 : "/standard/dept/"+deptCode,
 				dataType : "json",
 				type 	 : "PUT",
 				data	 : departmentDto,
 				success	 : data =>{
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
	function modifyDeptListBtn(kindStatus){
		// kindStatus 파라미터 1 = 수정
		// kindStatus 파라미터 2 = 삭제
		var result = false;
		
		if(kindStatus == 1){
			result = confirm("수정하시겠습니까?");
			if(result){
				modifyDeptList(kindStatus);
			}else{
				return false;
			}
		}else if(kindStatus == 2){
			result = confirm("삭제하시겠습니까?");
			if(result){
				modifyDeptList(kindStatus);
			}else{
				return false;
			}
		}
	}
 	
 	function searchDeptList(){
 		/* alert("검색시작"); */
 		
 		var deptName = $("#filterDeptName").val().trim();
 		/* console.log("deptName ->"+deptName); */
 		
 		if (deptName == null || deptName == "") {
 			deptName = "";
		  }
 		
 		var html = "";
 		
 		$.ajax({
 			url : "/standard/dept/search/",
 			dataType : "json",
 			type : "GET",
 			data : {
 				deptName : deptName
 			},
 			success : function(data){
 				var count = 1;
 				/* 없는 이름으로 검색한 경우에만 데이터가 없다는 것을 표시하기 위함.  */
 				if(deptName != "" && data == null || data.length == 0){
 					html += "<tr><td colspan = '9'><span id='searchName'>'"+deptName+"'</span> 검색결과가 없습니다.</td></tr>";
	 				$(".deptTableTbody").html(html);
 				}else{
 					
	 				$(data).each(function(index){
	 					html += "<tr onclick='showMemberOfDept("+index+")'>";
	 				
	 					html += "<td><input type='text' class='rowCount' name='rn' value ='"+ count++ +"' disabled='disabled'></td>";
	 			        html += "<td><input type='checkbox' class='tableCheckBox' name='tableCheckBox' id='tableCheckBox"+index+"'></td>";
	 			        html += "<td class ='bg-gray'><input type='text' class ='bg-gray' name='deptCode' id='deptCode"+index+"' value='"+this.deptCode+"' disabled='disabled'></td>";
	 			        html += "<td class ='bg-yellow'><input type='text' class ='bg-yellow' name='deptName' id='deptName"+index+"' value='"+this.deptName+"' required='required'></td>";
	 			        html += "<td class ='bg-yellow'><input type='text' class ='bg-yellow' name='regDate' id='regDate"+index+"' value='"+(this.regDate || "")+"' required='required'></td>";
	 			        html += "<td class ='bg-yellow'><input type='text' class ='bg-yellow' name='regUser' id='regUser"+index+"' value='"+(this.regUser || "")+"' required='required'></td>";
	 			        html += "<td class ='bg-yellow'><input type='text' class ='bg-yellow' name='updateDate' id='updateDate"+index+"' value='"+(this.updateDate || "")+"' required='required'></td>";
	 			        html += "<td class ='bg-yellow'><input type='text' class ='bg-yellow' name='updateUser' id='updateUser"+index+"' value='"+(this.updateUser || "")+"' required='required'></td>";
	 			        html += "<td class ='bg-gray'><input type='text' class ='bg-gray' name='deptYn' id='deptYn"+index+"' value='"+this.deptYn+"' disabled='disabled'></td>";
	 					html += "</tr>";
	 				})
 				}
 				$("#deptTableTbody").html(html);
 			}
 		});
 	}
 	
 	function resetDeptList(){
 		location.reload();
 	}
 	
 	function insertDeptList(){
 		var result = confirm("등록하시겠습니까?");
 		
 		if(result){
 			
	 		var deptName = $("#modalDeptName").val().trim();
	 		if(deptName == "" || deptName == null){
	 			alert("부서이름은 필수 입력값 입니다.");
	 			return false;
	 		}
	 		/* console.log("등록할 부서이름-> "+deptName); */
	 		
	 		$.ajax({
	 			url : "/standard/dept/"+deptName,
	 			dataType : "json",
	 			type : "POST",
	 			data : {
	 				deptName : deptName
	 			},
	 			success : data =>{
	 				if(data == 1){
	 					alert("등록되었습니다.");
	 				}else if(data == 2){
	 					alert("같은 이름의 부서가 존재합니다.");
	 				}else{
	 					alert("등록에 실패하였습니다.");
	 				}
	 				location.reload();
	 			}
	 		})
 		}else{
 			return false;
 		}
 	}
 	
 	function showMemberOfDept(index){
 		var deptCode = $("#deptCode"+index).val();
 		/* console.log(deptCode); */
 		var html = "";
 		
 		$.ajax({
 			url: "/standard/dept/member/" + deptCode,
 			dataType : "json",
 			type : "GET",
 			data : {
 				deptCode : deptCode
 			},
 			success : function(data){
 				if(data == null || data.length == 0){
 					html += "데이터가 없습니다.";
 				} else{	
	 				var count = 1;
	 				html += "<div class='filter'>";
	 				html += "<div class='form-data'>직원명</div>";
	 				html += "<div class='form-content'><input type='text' name='memberName' id = 'filterMemberName'>";
	 				html += "<button name='memberSearch' id='memberSearchBtn' onclick='memberSearch(\"" + deptCode + "\",1)'>조회</button></div>";
	 				html += "</div>";
					html += "<table id ='memberSearchTable'>";
					html += "<tr>";
					html += "<th></th>";
					html += "<th>이름</th>";
					html += "<th>이메일</th>";
					html += "<th>부서</th>";
					html += "<th>직급</th>";
					html += "<th>연락처</th>";
					html += "</tr>";
	 				$(data).each(function(){
	 					// 여기부터 tbody
	 					html += "<tr>";
	 					html += "<td><input type='text' class='rowCount' id='rn' name='rn' value='"+ count++ +"' disable='disable'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='memberName' name='memberName' value='"+this.memberName+"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='memberId' name='memberId' value='"+this.memberId+"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='deptName' name='deptName' value='"+this.deptName+"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='jobName' name='jobName' value='"+this.jobName+"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='tel' name='tel' value='"+this.tel+"' disabled='disabled'></td>";
	 					html += "</tr>";
	 					
	 				})
	 				html += "</table>";
 				}
 				$(".deptMember").html(html);
 			}
 		});
 	}
 	function memberSearch(ajaxDeptCode, kind){
 		/* alert("맴버서치 시작"+deptCode); */
 		
 		var memberName = $("#filterMemberName").val();
 		var deptCode = ajaxDeptCode;
 		/* console.log("검색-> "+memberName);
 		console.log("검색-> "+deptCode);
 		console.log("검색-> "+kind); */
 		
 		var html = "";
 		
 		$.ajax({
 			url: "/standard/dept/member/" + deptCode,
 			dataType : "json",
 			type : "GET",
 			data : {
 				deptCode 	: deptCode,
 				memberName 	: memberName,
 				kind		: kind
 			},
 			success : function(data){
 				if(data == null || data.length == 0){
 					html += "데이터가 없습니다.";
 				} else{
	 				var count = 1;
	 				html += "<div class='filter'>";
	 				html += "<div class='form-data'>직원명</div>";
	 				html += "<div class='form-content'><input type='text' name='memberName' id = 'filterMemberName'>";
	 				html += "<button name='memberSearch' id='memberSearchBtn' onclick='memberSearch(\"" + deptCode + "\",1)'>조회</button></div>";
	 				html += "</div>";
					html += "<table id ='memberSearchTable'>";
					html += "<tr>";
					html += "<th></th>";
					html += "<th>이름</th>";
					html += "<th>이메일</th>";
					html += "<th>부서</th>";
					html += "<th>직급</th>";
					html += "<th>연락처</th>";
					html += "</tr>";
	 				$(data).each(function(){
	 					// 여기부터 tbody
	 					html += "<tr>";
	 					
	 					html += "<td><input type='text' class='rowCount' id='rn' name='rn' value='"+ count++ +"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='memberName' name='memberName' value='"+this.memberName+"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='memberId' name='memberId' value='"+this.memberId+"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='deptName' name='deptName' value='"+this.deptName+"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='jobName' name='jobName' value='"+this.jobName+"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='tel' name='tel' value='"+this.tel+"' disabled='disable'></td>";
	 					html += "</tr>";
	 					
	 				})
	 				html += "</table>";
 				}
 				$(".deptMember").html(html);
 			}
 		});
 		
 	}
 	
 	</script>
