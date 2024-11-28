<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style type="text/css">
    .container {
        width: 400px;
        margin: 0 auto;
        padding: 20px;
        border-radius: 8px;
    }

    .title {
        text-align: center;
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 20px;
        color: #6A24FE;
        background-color: transparent;
    }

    .form-group {
        margin-bottom: 10px;
    }

    .form-group label {
        display: inline-block;
        width: 120px;
        font-weight: bold;
    }

    .form-group input[type="password"] {
        width: 200px;
        padding: 6px;
        font-size: 14px;
        border-radius: 4px;
        border: 1px solid #ddd;
    }

    .button-row {
        text-align: center;
        margin-top: 20px;
    }

    .button {
        padding: 8px 16px;
        background-color: #6A24FE;
        color: #fff;
        border-radius: 4px;
        font-size: 16px;
        border: none;
        cursor: pointer;
    }

    .button:hover {
        background-color: #4F1DA6;
    }
</style>

<div class="container">
    <h2 class="title" style="color: #6A24FE;">회원탈퇴</h2>
    <form action="${pageContext.request.contextPath}/users/delete" method="post">
        <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" id="pw" name="pw" required>
        </div>
        <div class="button-row">
            <input type="hidden" name="id" value="${vo.id}">
            <input type="submit" value="회원탈퇴" class="button">
        </div>
    </form>
</div>
