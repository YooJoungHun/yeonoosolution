<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>제품 검색</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        var sortOrder = 'asc'; // Initial sort order

        $('form').submit(function(event) {
            event.preventDefault(); // Prevent form submission

            var formData = $(this).serialize(); // Serialize form data
            var url = $(this).attr('action'); // Get the form action URL

            // Exclude empty name and code parameters if they exist
            if ($('#name').val() === '') {
                formData = formData.replace('&name=', '');
            }
            if ($('#code').val() === '') {
                formData = formData.replace('&code=', '');
            }

            // Send an AJAX request to the server
            $.ajax({
                url: url,
                type: 'GET',
                data: formData,
                dataType: 'json',
                success: function(data) {
                    updateTable(data); // Update the table with the received data
                },
                error: function() {
                    alert('An error occurred while fetching data.');
                }
            });
        });

        function updateTable(data) {
            var tableBody = $('tbody');
            tableBody.empty(); // Clear the table body

            // Iterate over the data and append rows to the table
            $.each(data, function(index, item) {
                var row = $('<tr>');
                row.append($('<td>').html('<input type="checkbox" class="item-checkbox">'));
                row.append($('<td>').text(item.item_code));
                row.append($('<td>').text(item.item_name));
                tableBody.append(row);
            });
        }

        // Add click event listeners to table headers for sorting
        $('th').click(function() {
            var columnIndex = $(this).index();
            var table = $('table');
            var rows = table.find('tbody tr').toArray();

            // Sort the rows based on the clicked header column
            rows.sort(function(a, b) {
                var aValue = $(a).find('td').eq(columnIndex).text();
                var bValue = $(b).find('td').eq(columnIndex).text();

                if (sortOrder === 'asc') {
                    return aValue.localeCompare(bValue);
                } else {
                    return bValue.localeCompare(aValue);
                }
            });

            // Update the table with sorted rows
            table.find('tbody').empty().append(rows);

            // Toggle the sort order
            sortOrder = (sortOrder === 'asc') ? 'desc' : 'asc';
        });

        $(document).ready(function() {
            // Confirm button click event
            $('#confirm-button').click(function() {
                var checkedItems = $('.item-checkbox:checked'); // Get checked checkboxes

                if (checkedItems.length > 0) {
                    var itemName = checkedItems.closest('tr').find('td:nth-child(2)').text(); // Get item name
                    var itemCode = checkedItems.closest('tr').find('td:nth-child(3)').text(); // Get item code

                    // Set values in inputs
                    window.opener.$('#code').val(itemCode);
                    window.opener.$('#name').val(itemName);

                    // Close the current window
                    window.close();
                } else {
                    alert('Please select at least one item.');
                }
            });
        });

    });
</script>
<body>
<h1>제품 검색</h1>

<form action="/api/item_search" method="get">
    <div class="form-group">
        <label for="name">품명:</label>
        <input type="text" id="name" name="name">
    </div>

    <div class="form-group">
        <label for="code">제품 코드:</label>
        <input type="text" id="code" name="code">
    </div>
    <button type="submit">검색</button>
</form>

<table>
    <thead>
    <tr>
        <th> </th>
        <th>품명</th>
        <th>제품코드</th>
    </tr>
    </thead>
    <tbody></tbody>
</table>
<button id="confirm-button" type="button">확인</button>
</body>
</html>
