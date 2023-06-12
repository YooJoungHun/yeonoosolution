<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	    .All {
	   		 display: flex;
	   		 }
	   	.main-container {
	   		overflow: auto !important;
	   	}
	   	.AllWithoutSidebar { margin: 30px;}
	   					   
	   		 
		.insertForm-table  { margin-left: 20px;
				   			 background-color: #F6F6F6;
				   			 border-collapse: separate; 
				   			 }
				   
		.insertForm-table th { font-weight: 450;
							   width: 15%;
							   height: 25px;
							   }
							   
		.insertForm-table td { height: 25px; border-radius: 3px; border: none;}
			
		.insertForm-table input { height: 25px;}
				 
				 
				 
		.insertForm-required {
							  border: 1.5px solid #F15F5F;
							  border-radius: 7px;
							  font-weight: 600; font-size: 14px; 
							  }
					  
		.insertForm-not-required { border: 1.5px solid #BDBDBD;
					  			   border-radius: 7px;
					  			   font-weight: 600; font-size: 14px;}
					  
		.color-notice { width: 51px; height:20px; font-size:11px; text-align: center;  border-radius: 7px;  margin-bottom: 7px;}
		
		
		#insertForm-background {background-color:#F6F6F6;
									  width:80%;
									  height:120px;
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
				  		  border:1px solid black; border-collapse:collapse; }				
		.itemInsertForm  th { border:1px solid #9E9E9E; padding:7px 0;  font-size: 14px; height: 2mm;}
		.itemInsertForm  td { border:1px solid #9E9E9E; padding:5px 0; }
				
				
		.itemInsertForm	th { background-color: #F6F6F6;}
		
		.listColor1 { background-color: #D9D9D9;} 
		.listColor2 { background-color: #E6F2FF;} 
		.listColor3 { background-color: #FFFFCC;} 
		.stOutTable-div {
						 height: 275px;
						 overflow-y: auto;
						 overflow-x: auto;}
		 .stOutTable-div th {background-color: #F6F6F6;}
				
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
								   
		.stOut-notice { margin-left:430px;
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
			            '<td class="listColor2"><input type="number" id="outQuantity' + rowIndex + '" name="outQuantity" value="' + outDetailList.outQuantity + '" class="listColor2" style="width:70px;">EA</td>'+      
			            '<td class="listColor3" style="width:80px;">' + outDetailList.salesPrice + '원</td>' +
			            '<td class="listColor1">' + outDetailList.totalPrice + '원</td>' +
				        '<td><input type="text"  id="memo2' + rowIndex + '" name="memo2" value="' + (outDetailList.memo ? outDetailList.memo : '') + '"</td>' +
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

		
		
		 
		/*  function confirmCancel() {
			  var selectedRadio = document.querySelector('input[name="rd1"]:checked');
			  if (selectedRadio) {
			    var outCode = selectedRadio.parentNode.nextElementSibling.textContent;

			    $.ajax({
			      url: '/sales/stock/confirmCanelYN/' + outCode,
			      type: "GET",
			      dataType: "text",
			      data: {outCode : outCode},
			      success: function (data) {
					        if (data === "1") {
					          alert("확정상태에서만 취소가능합니다.");
					        } else if (confirm("확정취소하시겠습니까?")) {
			          
			        $.ajax({
			            url: "/sales/stock/cancel/" + outCode,
			            type: "PATCH",
			            data: { outCode: outCode },
			            success: function (response) {
					              alert("확정취소 되었습니다.	");
					              location.reload();
			            },
			            error: function (error) {
			            },
			          });
			        }
			      },
			      error: function (error) {
			      },
			    });
			  } else {
			    return false;
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
		
		 function confirmCancel() {  
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

<script type="text/javascript">
		
		$(function(){
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
			
		});
		</script> 



	
		