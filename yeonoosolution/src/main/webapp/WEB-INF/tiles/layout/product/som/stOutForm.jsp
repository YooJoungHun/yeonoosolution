<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script defer src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		function stOutRadioCheck(index) {	
			var selOut_code = $('#idOutCode' + index).val();
			
			//alert(selOut_code);
			
			$.ajax({
				url : '/product/somStOutDetailLists/',
				type : 'GET',
				data : { outCode: selOut_code },
				dataType : 'html',
				success: function(stOutDetail) {
					
					$('#stOutDetailTable').html(stOutDetail);
					
				},
				error: function(error) {
				  console.error('Error:', error);
				}
			});
		}
		
		function openInsertStOutWindow() {
			var editUrl = "/product/somStOutInsertForm/";
			
			var editWindow = window.open(editUrl, "edit_window", "width=400, height=500");
		}
		
		function deleteStOut(){
			if(confirm("삭제하시겠습니까?")){
				var radioBtns = document.querySelector('input[name="selectRadio"]:checked');
				
				var rowIndex = (radioBtns.parentNode.parentNode.rowIndex)-1;
				
				alert("라디오 로우인덱스 -> "+rowIndex);
				
				var DelOut_code = document.getElementById("idOutCode"+rowIndex).value;
				alert("출고번호 -> "+ DelOut_code);
				
				$.ajax({
					url : '/product/somStOutDelete/',
					type : 'Patch',
					data : { outCode: DelOut_code },
					dataType : 'text',
					success: function(data) {
						if(parseInt(data) == 1){
							alert("삭제되었습니다");
							location.reload();
						}
					},
					error: function(error) {
					  console.error('Error:', error);
					}
				});
				
				
			}
			
		}
		
	</script>
	
	<style type="text/css">
		
		.stOutAll {
			display: flex;
		}
		
		.stOutFormDiv{
			margin: 30px;
		}
		
		input {
			height: 1.6rem;
		}
		
		#stOutTable {
    		border-collapse: collapse;
			background-color: #F8F8F8;
			padding: 20px;
			width: 120%;
			text-align: center;
		}
		
		#stOutDetailTable {
    		border-collapse: collapse;
			background-color: #F8F8F8;
			padding: 20px;
			width: 120%;
			text-align: center;
		}
		
		th {
			background-color: #909090;
		}
		
		tr:nth-child(even) {
			background-color: #D8D8D8;
		}
		
		tr:hover {
			background-color: #7C96C9;
		}
		
		.side-bar {
			border: 1px solid #ddd;
			padding: 20px;
			float: left;
			height: 100vh;
		}
		
		button {
			background-color: #F5F5F5;
			border: 1px solid #D6DAE2;
			outline: none;
			border-radius: 5px;
			padding: 0 12px;
			height: 32px;
		}
		
		button:not(:last-child) {
			margin-right: 4px;
		}
		
		button:hover {
			background-color: #8EA8DB;
		}
		
	</style>
	


