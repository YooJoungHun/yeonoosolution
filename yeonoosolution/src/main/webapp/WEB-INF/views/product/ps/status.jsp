<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>생산현황 검색</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            text-align: center;
        }

        form {
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 10px;
        }

        label {
            display: inline-block;
            width: 150px;
        }

        input[type="date"],
        input[type="text"] {
            width: 200px;
            padding: 5px;
        }

        button {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            cursor: pointer;
        }

        tbody tr:hover {
            background-color: #f5f5f5;
        }
    </style>
    <link rel="stylesheet" href="styles.css">
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
                    row.append($('<td>').text(item.item_code));
                    row.append($('<td>').text(item.item_name));
                    row.append($('<td>').text(item.item_quantity));
                    row.append($('<td>').text(item.product_count_y));
                    row.append($('<td>').text(item.product_count_n));
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
            const nameInput = document.getElementById("name");
            nameInput.addEventListener("keypress", handleKeyPress);
            const codeInput = document.getElementById("code");
            codeInput.addEventListener("keypress", handleKeyPress);

            function handleKeyPress(event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                    openPopup();
                }
            }

            function openPopup() {
                window.open("/item/search");
            }
        });
    </script>
</head>
<body>
<h1>생산현황 검색</h1>

<form action="/api/product/status/production" method="get">
    <div class="form-group">
        <label for="start">생산 시작일자:</label>
        <input type="date" id="start" name="start" required>
    </div>

    <div class="form-group">
        <label for="end">생산 종료일자:</label>
        <input type="date" id="end" name="end" required>
    </div>

    <div class="form-group">
        <label for="name">품명:</label>
        <input type="text" id="name" name="name">
    </div>

    <div class="form-group">
        <label for="code">품목코드:</label>
        <input type="text" id="code" name="code">
    </div>

    <button type="submit">검색</button>
</form>

<table>
    <thead>
    <tr>
        <th>품목 코드</th>
        <th>품명</th>
        <th>작업지시 수량</th>
        <th>양품 수량</th>
        <th>불량 수량</th>
    </tr>
    </thead>
    <tbody></tbody>
</table>
</body>
</html>