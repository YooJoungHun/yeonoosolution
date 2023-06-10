<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
	input {
		height: 1.6rem;
	}
	
	select {
		height: 1.9rem;
	}
	
	label {
		border: 1px solid #ddd;
		border-radius: 5px;
		padding: 5px;
	}
	
	.side-bar {
		border: 1px solid #ddd;
		padding: 20px;
		float: left;
		height: auto;
	}
	
	.container {
		width: 100%;
		display: flex;
	}
	
	.wh-data {
		border-collapse : collapse;
		padding: 20px;
		margin: 0 auto;
		white-space: nowrap;
		table-layout: fixed;
	}
	
	.content {
		display: inline-block;
		width: 80%;
		margin: 0 auto;
	}
	
	.wh-list {
		width: 100%; 
	    height: 400px; 
	    overflow: auto; 
		border: 1px solid #ddd;
		margin: 0 auto;
		background-color: #f8f8f8;
	}
	
	.input-div {
		display: flex;
		justify-content: space-between;
    	align-items: center;
	}
	
	.wh-data th, td {
		padding: 10px 20px;
		text-align: center;
		border: 1px solid #b3b3b3;
	}
	
	#item-name, #update-date {
		width: 200px;
	}
	
	.btn {
		background-color: white;
		border-radius: 5px;
		height: 30px;
		border: 1px solid navy;
		padding: 0 15px;
	}
	
	.btn:hover {
		background-color: navy;
		color: white;
		font-weight: bold;
	}
	
	.company-code, .member-name, .update-date {
		background-color: #d9d9d9;
	}
	
	.item-code, .item-name {
		background-color: #ffffcc;
	}
	
	.wh-code, .wh-name, .good-quantity, .bad-quantity {
		background-color: #e6f2ff;
	}
	
	.pagination {
		text-align: center;
		padding: 20px 0;
	}
	
	a {
		text-decoration: none;
	}
	
	.for-data:hover td {
		background-color: navy;
		color: white;
	}
</style>

<script type="text/javascript">
$(function(){
	$(".search-btn").on("click", function(){
		let whCode = $("#wh-name").val();
		console.log(whCode);
		if(whCode == null) {
			alert("조회하실 창고 이름을 선택해주세요");
			$("#wh-name").focus();
		} else {
			location.href="/product/is/wh/" + whCode;
		}
	});
});
</script>
