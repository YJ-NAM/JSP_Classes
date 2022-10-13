/**
 *  customer 테이블을 이용한 ajax 실습
 */

$(function() {
	// 여러 ajax에서 동일하게 사용되는 속성 설정
	$.ajaxSetup({
		ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type : "post"
	});
	
	// 모든 데이터를 가져오는 함수
	// customer 테이블에서 전체 데이터를 가져오는 함수
	function getData() {
		$.ajax({
			url : "/16_Ajax/select.do", // mapping 여기서~~~~
			datatype : "xml",	// 결과 데이터 타입
			success : function(data){
				// 테이블 태그의 첫번째 행(타이틀(제목) 태그)을 제외하고 나머지 모든 행을 제거하라는 명령어
				$("#listTable tr:gt(0)").remove();
				let table = "";
				
				$(data).find("customer").each(function() {
					table += "<tr>";
					table += "<td>" + $(this).find("no").text() + "</td>";
					table += "<td>" + $(this).find("id").text() + "</td>";
					table += "<td>" + $(this).find("name").text() + "</td>";
					table += "<td>" + $(this).find("age").text() + "</td>";
					table += "<td>" + $(this).find("phone").text() + "</td>";
					table += "<td>" + $(this).find("addr").text() + "</td>";
					table += "<td></td>";					
					table += "</tr>";
				})
				// 테이블의 첫번째 행 아래에 table 추가
				$("#listTable tr:eq(0)").after(table);
			},
			error : function(e){
				alert("데이터 통신 에러" + e.status);
			}
		});
	};
	
	// 아이디 중복 여부 확인
	$("#id").keyup(function(){
        $.ajax({
            url : "/16_Ajax/idCheck.do",
            datatype : "text",
            data : {id : $(this).val()},

            success : function(data){
                $("#id").parent().find("span").html(data);
            },
            error : function(e){
                alert("Error : " + e.status);
            }
        });
    }); // keyup() 함수 end

	// 가입하기 버튼 클릭 시 DB에 추가로 저장
	$("#btn").click(function() {
		
		$.ajax({
			url : "/16_Ajax/insert.do",
			data : $("#inForm").serialize(),	// serialize() : 쿼리스트링으로 변환해줌
			datatype : "text",
			success : function(data) {
				if(data > 0){
					alert("고객 가입이 성공적으로 완료되었습니다.");					
					// 가입 완료 후 전체 레코드 화면에 뿌려주어야 함					
					getData(); // getData() 호출
					
					// input 태그에 입력된 내용을 지우는 작업
					$("input[type=text]").each(function() {
						$(this).val("");
					});
				}else {
					alert("가입 실패");		
				}
			},
			error : function(e) {
				alert("데이터 통신 오류입니다." + e.status);
			}
			
		})
		
	});
	
	getData();
});