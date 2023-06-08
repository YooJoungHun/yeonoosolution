<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<style>
    html, body {
        width: 100%;
        height: 100%;
        padding: 0;
        margin: 1%;
    }

    .container {
        font-family: Arial, sans-serif;
        max-width: 800px;
        margin: 0 auto;
        margin-left: 1%;
    }

    .search {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin: 5px 0;
    }

    form {
        margin-bottom: 20px;
    }

    .form-group {
        display: flex;
        align-items: center;
        margin: 0;
    }

    .form-group > *:nth-child(2) {
        flex-grow: 1;
        min-width: 0;
        margin-left: 10px;
        padding: 0;
        height: 30px;
        border-radius: 5px;
        border: 1px solid #E8EBF0;
        font-size: 14px;
    }

    label {
        flex-shrink: 0;
        width: 100px;
        border-radius: 5px;
        border: 1px solid #E8EBF0;
        padding: 0;
        font-size: 14px;
        text-align: center;
        line-height: 30px;
    }

    input[type="text"] {
        flex-grow: 1;
        min-width: 0;
        margin-left: 10px;
        padding: 0;
        height: 30px;
        border-radius: 5px;
        border: 1px solid #E8EBF0;
        font-size: 14px;
        width: 100px;
    }

    button {
        background-color: white;
        border: 1px solid #D6DAE2;
        outline: none;
        border-radius: 5px;
        padding: 0 12px;
        height: 32px;
        font-size: 14px;
        margin-left: 10px;
    }

    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        var sortOrder = 'asc'; // Initial sort order

        $('form').submit(function (event) {
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
                contentType: 'application/json',
                success: function (data) {
                    updateTable(data); // Update the table with the received data
                },
                error: function () {
                    alert('An error occurred while fetching data.');
                }
            });

        });

        function updateTable(data) {
            var tableBody = $('tbody');
            tableBody.empty(); // Clear the table body

            // Iterate over the data and append rows to the table
            $.each(data, function (index, item) {
                var row = $('<tr>');
                row.append($('<td>').html('<input type="checkbox" class="item-checkbox">'));
                row.append($('<td>').text(item.item_code));
                row.append($('<td>').text(item.item_name));
                tableBody.append(row);
            });
        }

        // Add click event listeners to table headers for sorting
        var selectedColumnIndex = -1; // Variable to store the index of the currently selected column

        $('th').click(function () {
            var columnIndex = $(this).index();
            var table = $('table');
            var rows = table.find('tbody tr').toArray();

            // Sort the rows based on the clicked header column
            rows.sort(function (a, b) {
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

            // Remove background color from all tbody elements
            table.find('tbody').css('background-color', '');

            // Change background color of corresponding tbody elements
            table.find('tbody tr td:nth-child(' + (columnIndex + 1) + ')').css('background-color', '#FFFFCC');

            // Restore background color of previously selected tbody elements
            if (selectedColumnIndex !== -1 && selectedColumnIndex !== columnIndex) {
                table.find('tbody tr td:nth-child(' + (selectedColumnIndex + 1) + ')').css('background-color', '');
            }

            selectedColumnIndex = columnIndex; // Update the currently selected column index
        });


        $('#confirm-button').click(function () {
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
</script>
<body>
<div class="container">
    <form action="/api/item_search" method="get">
        <div class="search">
            <div class="form-group">
                <label for="name">품명:</label>
                <input type="text" id="name" name="name">
            </div>
            <div class="form-group">
                <label for="code">제품 코드:</label>
                <input type="text" id="code" name="code">
            </div>
            <button type="submit">검색</button>
        </div>
    </form>

    <table>
        <thead>
        <tr>
            <th></th>
            <th>품명</th>
            <th>제품코드</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
    <button id="confirm-button" type="button">확인</button>
</div>
</body>
</html>
