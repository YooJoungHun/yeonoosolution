<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
		
		.main-container {
				   		overflow: auto !important;
				   		margin-left: 30px;
				   	}

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

		
		.stout-with-item-table {
				 		   		border-collapse: collapse;}
		.stout-with-item-table th { 	
							 	  border-collapse: collapse;
							 	  position: sticky; top: 0; 
							 	  font-size: 13px;
							 	  }
		.stout-with-item-table 	td { 
									 font-size: 14px;
							 		 border: 1px solid #F6F6F6;
							 		 height: 35px;}
						 		 
		.stout-with-item-table-div {
									 height: 400px;
									 overflow-y: auto;
									 overflow-x: auto;}
		.stout-with-item-table-div	th {
										background-color: #F6F6F6;}
				
		.stout-with-item-table-div tr:hover td{
		   								   	   background-color: #8C8C8C;}
		.stout-with-item-table-div {border:1px solid #9E9E9E; width: 1200px;}
		
		.listColor1 { background-color: #D9D9D9;}
		.listColor2 { background-color: #E6F2FF;}
		.listColor3 { background-color: #FFFFCC;}
		.listColor4 { background-color: #FFC19E;}


</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


			function showSelect() { // 검색 거래처 코드 드롭다운 (지정이 없을 땐 "거래처코드 검색"이 보이도록)
				var selectElement = document.getElementById("customerCode");
				var selectedOption = selectElement.options[selectElement.selectedIndex];
				var selectedValue = selectedOption.value;
			
					if (selectedValue === "") {
					} else {
					}
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
			const newHeight = Math.min(rowsHeight, 400);
			const newWidth = Math.min(tableWidth, 1500); 
			
			container.style.height = newHeight + 'px';
			container.style.width = newWidth + 'px'; 
		});
		</script> 
