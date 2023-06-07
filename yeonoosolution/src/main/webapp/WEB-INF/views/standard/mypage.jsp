<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<div class = "myPageContainer">
 		
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel">비밀번호 변경</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		       <form>
		          <div class="mb-3">
		            <label for="modalPassword" class="col-form-label">현재 비밀번호:</label>
		            <input type="password" class="form-control" id="modalPassword" name ="password">
		          </div>
		          <div class="mb-3">
		            <label for="modalChangePassword" class="col-form-label">변경 비밀번호:</label>
		            <input type="password" class="form-control" id="modalChangePassword" name ="changePassword">
		          </div>
		          <div class="mb-3">
		            <label for="modalPasswordChk" class="col-form-label">변경 비밀번호 확인:</label>
		            <input type="password" class="form-control" id="modalPasswordChk" name ="passwordChk">
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" onclick="modifyPassword()">변경하기</button>
		      </div>
		    </div>
		  </div>
		</div>
 		<div class = "content">
	 		<div class = "crudBtn">
				<button id = "saveBtn" onclick="modifyMyInfo()">저장</button>
				<button id = "passwordModifyBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">비밀번호 변경 </button>
				<button id = "resetBtn" onclick="resetMyInfo()">초기화</button>
			</div>
 		
 			<div class = "picture">
 				<c:set var ="memberDto" value="${memberDtoList}"/>
	 				<div class = "myPictureTitle">
	 					<span id = "myPictureImgTitle">사진</span>
	 				</div>
	 				<div class = "myPicture">
	 					<img id="profileImg" alt="" src="${memberDto.memberImage }" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/upload/profile/alterImg.jpg';">
	 				</div>
		 			<div class = "myPictureUpload">
		 				<input type="file" id = "memberImage">
		 			</div>
 			</div>
 			
 			<div class = "myInfo">
 				<c:set var ="memberDto" value="${memberDtoList}"/>
					<form class="row g-3">
					  <div class="col-md-12">
					    <label for="memberId" class="form-label">아이디</label>
					    <input type="text" class="form-control" id="memberId" name = "memberId" value="${memberDto.memberId}" disabled="disabled">
					    <input type="hidden" class="form-control" id="memberUid" name = "memberUid" value="${memberDto.memberUid}" disabled="disabled">
					  </div>
					  <div class="col-md-12">
					    <label for="password" class="form-label">비밀번호</label>
					    <input type="password" class="form-control" id="password" name ="password" value="">
					  </div>
					  <div class="col-md-12">
					    <label for="passwordChk" class="form-label">비밀번호 확인</label>
					    <input type="password" class="form-control" id="passwordChk" name="passwordChk" placeholder="비밀번호 변경을 원하시면 비밀번호 변경 버튼을 눌러주세요">
					  </div>
					  <div class="col-12">
					    <label for="memberName" class="form-label">사용자명</label>
					    <input type="text" class="form-control" id="memberName" name ="memberName" value="${memberDto.memberName}">
					  </div>
					  <div class="col-md-4">
					    <label for="deptCode" class="form-label">부서</label>
					    <select id="deptCode" name="deptCode" class="form-select">
					     <c:forEach var="deptList" items="${deptDepartmentDtoList}">
					      <option value="${deptList.deptCode }" ${deptList.deptCode == memberDto.deptCode ? 'selected = selected' : '' }>${deptList.deptName }</option>
					     </c:forEach>
					    </select>
					  </div>
					  <div class="col-md-4">
					    <label for="jobCode" class="form-label">직책</label>
					    <select id="jobCode" name="jobCode" class="form-select">
					      <c:forEach var="jobList" items="${jobDtoList}">
					      <option value="${jobList.jobCode }" ${jobList.jobCode == memberDto.jobCode ? 'selected = selected' : '' }>${jobList.jobName }</option>
					      </c:forEach>
					    </select>
					  </div>
					  <div class="col-12">
					    <label for="address" class="form-label">주소</label>
					    <input type="text" class="form-control" id="address" name ="address" value="${memberDto.address}">
					  </div>
					  <div class="col-md-12">
					    <label for="tel" class="form-label">연락처</label>
					    <input type="text" class="form-control" id="tel" name ="tel" value="${memberDto.tel}">
					  </div>
					</form>
 			</div>
 		</div>
	</div>