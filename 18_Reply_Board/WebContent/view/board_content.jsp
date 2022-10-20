<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="time" value="${ System.currentTimeMillis() }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,700;1,300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.js?${ time }"></script>
<link rel="stylesheet" href="css/style.css" />
<script>
 	$(function() {
 		$(".btn").click(function() {
 			let button = $(".btn").index(this);
			if(button == 0){
				location.href='board_list.do';
			}else if(button == 1){
				location.href='board_modify.do?no=${ cont.bno }';
			}else if(button == 2) {
				location.href='board_delete.do?no=${ cont.bno }';
			}
		})
	})
</script>
</head>
<body>
	<div >
		<hr />
		<h3>${ cont.title } 상세 내용</h3>
		<hr />
		<br />
		
		<table class="table align-middle">
			<c:if test="${ !empty cont }">
				<tr>
					<th>글제목 : ${ cont.title }</th>
				</tr>
				<tr>
					<td>글번호 : ${ cont.bno }</td>
				</tr>
				<tr>
					<td>작성자 : ${ cont.writer }</td>
				</tr>
				<c:if test="${ !empty cont.regupdate }">
				<tr>
					<td>최종등록시간 : ${ cont.regupdate }</td>
				</tr>
				</c:if>
				<c:if test="${ empty cont.regupdate }">
				<tr>
					<td>최종등록시간: ${ cont.regdate }</td>
				</tr>
				</c:if>
				<tr>
					<td>
					<textarea class="form-control" name="" id="" cols="30" rows="10">${ cont.content }</textarea>
					</td>
				</tr>
			</c:if>
			<c:if test="${ empty cont }">
			<tr>
				<td colspan="4"><h3>No data</h3></td>
			</tr>
			</c:if>
			
			<tr>
				<td>
					<button type="button" class="btn btn-outline-success" >List</button>&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-warning" >Modify</button>&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-danger" >Delete</button>&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 댓글 폼 영역 -->
	<br />
	<hr />
	<br />
	<div align="left">
		<table class="table">
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" class="form-control" name="reWriter" id="reWriter" />
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<input type="text" class="form-control" name="reContent" id="reContent" height="50" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					 <button type="button" class="btn btn-outline-primary" id="replyBtn">Reply</button>				
				</td>	
			</tr>
		</table>
	</div>
	<br />
	<div align="left">
	<h5>댓글 목록</h5>
		<table class="list table table-bordered">
			<tr class="line">
				<td colspan="2">작성자</td>
			</tr>
			<tr class="line">
				<td>댓글내용</td><td>작성일자</td>
			</tr>				
		</table>
	</div>
	<script type="text/javascript">

	$(function() {
		// ajax에서 동일하게 사용되는 속성 설정
		$.ajaxSetup({
			// ajax에서 한글 깨짐 문제 해결
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type : "post"
		});
		
		// TBL_REPLY 테이블의 모든 데이터를 가져오는 함수
		function getList() {
			$.ajax({
				url : "/18_Reply_Board/view/board_reply.jsp",
				data : { rno : ${ cont.bno } },
				datatype : "xml",
				success : function(data) {
					// 테이블 태그의 타이틀 태그 제외한 댓글 목록 지우는 명령어
					$(".list tr:gt(1)").remove();
					let table = "";
					// .each -> forEach와 비슷한 기능
					$(data).find("reply").each(function() {
						table += "<tr>";
						// $(this).find("rewriter") : rewriter라는 태그가 있으면 찾으세요 라는 의미
						table += "<td colspan='2'>" + $(this).find("rewriter").text() + "</td>";
						table += "</tr>";
						
						table += "<tr>";
						table += "<td>" + $(this).find("recont").text() + "</td>";
						table += "<td>" + $(this).find("redate").text() + "</td>";
						table += "</tr>";
						
						table += "<tr>";
						table += "<td colspan='2'>&nbsp;</td>";
						table += "</tr>";
					});
					
					$(".list tr:eq(1)").after(table);
					
				},
				error : function(e) {
					alert("Error : "+e.status);
				}
			});
		} // getList() 종료
		
		// 댓글 작성 버튼 클릭 시 DB에 추가 저장
		$("#replyBtn").on("click", function() {
			$.ajax({
				url : "/18_Reply_Board/board_reply_insert_ok.do",
				datatype : "text",
				data : {
					writer : $("#reWriter").val(),
					content : $("#reContent").val(),
					bno : ${ cont.bno }
					},
				success : function(data) {
					if(data > 0){ // 성공해서 data 값에 넘어온 1 값이 담기게 되면 실행됨
						alert('댓글 작성 완료'); 
						// 댓글 작성 후 다시 전체 댓글 리스트 화면 출력 
						getList();
						
						// input 태그에 입력된 내용 지워줌
						$("input[type=text]").each(function() {
							$(this).val(""); // 입력된 값 초기화
						})
					}else {
						alert('댓글 추가 실패');
					}
				},
				error : function(e) {
					alert("Error code : "+e.status);
				}
			});
		}); // 댓글 등록하기 end	
		
		getList(); // 전체 리스트 호출 함수
	});
</script>
</body>
</html>