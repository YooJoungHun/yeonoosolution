<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<div class = "jobListContainer">
 		
		
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel">신규 직급 입력</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="">
		        	  <div class="mb-3">
			            <label for="modalJobName" class="col-form-label">직급명:</label>
			            <input type="text" class="form-control" id="modalJobName" name="jobName" required="required">
			          </div>
			          <button type="reset" class="btn btn-primary" >초기화</button>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" onclick="insertJobList()">등록</button>
		      </div>
		    </div>
		  </div>
		</div>
		<div class = "content">
			
			<div class = "crudBtn">
				<button id = "searchBtn" onclick="searchJobList()">조회</button>
				<button id = "insertBtn" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop">등록</button>
				<button id = "saveBtn" 	 onclick="modifyJobListBtn('1')">저장</button>
				<button id = "deleteBtn" onclick="modifyJobListBtn('2')">삭제</button>
				<button id = "resetBtn"  onclick="resetJobList()">초기화</button>
			</div>
			
			
			<div class = "filter">
	
	 			<div class = "form-data">직급명</div>
	 			
	 			<div class = "form-content">
	 				<input type="text" name="jobName" id ="filterJobName" value="">
	 			</div>
	 			
	 		</div>
		
		
			<div class = "jobList">
				<div class = "jobTableTitle">
					직급 리스트
				</div>
				<div class="jobListInfo">
					<table id="jobListTable">
						<tr>
							<th></th>
	 						<th><input type="checkbox" class="tableCheckBox" id="allCheck" onclick ="checkBoxAllCheck()"></th>	 						
							<th>직급코드</th>
							<th>직급이름</th>
							<th>생성일자</th>
							<th>생성자</th>
							<th>수정일자</th>
							<th>수정자</th>
							<th>사용여부</th>
						</tr>
						<tbody id ="jobTableTbody">
							<c:forEach var ="jobList" items ="${jobDtoList }" varStatus="status">
								<tr onclick="showMemberOfJob(${status.index})">
									<td>
										<input type="text" class="rowCount" value="${status.count }" disabled="disabled">
									</td>
									<td>
										<input type="checkbox" class="tableCheckBox" id="tableCheckBox${status.index }" name="tableCheckBox">
									</td>
									<td class ="bg-gray">
									  	<input type="text" class ="bg-gray"   id="jobCode${status.index }" 	 name="jobCode" value="${jobList.jobCode }" disabled="disabled">
									</td>
									<td class ="bg-yellow">
										<input type="text" class ="bg-yellow" id="jobName${status.index }" 	 name="jobName" value="${jobList.jobName }">
									</td>
									<td class ="bg-yellow">
										<input type="text" class ="bg-yellow" id="regDate${status.index }" 	 name="regDate" value="${jobList.regDate }" disabled="disabled">
									</td>					
									<td class ="bg-yellow">
										<input type="text" class ="bg-yellow" id="regUser${status.index }" 	 name="regUser" value="${jobList.regUser }" disabled="disabled">
									</td>					
									<td class ="bg-yellow">
										<input type="text" class ="bg-yellow" id="updateDate${status.index }" name="updateDate" value="${jobList.updateDate }" disabled="disabled">
									</td>					
									<td class ="bg-yellow">
										<input type="text" class ="bg-yellow" id="updateUser${status.index }" name="updateUser" value="${jobList.updateUser }" disabled="disabled">
									</td>					
									<td class ="bg-gray">
										<input type="text" class ="bg-gray"   id="jobYn${status.index }"  name="jobYn" value="${jobList.jobYn }" disabled="disabled">
									</td>					
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class = "jobMember">
				</div>
			</div>
		</div>
 	</div> 
 	