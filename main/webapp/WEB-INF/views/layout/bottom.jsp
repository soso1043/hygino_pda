<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<!-- 삭제 모달 -->
<div class="modal modal-alert fade" id="deleteModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<h5 id="exampleModalAlertWarningLabel" class="modal-title">
<i class="fa fa-bullhorn text-warning mr-1"></i> 데이터 삭제
</h5>
</div>
<div class="modal-body">
<p>삭제된 데이터는 복구가 불가능합니다.<br>정말 삭제하시겠습니까?</p>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-danger" id="btnDeleteConfirm">삭제</button>
<button class="btn btn-danger d-none" id="btnDeleteConfirmLoading" type="button" disabled=""><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Loading...</button>
&nbsp;<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
</div>
</div>
</div>
</div>
<!-- 삭제 모달 -->

</div>

<!--
<footer class="app-footer">
<ul class="list-inline">
<li class="list-inline-item"><a class="text-muted" href="#">Support</a></li>
<li class="list-inline-item"><a class="text-muted" href="#">Help Center</a></li>
<li class="list-inline-item"><a class="text-muted" href="#">Privacy</a></li>
<li class="list-inline-item"><a class="text-muted" href="#">Terms of Service</a></li>
</ul>
<div class="copyright">Copyright &copy; 2018. All right reserved.</div>
</footer>
-->
<!-- /.wrapper -->

</main>
<!-- /.app-main -->
</div>
<!-- /.app -->

<%@include file="../layout/script.jsp" %>

