<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="time" value="${ System.currentTimeMillis() }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.1.js?${ time }"></script>
    <script type="text/javascript">
    
    
    idChkInput = function() {
        let userId = $("#member_id").val();

        if($.trim(userId).length > 16){
            let warningTxt = "<font color='red'>아이디는 16글자 이하여야 합니다.</font>";
            $("#idcheck").html(warningTxt);
            return false;
        }

        if($.trim(userId).length < 4){
            let warningTxt = "<font color='red'>아이디는 4글자 이상이어야 합니다.</font>";
            $("#idcheck").html(warningTxt);
            return false;
        }


        // 아이디 중복여부 확인
        $.ajax({
            type : "post",
            url : "data/idCheck.jsp",
            data : { paramId : userId },
            datatype : "jsp",

            success : function(data){
                let ajaxTxt = "";
                if(data.trim() == 1){
                    ajaxTxt = "<font color='red'>중복된 아이디입니다.</font>";
                }else{
                    ajaxTxt = "<font color='blue'>사용 가능한 아이디입니다.</font>";
                }
                $("#idcheck").html(ajaxTxt);
            },

            error : function(e){
                alert("Error : " + e.status);
            }
        });
    }
    </script>
</head>
<body>
    <div align="center">
        <hr width="50%" color="blue" />
        <h3>회원 가입 폼 페이지</h3>
        <hr width="50%" color="blue" />

        <br /><br />

        <form method="post" action="https://google.com">
        <table border="1" cellspacing="0" cellpadding="5" width="450">
            <tr>
                <th width="150">회원 아이디</th>
                <td>
                    <input type="text" name="member_id" id="member_id" size="20" maxlength="20" autocomplete="off" onkeyup="idChkInput();" /><br />
                    <span id="idcheck"></span>
                </td>
            </tr>
        </table>
        </form>
    </div>
</body>
</html>