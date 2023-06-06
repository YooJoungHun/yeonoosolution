<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		.side-bar {
			  flex: 0 0 210px;
		      border: 1px solid #ddd;
		      padding: 20px;
		      float: left;
		      height: 100vh;}
	    .All {
	   		 display: flex;}
	   	.AllWithoutSidebar {
	   						margin: 30px;
	   						border:   ;
	   					   }
	   						/* button {
									padding: 5px 8px;
									border-radius: 5px;
									font-size: 15px;
									} */
	   	
	   		 
		.insertForm-table  { margin-left: 20px;
				   			 background-color: #F6F6F6;
				   			 }
				   
		.insertForm-table th { font-weight: 450;
							   width: 15%;
							   height: 25px;}
		.insertForm-table td { 
				    		   height: 25px;}
				 
		.insertForm-required {
							  border: 1.5px solid #F15F5F;
							  border-radius: 7px;
							  font-weight: 600; font-size: 14px;
							  }
					  
		.insertForm-not-required { border: 1.5px solid #BDBDBD;
					  			   border-radius: 7px;
					  			   font-weight: 600; font-size: 14px;}
					  
		#insertForm-background-color {background-color:#F6F6F6;
									  width:70%;
									  height:100px;
									  border-radius: 15px;
									  align-items: center;
									  display: flex;
									  } 
		
		
		
		.stOutTable-class {
				 		   border-collapse: collapse;}
		.stOutTable-class th { 	
						 	  border-collapse: collapse;
						 	  position: sticky; top: 0; 
						 	  font-size: 13px;}
		.stOutTable-class 	td { 
								 font-size: 14px;
						 		 border: 1px solid #F6F6F6;
						 		 height: 35px;}
					 
		.itemInsertForm { border-collapse: collapse;
						  width:55%;  text-align:center;
				  		  border:1px solid black; border-collapse:collapse; 
}				
		.itemInsertForm  th { border:1px solid #9E9E9E; padding:7px 0;  font-size: 14px; height: 2mm;}
		.itemInsertForm  td { border:1px solid #9E9E9E; padding:5px 0; }
				
				
		.itemInsertForm	th { background-color: #F6F6F6;}
		
		.listColor1 { background-color: #E6E6E6;}
		.listColor2 { background-color: #E6F5FF;}
		.listColor3 { background-color: #FAF2C8;}
		.stOutTable-div {
						 height: 275px;
						 overflow-y: auto;
						 overflow-x: auto;}
		 			th {
						background-color: #F6F6F6;}
				
		.stOutTable-div tr:hover td,
		.stOutTable-div tr:hover td input,
		.stOutTable-div tr:hover td select{
		   								   background-color: #8C8C8C;}
		.stOutTable-div {border:1px solid #9E9E9E;}
		
		
		.itemTable {
					  width: 70%;
					  text-align: center;
					  border-collapse: collapse;
					}
					
		.itemTable th {
					  background-color: #F6F6F6;
					  border: 1px solid #FFFFFF;
					  font-size: 14px;
					  height: 7mm;
					}
					
		.itemTable td {
					  border: 1px solid #F6F6F6;
					  font-size: 14px;
					  height: 25px;
						 		 
					}
					
		.itemTable th:first-child,
		.itemTable td:first-child {
					  border-left: 1px solid #9E9E9E;
					}
					
		.itemTable th:last-child,
		.itemTable td:last-child {
					  border-right: 1px solid #9E9E9E;
					}
					
		.itemTable tr:first-child th,
		.itemTable tr:last-child td {
					  border-top: 1px solid #9E9E9E;
					}
					
		.itemTable tr:last-child td,
		.itemTable tr:last-child th {
					  border-bottom: 1px solid #9E9E9E;
					}
				     
				     
				     
		.itemTable input { border: none;
						   }
						  
		.itemTable tr:hover td,
		.itemTable tr:hover td input {
									  background-color: #8C8C8C;}
									  
		
		
		.all-button {
					    display: inline-flex;
					    align-items: center;
					    padding: 5px 10px;
					    background-color: #FFFFFF;
					    border: 1px solid;
					    border-radius: 5px;
					    border-color: #BDBDBD;
					 	}

		.button-icon {
					  width: 16px;
					  height: 16px;
					  margin-right: 5px;
					 }
		.all-button:hover {
						   background-color: #FFFFD2;
						   border-color: #888888;
						  }
		
		
		.stOut-update-button { display: inline-flex;
						       align-items: center;
						       background-color: #FFFFFF;
						       border: 1px solid; 
						       border-radius: 5px;
						       border-color: #BDBDBD;
						       height: 35px;
						 	 }
		.stOut-update-button-icon {
								   width: 18px;
								   height: 18px;
								   margin-right: 3px;
								  }
		.stOut-update-button:hover {
								    background-color: #FFFFD2;
								    border-color: #888888;
								   }
								   
		.stOut-notice { margin-left:440px;
						font-size: 15px;
						color: #5D5D5D;
						}
						
						
						
		.item-update-button { display: inline-flex;
						       align-items: center;
						       background-color: #FFFFFF;
						       border: 1px solid; 
						       border-radius: 5px;
						       border-color: #BDBDBD;
						       height: 23px;
						 	 }
		.item-update-button-icon {
								   width: 15px;
								   height: 15px;
								   margin-right: 3px;
								  }
		.item-update-button:hover {
								    background-color: #FFFFD2;
								    border-color: #888888;
								   }
								   
								   
		.item-delete-button { display: inline-flex;
						       align-items: center;
						       background-color: #FFFFFF;
						       border: 1px solid; 
						       border-radius: 5px;
						       border-color: #BDBDBD;
						       height: 23px;
						 	 }
		.item-delete-button-icon {
								   width: 15px;
								   height: 15px;
								   margin-right: 3px;
								  }
		.item-delete-button:hover {
								    background-color: #FFFFD2;
								    border-color: #888888;
								   }
								   
					
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
 
		function itemList(outCode) {
			  $.ajax({
			    url: '/sales/stock/'+outCode,
			    type: 'GET',
			    data: { outCode: outCode },
			    success: function(response) {

			    	$('#outDetailTable tbody').empty();
			    	
			        $.each(response.outDetailList, function(index, outDetailList) {
			        	if (outDetailList.deleteStatus === 'N') {
			        	var rowIndex = index + 1;
			        	
			        	var row = '<tr>' +
			            '<td>' + outDetailList.sorder + '<input type="hidden" id="sorder' + rowIndex + '" value="' +outDetailList.sorder + '"><input type="hidden" id="outCode' + rowIndex + '" value="' +outDetailList.outCode + '"></td>' +
			            '<td class="listColor2">' + outDetailList.itemCode + '</td>' +
			            '<td class="listColor1">' + outDetailList.itemName + '</td>' +
			            '<td class="listColor1">' + outDetailList.whCode + '</td>' +
			            '<td class="listColor2"><input type="number" id="outQuantity' + rowIndex + '" name="outQuantity" value="' + outDetailList.outQuantity + '" class="listColor2" style="width:40px;"></td>'+      
			            '<td class="listColor3">' + outDetailList.salesPrice + '</td>' +
			            '<td class="listColor1">' + outDetailList.totalPrice + '</td>' +
				        '<td><input type="text"  id="memo2' + rowIndex + '" name="memo2" value="' + (outDetailList.memo2 ? outDetailList.memo2 : '') + '"</td>' +
				        '<td><button type="button" class="item-update-button" id="updateItemRow"  onclick="goUpdateItemRow(' + rowIndex + ')"><img src="/images/stout-update-icon.png" alt="" class="item-update-button-icon">수정</button></td>'+
				        '<td><button type="button" class="item-delete-button" id="deleteItem"  onclick="goDeleteItem(' + rowIndex + ')"><img src="/images/stout-delete-icon.png" alt="" class="item-delete-button-icon">삭제</button></td>'+ 
			            '</tr>';

			          $('#outDetailTable tbody').append(row);
			          	console.log(outDetailList);
			        }
			        });
			    },
			    error: function(error) {
			      console.error('Error:', error);
			    }
			  });
			}

		/* =================================================== */
		
		
		/* 		  function confirmCancle() {   이미 저장인지 확인하기
			  var selectedRadio = document.querySelector('input[name="rd1"]:checked');
			  if (selectedRadio) {
			    var outCode = selectedRadio.parentNode.nextElementSibling.textContent;
				    
			    $.ajax({
						url:"/confirmCancleYN",
						type:'GET',
						dataType:'text',
						success:function(data){
							if(data == '1'){
								alert('확정상태에서만 취소가능합니다.');
							}else if(confirm("확정취소하시겠습니까?")){  

				    $.ajax({
				      url: '/confirmCancle',
				      type: 'POST',
				      data: { outCode: outCode },
				      success: function(response) {
				    	 alert("확정취소되었습니다.");
				      },
				      error: function(error) {
				      }
			          });
			        } else {
			          return false;
			        }
			      }
			    });
			  }
			} */

		
		  
		  
		  function confirm() { /* 출고확정 */
			  var selectedRadio = document.querySelector('input[name="rd1"]:checked');
			  if (selectedRadio) {
			    
				  var outCode = selectedRadio.parentNode.nextElementSibling.textContent;
				    
				 
				    
				    $.ajax({
				      url: '/sales/stock/confrim/'+outCode,
				      type: 'PATCH',
				      data: { outCode: outCode },
				      success: function(response) {
				    	 alert("확정으로 변경되었습니다.");
							location.reload();
				      },
				      error: function(error) {
				      }
				    });
				  
			  }
			}
		
		  function confirmCancle() { /* 출고확정취소 */
			  var selectedRadio = document.querySelector('input[name="rd1"]:checked');
			  if (selectedRadio) {
			    var outCode = selectedRadio.parentNode.nextElementSibling.textContent;
				    
			    $.ajax({
				      url: '/sales/stock/cancel/'+outCode,
				      type: 'PATCH',
				      data: { outCode: outCode },
				      success: function(response) {
				    	 alert("확정취소되었습니다.");
	 						location.reload();
				      },
				      error: function(error) {
				      }
			          });
			  
			  }
			}
		  
		  function stOutDelete() { /* 출고리스트 행 삭제 */
			  var selectedRadio = document.querySelector('input[name="rd1"]:checked');
			  if (selectedRadio) {
			    var outCode = selectedRadio.parentNode.nextElementSibling.textContent;
				    
			    $.ajax({
				      url: '/sales/stock/'+outCode,
				      type: 'DELETE',
				      data: { outCode: outCode },
				      success: function(response) {
				    	 alert("행이 삭제되었습니다."); 
	 						location.reload();
				      },
				      error: function(error) {
				      }
			          });
			  }
			}
			    
			    
		  /* function insertData() {
			  var companyCode = document.querySelector('input[name="companyCode"]').value;
			  var companyName = document.querySelector('input[name="companyName"]').value;
			  var outDate = document.querySelector('input[name="outDate"]').value;
			  var memberUid = document.querySelector('input[name="memberUid"]').value;
			  var memberName = document.querySelector('input[name="memberName"]').value;
			  var memo = document.querySelector('input[name="memo"]').value;

			  var data = {
			    companyCode: companyCode,
			    companyName: companyName,
			    shippingDate: shippingDate,
			    memberUid: memberUid,
			    memberName: memberName,
			    memo: memo
			  };

			  $.ajax({
			    url: '/your-controller-url',  
			    type: 'POST',
			    data: data,
			    success: function(response) {
			    },
			    error: function(error) {
			    }
			  });
			}
 */
 			function goUpdateRow(countNum){ /* 출고리스트 열 수정 */
				var outCode 		= $("#idoutCode"+countNum).val();
				var selCustomerCode = $("#customerCode"+countNum).val();
				var selOutDate 		= $("#outDate"+countNum).val();
				var selRegUser 		= $("#regUser"+countNum).val();
				var selMemo 		= $("#memo"+countNum).val();

	 			
	 			
	 			$.ajax({ 
	 					url:"/sales/stock/stout/"+outCode,
	 					data: {outCode : outCode,
	 						   customerCode : selCustomerCode,
	 						   outDate : selOutDate,
	 						   regUser : selRegUser,
	 						   memo : selMemo},
	 					dataType:'text',
	 					type : 'PATCH',
	 					success:function(data){
	 						alert("수정되었습니다");
	 						location.reload();
	 					}
	 			});
 			}
 
 			function goUpdateItemRow(rowIndex){ /*  품목리스트 열 수정  */
				var outCode 	= $("#outCode"+rowIndex).val();
				var sorder 		= $("#sorder"+rowIndex).val();
				var outQuantity = $("#outQuantity"+rowIndex).val();
				var memo2 		= $("#memo2"+rowIndex).val();
	 			
	 			$.ajax({ 
	 					url:"/sales/stock/item/"+outCode,
	 					data: {outCode : outCode,
	 						   sorder : sorder,
	 						   outQuantity : outQuantity,
	 						   memo2 : memo2},
	 					dataType:'text',
	 					type : 'PATCH',
	 					success:function(data){
	 						alert("수정되었습니다");
	 						location.reload();
	 					}
	 			});
 			}
 			
 			function goDeleteItem(rowIndex){ /* 품목리스트 행 삭제 */
				var outCode   = $("#outCode"+rowIndex).val();
				var sorder	  = $("#sorder"+rowIndex).val();
	 			
	 			$.ajax({ 
	 					url:"/sales/stock/deletion/"+outCode,
	 					data: {outCode : outCode,
	 						   sorder : sorder},
	 					dataType:'text',
	 					type : 'PATCH',
	 					success:function(data){
	 						alert("삭제되었습니다");
	 						location.reload();
	 					}
	 			});
 			}
 
	
			/* $(() => {
				$('.updateForm').click(e => {								
					if ($(e.target).closest('.allOutList').find('.customerCode').is(':disabled')) { 
						$(e.target).closest('.allOutList').find('.customerCode').prop('disabled', false);
					}
					if ($(e.target).closest('.allOutList').find('.outDate').is(':disabled')) { 
						$(e.target).closest('.allOutList').find('.outDate').prop('disabled', false);	
					}
					if ($(e.target).closest('.allOutList').find('.regUser').is(':disabled')) { 
						$(e.target).closest('.allOutList').find('.regUser').prop('disabled', false);
					}
					if ($(e.target).closest('.allOutList').find('.memo').is(':disabled')) { 
						$(e.target).closest('.allOutList').find('.memo').prop('disabled', false);
					}
					$(e.target).closest('.allOutList').find('.updateRow').toggle();				
					$(e.target).closest('.allOutList').find('.updateForm').toggle();			
				});
			}); */
			
			function showSelectedOption() { // 검색 거래처 코드 드롭다운 (지정이 없을 땐 "거래처코드 검색"이 보이도록)
				var selectElement = document.getElementById("customerCode");
				var selectedOption = selectElement.options[selectElement.selectedIndex];
				var selectedValue = selectedOption.value;

					if (selectedValue === "") {
					} else {
					}
				} 
			
			function customerCodeSearch(customerCode) {
			   	  
			   	  $.ajax({
			   				url:"/",
			   				data: {customerCode : customerCode},
			   				type:'GET',
			   				dataType:'text',
			   				success:function(data){
			   				}
			   	  		});
			   		  }
			
			
			
			
			

			


</script>
</head>
<body>
<div class="All">

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
      <a href="/sales/analysis-of-materials">자제소요분석</a><p>
      <a href="/sales/receive-order">수주서 관리</a><p>
      <a href="/sales/stock/">출고 등록</a><p>
      <a href="/sales/stock/detail/">출고 조회</a><p>
      <a href="/sales/order">구매</a><p>
      <a href="/sales/stock-in">구매입고등록</a><p>
      
      <!-- standard -->
      <a href="/standard/login">로그인</a><p>
      <a href="/standard/user-admin">사용자 계정관리</a><p>
      <a href="/standard/imi">품목 관리 및 등록</a><p>
      <a href="/standard/ipi">품목 단가 관리</a><p>
      <a href="/standard/pmi">품목 관리 정보</a><p>
      
      <!-- 로그아웃 -->
      <c:if test="${sessionScope.member != null}">
         <form action="/standard/logout" method="POST">
            <button type="submit">로그아웃</button>
         </form>
      </c:if>
      
   </div>


<div class="AllWithoutSidebar">
<form name="form1" method="post" action="/sales/stock">

			<button type="submit" class="all-button">
			  <img src="/images/stout-insert-icon.png" alt="" class="button-icon">
			  저장
			</button>
		
			<button type="button" onclick="stOutDelete()" class="all-button">
			<img src="/images/stout-delete-icon.png" alt="" class="button-icon">
  				삭제
  			</button>
			
			<button type="button" onclick="location.href='/sales/stock/'" class="all-button">
			<img src="/images/stout-reset-icon.png" alt="" class="button-icon">
			초기화
			</button>
			
			<button type="button" onclick="confirm()" class="all-button">
			<img src="/images/stout-confirm-icon.png" alt="" class="button-icon">
			출고확정
			</button>
			
			<button type="button" onclick="confirmCancle()" class="all-button">
			<img src="/images/stout-confirm-cancle-icon.png" alt="" class="button-icon">
			출고확정취소
			</button>
			
			<button type="button" onclick="location.href='/sales/receive-order'" class="all-button">
			<img src="/images/stout-order-find-icon.png" alt="" class="button-icon">
			수주서 찾기
			</button><p>
			
		
				
			
			
<div id="insertForm-background-color">
	<table  class="insertForm-table" >
		<tr>
			<th class="insertForm-not-required" style="width: 50px;">수주번호</th>
			<td><input type="text"   name="orderCode" style="width:90px; height:22px; border-radius: 3px; border: 1px solid;" > </td>
			
			<th class="insertForm-required">거래처코드</th>
			<td><select name="customerCode" style="width:110px; height:26px; border-radius: 3px; border: 1px solid;" required="required"  onchange="showSelectedOption()">
							<option value="" selected >거래처코드 찾기</option>
							<c:forEach var="C" items="${companyCodeList }">
								<option value="${C.companyCode }" ${C.companyCode == OL.customerCode ? 'selected' : '' }>${C.companyCode }</option>
							</c:forEach>
			</select></td>
			
			
			<th class="insertForm-required" style="width: 4.2cm;" >기초기말구분</th>
			<td><input type="number" name="beginEndInventory" required="required" placeholder="0또는1"  style="width:55px; height:22px; border-radius: 3px; border: 1px solid;" ></td> 
		</tr>
		<tr>
			<th class="insertForm-required">출고일</th>
			<td><input type="Date"  	 name="outDate"   required="required" style="height:22px; border-radius: 3px; border: 1px solid;" ></td>
			<th class="insertForm-not-required">비고</th>
			<td><input type="text"       name="memo"  style="height:22px; border-radius: 3px; border: 1px solid;" ></td>
		</tr>
	</table>
			<input type="hidden"       name="regUser"   value="${memberName}">

</div>
</form>	



<form name="form2" method="get" action="${pageContext.request.contextPath }/sales/stock/">

 	 	<span style="font-size: 20px;	font-weight: 650; font-family: cursive; ">출고리스트</span>&nbsp;&nbsp;&nbsp;&nbsp;
 	

			<select name="customerCode" id="customerCode" onchange="showSelectedOption()" style="width:130px;height:30px;border-radius: 10px; ">
				<option value="" selected >&nbsp;&nbsp;거래처코드 찾기</option>
				<c:forEach var="C" items="${companyCodeList}">
					<option value="${C.companyCode}">${C.companyCode}</option>
				</c:forEach>
			</select>
		
		<button type="submit" class="all-button" style="margin-top: 50px;">
			  <img src="/images/stout-search-icon.png" alt="" class="button-icon">
			  검색
		</button>
		
		<a class="stOut-notice" style="line-height:300%"> ⦁ 거래처 코드, 출고일자, 비고 수정가능합니다.</a>
		
</form>


<form name="form3" method="post" >
			<input type="hidden" name="_method" value="PATCH"> 
			
<div class="stOutTable-div" id="table-size">
	<table class="stOutTable-class"  style="table-layout: fixed;"> 
	 	
			<tr>
				<th></th>
				<th></th>
				<th>출고번호</th>
				<th>상태</th>
				<th>거래처코드</th>
				<th>거래처명</th>
				<th>출고일자</th>
				<th>수주번호</th>
				<th>출고<br/>등록자</th>
				<th>등록일자</th>
				<th>수정자</th>
				<th>수정일자</th>
				<th>비고</th>
				<th></th>
			</tr>
			<c:forEach var="OL" items="${outList}" varStatus="status">
			<c:choose>
				<c:when test="${OL.deleteStatus == 'N' }">
				<tr>
					<td style="text-align:center;"><c:out value ="${status.count}"/><input type="hidden" value="${OL.outCode}" id="idoutCode${status.count}"></td>
					<td><input type="radio" name="rd1" onclick="itemList('${OL.outCode}')"></td> 
					<td class="listColor1"><c:out 	value ="${OL.outCode}" /></td> 
					<td style="width: 40px; text-align:center;" class="listColor1"><c:out 	value ="${OL.outType}"/></td>
					
					<td class="listColor2">
						<select name="customerCode" id="customerCode${status.count}" class="listColor2" style="border:none;">
							<c:forEach var="C" items="${companyCodeList }">
								<option value="${C.companyCode }" ${C.companyCode == OL.customerCode ? 'selected' : '' }>${C.companyCode }</option>
								
							</c:forEach>
						</select>
					</td>
					
					<td style="width: 90px;" class="listColor1"><c:out 	value ="${OL.companyName}"/></td>
					<td class="listColor2"><input  type="date" id="outDate${status.count}"  name="outDate" 	 value="${OL.outDate}" class="listColor2" style="border:none;"></td>
					<td class="listColor1"><c:out 	value ="${OL.orderCode}"/></td>
					<td style="width: 40px;" class="listColor2"><c:out 	value ="${OL.regUser}"/></td>
					<td style="width: 80px;" class="listColor1"><c:out 	value ="${OL.regDate}" /></td>
					<td style="width: 40px;" class="listColor1"><c:out 	value ="${OL.updateUser}"/></td> 
					<td style="width: 80px;" class="listColor1"><c:out 	value ="${OL.updateDate}" /></td> 
					<td><input  type="text" id="memo${status.count}"		name="memo" 	 value="${OL.memo}" style="border:none; height:25px;"></td>

					<td><button type="button" class="stOut-update-button" id="updateRow" onclick="goUpdateRow(${status.count})" >
				  		<img src="/images/stout-update-icon.png" alt="" class="stOut-update-button-icon">
				  		수정
					</button></td>
				
				
				</tr>
					<input  type="hidden" name="updateUser" 	 value="${memberName}">
				</c:when>	
			</c:choose>
			
			<%-- <tr>
				<td><c:out value ="${status.count}"/></td>
				<td><input type="hidden" value="${OL.outCode}" id="idoutCode${status.count}"></td>
				<td><input type="radio" name="rd1" onclick="itemList('${OL.outCode}')"></td> 
 				<td><c:out value ="${OL.outCode}" /></td> 
				<td><c:out value ="${OL.outType}"/></td>
				<td><input type ="text" id="customerCode${status.count}" class="customerCode" disabled value="${OL.customerCode}"></td>
				<td><c:out value ="${OL.companyName}"/></td>
				<td><input type ="date" id="outDate${status.count}" 	 class="outDate" 	 disabled value="${OL.outDate}"></td>
				<td><c:out value ="${OL.orderCode}"/></td>
				<td><input type ="text" id="regUser${status.count}" 	 class="regUser" 	 disabled value="${OL.regUser}"></td>
				<td><c:out value ="${OL.regDate}"/></td>
				<td><c:out value ="${OL.updateUser}"/></td>
				<td><c:out value ="${OL.updateDate}"/></td>
				<td><input type ="text" id="memo${status.count}" 	     class="memo"		 disabled value="${OL.memo}"></td>
			
				<td><button class="updateForm" >수정하기</button></td>
			
				<td ><input type="button" class="updateRow" value="수정완료" onclick="goUpdateRow(${status.count})"   disabled style="display: none;"></td>
			</tr> --%>    
			</c:forEach>			
			
	</table>
	</div>  
</form>
<script type="text/javascript">
			
			const container = document.getElementById('table-size');
			
			const tbody = container.querySelector('tbody');
			
			const rows = tbody.getElementsByTagName('tr');

			const table = container.querySelector('table');
			
			
			let rowsHeight = 0;
			for (let i = 0; i < rows.length; i++) {
			  rowsHeight += rows[i].clientHeight;
			}
			
			const tableWidth = table.clientWidth;
			
			const newHeight = Math.min(rowsHeight, 275);
			
			const newWidth = Math.min(tableWidth, 1400); 
			
			container.style.height = newHeight + 'px';
			container.style.width = newWidth + 'px'; 
			
			/* const container = document.getElementById('table-size');
			
			const tbody = container.querySelector('tbody');
		
			const rows = tbody.getElementsByTagName('tr');
		
			let rowsHeight = 0;
			for (let i = 0; i < rows.length; i++) {
			  rowsHeight += rows[i].clientHeight;
			}
		
			const newHeight = Math.min(rowsHeight, 275);
		
			container.style.height = newHeight + 'px'; */
		</script> 
<pre>


</pre>


<form name="form4" method="post" action="/sales/stock/item"> 	



 	<span style="font-size: 20px;	font-weight: 650; font-family: cursive; line-height: 250%; ">품목리스트 조회 및 추가</span>&nbsp;&nbsp;&nbsp;&nbsp;
	
	<button type="submit" class="all-button" >
		<img src="/images/stout-insert-icon.png" alt="" class="button-icon">
		제품추가
	</button>
	
	<input type="hidden" name="deleteStatus" >
	<input type="hidden" name="sorder" 		 >
	
	
 	<table border="1" class="itemInsertForm" >
		<tr>
			<th>출고번호</th>
			<th>사용가능 창고번호</th>
			<th>아이템코드</th>
			<th>수량</th>
			<th>비고</th>
		</tr>
		<tr>
			<td><select name="outCode" required="required" style="border:none;">
				<option value="" selected>출고번호 찾기</option>
				<c:forEach var="OC" items="${outCodeList}">
					<option value="${OC.outCode}">${OC.outCode}</option>
				</c:forEach>
			</select></td>
			
			<td><select name="whCode" required="required" style="border:none;">
				<option value="" selected>창고번호 찾기</option>
				<c:forEach var="WC" items="${whCodeList}">
					<option value="${WC.whCode}">${WC.whCode}</option>
				</c:forEach>
			</select></td>
			
			<td><select name="itemCode" required="required" style="border:none;">
				<option value="" selected>제품번호 찾기</option>
				<c:forEach var="IC" items="${itemCodeList}">
					<option value="${IC.itemCode}">${IC.itemCode}</option>
				</c:forEach>
			</select></td>
			
			<td><input type="number"  name="outQuantity"   required="required" placeholder="입력" style="width:60px;  height:20px; border:none;  text-align:center;"> </td> 
			<td><input type="text"    name="memo2" 		  placeholder="입력" style="  height:20px; border:none;   text-align:center;" ></td>
		</tr>
	</table><p>
</form>



<a style="line-height:200%; margin-left:10px; font-size: 15px; color: #5D5D5D;"> ⦁ 수량, 비고 수정가능합니다.</a>
<form name="form5" method="post" >

			<input type="hidden" name="_method" value="PATCH"> 
	<table border="1" id="outDetailTable" class="itemTable" > 
			<thead>
			<tr>
				<th>순번</th>
				<th>제품번호</th>
				<th>제품명</th>
				<th>창고번호</th>
				<th>수량</th>
				<th>단가</th>
				<th>총액</th>
				<th>비고</th>
				<th colspan='2'></th>
			</tr>
			</thead>
			
			<tbody>
				
				
			</tbody>
	</table>
		
</form>
</div>
</div>
<pre>





</pre>

</body>
</html>


	
		