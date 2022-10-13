<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	function loadCommets(article) {
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if(this.readyState === this.DONE){
				const response = JSON.parse(this.responseText); 
				
				const table = document.getElementById('list');
				const tr = document.createElement('tr');
				const titleTd = document.createElement('td');
				const commentCountTd = document.createElement('td');
				
				titleTd.innerText = article.title;
				commentCountTd.innerText = response.length;
				commentCountTd.style.textAlign = 'center';
				
				tr.appendChild(titleTd);
				tr.appendChild(commentCountTd);
				list.appendChild(tr);
			}
		}
		xhr.open('get', 'https://jsonplaceholder.typicode.com/comments?postId='+article.id, true);
		xhr.send();
		
	}
	
	
	function loadArticles() {
		const userId = document.getElementById('user_id').value;
		const xhr = new XMLHttpRequest(); // XMLHttpRequest 생성 후 xhr에 저장
		
		xhr.onreadystatechange = function() { // 상태값이 변경될 때마다 호출되는 콜백 함수 등록
		// onreadystatechange : to the function called when the request changes state, like this 
		
		// xhr.onreadystatechange = handler; !!!! important  : there's no () / parameters
		// function handler() { // Process the server response here }
	
		// You can define any kind of functions you want to use when the state changes;
		// "anonymous functions"
			
			if(this.readyState === this.DONE) { // state 값이 done인 경우
				// Everything is good, the response was received.
				// => 성공했을 때!
				
				/* 
					XMLHTTPRequest.readyState
				
				0 (uninitialized) or (request not initialized)
				1 (loading) or (server connection established)
				2 (loaded) or (request received)
				3 (interactive) or (processing request)
				4 (complete) or (request finished and response is ready)

				*/
				
				/* 
				
				if (httpRequest.status === 200) {
				    // Perfect!
				} else {
				    // There was a problem with the request.
				    // For example, the response may have a 404 (Not Found)
				    // or 500 (Internal Server Error) response code.
				}
				
				*/
				
				const response = JSON.parse(this.responseText); 
				// 호출이 완료되었으니 string 형태의 responseText를 json 형태로 변환 후 for문을 돌려 댓글을 불러오도록 loadComments 호출
				// httpRequest.responseText : returns the server response as a string of text
				
				/*  
					httpRequest.responseXML 
					: returns the response as an XMLDocument object you can traverse with JavaScript DOM functions
				
				*/
				
				for(let i=0; i<response.length; i++) {
					loadComments(response[i]);
				}
			}
		
			// Actually make the request here by calling open() and send() methods
			xhr.open('GET', 'https://jsonplaceholder.typicode.com/posts?userId='+userId, true);
			// Method : 'GET', 'POST'; need to be capitalized(for some browsers like Firefox)
			// URL : seding the request to
			// async : true (asynchronous) or false (synchronous)
			// The default value for the async parameter is async = true.
			// You can safely remove the third parameter from your code.

			xhr.send();
			// send() - for GET requests / send(string) - for POST requests
			
		}
	}

</script>
</head>
<body>
	<input type="text" id="user_id" />
	<button type="button" onclick="loadArticles()">게시글 읽어오기</button>
	
	<table id="list" width="100%">
	<thead>
		<tr>
			<th>타이틀</th>
			<td>댓글 수</td>
		</tr>
	</thead>
	<tbody>
	</tbody>
	</table>
</body>
</html>