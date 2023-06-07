<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="user-admin-body">
	<div id="user-admin-contain">
		<div id="user-admin-content">
			<div id="user-admin-search-div">
				<div class="user-admin-search-member">
					<input type="text" id="user-admin-search-member-name" placeholder="사용자명으로 검색">
					<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</div>
				<div class="user-admin-search-member">
					<input type="text" id="user-admin-search-member-id" placeholder="사용자 ID로 검색">
					<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</div>
			</div>
			<div id="user-admin-btn-div">
				<button type="button" id="user-admin-member-save-btn" class="btn btn-dark">저장</button>
				<button type="button" id="user-admin-member-init-btn" class="btn btn-dark">초기화</button>
				<button type="button" id="user-admin-member-add" class="btn btn-dark">사용자 추가</button>
				<button type="button" id="user-admin-member-delete"class="btn btn-dark">선택 사용자 삭제</button>
			</div>
			<div class="user-admin-tuigrid-header">
				<div>사용자목록</div>
			</div>
			<div id="user-admin-member-list">
				<table id="user-admin-member-list-table" class="user-admin-member-list-table user-admin-member-tables user-admin-member-tables-hearder">
					<thead>
						<tr>
							<th class="user-admin-member-checkbox"></th>
							<th class="user-admin-dept-code">부서</th>
							<th class="user-admin-job-code">직책</th>
							<th class="user-admin-company-code">회사</th>
							<th class="user-admin-member-id">아이디</th>
							<th class="user-admin-member-name">이름</th>
							<th class="user-admin-member-address">주소</th>
							<th class="user-admin-member-tel">연락처</th>
							<th class="user-admin-member-role">권한</th>
						</tr>
					</thead>
				</table>
				<table id="user-admin-member-list-table" class="user-admin-member-list-table user-admin-member-tables">
					<tbody id="user-admin-member-list-table-body">
					</tbody>
				</table>
			</div>
		</div>
	</div><!-- contain -->
</div><!-- user-admin-body -->