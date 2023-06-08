<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <form action="/api/product/status/defect" method="get">
        <div class="ds-header">
            <div class="ds-header-item-group">
                <label for="start">조회 시작일자:</label>
                <input type="date" id="start" name="start" required>
            </div>

            <div class="ds-header-item-group">
                <label for="end">조회 종료일자:</label>
                <input type="date" id="end" name="end" required>
            </div>
        </div>
        <div class="ds-header">
            <div class="ds-header-item-group">
                <label for="name">품명:</label>
                <input type="text" id="name" name="name">
            </div>
            <div class="ds-header-item-group">
                <label for="code">품목코드:</label>
                <input type="text" id="code" name="code">
            </div>
        </div>
        <div class="ds-list-header-left">
            불량 현황
            <button type="submit">검색</button>
        </div>
    </form>
    <div class="ds-content">
        <div class="ds-list-header">
            <div class="ds-list-content">
                <table>
                    <thead>
                    <tr>
                        <th>불량 일자</th>
                        <th>품목코드</th>
                        <th>품명</th>
                        <th>불량 유형</th>
                        <th>불량 수량</th>
                        <th>작업자</th>
                        <th>메모</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</div>