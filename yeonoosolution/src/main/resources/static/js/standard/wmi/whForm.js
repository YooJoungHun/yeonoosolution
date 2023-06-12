	// 검색
	function searchWhList() {
		var selWh_code = $('#wh_code_search').val();
		var selWh_name = $('#wh_name_search').val();
		
		// alert("코드 -> "+ selWh_code);
		// alert("이름 -> "+ selWh_name);
		
		var whDto = {
				whCode : selWh_code, whName : selWh_name
		};
		
		$.ajax(
			{
				url : "/standard/warehouseSearchLists/",
				type : 'Get',
				data :  whDto,
				dataType : 'html',
				success : function(SearchR){
					// alert(SearchR);
					
					var tableUpdate = $('#warehouseTable').html(SearchR);
					// alert(tableUpdate);
					
				}
			}
		);
	}
	
	
	// 전부 로딩완료가 되면 실행되게 하기
	$(document).ready(function(){
		// 테이블 로우 클릭하면 체크박스가 체크되게 하기
		$("table tr").not("tr td").click(function(event){
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
		   // this = $("table tr").not("tr td").click
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
		var checkBoxes = document.querySelectorAll("input[type='checkbox']");
		var allCheck = document.getElementById("AllCheckBox");
		
		for(var i = 0; i < checkBoxes.length; i++){
		   	// allcheck가 체크가 되면 check박스 전부 체크해라
		   	checkBoxes[i].checked = allCheck.checked;
		}
	   
	}
	
	function openInsertWhWindow() {
		var editUrl = "/standard/warehouseInsertForm/";
		
		var editWindow = window.open(editUrl, "edit_window", "width=400, height=500");
		
	}
	
	
	function getCheckBoxData(rowIndex, kindNumber) {
	   var whCodeInput = document.getElementById("whCode"+rowIndex).value;
	   var whNameInput = document.getElementById("whName"+rowIndex).value;
	   var useYnInput = document.getElementById("useYn" + rowIndex).options[document.getElementById("useYn" + rowIndex).selectedIndex].value;
	   var updateUserInput = document.getElementById("updateUser"+rowIndex).value;
	   var memoInput = document.getElementById("memo"+rowIndex).value;
	   
	   // alert("useYnInput -> "+ useYnInput);
	   
	   var kindCheck = kindNumber;
	   
	   var checkBoxRowData = {
			 whCode  : whCodeInput,
			 whName  : whNameInput,
			 useYn : useYnInput,
			 updateUser : updateUserInput,
			 memo  : memoInput,
	        
	         kindN   : kindCheck
	   };
	   
	   return checkBoxRowData;
	}
	
	
	function modifyWhInfo(kindStatus){      
	   // number 파라미터 1 = 수정
	   // number 파라미터 2 = 삭제
	   var kindNumber = kindStatus;
	   if(kindNumber == 1){
	      alert("수정시작");
	   }else{
	      alert("삭제시작");
	   }
	   
	   
	   // 체크 박스를 2개 체크했으면 length가 2가 된다.
	   var checkBoxes = document.querySelectorAll('input[name="tableCheckBox"]:checked');
	   console.log(checkBoxes.length);
	   // alert("체크 갯수 -> "+ checkBoxes.length);
	   
	   // 체크 된게 없으면 길이가 0, 고로 리턴 false
	   if(checkBoxes.length == 0) {
		   alert("품목을 선택해 주세요");
		   return false;
	   } 
	   
	   // 최종 업데이트할 때만  alert뜨게 하기 위해서 사용 
	   var modifiedCount = 0;
	
	   
	   for(var i = 0; i<checkBoxes.length; i++){
	      // rowindex는 1부터 시작하므로 -1을 해주어야 ${status.index}와 맞출 수 잇다.
	      // 체크 된 체크 박스가 몇번째 테이블 로우 인지 알아내는 법
	      var rowIndex = (checkBoxes[i].parentNode.parentNode.rowIndex)-1;
	      console.log("로우 인덱스 -> "+rowIndex);
	      
	      var whDto     = getCheckBoxData(rowIndex, kindNumber);
	      // var warehouseCode    = document.getElementById("whCode"+rowIndex).value;
	      
	      // alert("useYn -> "+ whDto.useYn);
	      
	      $.ajax({
	         url : "/standard/warehouseModified/",
	         dataType : "json",
	         type : "PUT",
	         data : whDto,
	         success : data =>{
	        	 modifiedCount++;
	            if(modifiedCount == checkBoxes.length && data === 1 && kindNumber == 1){
	               alert("수정되었습니다.")
	               location.reload();
	            } else if(modifiedCount == checkBoxes.length && data != 1 && kindNumber == 1){
	               alert("수정에 실패하였습니다.")
	            }
	            if(modifiedCount == checkBoxes.length && data === 1 && kindNumber == 2){
	               alert("삭제되었습니다.")
	               location.reload();
	            } else if(modifiedCount == checkBoxes.length && data != 1 && kindNumber == 2){
	               alert("삭제 실패하였습니다.")
	            }
	            location.reload();
	         }
	      }); 
	   }      
	}