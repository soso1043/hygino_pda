<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp" %>
<body>

    <!-- .auth -->
    <main class="auth">
        <header id="auth-header" class="auth-header" style="background-image: url(<c:url value='/resources/assets/images/illustration/img-1.png'/>);">
            <h1>MES</h1>
        </header>

        <form class="auth-form" id="loginForm">
            <div id="messageBox" class="alert alert-danger has-icon d-none" role="alert">
                <div class="alert-icon">
                    <span class="fa fa-info"></span>
                </div>
                <h5>오류</h5>
                <span id="message"></span>
            </div>
            <div class="form-group">
                <div class="form-label-group">
                    <input type="text" name="userId" id="userId" class="form-control" placeholder="아이디" autofocus required>
                    <label for="userId">아이디</label>
                </div>
            </div>
            <div class="form-group">
                <div class="form-label-group">
                    <input type="password" name="password" id="password" class="form-control" placeholder="비밀번호" required>
                    <label for="password">비밀번호</label>
                </div>
            </div>
            <div class="form-group">
                <button class="btn btn-lg btn-primary btn-block btn-login" type="submit">로그인</button>
                <button class="btn btn-lg btn-primary btn-block d-none btn-loading" type="button" disabled=""><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Loading...</button>
            </div>
        </form>
    </main>

    <%@include file="../layout/script.jsp" %>
    <script>
        currentPage = "login";

        $('#loginForm').parsley();

        $("#loginForm").submit(function(e){
            e.preventDefault(e);

            $.ajax({
                type: 'POST',
                url: '<c:url value="/auth/login_ajax"/>',
                dataType: 'json',
                data: {
                    userId: $('#userId').val(),
                    password: $('#password').val(),
                },
                beforeSend: function() {
                    $('.btn-login').addClass('d-none');
                    $('.btn-loading').removeClass('d-none');
                },
                success: function (res) {
                    if (res.result === 'ok') {
                        $(location).attr('href', '<c:url value="/dashboard"/>');
                    } else {
                        $('#password').val('');
                        $('#message').text(res.message);
                        $('#messageBox').removeClass('d-none');
                    }
                },
                complete:function(){
                    $('.btn-login').removeClass('d-none');
                    $('.btn-loading').addClass('d-none');
                }
            });
        });
    </script>
</body>
</html>
