<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%	pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp"%>

<div class="page has-sidebar has-sidebar-expand-lg">
		<div class="sidebar-section">
			<div class="row">
		<!-- 
	    <div class="page-inner">
	    -->
		<!-- 	    <div class="col-md-6"> -->
		<div style="width: 40%">
			<div class="card">
				<div class="card-body col-sm-12">
					<h4 class="card-title mb-4">기초코드목록</h4>
					<button class="btn btn-info float-right mr-2" type="button" id="baseGroupAddBtn">기초그룹코드 추가</button>
				</div>
				<!-- 그룹 전체 조회 -->
				<div class="table-responsive">
					<table class="table table-bordered" id="systemCommonGroup">
						<thead class="thead-">
							<tr>
								<th style="min-width: 50px" id="baseGroupCd">사용유무</th>
								<th style="min-width: 50px" id="baseGroupCdNm">기초코드</th>
								<th style="min-width: 50px" id="baseGroupCdDesc">기초코드명</th>
							</tr>
						</thead>
					</table>
				</div>
				<!-- 그룹 전체 조회 끝-->
				<!-- 그룹 입력 -->
				<div id="groupCreateBox" class="d-none">
					<form id="groupForm">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">기초그룹코드</th>
									<th scope="col">기초그룹코드명</th>
									<th scope="col">기초그룹코드상세</th>
									<th scope="col">사용유무</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" class="form-control" placeholder="ex)001" name="baseGroupCd"></td>
									<td><input type="text" class="form-control"	placeholder="ex)기초코드명" name="baseGroupCdNm" value="기초코드명"></td>
									<td><input type="text" class="form-control" placeholder="ex)기초그룹코드상세" name="baseGroupCdDesc" value="기초그룹코드상세"></td>
									<th scope="row">
										<select id="useYn" name="useYn" class="custom-select" style="width: 100px;" name="useYn">
												<option value="Y">유</option>
												<option value="N">무</option>
										</select>
									</th>
								</tr>
							</tbody>
						</table>
						<div class="mt-2">
							<button type="button" class="btn btn-primary float-right mr-2"	 id="btnAddConfirmGroup">등록</button>
							<button type="button" class="btn btn-secondary float-right mr-2" id="baseGroupBtnClose">닫기</button>
						</div>
					</form>
				</div>
				<!-- 그룹 입력 끝 -->
				<!-- 그룹 상세보기 -->
				<div id="groupViewBox" class="d-none">
					<table class="table table-bordered table-hover">
						<colgroup><col width="120"></colgroup>
						<tr><th>기초코드		</th><td><span id="viewBoxbaseGroupCd"		></span></td></tr>
						<tr><th>기초코드명		</th><td><span id="viewBoxbaseGroupCdNm"	></span></td></tr>
						<tr><th>기초그룹코드상세	</th><td><span id="viewBoxbaseGroupCdDesc"	></span></td></tr>
						<tr><th>사용유무		</th><td><span id="viewBoxUseYn"			></span></td></tr>
					</table>
					<table class="table table-bordered table-hover mt-3">
						<colgroup><col width="120"></colgroup>
						<tr><th>등록자</th><td><span id="viewBoxregId"></span></td></tr>
						<tr><th>등록일시</th><td><span id="viewBoxregDate"></span></td></tr>
					</table>
					<table class="table table-bordered table-hover mt-3">
						<colgroup><col width="120"></colgroup>
						<tr><th>수정자</th><td><span id="viewBoxupdId"></span></td></tr>
						<tr><th>수정일시</th><td><span id="viewBoxupdDate"></span></td></tr>
					</table>
					<button type="button" class="btn btn-warning float-right mr-2" id="groupEditBtn">수정</button>
					<!-- <button type="button" class="btn btn-danger float-right mr-2" id="btnDelete" data-toggle="modal" data-target="#deleteModal">삭제(미구현)</button> -->
					<button type="button" class="btn btn-secondary float-right mr-2" id="groupCloseBtn">닫기</button>
				</div>
				<!-- 그룹 상세보기  끝 -->
				<!-- 그룹 수정 -->
				<div id="groupFormBox" class="d-none">
					<form id="groupEditForm">
						<!-- <input type="hidden" name="verify" value="n"> 뭐하는 애인고 -> 중복확인 검사값-->
						<table class="table table-bordered table-hover">
							<colgroup><col width="120"></colgroup>
							<tr><th>기초코드		</th><td><input type="text" class="form-control" id="baseGroupCd" 	name="baseGroupCd" disabled></td></tr>
							<tr><th>기초코드명		</th><td><input type="text" class="form-control" id="baseGroupCdNm" name="baseGroupCdNm"></td></tr>
							<tr><th>기초그룹코드상세	</th><td><input type="text" class="form-control" id="baseGroupCdDesc" name="baseGroupCdDesc"></td></tr>
							<tr><th>사용유무		</th>
								<td>
									<select id="useYn" name="useYn" class="custom-select" style="width: 100px;">
											<option value="Y">유</option>
											<option value="N">무</option>
									</select>
								</td>
							</tr>
						</table>
						<table class="table table-bordered table-hover mt-3">
							<colgroup><col width="120"></colgroup>
							<tr><th>등록자	</th><td><input type="text" class="form-control" id="regId" name="regId" disabled></td></tr>
							<tr><th>등록일시	</th><td><input type="text" class="form-control" id="regDate" name="regDate" disabled></td>
							</tr>
						</table>
						<table class="table table-bordered table-hover mt-3"><colgroup><col width="120"></colgroup>
							<tr><th>수정자	</th><td><input type="text" class="form-control"  id="updId" name="updId" disabled></td></tr>
							<tr><th>수정일시	</th><td><input type="text" class="form-control" id="updDate" name="updDate" disabled></td>
							</tr>
						</table>
						<button type="button" class="btn btn-warning" id="groupUpdateBtn">수정 완료</button>
						<!-- <button type="button" class="btn btn-warning" id="btnShowPasswordEdit">비밀번호 수정</button> -->
						<button type="button" class="btn btn-secondary" id="groupUpdateCancelBtn">수정 닫기</button>
					</form>
				</div>
				<!-- 그룹 수정  끝-->
			</div>
			<!-- /.page-section -->
		</div>
		<!-- 	    <div class="col-md-6"> -->
		<div style="width: 60%;">
			<header class="sidebar-header d-sm-none">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active">
							<a href="#"onclick="Looper.toggleSidebar()">
							<i class="breadcrumb-icon fa fa-angle-left mr-2"></i>뒤로가기</a>
						</li>
					</ol>
				</nav>
			</header>
			<div class="sidebar-section">
				<div class="card">
					<div class="card-body col-sm-12">
						<h4 class="card-title mb-4">세부내용</h4>
						<button class="btn btn-info float-right mr-2" type="button"	id="codeAddBtn" disabled>기초코드 추가</button>
					</div>
					<!--  코드 전체 조회 -->
					<div class="table-responsive">
						<table class="table table-bordered" id="systemCommonCode">
							<thead class="thead-">
								<tr>
									<th style="min-width: 100px">사용유무</th>
									<th style="min-width: 150px">기초그룹코드</th>
									<th style="min-width: 100px">기초코드</th>
									<th style="min-width: 150px">기초코드명</th>
									<th style="min-width: 150px">기초코드약어명</th>
									<th style="min-width: 150px">기초코드상세</th>
									<th style="min-width: 150px">etc1</th>
									<th style="min-width: 150px">etc2</th>
									<th style="min-width: 150px">etc3</th>
									<th style="min-width: 150px">etc4</th>
									<th style="min-width: 150px">etc5</th>
									<th style="min-width: 150px">etc6</th>
									<th style="min-width: 150px">etc7</th>
									<th style="min-width: 150px">etc8</th>
									<th style="min-width: 150px">etc9</th>
									<th style="min-width: 150px">etc10</th>
									<th style="min-width: 150px">등록자</th>
									<th style="min-width: 150px">등록일</th>
									<th style="min-width: 150px">수정자</th>
									<th style="min-width: 150px">수정일</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- 코드 전체 조회 끝 -->
					<!-- 코드 입력  -->
					<div id="codeCreateBox" class="d-none" style="overflow:scroll;">
						<form id="codeForm">
							<table class="table table-stripede">
								<thead>
									<tr>
										<th scope="col" style="min-width: 100px">기초그룹코드</th>
										<th scope="col" style="min-width: 100px">기초코드</th>
										<th scope="col" style="min-width: 100px">기초코드명</th>
										<th scope="col" style="min-width: 100px">기초코드약어명</th>
										<th scope="col" style="min-width: 100px">기초코드상세</th>
										<th scope="col" style="min-width: 100px">사용여부</th>
										<th scope="col" style="min-width: 100px">etc1</th>
										<th scope="col" style="min-width: 100px">etc2</th>
										<th scope="col" style="min-width: 100px">etc3</th>
										<th scope="col" style="min-width: 100px">etc4</th>
										<th scope="col" style="min-width: 100px">etc5</th>
										<th scope="col" style="min-width: 100px">etc6</th>
										<th scope="col" style="min-width: 100px">etc7</th>
										<th scope="col" style="min-width: 100px">etc8</th>
										<th scope="col" style="min-width: 100px">etc9</th>
										<th scope="col" style="min-width: 100px">etc10</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text" class="form-control" id="" name="baseGroupCd" disabled>
										<td><input type="text" class="form-control" id="" name="baseCd" placeholder="ex)000"></td>
										<td><input type="text" class="form-control" id="" name="baseCdNm" value="기초코드명"></td>
										<td><input type="text" class="form-control" id="" name="baseCdAbbr" value="기초코드약어명"></td>
										<td><input type="text" class="form-control" id="" name="baseCdDesc" value="기초코드상세"></td>
										<th scope="row">
											<select id="useYn" name="useYn" class="custom-select" style="width: 100px;" name="useYn">
													<option value="Y">유</option>
													<option value="N">무</option>
											</select>
										</th>
										<td><input type="text" class="form-control" id="editCodeEtc1" name="etc1"></td>
										<td><input type="text" class="form-control" id="editCodeEtc2" name="etc2"></td>
										<td><input type="text" class="form-control" id="editCodeEtc3" name="etc3"></td>
										<td><input type="text" class="form-control" id="editCodeEtc4" name="etc4"></td>
										<td><input type="text" class="form-control" id="editCodeEtc5" name="etc5"></td>
										<td><input type="text" class="form-control" id="editCodeEtc6" name="etc6"></td>
										<td><input type="text" class="form-control" id="editCodeEtc7" name="etc7"></td>
										<td><input type="text" class="form-control" id="editCodeEtc8" name="etc8"></td>
										<td><input type="text" class="form-control" id="editCodeEtc9" name="etc9"></td>
										<td><input type="text" class="form-control" id="editCodeEtc10" name="etc10"></td>
									</tr>
								</tbody>
							</table>
							<div class="mt-2">
								<button type="button" class="btn btn-primary float-right mr-2"	 id="btnAddConfirmCode">등록</button>
								<button type="button" class="btn btn-secondary float-right mr-2" id="codeBtnClose">닫기</button>
							</div>
						</form>
					</div>
					<!-- 코드 입력 끝  -->
					<!-- 시스템코드 상세보기 -->
					<div id="codeViewBox" class="d-none">
						<table class="table table-bordered table-hover">
							<colgroup><col width="120"></colgroup>
							<tr><th>그룹코드		</th><td><span id="viewCodeBaseGroupCd"	></span></td></tr>
							<tr><th>기초코드		</th><td><span id="viewCodeBaseCd"		></span></td></tr>
							<tr><th>기초코드명		</th><td><span id="viewCodeBaseCdNm"	></span></td></tr>
							<tr><th>기초코드약어명	</th><td><span id="viewCodeBaseCdAbbr"	></span></td></tr>
							<tr><th>기초그룹코드상세	</th><td><span id="viewCodeBaseCdDesc"	></span></td></tr>
							<tr><th>사용유무		</th><td><span id="viewCodeUseYn"		></span></td></tr>
							<tr><th>etc1		</th><td><span id="viewCodeEtc1"		></span></td></tr>
							<tr><th>etc2		</th><td><span id="viewCodeEtc2"		></span></td></tr>
							<tr><th>etc3		</th><td><span id="viewCodeEtc3"		></span></td></tr>
							<tr><th>etc4		</th><td><span id="viewCodeEtc4"		></span></td></tr>
							<tr><th>etc5		</th><td><span id="viewCodeEtc5"		></span></td></tr>
							<tr><th>etc6		</th><td><span id="viewCodeEtc6"		></span></td></tr>
							<tr><th>etc7		</th><td><span id="viewCodeEtc7"		></span></td></tr>
							<tr><th>etc8		</th><td><span id="viewCodeEtc8"		></span></td></tr>
							<tr><th>etc9		</th><td><span id="viewCodeEtc9"		></span></td></tr>
							<tr><th>etc10		</th><td><span id="viewCodeEtc10"		></span></td></tr>
						</table>
						<table class="table table-bordered table-hover mt-3">
							<colgroup><col width="120"></colgroup>
							<tr><th>등록자	</th><td><span id="viewCodeRegId"	></span></td></tr>
							<tr><th>등록일시	</th><td><span id="viewCodeRegDate"	></span></td></tr>
						</table>
						<table class="table table-bordered table-hover mt-3">
							<colgroup><col width="120"></colgroup>
							<tr><th>수정자	</th><td><span id="viewCodeUpdId"	></span></td></tr>
							<tr><th>수정일시	</th><td><span id="viewCodeUpdDate"	></span></td></tr>
						</table>
						<button type="button" class="btn btn-warning float-right mr-2" id="codeEditBtn">수정</button>
						<!-- <button type="button" class="btn btn-danger float-right mr-2" id="btnDelete" data-toggle="modal" data-target="#deleteModal">삭제(미구현)</button> -->
						<button type="button" class="btn btn-secondary float-right mr-2" id="codeCloseBtn">닫기</button>
					</div>
					<!-- 시스템코드 상세보기  끝 -->
					<!-- 시스템코드 수정 -->
					<div id="codeEditBox" class="d-none">
						<form id="codeEditForm">
							<!-- <input type="hidden" name="verify" value="n"> 뭐하는 애인고 -> 중복확인 검사값-->
							<table class="table table-bordered table-hover">
								<colgroup><col width="120"></colgroup>
								<tr><th>기초그룹코드	</th><td><input type="text" class="form-control" id="editCodeBaseGroupCd" 	name="baseGroupCd" disabled></td></tr>
								<tr><th>기초코드		</th><td><input type="text" class="form-control" id="editCodeBaseCd" 		name="baseCd" disabled> </td></tr>
								<tr><th>기초코드명		</th><td><input type="text" class="form-control" id="editCodeBaseCdNm" 		name="baseCdNm"></td></tr>
								<tr><th>기초코드약어명	</th><td><input type="text" class="form-control" id="editCodeBaseCdAbbr" 	name="baseCdAbbr"></td></tr>
								<tr><th>기초코드상세	</th><td><input type="text" class="form-control" id="editCodeBaseCdDesc" 	name="baseCdDesc"></td></tr>
								<tr><th>사용유무		</th>
									<td>
										<select id="useYn" name="useYn" class="custom-select" style="width: 100px;">
												<option value="Y">유</option>
												<option value="N">무</option>
										</select>
									</td>
								</tr>
								<tr><th>etc1		</th><td><input type="text" class="form-control" id="editCodeEtc1" 		name="etc1"></td></tr>
								<tr><th>etc2		</th><td><input type="text" class="form-control" id="editCodeEtc2" 		name="etc2"></td></tr>
								<tr><th>etc3		</th><td><input type="text" class="form-control" id="editCodeEtc3" 		name="etc3"></td></tr>
								<tr><th>etc4		</th><td><input type="text" class="form-control" id="editCodeEtc4" 		name="etc4"></td></tr>
								<tr><th>etc5		</th><td><input type="text" class="form-control" id="editCodeEtc5" 		name="etc5"></td></tr>
								<tr><th>etc6		</th><td><input type="text" class="form-control" id="editCodeEtc6" 		name="etc6"></td></tr>
								<tr><th>etc7		</th><td><input type="text" class="form-control" id="editCodeEtc7" 		name="etc7"></td></tr>
								<tr><th>etc8		</th><td><input type="text" class="form-control" id="editCodeEtc8" 		name="etc8"></td></tr>
								<tr><th>etc9		</th><td><input type="text" class="form-control" id="editCodeEtc9" 		name="etc9"></td></tr>
								<tr><th>etc10		</th><td><input type="text" class="form-control" id="editCodeEtc10"		name="etc10"></td></tr>
							</table>
							<table class="table table-bordered table-hover mt-3">
								<colgroup><col width="120"></colgroup>
								<tr><th>등록자	</th><td><input type="text" class="form-control" id="regId" name="regId" disabled></td></tr>
								<tr><th>등록일시	</th><td><input type="text" class="form-control" id="regDate" name="regDate" disabled></td>
								</tr>
							</table>
							<table class="table table-bordered table-hover mt-3"><colgroup><col width="120"></colgroup>
								<tr><th>수정자	</th><td><input type="text" class="form-control" id="updId" name="updId" disabled></td></tr>
								<tr><th>수정일시	</th><td><input type="text" class="form-control" id="updDate" name="updDate" disabled></td>
								</tr>
							</table>
							<button type="button" class="btn btn-warning" id="codeUpdateBtn">수정 완료</button>
							<!-- <button type="button" class="btn btn-warning" id="btnShowPasswordEdit">비밀번호 수정</button> -->
							<button type="button" class="btn btn-secondary" id="codeUpdateCancelBtn">수정 닫기</button>
						</form>
					</div>
					<!-- 시스템코드 수정  끝-->
				</div>
			</div>
		</div>
	</div>
	</div>
</div>

<%@include file="../layout/bottom.jsp"%>

<script>
   	//기초그룹코드 추가 클릭 시
   	$('#baseGroupAddBtn').click(function () {
   		//baseGroupSave.disabled = true;
   		$('#groupCreateBox').removeClass('d-none');
   	});
   	//기초그룹코드 입력 폼 닫기
   	$('#baseGroupBtnClose').click(function () {
   		$('#groupCreateBox').addClass('d-none');
   	});
    //기초그룹코드 수정 클릭 시
   	$('#groupEditBtn').click(function () {
   		$('#groupViewBox').addClass('d-none');
		$('#groupFormBox').removeClass('d-none');1
   	});
    //기초그룹코드 수정 취소 클릭 시
   	$('#groupUpdateCancelBtn').click(function () {
   		$('#groupViewBox').removeClass('d-none');
		$('#groupFormBox').addClass('d-none');
   	});
	//기초그룹코드 입력 폼 닫기
   	$('#groupCloseBtn').click(function () {
   		$('#groupViewBox').addClass('d-none');
   	});
   	//기초코드 추가 클릭 시
   	$('#codeAddBtn').click(function () {
   		$('#codeCreateBox').removeClass('d-none');
   	});
   	//기초코드 입력 폼 닫기
   	$('#codeBtnClose').click(function () {
   		$('#codeCreateBox').addClass('d-none');
   	});
   	//기초코드 조회 닫기
   	$('#codeCloseBtn').click(function () {
   		$('#codeViewBox').addClass('d-none');
   	});
   	//기초코드 수정 폼 열기
   	$('#codeEditBtn').click(function () {
   		$('#codeViewBox').addClass('d-none');
   		$('#codeEditBox').removeClass('d-none');
   	});
   	//기초코드 수정 폼 닫기
   	$('#codeUpdateCancelBtn').click(function () {
   		$('#codeEditBox').addClass('d-none');
   		$('#codeViewBox').removeClass('d-none');
		
   	});
   	//시스템공통그룹 전체조회
	$('#systemCommonGroup').DataTable({
		'ajax': {
			url: '<c:url value="systemCommonGroupDataList"/>',
			type: 'GET',
			data: {},
		},
		rowId: 'baseGroupCd', // id값 할당?
		
		columns: [
			{
				render: function(data, type, row) {					
					if (row['useYn']=='Y'){
						return '유';
					} 
					else if (row['useYn']=='N'){
						return '무';
					} 
					else{
						return '에러(알수없음)';
					}
				}
			},
			{ data: 'baseGroupCd' },
			{ data: 'baseGroupCdNm' },
		],
		order: [
			[ 1, 'asc' ],
		],
	});

	// 시스템공통그룹 상세 정보 보기
	$('#systemCommonGroup tbody').on('click', 'tr', function () {
       sideView = 'view';
       rowIdx = $(this).closest('tr').attr('id');
       //클릭 Group의 상세 정보
       $.ajax({
           url: '<c:url value="systemCommonGroupView"/>',
           type: 'GET',
           data: {
               'baseGroupCd': rowIdx
           },
           success: function (res) {
               let data = res.data;
               viewIdx = data.baseGroupCd;

               // 보기
               $('#viewBoxbaseGroupCd').text(data.baseGroupCd);
               $('#viewBoxbaseGroupCdNm').text(data.baseGroupCdNm);
               $('#viewBoxbaseGroupCdDesc').text(data.baseGroupCdDesc);
               $('#viewBoxUseYn').text(data.useYn);
               $('#viewBoxregId').text(data.regId);
               $('#viewBoxregDate').text( moment(data.regDate).format('YYYY-MM-DD') );
               $('#viewBoxupdId').text(data.updId);
               $('#viewBoxupdDate').text( moment(data.updDate).format('YYYY-MM-DD') );
               
               // 수정
               $('#groupEditForm input[name="baseGroupCd"]').val(data.baseGroupCd);
               $('#groupEditForm input[name="baseGroupCdNm"]').val(data.baseGroupCdNm);
               $('#groupEditForm input[name="baseGroupCdDesc"]').val(data.baseGroupCdDesc);
               $('#groupEditForm select[name=useYn]').val(data.useYn);
               $('#groupEditForm input[name="regId"]').val(data.regId);
               $('#groupEditForm input[name="regDate"]').val( moment(data.regDate).format('YYYY-MM-DD') );
               $('#groupEditForm input[name="updId"]').val(data.updId);
               $('#groupEditForm input[name="updDate"]').val( moment(data.updDate).format('YYYY-MM-DD') );

               $('#groupViewBox').removeClass('d-none');		//수정 버튼 클릭 시 viewBox는 없어지고 그자리에 입력groupFormBox 표시
               $('#groupFormBox').addClass('d-none');
               
               //기초코드 추가 폼
			   $('#codeForm input[name="baseGroupCd"]').val(data.baseGroupCd);
			   //기초코드 수정 폼
			   $('#codeEditForm input[name="baseGroupCd"]').val(data.baseGroupCd);
			   codeAddBtn.disabled = false;
           }
       });
       
	//클릭 Group의 Code 리스트
	$('#systemCommonCode').DataTable({
		"destroy": true,	//데이터테이블 초기화
		'ajax': {
				url: '<c:url value="systemCommonCodeDataList"/>',
				type: 'GET',
				data: {
					'baseGroupCd': rowIdx
				},
			},
			rowId: 'baseGroupCd', // id값 할당
			//rowId2: 'baseCd', // id값 할당
			columns: [
				{
	  				render: function(data, type, row) {					
	  					if (row['useYn']=='Y'){
	  						return '유';
	  					} else{
	  						return '무';
	  					}
	  				}
	  			},
	  			{ data: 'baseGroupCd' },
	  			{ data: 'baseCd' },
	  			{ data: 'baseCdNm' },
	  			{ data: 'baseCdAbbr' },
	  			{ data: 'baseCdDesc' },
	  			{ data: 'etc1' },
	  			{ data: 'etc2' },
	  			{ data: 'etc3' },
	  			{ data: 'etc4' },
	  			{ data: 'etc5' },
	  			{ data: 'etc6' },
	  			{ data: 'etc7' },
	  			{ data: 'etc8' },
	  			{ data: 'etc9' },
	  			{ data: 'etc10' },
	  			{ data: 'regId' },
	              {
	                  render: function(data, type, row) {
	                      return moment(row['regDate']).format('YYYY-MM-DD');
	                  }
	              },
	  			{ data: 'updId' },
	              {
	                  render: function(data, type, row) {
	                      return moment(row['updDate']).format('YYYY-MM-DD');
	                  }
	              },
	  		],
	  		order: [
	  			[ 2, 'asc' ],
	  		],
	  	});
	});

	//빈 테이블 하나 만들어 줘야 이중 Tablib가 클릭 이벤트가 실행됨.(tr생성)
	let systemCommonCode = $('#systemCommonCode').DataTable({
	});

	// 시스템공통그룹 상세 정보 보기
	$('#systemCommonCode tbody').on('click', 'tr', function () {
		//$(this).toggleClass('selected');
        //sideView = 'view';
		let val = new Array();
        for(i=0; i < 20; i++){
        	val[i] = $(this).closest('tr').find('td:eq(' + i + ')').text(); // amend the index as needed
	       
        }
       //클릭 Group의 상세 정보
       $.ajax({
           url: '<c:url value="systemCommonCodeView"/>',
           type: 'GET',
           data: {
				'baseGroupCd' : val[1],
				'baseCd' : val[2],		
           },
           success: function (res) {
               let data = res.data;
               //viewIdx = data.baseGroupCd;
 
				//코드 View
				$('#viewCodeBaseCd').text(data.baseCd);		
				$('#viewCodeBaseCdNm').text(data.baseCdNm);
				$('#viewCodeBaseCdAbbr').text(data.baseCdAbbr);
				$('#viewCodeBaseGroupCd').text(data.baseGroupCd);
				$('#viewCodeBaseCdDesc').text(data.baseCdDesc);
				$('#viewCodeEtc1').text(data.etc1);
				$('#viewCodeEtc2').text(data.etc2);
				$('#viewCodeEtc3').text(data.etc3);
				$('#viewCodeEtc4').text(data.etc4);
				$('#viewCodeEtc5').text(data.etc5);
				$('#viewCodeEtc6').text(data.etc6);
				$('#viewCodeEtc7').text(data.etc7);
				$('#viewCodeEtc8').text(data.etc8);
				$('#viewCodeEtc9').text(data.etc9);
				$('#viewCodeEtc10').text(data.etc10);
				$('#viewCodeUseYn').text(data.useYn);
				$('#viewCodeRegId').text(data.updId);
				$('#viewCodeRegDate').text( moment(data.regDate).format('YYYY-MM-DD') );
				$('#viewCodeUpdId').text(data.updId);
				$('#viewCodeUpdDate').text( moment(data.updDate).format('YYYY-MM-DD') );
				
				//코드 EditForm
				$('#codeEditForm input[name="baseGroupCd"]').val(data.baseGroupCd);
				$('#codeEditForm input[name="baseCd"]').val(data.baseCd);
				$('#codeEditForm input[name="baseCdNm"]').val(data.baseCdNm);
				$('#codeEditForm input[name="baseCdAbbr"]').val(data.baseCdAbbr);
				$('#codeEditForm input[name="baseCdDesc"]').val(data.baseCdDesc);
				$('#codeEditForm input[name="etc1"]').val(data.etc1);
				$('#codeEditForm input[name="etc2"]').val(data.etc2);
				$('#codeEditForm input[name="etc3"]').val(data.etc3);
				$('#codeEditForm input[name="etc4"]').val(data.etc4);
				$('#codeEditForm input[name="etc5"]').val(data.etc5);
				$('#codeEditForm input[name="etc6"]').val(data.etc6);
				$('#codeEditForm input[name="etc7"]').val(data.etc7);
				$('#codeEditForm input[name="etc8"]').val(data.etc8);
				$('#codeEditForm input[name="etc9"]').val(data.etc9);
				$('#codeEditForm input[name="etc10"]').val(data.etc10);
				$('#codeEditForm select[name=useYn]').val(data.useYn);
				$('#codeEditForm input[name="regId"]').val(data.regId);
				$('#codeEditForm input[name="regDate"]').val( moment(data.regDate).format('YYYY-MM-DD') );
				$('#codeEditForm input[name="updId"]').val(data.updId);
				$('#codeEditForm input[name="updDate"]').val( moment(data.updDate).format('YYYY-MM-DD') );
         	},
   			complete : function() {
   				$('#codeCreateBox').addClass('d-none');
   				$('#codeViewBox').removeClass('d-none');
   				$('#codeEditBox').addClass('d-none');
   			}
       });
	});

	//시스템공통그룹 등록
	$('#btnAddConfirmGroup').on('click', function() {
	    $.ajax({
	        url: '<c:url value="systemCommonGroupCreate"/>',
	        type: 'POST',
	        data: {
	            'baseGroupCd': $('#groupForm input[name=baseGroupCd]').val(),
	            'baseGroupCdNm': $('#groupForm input[name=baseGroupCdNm]').val(),
	            'baseGroupCdDesc': $('#groupForm input[name=baseGroupCdDesc]').val(),
	            'useYn': $('#groupForm select[name=useYn]').val(),
	        },
	        beforeSend: function() {
	            //$('#btnAddConfirm').addClass('d-none');
	            //$('#btnAddConfirmLoading').removeClass('d-none');
	        },
	        success: function (res) {
	            let data = res.data;
	            //viewIdx = data.idx;
	            sideView = 'view';
	
	            if (res.result == 'ok') {
		            //그룹 View
	            	$('#viewBoxbaseGroupCd').text(data.baseGroupCd);
	                $('#viewBoxbaseGroupCdNm').text(data.baseGroupCdNm);
	                $('#viewBoxbaseGroupCdDesc').text(data.baseGroupCdDesc);
	                $('#viewBoxUseYn').text(data.useYn);
	                $('#viewBoxregId').text(data.regId);
	                $('#viewBoxregDate').text( moment(data.regDate).format('YYYY-MM-DD') );
	                $('#viewBoxupdId').text(data.updId);
	                $('#viewBoxupdDate').text( moment(data.updDate).format('YYYY-MM-DD') );
	
	                //그룹 EditForm
	                $('#groupEditForm input[name="baseGroupCd"]').val(data.baseGroupCd);
	                $('#groupEditForm input[name="baseGroupCdNm"]').val(data.baseGroupCdNm);
	                $('#groupEditForm input[name="baseGroupCdDesc"]').val(data.baseGroupCdDesc);
	                $('#groupEditForm select[name=useYn]').val(data.useYn);
	                $('#groupEditForm input[name="regId"]').val(data.regId);
	                $('#groupEditForm input[name="regDate"]').val( moment(data.regDate).format('YYYY-MM-DD') );
	                $('#groupEditForm input[name="updId"]').val(data.updId);
	                $('#groupEditForm input[name="updDate"]').val( moment(data.updDate).format('YYYY-MM-DD') );
	
	                $('#groupViewBox').removeClass('d-none');		//수정 버튼 클릭 시 viewBox는 없어지고 그자리에 입력groupFormBox 표시
	                $('#groupFormBox').addClass('d-none');
	
	            } else {
	                toastr.error(res.message);
	            }
	        },
	        complete:function(){
	            //$('#groupViewBox').removeClass('d-none');
	            //$('#btnAddConfirmLoading').addClass('d-none');
	            $('#systemCommonGroup').DataTable().ajax.reload(); //등록 후 테이블 리로드
	        }
	    });
	 });

    //그룹코드 정보수정 클릭 시
   	$('#groupUpdateBtn').click(function () {
          $.ajax({
            url: '<c:url value="systemCommonGroupUpdate"/>',
            type: 'POST',
            data: {
                'baseGroupCd': $('#groupEditForm input[name="baseGroupCd"]').val(),
                'baseGroupCdNm': $('#groupEditForm input[name="baseGroupCdNm"]').val(),
                'baseGroupCdDesc': $('#groupEditForm input[name="baseGroupCdDesc"]').val(),
                'useYn': $('#groupEditForm select[name="useYn"]').val(),
            },
            beforeSend: function() {
               //$('#btnUpdateConfirm').addClass('d-none');
               //$('#btnUpdateConfirmLoading').removeClass('d-none');
            },
            success: function (res) {
                let data = res.data;
                sideView = 'view';
                if (res.result == 'ok') {
                  // 수정 완료 시 수정데이터 보기
                  $('#viewBoxbaseGroupCd').text(data.baseGroupCd);
	              $('#viewBoxbaseGroupCdNm').text(data.baseGroupCdNm);
	              $('#viewBoxbaseGroupCdDesc').text(data.baseGroupCdDesc);
	              $('#viewBoxUseYn').text(data.useYn);
	              $('#viewBoxregId').text(data.regId);
	              $('#viewBoxregDate').text( moment(data.regDate).format('YYYY-MM-DD') );
	              $('#viewBoxupdId').text(data.updId);
	              $('#viewBoxupdDate').text( moment(data.updDate).format('YYYY-MM-DD') );

                  //$('#formText').text(' - 정보');
                  //$('#userTable').DataTable().ajax.reload( function () {});
                  //toastr.success('수정되었습니다.');
                } else {
                    toastr.error(res.message);
                }
            },
            complete:function(){
              	alert("그룹 수정 완료");
          		$('#groupFormBox').addClass('d-none');
          		$('#groupViewBox').removeClass('d-none');
          		$('#systemCommonGroup').DataTable().ajax.reload(); //등록 후 테이블 리로드
            }
        });
   	});

  //시스템코드 등록
	$('#btnAddConfirmCode').on('click', function() {
		$.ajax({
			url : '<c:url value="systemCommonCodeCreate"/>',
			type : 'POST',
			data : {
				'baseGroupCd' 	: $('#codeForm input[name=baseGroupCd]').val(),
				'baseCd' 		: $('#codeForm input[name=baseCd]').val(),
				'baseCdNm' 		: $('#codeForm input[name=baseCdNm]').val(),
				'baseCdAbbr' 	: $('#codeForm input[name=baseCdAbbr]').val(),
				'baseCdDesc' 	: $('#codeForm input[name=baseCdDesc]').val(),
				'etc1' 			: $('#codeForm input[name=etc1]').val(),
				'etc2' 			: $('#codeForm input[name=etc2]').val(),
				'etc3' 			: $('#codeForm input[name=etc3]').val(),
				'etc4' 			: $('#codeForm input[name=etc4]').val(),
				'etc5' 			: $('#codeForm input[name=etc5]').val(),
				'etc6' 			: $('#codeForm input[name=etc6]').val(),
				'etc7' 			: $('#codeForm input[name=etc7]').val(),
				'etc8' 			: $('#codeForm input[name=etc8]').val(),
				'etc9' 			: $('#codeForm input[name=etc9]').val(),
				'etc10' 		: $('#codeForm input[name=etc10]').val(),
				'useYn' 		: $('#codeForm select[name=useYn]').val(),
			},
			beforeSend : function() {
				//$('#btnAddConfirm').addClass('d-none');
				//$('#btnAddConfirmLoading').removeClass('d-none');
			},
			success : function(res) {
				let data = res.data;
				//viewIdx = data.idx;
				//sideView = 'view';

				if (res.result == 'ok') {
					
					//코드 View
					$('#viewCodeBaseCd').text(data.baseCd);		
					$('#viewCodeBaseCdNm').text(data.baseCdNm);
					$('#viewCodeBaseCdAbbr').text(data.baseCdAbbr);
					$('#viewCodeBaseGroupCd').text(data.baseGroupCd);
					$('#viewCodeBaseCdDesc').text(data.baseCdDesc);
					$('#viewCodeEtc1').text(data.etc1);
					$('#viewCodeEtc2').text(data.etc2);
					$('#viewCodeEtc3').text(data.etc3);
					$('#viewCodeEtc4').text(data.etc4);
					$('#viewCodeEtc5').text(data.etc5);
					$('#viewCodeEtc6').text(data.etc6);
					$('#viewCodeEtc7').text(data.etc7);
					$('#viewCodeEtc8').text(data.etc8);
					$('#viewCodeEtc9').text(data.etc9);
					$('#viewCodeEtc10').text(data.etc10);
					$('#viewCodeUseYn').text(data.useYn);
					$('#viewCodeRegId').text(data.updId);
					$('#viewCodeRegDate').text( moment(data.regDate).format('YYYY-MM-DD') );
					$('#viewCodeUpdId').text(data.updId);
					$('#viewCodeUpdDate').text( moment(data.updDate).format('YYYY-MM-DD') );
					
					//코드 EditForm
					$('#codeEditForm input[name="baseGroupCd"]').val(data.baseGroupCd);
					$('#codeEditForm input[name="baseCd"]').val(data.baseCd);
					$('#codeEditForm input[name="baseCdNm"]').val(data.baseCdNm);
					$('#codeEditForm input[name="baseCdAbbr"]').val(data.baseCdAbbr);
					$('#codeEditForm input[name="baseCdDesc"]').val(data.baseCdDesc);
					$('#codeEditForm input[name="etc1"]').val(data.etc1);
					$('#codeEditForm input[name="etc2"]').val(data.etc2);
					$('#codeEditForm input[name="etc3"]').val(data.etc3);
					$('#codeEditForm input[name="etc4"]').val(data.etc4);
					$('#codeEditForm input[name="etc5"]').val(data.etc5);
					$('#codeEditForm input[name="etc6"]').val(data.etc6);
					$('#codeEditForm input[name="etc7"]').val(data.etc7);
					$('#codeEditForm input[name="etc8"]').val(data.etc8);
					$('#codeEditForm input[name="etc9"]').val(data.etc9);
					$('#codeEditForm input[name="etc10"]').val(data.etc10);
					$('#codeEditForm select[name=useYn]').val(data.useYn);
					$('#codeEditForm input[name="regId"]').val(data.regId);
					$('#codeEditForm input[name="regDate"]').val( moment(data.regDate).format('YYYY-MM-DD') );
					$('#codeEditForm input[name="updId"]').val(data.updId);
					$('#codeEditForm input[name="updDate"]').val( moment(data.updDate).format('YYYY-MM-DD') );
					
				} else {
					//toastr.error(res.message);
				}
			},
			complete : function() {
				$('#codeCreateBox').addClass('d-none');
				$('#codeViewBox').removeClass('d-none');		//수정 버튼 클릭 시 viewBox는 없어지고 그자리에 입력groupFormBox 표시
				$('#codeEditBox').addClass('d-none');
				$('#systemCommonCode').DataTable().ajax.reload(); //등록 후 테이블 리로드
				alert("기초코드 등록 완료.!");
			}
		});
	 });

	//시스템코드 정보수정 클릭 시
   	$('#codeUpdateBtn').click(function () {
            $.ajax({
            url: '<c:url value="systemCommonCodeUpdate"/>',
            type: 'POST',
            data: {
				'baseGroupCd' 	: $('#codeEditForm input[name=baseGroupCd]').val(),
				'baseCd' 		: $('#codeEditForm input[name=baseCd]').val(),
				'baseCdNm' 		: $('#codeEditForm input[name=baseCdNm]').val(),
				'baseCdAbbr' 	: $('#codeEditForm input[name=baseCdAbbr]').val(),
				'baseCdDesc' 	: $('#codeEditForm input[name=baseCdDesc]').val(),
				'etc1' 			: $('#codeEditForm input[name=etc1]').val(),
				'etc2' 			: $('#codeEditForm input[name=etc2]').val(),
				'etc3' 			: $('#codeEditForm input[name=etc3]').val(),
				'etc4' 			: $('#codeEditForm input[name=etc4]').val(),
				'etc5' 			: $('#codeEditForm input[name=etc5]').val(),
				'etc6' 			: $('#codeEditForm input[name=etc6]').val(),
				'etc7' 			: $('#codeEditForm input[name=etc7]').val(),
				'etc8' 			: $('#codeEditForm input[name=etc8]').val(),
				'etc9' 			: $('#codeEditForm input[name=etc9]').val(),
				'etc10' 		: $('#codeEditForm input[name=etc10]').val(),
				'useYn' 		: $('#codeEditForm select[name=useYn]').val(),
            },
            beforeSend: function() {
               //$('#btnUpdateConfirm').addClass('d-none');
               //$('#btnUpdateConfirmLoading').removeClass('d-none');
            },
            success: function (res) {
                let data = res.data;
                sideView = 'view';
                if (res.result == 'ok') {

				//코드 View
				$('#viewCodeBaseCd').text(data.baseCd);		
				$('#viewCodeBaseCdNm').text(data.baseCdNm);
				$('#viewCodeBaseCdAbbr').text(data.baseCdAbbr);
				$('#viewCodeBaseGroupCd').text(data.baseGroupCd);
				$('#viewCodeBaseCdDesc').text(data.baseCdDesc);
				$('#viewCodeEtc1').text(data.etc1);
				$('#viewCodeEtc2').text(data.etc2);
				$('#viewCodeEtc3').text(data.etc3);
				$('#viewCodeEtc4').text(data.etc4);
				$('#viewCodeEtc5').text(data.etc5);
				$('#viewCodeEtc6').text(data.etc6);
				$('#viewCodeEtc7').text(data.etc7);
				$('#viewCodeEtc8').text(data.etc8);
				$('#viewCodeEtc9').text(data.etc9);
				$('#viewCodeEtc10').text(data.etc10);
				$('#viewCodeUseYn').text(data.useYn);
				$('#viewCodeRegId').text(data.updId);
				$('#viewCodeRegDate').text( moment(data.regDate).format('YYYY-MM-DD') );
				$('#viewCodeUpdId').text(data.updId);
				$('#viewCodeUpdDate').text( moment(data.updDate).format('YYYY-MM-DD') );
                
                //$('#formText').text(' - 정보');
                //$('#userTable').DataTable().ajax.reload( function () {});
                //toastr.success('수정되었습니다.');
                } else {
                    toastr.error(res.message);
                }
            },
            complete:function(){
              	alert("코드 수정 완료");
          		$('#codeEditBox').addClass('d-none');
          		$('#codeViewBox').removeClass('d-none');
          		$('#systemCommonCode').DataTable().ajax.reload(); //수정 후 테이블 리로드
            }
        });
   	});
</script>

</body>
</html>
