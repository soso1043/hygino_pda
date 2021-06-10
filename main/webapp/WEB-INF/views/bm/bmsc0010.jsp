<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/body-top.jsp" %>

<div class="page has-sidebar has-sidebar-expand-lg">
	<div class="row">
	    <!-- 
	    <div class="page-inner">
	    -->
<!-- 	    <div class="col-md-6"> -->
			<div style="width:60%">	
	        <header class="page-title-bar">
	            <!-- floating action -->
	            <button type="button" class="btn btn-success btn-floated"><span class="fa fa-plus"></span></button> <!-- /floating action -->
	            <!-- title and toolbar -->
	
	            <!-- title and toolbar -->
	            <div class="d-md-flex align-items-md-start">
	                <h5 class="page-title mr-sm-auto">&nbsp;&nbsp;제품코드관리 > 제품코드목록</h5>
	                <div class="btn-toolbar">
	                    <button type="button" class="btn btn-success">Excel</button>	                
	                    &nbsp;
	                    <button type="button" class="btn btn-primary" id="btnShowCreate">조회</button>
	                </div>
	            </div>
	            <!-- /title and toolbar -->
	
	        </header>
	
	        <!-- .page-section -->
	        <div class="page-section">
	            <div class="card card-fluid">
	                <div class="card-body">
	                    <table id="goodsCdTable" class="table table-bordered">
	                        <thead>
	                        <tr>
	                            <th>제품코드</th>
	                            <th>제품명</th>
	                            <th>규격</th>
	                            <th>모델NO</th>
	                            <th>AL/Nicu</th>
	                            <th>Film</th>
	                            <th>면취<br/>(압연)</th>
	                            <th>구분<br/>(연질/경질)</th>
	                        </tr>
	                        </thead>
	                    </table>
	                </div>
	            </div>
	        </div>
	        <!-- /.page-section -->
	
	    </div>
	
	    <!-- 사이드 페이지 -->
	    <!-- 
	    <div class="page-sidebar">
	    -->
	    
<!-- 	    <div class="col-md-6"> -->
			<div style="width:40%;">
	        <header class="sidebar-header d-sm-none">
	            <nav aria-label="breadcrumb">
	                <ol class="breadcrumb">
	                    <li class="breadcrumb-item active">
	                        <a href="#" onclick="Looper.toggleSidebar()"><i class="breadcrumb-icon fa fa-angle-left mr-2"></i>뒤로가기</a>
	                    </li>
	                </ol>
	            </nav>
	        </header>
	        <div class="sidebar-section">
	            <button type="button" class="close mt-n1 d-none d-xl-none d-sm-block" onclick="Looper.toggleSidebar()" aria-label="Close"><span aria-hidden="true">×</span></button>
	            <h6> 제품코드 정보 <span id="formText"></span></h6>
	
	            <!-- 등록, 수정 -->
	            <div id="formBox">
	                    <div class="mt-2">
	                        <button type="button" class="btn btn-primary" id="btnAdd">등록</button>
	                        <button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled=""><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중</button>
	                        <button type="button" class="btn btn-warning" id="btnEdit">수정</button>
	                        <button class="btn btn-warning d-none" id="btnEditConfirmLoading" type="button" disabled=""><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중</button>
	                    </div>	            
	                <form id="form">
	                    <input type="hidden" name="verify" value="n">
	                    <table>
	                        <colgroup>
	                            <col width="20%">
	                            <col width="30%">
	                            <col width="20%">
	                            <col width="30%">	                            
	                        </colgroup>
	                        <tr>
	                            <th>제품코드</th>
	                            <td><input type="text" class="form-control" id="goodsCd" name="goodsCd"></td>
	                            <th>제품명<br/>(기종)</th>
	                            <td><input type="text" class="form-control" id="goodsNm"  name="goodsNm"></td>
	                        </tr>
	                        <tr>
	                            <th>규격</th>
	                            <td><input type="text" class="form-control" id="model"  name="model"></td>
	                            <th>모델NO</th>
	                            <td><input type="text" class="form-control" id="modelNo"  name="modelNo"></td>
	                        </tr>
	                        <tr>
	                            <th>비중</th>
	                            <td ><input type="text" class="form-control" id=gravity name="gravity"></td>
	                        </tr>
	                    </table>

	                     <h6> AL/Nicu</h6>
	                    <table>
	                        <colgroup>
	                            <col width="20%">
	                            <col width="30%">
	                            <col width="20%">
	                            <col width="30%">	                            
	                        </colgroup>
	                        <tr>
	                            <th>자재명</th>
	                            <input type="hidden" class="form-control" id="alni_matrlCd" name="alni_matrlCd">
	                            <td colspan="3"><input type="text" class="form-control" id="alni_matrlNm" name="alni_matrlNm" style="width:89%;float:left">
	                            <button type="button" class="btn btn-primary" id="btnSelAlni" onClick="selectMatrlCode('alni')" style="float:right">선택</button></td>
	                        </tr>
	                        <tr>
	                            <th>재질</th>
	                            <td><input type="text" class="form-control" id="alni_qutyNm" name="alni_qutyNm"></td>
	                            <th>구분(연질/경질)</th>
	                            <td><input type="text" class="form-control"  id="alni_gubunNm" name="alni_gubunNm"></td>
	                        </tr>
	                        <tr>
	                            <th>두께</th>
	                            <td ><input type="text" class="form-control"  id="alni_thickness" name="alni_thickness"></td>
	                            <th>면취(압연)</th>
	                            <td ><input type="text" class="form-control" id="alni_chamferYnNm" name="alni_chamferYnNm"></td>	                            
	                        </tr>
	                        <tr>
	                            <th>폭</th>
	                            <td ><input type="text" class="form-control" id="alni_depth" name="alni_depth"></td>
	                            <th>너비</th>
	                            <td ><input type="text" class="form-control" id="alni_width" name="alni_width"></td>	                            
	                        </tr>
	                        <tr>
	                            <th>길이</th>
	                            <td ><input type="text" class="form-control" id="alni_length" name="alni_length"></td>
	                            <th>피치</th>
	                            <td ><input type="text" class="form-control" id="alni_pitch" name="alni_pitch"></td>	                            
	                        </tr>
	                        <tr>
	                            <th>표면처리</th>
	                            <td ><input type="text" class="form-control" id="alni_surfaceTrtmtNm" name="alni_surfaceTrtmtNm"></td>
	                        </tr>	                        
	                    </table>
	                     <h6>Film</h6>
	                    <table>
	                        <colgroup>
	                            <col width="20%">
	                            <col width="30%">
	                            <col width="20%">
	                            <col width="30%">	                            
	                        </colgroup>
	                        <tr>
	                            <th>자재명</th>
	                            <input type="hidden" id="film_matrlCd" name="film_matrlCd">
	                            <td colspan="3"><input type="text" class="form-control" id="film_matrlNm" name="film_matrlNm" style="width:89%;float:left">
	                            <button type="button" class="btn btn-primary" id="btnSelFilm" onClick="selectMatrlCode('film')" style="float:right">선택</button></td>
	                        </tr>
	                        <tr>
	                            <th>재질</th>
	                            <td><input type="text" class="form-control" id="film_qutyNm" name="film_qutyNm"></td>
	                            <th>구분(연질/경질)</th>
	                            <td><input type="text" class="form-control"  id="film_gubunNm" name="film_gubunNm"></td>
	                        </tr>
	                        <tr>
	                            <th>두께</th>
	                            <td ><input type="text" class="form-control"  id="film_thickness" name="film_thickness"></td>
	                            <th>면취(압연)</th>
	                            <td ><input type="text" class="form-control" id="film_chamferYnNm" name="film_chamferYnNm"></td>	                            
	                        </tr>
	                        <tr>
	                            <th>폭</th>
	                            <td ><input type="text" class="form-control" id="film_depth" name="film_depth"></td>
	                            <th>너비</th>
	                            <td ><input type="text" class="form-control" id="film_width" name="film_width"></td>	                            
	                        </tr>
	                        <tr>
	                            <th>길이</th>
	                            <td ><input type="text" class="form-control" id="film_length" name="film_length"></td>
	                            <th>피치</th>
	                            <td ><input type="text" class="form-control" id="film_pitch" name="film_pitch"></td>	                            
	                        </tr>
	                        <tr>
	                        	<th>출고처</th>
	                        	<input type="hidden" id="dealCorpCd" name="dealCorpCd">
	                            <td ><input type="text" class="form-control" id="dealCorpNm" name="dealCorpNm" style="width:70%;float:left" >
	                            <button type="button" class="btn btn-primary" id="btnSelDealCorp" onClick="selectDealCorp()" style="float:right">선택</button></td>
	                            <th>재고단위</th>
	                            <td><select id="tmUnitCd" ></select></td>
	                        </tr>
	                        <tr>
	                            <th>체크1</th>
	                            <td ><input type="text" class="form-control" id="etc1" name="etc1"></td>
	                            <th>포장단위</th>
	                            <td ><select id="packUnitCd" ></select></td>	                            
	                        </tr>
	                        <tr>
	                            <th>상태유무</th>
	                            <td ><select id="statusYnCd" ></select></td>
	                            <th>비고</th>
	                            <td ><input type="text" class="form-control" id="goodsDesc" name="goodsDesc"></td>	                            
	                        </tr>	                        	                        
	                    </table>	                    	                    	                    
	                </form>
	            </div>
	            <!--// 등록, 수정 -->
	                    <div class="mt-2">
	                        <button type="button" class="btn btn-primary d-none" id="btnSave">저장</button>
	                        <button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled=""><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중</button>
	                    </div>	
	            
	
	        </div>
	    </div>
    </div>
</div>

<%@include file="../layout/bottom.jsp" %>

<script>
    let currentPage = 'goodsCode';
    let sideView = 'add';

  	//공통코드 처리 시작
    var statusYnCode=new Array();
      	
    <c:forEach items="${statusYnCd}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseCdNm="${info.baseCdNm}";
		statusYnCode.push(json);
    </c:forEach>

    var tmUnitCode=new Array();

    <c:forEach items="${tmUnitCd}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseCdNm="${info.baseCdNm}";
		tmUnitCode.push(json);
    </c:forEach>

    var packUnitCode=new Array();

    <c:forEach items="${packUnitCd}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseCdNm="${info.baseCdNm}";
		packUnitCode.push(json);
    </c:forEach>
  //공통코드 처리 종료
      
    //alert("test ="+JSON.stringify(useYnCode));
    
    $('#'+currentPage+'Menu').closest('.has-child','li').addClass('has-open');
    $('#'+currentPage+'Menu').css('color','#0000FF');

    uiInitProc(true);
	uiProc(true);
	
    // 목록
    let goodsCodeTable = $('#goodsCdTable').DataTable({
        language: lang_kor,
        paging: true,
        info: true,
        ordering: true,
        processing: true,
        autoWidth: false,
        ajax: {
            url: '<c:url value="/bm/goodsCodeDataList"/>',
            type: 'GET',
            data: {
            },
            /*
            success : function(res) {
                console.log(res);
            }
            */
        },
        rowId: 'goodsCd',
        columns: [
            { data: 'goodsCd' },
            { data: 'goodsNm' },
            { data: 'model' },
            { data: 'modelNo' },
            { data: 'alnicuMatrlNm' },
            { data: 'filmMatrlNm' },
            { data: 'gubunNm' },
            { data: 'chamferYnNm' },
        ],
        columnDefs: [
            {
                //'targets': [0],
                //'orderable': false,
                //'searchable': false,
            },
        ],
        order: [
            [ 1, 'asc' ]
        ],
    });

    // 보기
    $('#goodsCdTable tbody').on('click', 'tr', function () {
        goodsCd = goodsCodeTable.row( this ).data().goodsCd;
        console.log("goodsCd = " + goodsCd);
        $.ajax({
            url: '<c:url value="/bm/goodsCodeData"/>',
            type: 'GET',
            data: {
                'goodsCd': goodsCd
            },
            success: function (res) {
                let data = res.data;
                let alnidata = res.alnidata;
                let filmdata = res.filmdata;
                sideView = 'edit';
                // 보기
                $('#goodsCd').val(data.goodsCd);
                $('#goodsNm').val(data.goodsNm);
                $('#model').val(data.model);
                $('#modelNo').val(data.modelNo);
                $('#gravity').val(data.gravity);
                $('#dealCorpNm').val(data.dealCorpNm);
                $('#dealCorpCd').val(data.dealCorpCd);                                                               
                $('#etc1').val(data.etc1);
                $('#goodsDesc').val(data.goodsDesc);

                $('#alni_matrlCd').val(alnidata.matrlCd);
                $('#alni_matrlNm').val(alnidata.matrlNm);
                $('#alni_qutyNm').val(alnidata.qutyNm);
                $('#alni_gubunNm').val(alnidata.gubunNm);
                $('#alni_chamferYnNm').val(alnidata.chamferYnNm);
                $('#alni_thickness').val(alnidata.thickness);
                $('#alni_depth').val(alnidata.depth);
                $('#alni_width').val(alnidata.width);
                $('#alni_length').val(alnidata.length);
                $('#alni_pitch').val(alnidata.pitch);
                $('#alni_surfaceTrtmtNm').val(alnidata.surfaceTrtmtNm);

                $('#film_matrlCd').val(filmdata.matrlCd);
                $('#film_matrlNm').val(filmdata.matrlNm);
                $('#film_qutyNm').val(filmdata.qutyNm);
                $('#film_gubunNm').val(filmdata.gubunNm);
                $('#film_chamferYnNm').val(filmdata.chamferYnNm);
                $('#film_thickness').val(filmdata.thickness);
                $('#film_depth').val(filmdata.depth);
                $('#film_width').val(filmdata.width);
                $('#film_length').val(filmdata.length);
                $('#film_pitch').val(filmdata.pitch);
                //$('#film_surfaceTrtmtNm').val(filmdata.surfaceTrtmtNm);                
                                               
				//화면처리
                uiProc(true);

                //선택박스 처리
                selectBoxAppend(packUnitCode, "packUnitCd", data.packUnitCd , "");
                selectBoxAppend(tmUnitCode, "tmUnitCd", data.tmUnitCd , ""); 
                selectBoxAppend(statusYnCode, "statusYnCd", data.statusYnCd , "");  			
            }
        });
    });

    // 등록폼
    $('#btnAdd').on('click', function() {
        sideView = 'add';

        $('#form').each(function(){
            this.reset();
        });

      	if( true ) {
            //$('#goodsCd').val(data.goodsCd);
            $('#goodsNm').val("DE/SK");
            $('#model').val("0.2*14-PP5.5*45-45.5");
            $('#modelNo').val("162-00036A");
            $('#gravity').val("0.00238");
            $('#etc1').val("체크1");
            $('#goodsDesc').val("비고 제품등록 테스트");
      	}
      	        
		//화면처리
        uiProc(false);

        //선택박스 처리
        selectBoxAppend(packUnitCode, "packUnitCd", "" , "2");
        selectBoxAppend(tmUnitCode, "tmUnitCd", "" , "2"); 
        selectBoxAppend(statusYnCode, "statusYnCd", "" , "2");       
        $('#btnSave').removeClass('d-none');  // 등록버튼
    });

    // 수정폼
    $('#btnEdit').on('click', function() {
        if(sideView != 'edit') {
        	toastr.error("수정할 목록을 선택해 주세요!");
            return false;
        }

		uiProc(false);
        $('#btnSave').removeClass('d-none');
    });    

    // 등록 처리
    $('#btnSave').on('click', function() {
        if ( !$.trim($('#goodsNm').val()) ) {
            toastr.error('제품명을 입력해 주세요.');
            $('#goodsNm').focus();
            return false;
        }

        if ( !$.trim($('#model').val()) ) {
            toastr.error('규격을 입력해 주세요.');
            $('#model').focus();
            return false;
        }

        if ( !$.trim($('#modelNo').val()) ) {
            toastr.error('모델번호를 입력해 주세요.');
            $('#modelNo').focus();
            return false;
        }
        
        if ( !$.trim($('#gravity').val()) ) {
            toastr.error('비중을 입력해 주세요.');
            $('#gravity').focus();
            return false;
        }
        
        if ( !$.trim($('#alni_matrlCd').val()) ) {
            toastr.error('Al/Nicu 자재코드 정보를  선택해 주세요.');
            return false;
        }

        var matrlCd = $('#alni_matrlCd').val().substring(0,1);
        if ( matrlCd != 'A' && matrlCd != 'N' ) {
            toastr.error('Al/Nicu 선택 시  Al 또는 Nicu 재질 자재코드 정보를  선택해 주세요.');
            return false;
        }
        
        if ( !$.trim($('#film_matrlCd').val()) ) {
            toastr.error('Film 자재코드 정보를  선택해 주세요.');
            return false;
        }

        matrlCd = $('#film_matrlCd').val().substring(0,1);
        if ( matrlCd != 'F') {
            toastr.error('Film 선택 시  Film 재질 자재코드 정보를  선택해 주세요.');
            return false;
        } 

        if ( !$.trim($('#dealCorpCd').val()) ) {
            toastr.error('출고처 정보를  선택해 주세요.');
            return false;
        }
                
        if ( $("#tmUnitCd option:selected").val() == "" ) {
            toastr.error('재고단위를 선택해 주세요.');
            return false;
        }              

        if ( $("#packUnitCd option:selected").val() == "" ) {
            toastr.error('포장단위를 선택해 주세요.');
            return false;
        }

        if ( $("#statusYnCd option:selected").val() == "" ) {
            toastr.error('상태유무를 선택해 주세요.');
            return false;
        }          

        var url = '/bm/goodsCdCreate';        
        if( sideView == "edit" ) {
            url = '/bm/goodsCdUpdate'
        }
        
        $.ajax({
            url: url,
            type: 'POST',
            data: {
            	'goodsCd'   	:        $('#goodsCd').val(),                
            	'goodsNm'   	:        $('#goodsNm').val(),
	            'model'      	:        $('#model').val(),
	            'modelNo'   	:        $('#modelNo').val(),
	            'alnicuMatrlCd' :        $('#alni_matrlCd').val(),
	            'filmMatrlCd'   :        $('#film_matrlCd').val(),
	            'gravity'      	:        $('#gravity').val(),
	            'dealCorpCd'    :        $('#dealCorpCd').val(),
	            'tmUnitCd'      :        $("#tmUnitCd option:selected").val(),
	            'packUnitCd'    :        $("#packUnitCd option:selected").val(),	            
	            'etc1'          :        $('#etc1').val(),
	            'goodsDesc'     :        $('#goodsDesc').val(),
	            'statusYnCd'    :        $("#statusYnCd option:selected").val(),
	            'regId'			:		'reg_id',
	            'updId'			:		'upd_id'
            },
            beforeSend: function() {
              //  $('#btnAddConfirm').addClass('d-none');
              //  $('#btnAddConfirmLoading').removeClass('d-none');
            },
            success: function (res) {
                let data = res.data;
 
                if (res.result == 'ok') {
                    // 보기
					$('#goodsCd').val(data.goodsCd);
                    $('#goodsCdTable').DataTable().ajax.reload( function () {});
                    
                    uiProc(true);
                    $('#btnSave').addClass('d-none');
                   if( sideView == "edit" ) {
                	   toastr.success('수정되었습니다.');
                    } else {
                        toastr.success('등록되었습니다.');
                    }
                   
                   	sideView = 'edit';
                } else {
                    toastr.error(res.message);
                }
            },
            complete:function(){
                //$('#btnAddConfirm').removeClass('d-none');
                //$('#btnAddConfirmLoading').addClass('d-none');
            }
        });
    });



   	function uiProc(flag)
   	{
        //$("#goodsCd").attr("disabled",flag);
        $("#goodsNm").attr("disabled",flag);                
        $("#model").attr("disabled",flag);               
        $("#presidentNm").attr("disabled",flag);                 
        $("#modelNo").attr("disabled",flag);   
        $("#gravity").attr("disabled",flag);
        $("#tmUnitCd").attr("disabled",flag);
        $("#packUnitCd").attr("disabled",flag);
        $("#etc1").attr("disabled",flag);
        $("#goodsDesc").attr("disabled",flag);  
        $("#statusYnCd").attr("disabled",flag);
        $("#statusYnCd").attr("disabled",flag); 
        $("#btnSelAlni").attr("disabled",flag);
        $("#btnSelFilm").attr("disabled",flag);                
        $("#btnSelDealCorp").attr("disabled",flag); 
   	}

   	function uiInitProc(flag)
   	{
        $("#goodsCd").attr("disabled",flag);
        $("#dealCorpNm").attr("disabled",flag);
        
        $("#alni_matrlNm").attr("disabled",flag);                
        $("#alni_qutyNm").attr("disabled",flag);               
        $("#alni_gubunNm").attr("disabled",flag);                 
        $("#alni_thickness").attr("disabled",flag);   
        $("#alni_chamferYnNm").attr("disabled",flag);
        $("#alni_depth").attr("disabled",flag);
        $("#alni_width").attr("disabled",flag);
        $("#alni_length").attr("disabled",flag);
        $("#alni_pitch").attr("disabled",flag);  
        $("#alni_surfaceTrtmtNm").attr("disabled",flag); 

        $("#film_matrlNm").attr("disabled",flag);                
        $("#film_qutyNm").attr("disabled",flag);               
        $("#film_gubunNm").attr("disabled",flag);                 
        $("#film_thickness").attr("disabled",flag);   
        $("#film_chamferYnNm").attr("disabled",flag);
        $("#film_depth").attr("disabled",flag);
        $("#film_width").attr("disabled",flag);
        $("#film_length").attr("disabled",flag);
        $("#film_pitch").attr("disabled",flag);  
        $("#film_surfaceTrtmtNm").attr("disabled",flag);       
   	}   	

   	function selectMatrlCode(qutyType)
   	{
   	   	var url="/cmsc0050?qutyType="+qutyType;
		window.open(url, "자재코드조회팝업", "width=1200,height=800,left=600");
   	}

   	function selectDealCorp()
   	{
   	   	var url="/cmsc0020";
		window.open(url, "거래처정보조회팝업", "width=1200,height=800,left=600");
   	}   	
   	    
//     // 삭제 처리
//     $('#btnDeleteConfirm').on('click', function() {
//         $.ajax({
//             url: '/user/delete',
//             type: 'POST',
//             data: {
//                 'idx': viewIdx,
//             },
//             beforeSend: function() {
//                 $('#btnDeleteConfirm').addClass('d-none');
//                 $('#btnDeleteConfirmLoading').removeClass('d-none');
//             },
//             success: function (res) {
//                 $('#deleteModal').modal('hide');

//                 if (res.result == 'ok') {
//                     viewIdx = '';
//                     $('#formText').text(' - 등록');
//                     $('#form').each(function(){
//                         this.reset();
//                     });
//                     $('#viewBox').addClass('d-none');
//                     $('#formBox').removeClass('d-none');
//                     $('#btnAddConfirm').removeClass('d-none');  // 등록버튼
//                     $('#btnEditConfirm').addClass('d-none');    // 수정버튼
//                     $('#goodsCodeTable').DataTable().ajax.reload( function () {});
//                     toastr.success('삭제되었습니다.');
//                 } else {
//                     toastr.error(res.message);
//                 }
//             },
//             complete:function(){
//                 $('#btnDeleteConfirm').removeClass('d-none');
//                 $('#btnDeleteConfirmLoading').addClass('d-none');
//             }
//         });
//     });
</script>

</body>
</html>
