<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
	
	body{
		width: 80%;
		margin: 0 auto !important;
	}
	
	.stockMoveRegistrationTable, .stockMoveDetailTable{
		display: black;
		width: 100%;
		border-collapse: collapse;
		text-align: center;

	}
	
	.divTable{
		height: 184px;
		overflow-y: auto;
		overflow-x: auto;
		position: relative;
	}

	.divTable td, .divTable, tr{
		white-space: nowrap;
	}
	
	.stockMoveRegistrationTable thead, .stockMoveDetailTable thead{
		position: sticky;
		top: 0;
		background: lightgray;
	}
	
	.stockMoveRegistrationTable td , .stockMoveDetailTable td{
		border: 1px solid darkgray;
		padding: 5px;
	}
	
	.stockMoveRegistrationTable tr[data-status='stMoveRegistrationAdd'] .moveDate,
	.stockMoveDetailTable tr[data-status='stMoveDetailAdd'] .itemCode,
	.stockMoveDetailTable tr[data-status='stMoveDetailAdd'] .whCodeIn,
	.stockMoveDetailTable tr[data-status='stMoveDetailAdd'] .moveMemo,
	.stockMoveDetailTable tr[data-status='stMoveDetailAdd'] .moveQuantity{
   		cursor: pointer;
   		background-color: #D4F4FA;
	}

	#saveBtn, #moveConfirmationBtn{
		cursor: pointer;
	}
	
	.buttons button, 
	#registrationBtns button, 
	#detailBtns button{
		background-color: white;
		border: 1px solid #D6DAE2;
		outline: none;
		border-radius: 5px;
		padding: 0 12px;
		height: 32px;
	}
	
	.buttons button:not(:last-child) {
		margin-right: 4px;
	}
	
	.buttons button:hover,
	#registrationBtns button:hover, 
	#detailBtns button:hover {
		background-color: #FFFFCC;
	}
	
	#registrationBtns, #detailBtns {
		text-align: right;
		margin: 10px auto;
	}
	
	
	.selected-row{
		background-color: #FFFFCC;
	}
	
	.moveMemo{
		background-color: #D4F4FA;
		max-width: 150px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		cursor: pointer;
	}

	#itemCodeTable, #whCodeInTable { 
		width: 100% !important;
	}
	
	#itemCodeTable tbody tr:hover,
	#whCodeInTable tbody tr:hover    {
		background-color: rgba(240,240,221,0.5);
		cursor: pointer;
	}

	.stockMoveRegistrationTable tr[data-delete-status='delete-registration'] td,
	.stockMoveDetailTable tr[data-delete-status='delete-detail'] td {
		background-color: darkgray;
		opacity: 0.9;
		text-decoration: line-through;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">