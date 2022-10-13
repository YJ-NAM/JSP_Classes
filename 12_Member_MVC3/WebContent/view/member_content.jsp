<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cont" value="${ contentDTO }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	
	$(function() {
		
		$("#deleteForm").css('display', 'none');
		
		$("#deleteOpen").click(function() {		
			$("#deleteForm").slideToggle(100, function(){
			});				
			$("input:password[name='password']").focus();
		});	
		
	})
	

	function validateForm(form) {
		if(form.password.value == ""){
			alert("비밀번호를 입력하세요.");
			form.password.focus();
			return false;
		}else {
			if(form.password.value == ${ cont.pwd }) {
				if(confirm('정말로 삭제하시겠습니까? 삭제시 복구가 불가능합니다.')){
					return true;
				}else {
					form.password.value = "";
					form.password.focus();
					return false;
				}
			}else {
				alert("비밀번호가 틀립니다.");
				form.password.value = "";
				form.password.focus();
				return false;
			}
		}
	} 

</script>
<link rel="stylesheet" href="css/snow.css" />
<style type="text/css">
	
	body{
		background-image: linear-gradient(to left bottom, MintCream, LavenderBlush);
		background-attachment: fixed;
		/* linear-gradient 반복 안하고 채우게 하는 속성 */
	}
	
	div h3 {
		font-weight: bolder;
		color: DarkCyan;
	}
	
	table tr th, td {
		border: 1px solid LemonChiffon;
	}
	
	table tr th {
		background-color: LightYellow;
	}
	
	#title {
		font-size: 22px;
		background-image: linear-gradient(to right, LemonChiffon, Ivory);
		color: DarkCyan;
	}
	
	#last {
		background-image: linear-gradient(to left, LemonChiffon, Ivory);	
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
	<h3>${ contentDTO.memname }님의 상세정보 페이지</h3>
	<hr width="50%"/>
	<br />
	
	<table>
		<c:choose>
			<c:when test="${ not empty cont }" >
			<tr><th colspan="4" id="title">${ cont.memname }</th></tr>
			<tr>
				<th>아이디</th> <td>${ cont.memid }</td>
				<th>회원번호</th> <td>${ cont.num }</td>
			</tr>
			<tr>
				<th>비밀번호</th> <td>*****</td>
				<th>나이</th> <td>${ cont.age }</td>
			</tr>
			<tr>
				<th>직업</th> <td>${ cont.job }</td>
				<th>마일리지</th> <td><fmt:formatNumber value="${ cont.mileage }" /></td>
			</tr>
			<tr>
				<th>주소</th> <td>${ cont.addr }</td>
				<th>등록일자</th> <td>${ cont.regdate.substring(0,10) }</td>
			</tr>
			</c:when>
			<c:otherwise>
			<tr>
				<td colspan="4">등록된 정보가 없습니다...</td>
			</tr>
			</c:otherwise>
		</c:choose>
			<tr>
				<td id="last" colspan="4" align="center">
					<button type="button" class="btn btn-primary" onclick="location.href='insert.do?num=${ cont.num }'">수정하기</button>&nbsp;
					<button type="button" class="btn btn-danger" id="deleteOpen">삭제하기</button>&nbsp;
					<button type="button" class="btn btn-info" onclick="location.href='select.do'">목록보기</button>&nbsp;
				</td>
			</tr>
	</table>
	<br />
	<div id="deleteForm" align="center">
		<form name="deleteForms" action="<%= request.getContextPath() %>/delete.do" method="post" onsubmit="return validateForm(this)">
		<input type="hidden" name="num" value="${ cont.num }"/>
		<table>
			<tr>
				<th>비밀번호 입력</th>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-danger">삭제하기</button>
					<button type="reset" class="btn btn-success">다시입력</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
	</div>
</body>
</html>