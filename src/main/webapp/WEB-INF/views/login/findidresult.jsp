<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
    request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기 결과</title>
    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
        }

        ul {
            list-style: none;
        } /* 리스트 앞에 . 같은거 제거*/
        a {
            text-decoration: none;
        } /* 링크에 밑줄 같은거 제거*/
        * {
            padding: 0;
            margin: 0;
            border: none;
        }

        body {
            font-size: 14px;
            font-family: 'Roboto', sans-serif;
        }

        .findid-result-wrapper {
            width: 400px;
            height: 350px;
            padding: 40px;
            box-sizing: border-box;
            margin-left: 37%;
            margin-top: 2%;
        }

        .findid-result-wrapper > h2 {
            font-size: 24px;
            color: #6A24FE;
            margin-bottom: 20px;
        }

        .findid-result-wrapper > p {
            margin-bottom: 10px;
        }

        .findid-result-wrapper > a {
            color: #6A24FE;
        }

        .findid-result-wrapper > a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="findid-result-wrapper">
        <h2>아이디 찾기 결과</h2>
        <% if (request.getAttribute("idResult") != null) { %>
            <p>입력하신 정보와 일치하는 아이디는 다음과 같습니다:</p>
            <p>${idResult}</p>
            <p>
                <a href="${contextPath}/login/findpwform" style="color: #6A24FE;">비밀번호 찾기</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="${contextPath}/login/loginform" style="color: #6A24FE;">로그인</a>
            </p>
        <% } else { %>
            <p>일치하는 아이디가 없습니다.</p>
            <p>다른 아이디를 찾으시려면 <a href="${contextPath}/login/findidform" style="color: #6A24FE;">여기</a>를 클릭하세요.</p>
        <% } %>
    </div>
</body>
</html>
