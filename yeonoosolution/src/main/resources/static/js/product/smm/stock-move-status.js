/** stock-move-status page scripts
 * 
 */
$(document).ready(function() {
	$("#searchDateStart").datepicker({
		dateFormat: "yy-mm-dd",
		onClose: function(selectedDate) {
			$("#searchDateEnd").datepicker("option", "minDate", selectedDate);
		}
	}).attr("readonly", "readonly");
	
	$("#searchDateEnd").datepicker({
		dateFormat: "yy-mm-dd",
		onClose: function(selectedDate) {
			$("#searchDateStart").datepicker("option", "maxDate", selectedDate);
		}
	}).attr("readonly", "readonly");


	$('#searchBtn').click(function() {
		let keyword = $('#searchInput').val().toLowerCase().trim();
		
		let startDate = $('#searchDateStart').val();
		let endDate = $('#searchDateEnd').val();
		
		$.ajax({
			url: '/product/stockMoveSearch/',
			method: 'GET',
			data: {
				keyword: keyword,
				startDate: startDate,
				endDate: endDate
				},
			success: function(data) {
	            $("#stockMove tbody").empty();
	            /* tbody append */
	            $.each(data, function(index, item) {
	                var row = $("<tr>");
	                row.append($("<td class='moveCount'>").text(index + 1));
	                row.append($("<td class='moveCode'>").text(item.moveCode));
	                row.append($("<td class='moveDate'>").text(item.moveDate));
	                row.append($("<td class='itemCode'>").text(item.itemCode));
	                row.append($("<td class='itemName'>").text(item.itemName));
	                row.append($("<td class='stockQuantity'>").text(item.stockQuantity));
	                row.append($("<td class='whCodeOut'>").text(item.whCodeOut));
	                row.append($("<td class='whCodeIn'>").text(item.whCodeIn));
	                row.append($("<td class='moveQuantity'>").text(item.moveQuantity));
	                row.append($("<td class='moveType'>").text(item.moveType));
	                row.append($("<td class='memo'>").text(item.memo));
	                row.append($("</tr>"));
	
	                $("#stockMove tbody").append(row);
	            });
	        }
		});
	});
	
	$('#resetBtn').click(function (){
		$('#searchInput').val('');
		$('#searchDateStart').val('');
		$('#searchDateEnd').val('')
		//날짜 초기화
		$("#searchDateStart").datepicker("option", "maxDate", null);
		$("#searchDateEnd").datepicker("option", "minDate", null);
	});
});
