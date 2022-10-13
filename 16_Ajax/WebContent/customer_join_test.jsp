<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <script>

    checkCheck = function() {

        let user_id = $("#id").val();
            
        if($.trim(user_id).length > 16){
            let warning = "<font color='red'>아이디는 16글자 이하여야 합니다.</font>";
            $("#idCheck").html(warning);
            return false;
        }

        if($.trim(user_id).length < 4){
            let warning = "<font color='red'>아이디는 4글자 이상이어야 합니다.</font>";
            $("#idCheck").html(warning);
            return false;
        }
    }

    </script>
</head>
<body>
    <form action="http://www.naver.com" method="post">
        아이디 : <input type="text" id="id" onkeyup="checkCheck()" />
        <span id="idCheck"></span>
    </form>
</body>