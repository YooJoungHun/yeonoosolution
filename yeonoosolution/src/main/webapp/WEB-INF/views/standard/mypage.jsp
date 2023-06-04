<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<style type="text/css">
	.myPageContainer{
		width: 100%;
		display: flex;
	}
	.side-bar {
	   	width: 200px;
	   	background-color: #f2f2f2;
	   	border: 1px solid #ddd;
	   	padding: 20px;
	   	float: left;
	   	height: auto;
	}
	
	.crudBtn{
	   	display: flex; 
	   	margin-bottom: 50px;
	   	margin-top: 10px;
	}
	.crudBtn button{
	  	width: 70px;
	  	height: 30px;
	  	font-weight: bold;
	  	font-size:13px;
	  	background-color: white;
	  	border: 1px solid #D6DAE2;
	  	outline: none;
	  	border-radius: 5px;
	  	padding: 0 12px;
	  	margin-right: 5px;
	}
	#passwordModifyBtn{
	  	width: auto;
	}
	.content{
	  	display: inline-block;
	  	margin: 0 auto;
	 
	}
	.picture{
	  	border: 1px solid black;
	  	display: inline-block;
	  	margin-left: 10px;
	  	margin-top: 30px;
	}
	.myPictureTitle{
	  	border: 1px solid black;
	  	text-align: center;
	  	font-size: 18px;
	  	font-weight: bold;
	 
	}
	.myPicture{
	  	border: 1px solid black;
	  	width: 100%;
	  	height: 170px;
	  
	}
	.myPicture img{
		width: 100%;
	    height:100%;
	}
	.myPictureUpload{
	  	border: 1px solid black;
	}
	.myInfo{
	 	width: 730px;
	 	float: left;
	}
	.form-label{
		font-weight: bold;
	}
</style>
</head>
<body>
	<div class = "myPageContainer">
		<div class="side-bar">
		      <!-- product/ds -->
		      <a href="/product/status/defect">불량현황</a><p>
		      <!-- product/ps -->
		      <a href="/product/status/production">생산현황 검색</a><p>
		      <!-- product/pr -->
		      <!-- product -->
		      <a href="/product/is/item">품목별 재고 현황</a><p>
		      <a href="/product/is/bom">BOM별 재고 현황</a><p>
		      <a href="/product/is/wh">창고별 재고 현황</a><p>
		      <a href="/product/is/wh/">창고별 재고 현황 상세</a><p>
		      <a href="/item/search">제품 검색</a><p>
		      <a href="/product/sim">입고</a><p>
		      <a href="/wo">제품 생산 지시</a><p>
		      
		      <!-- sales -->
		      <a href="/sales/receive-order">수주서 관리</a><p>
		      <a href="/sales/analysis-of-materials">자제요소분석</a><p>
		      <a href="/sales/order">구매</a><p>
		      <a href="/sales/stock-in">구매입고등록</a><p>
		      
		      <!-- standard -->
		      <a href="/standard/login">로그인</a><p>
		      <a href="/standard/user-admin">사용자 계정관리</a><p>
		      <a href="/standard/imi">품목 관리 및 등록</a><p>
		      <a href="/standard/ipi">품목 단가 관리</a><p>
		      <a href="/standard/pmi">품목 관리 정보</a><p>
		      
		              기본정보<p>
 			  <a href="/standard/companyInfo/">회사정보</a><p>
 			  <a href="/standard/customerInfo/">거래처정보</a><p>
 			     사용자관리<p>
 			  <a href="/standard/myPage/">개인정보수정</a><p>
 			  <a href="/standard/dept/">부서등록 및 확인</a><p>
 			  <a href="/standard/job/">직급등록 및 확인</a><p>
		      
		      <!-- 로그아웃 -->
		      <c:if test="${sessionScope.member != null}">
		         <form action="/standard/logout" method="POST">
		            <button type="submit">로그아웃</button>
		         </form>
		      </c:if>
		      
		</div>
 		
 		
 		
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
	<script type="text/javascript">
	function modifyMyInfo(){
		var result = confirm("저장하시겠습니까?");
		
		if(result){
			
			var memberId 	= $("#memberId").val();
			var memberUid 	= $("#memberUid").val();
			var password 	= $("#password").val();
			var passwordChk = $("#passwordChk").val();
			var memberName 	= $("#memberName").val();
			var deptCode 	= $("#deptCode").val();
			var jobCode 	= $("#jobCode").val();
			var address		= $("#address").val();
			var tel			= $("#tel").val();
			var memberImage = $("#memberImage")[0].files[0];
			
			/* console.log("memberId -> "+memberId);
			console.log("password -> "+password);
			console.log("passwordChk -> "+passwordChk);
			console.log("memberName -> "+memberName);
			console.log("deptCode -> "+deptCode);
			console.log("jobCode -> "+jobCode);
			console.log("address -> "+address);
			console.log("tel -> "+tel);
			console.log("memberImage -> "+memberImage); */
			
			if(password != passwordChk){
				alert("비밀번호가 일치하지 않습니다.");
				$("#passwordChk").focus();
				return false;
			}
			
			if(password == "" || password == null){
				alert("비밀번호와 비밀번호 확인을 입력해주세요");
				$("#password").focus();
				return false;
			}
			
			// 업로드할 파일이 있다면 실행
			// 나눠 놓은 이유 => restful api
			if (memberImage) {
			      // ajax로 사진 올리고싶으면 꼭 FormData객체 선언해서 사용할 것. 
			      var formData = new FormData();
			      formData.append("memberImage", memberImage);
			      formData.append("memberUid", memberUid);
	
			      $.ajax({
			        url: "/standard/myPage/" + memberUid,
			        type: "POST",
			        data: formData,
			        processData: false, // 이미지 업로드시 필수 :  jQuery가 데이터를 자동으로 처리하지 않도록 설정하는 옵션. 이 옵션을 설정하면 FormData 객체의 데이터가 자동으로 문자열로 변환되지 않고 원본 형식으로 전송됨. 
			        contentType: false, // 이미지 업로드시 필수 :  contentType: false를 설정하면 jQuery가 자동으로 컨텐츠 타입을 설정하지 않고, 브라우저가 자동으로 multipart/form-data로 설정함.
			        success: function(data) {
			          if (data === 1) {
			        	  alert("이미지 저장 성공");
			          } else {
			        	  alert("이미지 저장 실패");
			          }
			        }
			   });
			}
			
			
			var myData = {
					memberId 	: memberId,
					memberUid	: memberUid,
					password	: password,
					memberName 	: memberName,
					address		: address,
					tel			: tel
			}
			
			$.ajax({
				url : "/standard/myPage/"+memberUid,
				dataType : "json",
				type : "PUT",
				data : myData,
				success : data=>{
					if(data == 1){
						alert("저장되었습니다.");
						location.reload();
					}else if(data == 2){
						alert("비밀번호가 일치 하지 않습니다.");
					}
				}
			})
		} else{
			return false;
		}
		
		
	}
	
	function resetMyInfo(){
		/* alert("초기화 시작"); */
		location.reload();
	}
	
	function modifyPassword(){
		var result = confirm("비밀번호 변경하시겠습니까?");
		
		if(result){
			
			var password 		= $("#modalPassword").val().trim();
			var changePassword 	= $("#modalChangePassword").val().trim();
			var passwordChk	   	= $("#modalPasswordChk").val().trim();
			var memberUid 		= $("#memberUid").val();
			var memberId 		= $("#memberId").val();
			/* console.log("password-> "+password);
			console.log("changePassword-> "+changePassword);
			console.log("passwordChk-> "+passwordChk);
			console.log("memberUid-> "+memberUid); */
			
			if(password == null || password == ""){
				alert("현재 비밀번호를 입력해주세요");
				$("#modalPassword").focus();
				return false;
			}
			
			if(changePassword == null || changePassword ==""){
				alert("변경하실 비밀번호를 입력해주세요");
				$("#modalChangePassword").focus();
				return false;
			}
			
			if(changePassword != passwordChk){
				alert("변경 비밀번호와 변경 비밀번호 확인이 일치하지 않습니다.");
				$("#modalChangePassword").focus();
				return false;
			} 
			
			var passwordData = {
					password 		: password,
					changePassword 	: changePassword,
					memberUid		: memberUid,
					memberId		: memberId
			}
			
			$.ajax({
				url : "/standard/myPage/changePassword/"+memberUid,
				dataType : "json",
				type : "POST",
				data : passwordData,
				success : data =>{
					if(data == 1){
						alert("비밀번호가 변경되었습니다.");
						location.reload();
					} else if(data == 2){
						alert("현재 비밀번호가 일치하지 않습니다.");
						$("#modalPassword").focus();
					} else if(data == 3){
						alert("변경할 비밀번호를 입력해주세요.");
						$("#modalChangePassword").focus();
					} else{
						alert("비밀번호 변경에 실패하였습니다.");
					}
				}
			});
		}
		
		
	}
	
	</script>
</body>
</html>