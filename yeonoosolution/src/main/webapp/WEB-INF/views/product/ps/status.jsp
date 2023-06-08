<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <form action="/api/product/status/production" method="get">
        <div class="ps-header">
        <div class="ps-header-item-group">
            <label for="start">생산 시작일자:</label>
            <input type="date" id="start" name="start" required>
        </div>

        <div class="ps-header-item-group">
            <label for="end">생산 종료일자:</label>
            <input type="date" id="end" name="end" required>
        </div>
        </div>

        <div class="ps-header">
            <div class="ps-header-item-group">
                <label for="name">품명:</label>
                <input type="text" id="name" name="name">
            </div>

            <div class="ps-header-item-group">
                <label for="code">품목코드:</label>
                <input type="text" id="code" name="code">
            </div>
        </div>
        <div class="ps-list-header-left">
            생산 현황
            <button type="submit">검색</button>
        </div>
    </form>
    <div class="ps-content">
    <div class="ps-list-header">
        <div class="ps-list-content">
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
        </div>
    </div>
</div>
</div>