<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
	.container {
	  	display: flex;
	  	flex-direction: row;
	  	justify-content: space-between;
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
	
	.companyInfoTable img{
		width: 340px;
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