<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.container {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}

.sideMenu {
  width: 200px;
  background-color: #f2f2f2;
}
.menuTitle{
	font-size: 18px;
}

ul {
  list-style-type: none;
  padding: 0;
}

ul li {
  padding: 10px;
  font-weight: bold;
}

ul li a {
  text-decoration: none;
  color: #333;
}

.content {
  flex: 1;
  margin-left: 20px;
}

.saveBtn {
  margin-bottom: 20px;
}
#companyInfoSaveBtn{
	width: 50px;
	height: 30px;
	font-weight: bold;
}

.companyInfoTable {
  border-collapse: collapse;
  width: 100%;
}

.companyInfoTable th,
.companyInfoTable td {
  padding: 8px;
  border-bottom: 1px solid #ddd;
  text-align: left;
}

.companyInfoTable th {
  width: 150px;
}
.companyInfoTable input {
  width: 150px;
  height: 30px;
  
}

.companyLogoImg {
  max-width: 200px;
  max-height: 200px;
}
</style>
</head>
<body>
 	<div class = "container">
 		<div class = "sideMenu">
 			<ul>
 				<li class = "menuTitle">기본정보</li>
 				<li><a href="/standard/companyInfo/">-회사정보</a></li>
 				<li><a href="/standard/customerInfo/">-거래처정보</a></li>
 				<li class = "menuTitle">사용자관리</li>
 				<li><a href="/standard/myPage/">-개인정보수정</a></li>
 				<li><a href="/standard/dept/">-부서등록 및 확인</a></li>
 				<li><a href="/standard/job/">-직급등록 및 확인</a></li>
 			</ul>
 		</div>
 	
		<div class = "content">
			<div class = "saveBtn">
				<button id = "companyInfoSaveBtn" onclick="companyInfoSave()">저장</button>
			</div>
				<c:forEach var="companyList" items="${companyDtoList}">
					<table class="companyInfoTable">
						<tr>
							<th>회사코드</th>
							<td><input type="text" id="companyCode" name="companyCode" value="${companyList.companyCode }" disabled="disabled"></td>
						</tr>
						<tr>
							<th>구분</th>
							<td>
								<select id="businessType" name="businessType">
									<option value="" 	${companyList.businessType == null ? 'selected = selected' : '' }>--
									<option value="개인" ${companyList.businessType == '개인' ? 'selected = selected' : '' }>개인사업자
									<option value="법인" ${companyList.businessType == '법인' ? 'selected = selected' : '' }>법인사업자
								</select>
							</td>
						</tr>
						<tr>
							<th>회사명</th>
							<td><input type="text" id="companyName" value="${companyList.companyName }" ></td>
						</tr>
						<tr>
							<th>사업자등록번호</th>
							<td><input type="text" id="businessCode" value="${companyList.businessCode }" ></td>
						</tr>
						<tr>
							<th>대표자 성명</th>
							<td><input type="text" id="ownerName" value="${companyList.ownerName }" ></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" id="tel" value="${companyList.tel }" ></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" id="address" value="${companyList.address }" ></td>
						</tr> 
						<tr>
							<th>회사로고</th>
							<td><input type="file" id="companyLogo"></td>
						</tr> 
						<tr>
							<th>회사로고사진</th>
							<td>
								<img alt="UpLoad Image" id="companyLogoImg" src="${companyList.companyLogo}">
							</td>
							
						</tr> 
					</table>
				</c:forEach>
			</div>
		</div>

</body>
<script type="text/javascript">
	function companyInfoSave(){
		alert("저장하시겠습니까?");
		
		var companyCode 	= $("#companyCode").val();
		var companyName		= $("#companyName").val();
		var businessType 	= $("#businessType").val();
		var businessCode 	= $("#businessCode").val();
		var ownerName 		= $("#ownerName").val();
		var tel 			= $("#tel").val();
		var address 		= $("#address").val();
		var companyLogo 	= $("#companyLogo")[0].files[0];
		
		// 업로드할 파일이 있다면 실행
		// 나눠 놓은 이유 => restful api 
		if (companyLogo) {
		      // ajax로 사진 올리고싶으면 꼭 FormData객체 선언해서 사용할 것. 
		      var formData = new FormData();
		      formData.append("companyLogo", companyLogo);
		      formData.append("companyCode", companyCode);

		      $.ajax({
		        url: "/standard/companyInfo/" + companyCode,
		        type: "POST",
		        data: formData,
		        processData: false, // 이미지 업로드시 필수 :  jQuery가 데이터를 자동으로 처리하지 않도록 설정하는 옵션. 이 옵션을 설정하면 FormData 객체의 데이터가 자동으로 문자열로 변환되지 않고 원본 형식으로 전송됨. 
		        contentType: false, // 이미지 업로드시 필수 :  contentType: false를 설정하면 jQuery가 자동으로 컨텐츠 타입을 설정하지 않고, 브라우저가 자동으로 multipart/form-data로 설정함.
		        success: function(data) {
		          if (data === 1) {
		            console.log("이미지 저장 성공");
		          } else {
		            console.log("이미지 저장 실패");
		          }
		        }
		      });
		    } else {
		      console.log("이미지 취소");
		    }
		
		$.ajax({
			url : "/standard/companyInfo/"+companyCode,
			dataType : "json",
			type : "PUT",
			data : {
				"businessType" 	: businessType,
				"businessCode" 	: businessCode,
				"ownerName" 	: ownerName,
				"tel" 			: tel,
				"address" 		: address,
				"companyName"	: companyName
			},
			success : data =>{
				if(data === 1){
					alert("저장하였습니다.")
				} else{
					alert("저장에 실패하였습니다.")
				}
				location.reload();
			}
			
		});
		
	};
	
</script>
</html>