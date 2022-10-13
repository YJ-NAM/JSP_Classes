<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${ !empty keyword && !empty search }"> <!-- search -->
		<c:set var="semiTitle" value="검색 결과" />
		<c:set var="address" value="board_search.do" />
	</c:when>
	<c:otherwise> <!-- 전체 -->
		<c:set var="semiTitle" value="Board 게시판 전체 목록" />
		<c:set var="address" value="board_list.do" />
		<c:set var="keyword" value=""/>
		<c:set var="search" value=""/>
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
<script src="js/flower.js"></script>
<script src="https://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/backtobasic.css" />
<style>

	.page-paging {
	    display: inline-block;
	    padding: 0;
	    text-align: center;
	    font-size: 0;
	    line-height: 0;
	}
	.page-paging ol {
	    display: inline-block;
	    vertical-align: top;
	    margin: 0;
	    padding: 0;
	}
	.page-paging span,
	.page-paging ol li {
	    display: inline-block;
	    margin-left: -1px;
	    background: #fefefe;
	    line-height: 36px;
	    letter-spacing: -1px;
	    color: #6c757d;
	    vertical-align: top;
	    border-top: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	    border-left: 1px solid #ccc;
	}
	
	.page-paging span {
	    width: 38px;
	    font-size: 16px;
	    overflow: hidden;
	}
	.page-paging span.nolink {
	    width: 38px;
	    height: 38px;
	    text-align: center;
	    box-sizing: border-box;
	}
	.page-paging span:first-child {
	    margin-left: 0;
	    border-top: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	    border-left: 1px solid #ccc;
	    -webkit-border-top-left-radius: 5px;
	    -webkit-border-bottom-left-radius: 5px;
	    -moz-border-radius-topleft: 5px;
	    -moz-border-radius-bottomleft: 5px;
	    border-top-left-radius: 5px;
	    border-bottom-left-radius: 5px;
	}
	.page-paging span:last-child {
	    margin-left: 0;
	    border-top: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	    border-right: 1px solid #ccc;
	    -webkit-border-top-right-radius: 5px;
	    -webkit-border-bottom-right-radius: 5px;
	    -moz-border-radius-topleft: 5px;
	    -moz-border-radius-bottomleft: 5px;
	    border-top-right-radius: 5px;
	    border-bottom-right-radius: 5px;
	}
	
	.page-paging a {
	    display: block;
	    width: 38px;
	    text-align: center;
	    font-family: verdana;
	    font-size: 14px;
	    color: #007bff;
	    text-decoration: none;
	    letter-spacing: -1px;
	}
	.page-paging span a {
	    width: 38px;
	    height: 36px;
	    font-size: 16px;
	    text-decoration: none;
	    letter-spacing: -1px;
	}
	.page-paging a:hover {
	    color: #000;
	    background: #f3f3f3;
	    text-decoration: none;
	}
	
	.page-paging li.now {
	    width: 38px;
	    height: 38px;
	    color: #fff;
	    background: #007bff;
	    border-top: 1px solid #007bff;
	    border-bottom: 1px solid #007bff;
	    font-family: verdana;
	    font-size: 13px;
	    text-align: center;
	    box-sizing: border-box;
	}
	
	.btn-light {
		border: 2px solid pink !important;
		width: 50px !important;
		height: 40px !important;
		font-size: 12px !important;
		padding: 1px !important;
	}
	
	a {
		display: block;
		text-decoration: none;
		color: Violet;
	}
	
	a:hover {
		color: darkviolet;
	}
	
</style>
</head>
<body>
	<div align="center">
		<hr width="50%"/>
		<h3><i>${ keyword }</i> ${ semiTitle }</h3>
		<hr width="50%"/>
		<br />
		
		<table>
			<tr>
				<th>글번호</th><th>글제목</th><th>조회수</th><th>작성일자</th>
			</tr>
			
			<c:if test="${ !empty List }">
				<c:forEach items="${ List }" var="dto">
					<tr>
						<td>${ dto.board_no }</td>
						<td><a href="<%= request.getContextPath() %>/board_content.do?no=${ dto.board_no }&page=${ page }">${ dto.board_title }</a></td>
						<td>${ dto.board_hit }</td>
						<td>${ dto.board_date.substring(0,10) }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${ empty List }">
				<tr>
					<td colspan="4" align="center">
						<h3>전체 게시물 리스트가 없습니다....</h3>
					</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="4" align="center">
					<button type="button" class="btn btn-info" onclick="location.href='board_write.do'">글쓰기</button>
				</td>
			</tr>
		</table>
		<br />
		
		<div class="page-paging">
		    <c:if test="${startBlock > 1}"><span><a href="${address}?page=1&search=${search}&keyword=${keyword}"><i class="fa fa-angle-double-left"></i></a></span></c:if>
		    <c:if test="${startBlock <= 1}"><span class="nolink"><i class="fa fa-angle-double-left"></i></span></c:if>
		
		    <c:if test="${page > 1}"><span><a href="${address}?page=${page - 1}&search=${search}&keyword=${keyword}"><i class="fa fa-angle-left"></i></a></span></c:if>
		    <c:if test="${page <= 1}"><span class="nolink"><i class="fa fa-angle-left"></i></span></c:if>
		
		    <ol>
		        <c:forEach begin="${startBlock}" end="${endBlock}" var="i">
		        <c:if test="${i == page}"><li class="now">${i}</li></c:if>
		        <c:if test="${i != page}"><li><a href="${address}?page=${i}&search=${search}&keyword=${keyword}">${i}</a></li></c:if>
		        </c:forEach>
		    </ol>
		
		    <c:if test="${page < allPage}"><span><a href="${address}?page=${page + 1}&search=${search}&keyword=${keyword}"><i class="fa fa-angle-right"></i></a></span></c:if>
		    <c:if test="${page >= allPage}"><span class="nolink"><i class="fa fa-angle-right"></i></span></c:if>
		
		    <c:if test="${endBlock < allPage}"><span><a href="${address}?page=${allPage}&search=${search}&keyword=${keyword}"><i class="fa fa-angle-double-right"></i></a></span></c:if>
		    <c:if test="${endBlock >= allPage}"><span class="nolink"><i class="fa fa-angle-double-right"></i></span></c:if>
		</div>

		<hr width="50%"/>
		<br />
		<div class="row" style="width: 30em">
   			<div class="col-lg">
				<form action="<%= request.getContextPath() %>/board_search.do" method="post">
				 <div class="input-group list-search-form w-70">
					<select name="search" class="custom-select col-xs-2">
						<option value="all"<c:if test='${field eq "all"}'> selected="selected"</c:if>>전체</option>
					    <option value="title"<c:if test='${field eq "title"}'> selected="selected"</c:if>>제목</option>
					    <option value="cont"<c:if test='${field eq "cont"}'> selected="selected"</c:if>>내용</option>
					    <option value="title_cont"<c:if test='${field eq "title_cont"}'> selected="selected"</c:if>>제목+내용</option>
					    <option value="writer"<c:if test='${field eq "writer"}'> selected="selected"</c:if>>작성자</option>
					</select>
					<input type="text" name="keyword" value="${keyword}" class="form-control" />
					<button type="submit" class="btn btn-light">검색</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>