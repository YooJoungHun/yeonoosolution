<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    html, body {
        width: 100%;
        height: 100%;
        padding: 0;
        margin: 0;
    }

    .container {
        font-family: Arial, sans-serif;
        max-width: 800px;
        margin: 0 auto;
        margin-left: 1%;
    }


    .ds-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin: 5px 0;
    }

    .ds-header-item-group {
        display: flex;
        align-items: center;
        margin-right: auto;
    }

    .ds-header-item-group > label {
        flex-shrink: 0;
        width: 150px;
        border-radius: 5px;
        border: 1px solid #E8EBF0;
        padding: 0;
        font-size: 14px;
        text-align: center;
        line-height: 30px;
    }

    .ds-header-item-group > input {
        flex-grow: 1;
        min-width: 0;
        margin-left: 10px;
        padding: 0;
        height: 30px;
        border-radius: 5px;
        border: 1px solid #E8EBF0;
        font-size: 14px;
        width: 200px;
    }


    .ds-header-item-group > *:nth-child(2) {
        flex-grow: 1;
        min-width: 0;
        margin-left: 10px;
        padding: 0;
        height: 30px;
        border-radius: 5px;
        border: 1px solid #E8EBF0;
        font-size: 14px;
    }

    .ds-header-item-group.right button {
        margin-left: 10px;
    }

    .ds-content {
        margin-top: 20px;
    }

    .ds-list-header-left {
        display: flex;
        align-items: center;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 10px;
    }

    .ds-list-header-left button {
        background-color: white;
        border: 1px solid #D6DAE2;
        outline: none;
        border-radius: 5px;
        padding: 0 12px;
        height: 32px;
        font-size: 24px;
        margin-left: 10px;
    }

    .ds-list-header-left button:hover {
        background-color: #FFFFCC;
    }

    .ds-list-content

    hr {
        background-color: #DCDCDC;
        height: 2px;
        border: 0;
        width: 100%;
        margin: 8px;
    }

    label {
        font-weight: bold;
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
                row.append($('<td>').text(item.defective_loss_date));
                row.append($('<td>').text(item.item_code));
                row.append($('<td>').text(item.item_name));
                row.append($('<td>').text(item.defective_loss_type));
                row.append($('<td>').text(item.defective_loss_quantity));
                row.append($('<td>').text(item.reg_user));
                row.append($('<td>').text(item.memo));
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
            var width = 800; // 창의 너비
            var height = 400; // 창의 높이
            var options = "width=" + width + ", height=" + height;

            window.open("/item/search", "", options);
        }

    });
</script>