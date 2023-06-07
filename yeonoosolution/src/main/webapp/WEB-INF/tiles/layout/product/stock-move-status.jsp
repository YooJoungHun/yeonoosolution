<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
	#stockMove{
		width: 100%;
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	#stockMove th{
		padding: 5px;
		background: lightgray;
	}
	
	#stockMove td {
		border: 1px solid darkgray;
		padding: 5px;
		text-align: center;
	}
	
	.buttons{
		display: block;
	}
	
	.buttons #searchBtn{
		cursor: pointer;
	}
	
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">