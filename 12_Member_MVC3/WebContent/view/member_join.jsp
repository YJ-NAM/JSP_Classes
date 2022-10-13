<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="dto" value="${ Modify }" />
<c:choose>
	<c:when test="${ not empty dto }">
		<c:set var="button" value="수정"/>
		<c:set var="num" value="${ dto.num }" />
		<c:set var="id" value="${ dto.memid }" />
		<c:set var="name" value="${ dto.memname }" />
		<c:set var="pwd" value="${ dto.pwd }" />
		<c:set var="age" value="${ dto.age }" />
		<c:set var="mileage" value="${ dto.mileage }" />
		<c:set var="job" value="${ dto.job }" />
		<c:set var="addr" value="${ dto.addr }" />
		<c:set var="readonly" value="readonly='readonly'" />
		<c:set var="required" value="" />
	</c:when>
	<c:otherwise>
		<c:set var="button" value="등록"/>
		<c:set var="num" value="0" /> <!-- nullPointerException 방지용 -->
		<c:set var="name" value="" />
		<c:set var="pwd" value="" />
		<c:set var="age" value="" />
		<c:set var="mileage" value="" />
		<c:set var="job" value="" />
		<c:set var="addr" value="" />
		<c:set var="readonly" value="" />
		<c:set var="required" value="required='required'" />
	</c:otherwise>
</c:choose>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="css/snow.css" />
<script type="text/javascript">

	$(function() {
		
		$("#mem_id").on("blur", function(){
			let idCheck = $("#mem_id").val().trim();
			let pattern = /^[a-zA-Z0-9]{4,}$/;
			
			if($("#mem_id").val() != ""){
				if(pattern.test(idCheck)){
				}else {
					alert("4자 이상 영문 대소문자, 숫자 조합만 가능합니다.");
					$("#mem_id").val("");
					$("#mem_id").focus();
				}
			}			
		});		
	});
	
		
	function validateForm(form) {
		if(confirm('이대로 등록하시겠습니까?')){
			return true;
		}else {
			return false;
		}
	}

</script>
<style type="text/css">

	body {
		background-color: PaleTurquoise;
	}
	
	div h3 {
		font-weight: bolder;
		color: Teal;
	}

	table tr th {
		background: LightCyan;
		text-align: center;
	}
	
	table tr td {
		background: white;		
	}

</style>
</head>
<body>
	<div class="snowflakes" aria-hidden="true">
	  <div class="snowflake">
	  ❅
	  </div>
	  <div class="snowflake">
	  ❆
	  </div>
	  <div class="snowflake">
	  ❅
	  </div>
	  <div class="snowflake">
	  ❆
	  </div>
	  <div class="snowflake">
	  ❅
	  </div>
	  <div class="snowflake">
	  ❆
	  </div>
	  <div class="snowflake">
	    ❅
	  </div>
	  <div class="snowflake">
	    ❆
	  </div>
	  <div class="snowflake">
	    ❅
	  </div>
	  <div class="snowflake">
	    ❆
	  </div>
	  <div class="snowflake">
	    ❅
	  </div>
	  <div class="snowflake">
	    ❆
	  </div>
	</div>

	<div align="center">
		<hr width="50%"/>
		<h3>MEMBER10 테이블 회원 등록 폼 페이지</h3>
		<hr width="50%"/>
		<br />
		
		<form name="myForm" action="<%= request.getContextPath() %>/insert_ok.do" method="post" onsubmit="return validateForm(this)">
			<input type="hidden" name="num" value="${ num }" />
			<table>
				<tr>
					<th>회원 아이디</th>
					<td><input type="text" name="member" id="mem_id" value="${ id }" ${ required } ${ readonly } /></td>
				</tr>
				<tr>
					<th>회원 이름</th>
					<td><input type="text" name="member" value="${ name }" ${ required } ${ readonly }/></td>
				</tr>
				<tr>
					<th>회원 비밀번호</th>
					<td><input type="password" name="member" ${ required }/></td>
				</tr>
				<tr>
					<th>회원 나이</th>
					<td><input type="text" name="member" value="${ age }" ${ required }/></td>
				</tr>
				<tr>
					<th>회원 마일리지</th>
					<td><input type="text" name="member" value="${ mileage }" /></td>
				</tr>
				<tr>
					<th>회원 직업</th>
					<td><input type="text" name="member" value="${ job }" /></td>
				</tr>
				<tr>
					<th>회원 주소</th>
					<td><input type="text" name="member" value="${ addr }" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-primary">${ button }하기</button>&nbsp;&nbsp;
						<button type="reset" class="btn btn-success">다시작성</button>
					</td>				
				</tr>
			</table>
		</form>	
	</div>
</body>
</html>