<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style type="text/css">
	.container {
		display: flex;
		width: 100%;
	}
	
	.main-container {
	 	overflow: auto !important;
	}
	
	.content {
		display: inline-block;
		margin: 0 auto;
		width: 90%;
		height: 80%;
	}
	
	.chart-area {
		display: inline-block;
	}
	
	.side-bar {
		border: 1px solid #ddd;
		padding: 20px;
		float: left;
		height: auto;
	}
	
	.info {
		width: 90%;
	    height: 300px;
	    border: 1px solid #ddd;
	    display: inline-block;
	    margin: 0 auto;
	    border-radius: 10px;
	    margin-left: 55px;
	    margin-bottom: 20px;
	    margin-top: 20px;
	    overflow: auto;
	}
	
	label {
		border: 1px solid #ddd;
		border-radius: 5px;
		padding: 5px;
		margin-left: 100px;
	}
	
	.chart-area {
		display: flex;
	}
	
	#chartContainer, #bar-chart-container {
		border: 1px solid #ddd;
		border-radius: 10px;
		text-align: center;
	}
	
	.company-code {
		margin-left: 250px;
	}

	.loss-table {
		overflow: auto;
	}
	
	.loss-table th, td {
		padding: 10px 20px;
		text-align: center;
		border: 1px solid #b3b3b3;
	}
	
	.loss-table {
		border-collapse : collapse;
		padding: 20px;
		white-space: nowrap;
		table-layout: fixed;
		background-color: #f8f8f8;
	}
	
	h2 {
		margin-left: 55px;
	}
	
	.work-order-code, .item-code {
		background-color: #e6f2ff;
	}
	
	.sorder, .defective-loss-quantity {
		background-color: #ffffcc;
	}
	
	.reg-user, .reg-date, .defective-loss-date {
		background-color: #d9d9d9;
	}
	
	.loss-list:hover td {
		background-color: navy;
		color: white;
	}
	
	#my-bar-chart {
		height: 80% !important;
		width: 300px !important;
	}
</style>

<script type="text/javascript">
	$(function(){
		let productType = $(".product-type").map(function() {
			  return $(this).val();
			}).get();
		
		let workOrderCount = $(".work-order-count").map(function() {
			return $(this).val();
		}).get();
		
		let receiveOrPlace = $(".receive-or-place").map(function() {
			return $(this).val();
		}).get();
		
		let ordersCount = $(".orders-count").map(function() {
			return $(this).val();
		}).get();
		
		if(productType.length == 0) {
			productType = ["일반", "재작업", "개발품(시제품)"];
			workOrderCount = ["0", "0", "0"];
		} else if(receiveOrPlace.length == 0) {
			workOrderCount = ["수주", "발주"];
			ordersCount = ["0", "0"];
		}
		
		console.log("productType : " + productType + ", workOrderCount : " + workOrderCount);
		 
		const ctx = document.getElementById('myChart').getContext('2d');
		const myChart = new Chart(ctx, {
		    type: 'doughnut',
		    data: {
		        labels: productType,
		        datasets: [{
		            label: '금일 작업 지시 현황',
		            data: workOrderCount,
		            backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)'],
		            borderColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)'],
		            borderWidth: 3
		        }]
		    },
		    options: {
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    }
		}
	 );
	
		console.log("receiveOrPlace : " + receiveOrPlace + ", ordersCount : " + ordersCount);
		
		const context = document.getElementById('my-bar-chart').getContext('2d');
		const myBarChart = new Chart(context, {
		    type: 'bar',
		    data: {
		        labels: receiveOrPlace,
		        datasets: [{
		            label: '금일 수발주 건 수',
		            data: ordersCount,
		            backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)'],
		            borderColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)'],
		            borderWidth: 3
		        }]
		    },
			options: {
				responsive: false,
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true,
							stepSize : 1,
						}
					}]
				}
			}
		}
	 );
});
</script>