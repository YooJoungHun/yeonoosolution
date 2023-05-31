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
		.table1 th {
					background-color: #FAF4C0;
					}
					
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
 
		function itemList(outCode) {
			  $.ajax({
			    url: '/itemList',
			    type: 'GET',
			    data: { outCode: outCode },
			    success: function(response) {

			    	$('#outDetailTable tbody').empty();
			    	
			        $.each(response.outDetailList, function(index, outDetailList) {
			        	if (outDetailList.deleteStatus === 'N') {
			        	var rowIndex = index + 1;
			        	
			        	var row = '<tr>' +
			            '<td><input type="hidden" id="outCode' + rowIndex + '" value="' +outDetailList.outCode + '"></td>' +
			            '<td>' + outDetailList.sorder + '<input type="hidden" id="sorder' + rowIndex + '" value="' +outDetailList.sorder + '"></td>' +
			            '<td>' + outDetailList.itemCode + '</td>' +
			            '<td>' + outDetailList.itemName + '</td>' +
			            '<td>' + outDetailList.whCode + '</td>' +
			            '<td><input type="number" id="outQuantity' + rowIndex + '" name="outQuantity" value="' + outDetailList.outQuantity + '"></td>'+      
			            '<td>' + outDetailList.salesPrice + '</td>' +
			            '<td>' + outDetailList.totalPrice + '</td>' +
				        '<td><input type="text"  id="memo2' + rowIndex + '" name="memo2" value="' + (outDetailList.memo2 ? outDetailList.memo2 : '') + '"</td>' +
				        '<td><input type="button" id="updateItemRow" value="수정" onclick="goUpdateItemRow(' + rowIndex + ')"></td>' +
				        '<td><input type="button" id="deleteItem" value="삭제" onclick="goDeleteItem(' + rowIndex + ')"></td>' +
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
			      url: '/confirm',
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
				      url: '/confirmCancle',
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
				      url: '/stOutDelete',
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
				var selOutCode 		= $("#idoutCode"+countNum).val();
				var selCustomerCode = $("#customerCode"+countNum).val();
				var selOutDate 		= $("#outDate"+countNum).val();
				var selRegUser 		= $("#regUser"+countNum).val();
				var selMemo 		= $("#memo"+countNum).val();

	 			
	 			
	 			$.ajax({ 
	 					url:"/updateStOut",
	 					data: {outCode : selOutCode,
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
	 					url:"/updateItemStOut",
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
	 					url:"/deleteItemStOut",
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

<form name="form1" method="post">

			<button type="button" onclick="stOutDelete()">삭제</button>
			<button type="button" onclick="confirm()">출고확정</button>
			<button type="button" onclick="confirmCancle()">출고확정취소</button>
			<button type="button" onclick="location.href='/'">초기화</button><p>
			<button type="button" onclick="location.href='/new'">출고조회</button><p>
			
				
			
			
			
			<input type="submit" value="저장" formaction="/insertStOut" > 
	<table border="1" class="table1">
		<tr>
			<th>수주번호</th>
			<th>거래처코드</th>
			<th>기초기말구분</th>
		</tr>
		<tr>
			<td><input type="text"   name="orderCode" > </td> <!-- 신규등록 시 입력필수 x (수주번호 검색기능) -->
			<td><input type="text"   name="customerCode"  required="required" placeholder="필수"></td> <!-- 검색기능 -->
			<td><input type="number" name="beginEndInventory" ></td>
		</tr>
		<tr>
			<th>등록자</th>
			<th>출고일</th>
			<th>비고</th>
		</tr>
		<tr>
			<td><input type="text"       name="regUser"   required="required" placeholder="필수"></td>
			<td><input type="Date"  	 name="outDate"   required="required"></td>
			<td><input type="text"       name="memo" ></td>
		</tr>
	</table>
</form>	






<form name="form2" method="get" action="${pageContext.request.contextPath }/">

 	<h4>출고리스트</h4>

			<select name="customerCode" id="customerCode" onchange="showSelectedOption()">
				<option value="" selected>거래처코드 찾기</option>
				<c:forEach var="C" items="${companyCodeList}">
					<option value="${C.companyCode}">${C.companyCode}</option>
				</c:forEach>
			</select>
			
		<input type="submit" value="검색"><p>

</form>







<form name="form3" method="post" >
			<input type="hidden" name="_method" value="PATCH"> 
	<table border="1" class="table1"> 
			<tr>
				<th></th>
				<th></th>
				<th>출고번호</th>
				<th>상태</th>
				<th>거래처코드</th>
				<th>거래처명</th>
				<th>출고일자</th>
				<th>수주번호</th>
				<th>출고등록자</th>
				<th>등록일자</th>
				<th>수정자</th>
				<th>수정일자</th>
				<th>비고</th>
			</tr>
			<c:forEach var="OL" items="${outList}" varStatus="status">
			<c:choose>
				<c:when test="${OL.deleteStatus == 'N' }">
				<tr>
					<td><c:out value ="${status.count}"/><input type="hidden" value="${OL.outCode}" id="idoutCode${status.count}"></td>
					<td><input type="radio" name="rd1" onclick="itemList('${OL.outCode}')"></td> 
					<td><c:out 	value ="${OL.outCode}" /></td> 
					<td><c:out 	value ="${OL.outType}"/></td>
					
					<td>
						<select name="customerCode" id="customerCode${status.count}">
							<c:forEach var="C" items="${companyCodeList }">
								<option value="${C.companyCode }" ${C.companyCode == OL.customerCode ? 'selected' : '' }>${C.companyCode }</option>
								
							</c:forEach>
						</select>
					</td>
					
					<td><c:out 	value ="${OL.companyName}"/></td>
					<td><input  type="date" id="outDate${status.count}"  name="outDate" 	 value="${OL.outDate}"></td>
					<td><c:out 	value ="${OL.orderCode}"/></td>
					<td><input  type="text" id="regUser${status.count}"  	 name="regUser"  value="${OL.regUser}"></td>
					<td><c:out 	value ="${OL.regDate}" /></td>
					<td><c:out 	value ="${OL.updateUser}"/></td>
					<td><c:out 	value ="${OL.updateDate}" /></td>
					<td><input  type="text" id="memo${status.count}"		name="memo" 	 value="${OL.memo}"></td>
					
					<td><input type="button" id="updateRow" value="수정" onclick="goUpdateRow(${status.count})"></td>
				</tr>
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
</form>
	

 	<h4>품목리스트</h4>
 	
<form name="form4" method="post" > 	

	<input type="submit" value="제품추가" formaction="/insertStOutDetail">
	
	<input type="hidden" name="deleteStatus" >
	<input type="hidden" name="sorder" 		 >
	
 	<table border="1" class="table1">
		<tr>
			<th>출고번호</th>
			<th>사용가능 창고번호</th>
			<th>아이템코드</th>
			<th>수량</th>
			<th>비고</th>
		</tr>
		<tr>
			<td><select name="outCode" required="required">
				<option value="" selected>출고번호 찾기</option>
				<c:forEach var="OC" items="${outCodeList}">
					<option value="${OC.outCode}">${OC.outCode}</option>
				</c:forEach>
			</select></td>
			
			<td><select name="whCode" required="required">
				<option value="" selected>창고번호 찾기</option>
				<c:forEach var="WC" items="${whCodeList}">
					<option value="${WC.whCode}">${WC.whCode}</option>
				</c:forEach>
			</select></td>
			
			<td><select name="itemCode" required="required">
				<option value="" selected>제품번호 찾기</option>
				<c:forEach var="IC" items="${itemCodeList}">
					<option value="${IC.itemCode}">${IC.itemCode}</option>
				</c:forEach>
			</select></td>
			
			<td><input type="number"  name="outQuantity"   required="required"> </td> 
			<td><input type="text"    name="memo2" 		   ></td>
		</tr>
	</table><p>
</form>
 	
<form name="form5" method="post" >
			<input type="hidden" name="_method" value="PATCH"> 
	<table border="1" id="outDetailTable" class="table1"> 
			<thead>
			<tr>
				<th></th>
				<th>순번</th>
				<th>제품번호</th>
				<th>제품명</th>
				<th>창고번호</th>
				<th>수량</th>
				<th>단가</th>
				<th>총액</th>
				<th>비고</th>
			</tr>
			</thead>
			
			<tbody>
				
				
			</tbody>
	</table>  
</form>


</body>
</html>


	
		