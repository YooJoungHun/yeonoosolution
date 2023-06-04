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
	
	.side-bar {
	  width: 200px;
	  background-color: #f2f2f2;
	  border: 1px solid #ddd;
	  padding: 20px;
	  float: left;
	  height: auto;
	}
	
	.content {
	  flex: 1;
	  margin-left: 20px;
	  display: inline-block;
	
	}
	
	.saveBtn {
	  margin-bottom: 20px;
	}
	#companyInfoSaveBtn{
	  width: 70px;
	  height: 30px;
	  font-weight: bold;
	  background-color: white;
	  border: 1px solid #D6DAE2;
	  outline: none;
	  border-radius: 5px;
	  padding: 0 12px;
	}
	
	.companyInfoTable {
	  border-collapse: collapse;
	  background-color: #F8F8F8;
	  /* width: 100%; */
	}
	
	.companyInfoTable th,
	.companyInfoTable td,
	.companyInfoTable tr{
	  padding: 8px;
	  border: 1px solid #ddd;
	  text-align: left;
	}
	
	.companyInfoTable .tableTitle {
	  width: 190px;
	  height: 50px;
	  border: 1px solid #ddd;
	  font-size: 18px;
	 
	}
	
	.companyInfoTable tr input, #businessType {
	  height: 29px;
	  font-size: 18px;
	  border: 1px solid #ddd;
	  border-radius: 5px;
	}
	
	#companyCode{
	  background-color: #EAEAEA;
	}
	
	#businessType{
	  width: 225px;
	}
	
	#companyLogo{
	  height: 31px;
	}
	
	.companyLogoImg {
	  max-width: 200px;
	  max-height: 200px;
	} 
	.highLight{
	  font-size: 22px;
	  color: red;
	}
	#saveInfo{
	  font-size: 12px;
	}
</style>
</head>
<body>
 		<div class = "container">
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
 		
 	
		<div class = "content">
			<div class = "saveBtn">
				<button id = "companyInfoSaveBtn" onclick="companyInfoSave()">저장</button>
				<span class = "highLight">"*"</span>
				<span id = "saveInfo">표시는 필수 입력 값 입니다.</span>
			</div>
				<c:forEach var="companyList" items="${companyDtoList}">
					<table class="companyInfoTable">
						<tr>
							<th class = "tableTitle">회사코드</th>
							<td><input type="text" id="companyCode" name="companyCode" value="${companyList.companyCode }" disabled="disabled"></td>
						</tr>
						<tr>
							<th class = "tableTitle">구분<span class = "highLight">*</span></th>
							<td>
								<select id="businessType" name="businessType">
									<option value="--" 	${companyList.businessType == null ? 'selected = selected' : '' }>--
									<option value="개인" ${companyList.businessType == '개인' ? 'selected = selected' : '' }>개인사업자
									<option value="법인" ${companyList.businessType == '법인' ? 'selected = selected' : '' }>법인사업자
								</select>
							</td>
						</tr>
						<tr>
							<th class = "tableTitle">회사명<span class = "highLight">*</span></th>
							<td><input type="text" id="companyName" value="${companyList.companyName }" ></td>
						</tr>
						<tr>
							<th class = "tableTitle">사업자등록번호<span class = "highLight">*</span></th>
							<td><input type="text" id="businessCode" value="${companyList.businessCode }" ></td>
						</tr>
						<tr>
							<th class = "tableTitle">대표자 성명<span class = "highLight">*</span></th>
							<td><input type="text" id="ownerName" value="${companyList.ownerName }" ></td>
						</tr>
						<tr>
							<th class = "tableTitle">전화번호<span class = "highLight">*</span></th>
							<td><input type="text" id="tel" value="${companyList.tel }" ></td>
						</tr>
						<tr>
							<th class = "tableTitle">주소<span class = "highLight">*</span></th>
							<td><input type="text" id="address" value="${companyList.address }" ></td>
						</tr> 
						<tr>
							<th class = "tableTitle">회사로고</th>
							<td><input type="file" id="companyLogo"></td>
						</tr> 
						<tr>
							<th class = "tableTitle">회사로고사진</th>
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
		var result = confirm("저장하시겠습니까?");
		
		if(result){
			var companyCode 	= $("#companyCode").val();
			var companyName		= $("#companyName").val().trim();
			var businessType 	= $("#businessType").val();
			var businessCode 	= $("#businessCode").val().trim();
			var ownerName 		= $("#ownerName").val().trim();
			var tel 			= $("#tel").val().trim();
			var address 		= $("#address").val().trim();
			var companyLogo 	= $("#companyLogo")[0].files[0];
			
			if(companyName == "" || companyName == null){
				alert("회사 명을 입력해주세요");
				$("#companyName").focus();
				return false;
			}
			if(businessType == "--"){
				alert("사업자구분을 입력해주세요");
				$("#businessType").focus();
				return false;
			} 
			
			if(businessCode == "" || businessCode == null){
				alert("사업자등록번호를 입력해주세요");
				$("#businessCode").focus();
				return false;
			}else {
			    var regBusinessCode = /^\d{3}-\d{2}-\d{5}$/; // 사업자 등록번호 정규식표현: 123-12-12345
			    if (!regBusinessCode.test(businessCode)) {
			        alert("올바른 사업자등록번호 형식이 아닙니다.");
			        $("#businessCode").focus();
			        return false;
			    }
			}
			
			if(ownerName == "" || ownerName == null){
				alert("대표자 성명을 입력해주세요");
				$("#ownerName").focus();
				return false;
			}
			if(tel == "" || tel == null){
				alert("전화번호를 입력해주세요");
				$("#tel").focus();
				return false;
			} else {
				var regTel = /^\d{2,3}-?\d{3,4}-?\d{4}$/;
				if(!regTel.test(tel)){
					alert("올바른 전화번호 형식이 아닙니다.");
					$("#tel").focus();
					return false;
				}
			}
			
			if(address == "" || address == null){
				alert("주소를 입력해주세요");
				$("#address").focus();
				return false;
			}
			
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
			
		}else{
			return false;
		}
		
		
	};
	
</script>
</html>