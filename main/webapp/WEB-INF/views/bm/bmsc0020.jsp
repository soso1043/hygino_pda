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
	                <h5 class="page-title mr-sm-auto">&nbsp;&nbsp;거래처정보관리 > 거래처정보목록</h5>
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
	                    <table id="dealCorpTable" class="table table-bordered">
	                        <thead>
	                        <tr>
	                            <th>거래처코드</th>
	                            <th>거래처명</th>
	                            <th>이니셜</th>
	                            <th>대표자</th>
	                            <th>국가명</th>
	                            <th>사업자번호</th>
	                            <th>법인번호</th>
	                            <th>업태</th>
	                            <th>종목</th>
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
	            <h6> 거래처 정보 <span id="formText"></span></h6>
	
	            <!-- 등록, 수정 -->
	            <div id="formBox">
	                    <div class="mt-2">
	                        <button type="button" class="btn btn-primary" id="btnAdd">등록</button>
	                        <button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled=""><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중</button>
	                        <button type="button" class="btn btn-warning" id="btnEdit">수정</button>
	                        <button class="btn btn-warning d-none" id="btnEditConfirmLoading" type="button" disabled=""><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중</button>
	                    </div>	            
	                <form id="form">
	                    <table>
	                        <colgroup>
	                            <col width="20%">
	                            <col width="30%">
	                            <col width="20%">
	                            <col width="30%">	                            
	                        </colgroup>
	                        <tr>
	                            <th>거래처코드</th>
	                            <td><input type="text" class="form-control" id="dealCorpCd" name="dealCorpCd"></td>
	                        </tr>
	                        <tr>
	                            <th>거래처명</th>
	                            <td><input type="text" class="form-control" id="dealCorpNm"  name="dealCorpNm"></td>
	                            <th>이니셜</th>
	                            <td><input type="text" class="form-control" id="initial"  name="initial"></td>
	                        </tr>
	                        <tr>
	                            <th>대표자</th>
	                            <td><input type="text" class="form-control" id="presidentNm"  name="presidentNm"></td>
	                            <th>국가명</th>
	                            <td><input type="text" class="form-control" id="country"  name="country"></td>
	                        </tr>
	                        <tr>
	                            <th>사업자번호</th>
	                            <td><input type="text" class="form-control" id="corpNo"  name="corpNo"></td>
	                            <th>법인번호</th>
	                            <td><input type="text" class="form-control" id="registNo"  name="registNo"></td>
	                        </tr>
	                        <tr>
	                            <th>업태</th>
	                            <td><input type="text" class="form-control" id="bizCond"  name="bizCond"></td>
	                            <th>업종</th>
	                            <td><input type="text" class="form-control" id="bizType"  name="bizType"></td>
	                        </tr>
	                        <tr>
	                            <th rowspan="2">우편번호</th>
	                            <td rowspan="2"><input type="text" class="form-control" id="addrNo"  name="addrNo"></td>
	                            <th rowspan="2">주소</th>
	                            <td><input type="text" class="form-control" id="addrBase"  name="addrBase"></td>
	                       </tr>
	                        <tr>
	                            <td><input type="text" class="form-control" id="addrDtl"  name="addrDtl"></td>
	                       </tr>	                       
	                        <tr>
	                            <th>전화번호</th>
	                            <td><input type="text" class="form-control" id="telNo"  name="telNo"></td>
	                            <th>팩스번호</th>
	                            <td><input type="text" class="form-control" id="faxNo"  name="faxNo"></td>
	                        </tr>
	                        <tr>
	                            <th>과세</th>
	                            <td><input type="text" class="form-control" id="tax"  name="tax"></td>
	                            <th>E-mail</th>
	                            <td><input type="text" class="form-control" id="emailAddr"  name="emailAddr"></td>
	                        </tr>
	                        <tr>
	                            <th>업무담당</th>
	                            <td><input type="text" class="form-control" id="officeChrger"  name="officeChrger"></td>
	                            <th>영업담당</th>
	                            <td><input type="text" class="form-control" id="bizChrger"  name="bizChrger"></td>
	                        </tr>
	                        <tr>
	                        	<input type="hidden" class="form-control" id="dealGubun"  name="dealGubun">
	                            <th>거래구분</th>
	                            <td colspan="3"><input type="checkbox"  id="sales"  name="sales">매출 
	                            				<input type="checkbox"  id="purchase"  name="purchase">매입
	                            				<input type="checkbox"  id="inwhs"  name="inwhs">입고
	                            				<input type="checkbox"  id="outwhs"  name="outwhs">출고
	                            				<input type="checkbox"  id="materials"  name="materials">자재
	                            				<input type="checkbox"  id="etcetc"  name="etcetc">기타
	                            </td>
	                        </tr>	                        
	                        <tr>
	                            <th>사용유무</th>
	                            <td><select id="useYnCd" ></select></td>
	                            <th>비고</th>
	                            <td><input type="text" class="form-control" id="dealCorpDesc"  name="dealCorpDesc"></td>
	                        </tr>	                        	                        		                        	                        		                        	                        	                        
	                    </table>
	                    	                    	                    
	                </form>
	            </div>
	                    <div class="mt-2">
	                        <button type="button" class="btn btn-primary d-none" id="btnSave">저장</button>
	                        <button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled=""><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중</button>
	                    </div>	
	            <!--// 등록, 수정 -->
	
	        </div>
	    </div>
    </div>
</div>

<%@include file="../layout/bottom.jsp" %>

<script>
    let currentPage = 'dealCorp';
    let viewIdx;
    let sideView = 'add';

//     var statusCodeList = "${statusCodeList}";
//     var statusCodeJsonList = "${statusCodeJsonList}";

    var useYnCode=new Array();

    <c:forEach items="${useYnCd}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseCdNm="${info.baseCdNm}";
		useYnCode.push(json);
    </c:forEach>

    //alert("test ="+JSON.stringify(useYnCode));
    
    $('#'+currentPage+'Menu').closest('.has-child','li').addClass('has-open');
    $('#'+currentPage+'Menu').css('color','#0000FF');

    $("#dealCorpCd").attr("disabled",true);
	uiProc(true);
		    
    // 목록
    let dealCorpTable = $('#dealCorpTable').DataTable({
        language: lang_kor,
        paging: true,
        info: true,
        ordering: true,
        processing: true,
        autoWidth: false,
        ajax: {
            url: '<c:url value="/bm/dealCorpDataList"/>',
            type: 'GET',
            data: {
            },
            /*
            success : function(res) {
                console.log(res);
            }
            */
        },
        rowId: 'dealCorpCd',
        columns: [
            { data: 'dealCorpCd' },
            { data: 'dealCorpNm' },
            { data: 'initial' },
            { data: 'presidentNm' },
            { data: 'country' },
            { data: 'corpNo' },
            { data: 'registNo' },
            { data: 'bizCond' }, 
            { data: 'bizType' }                                              
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

        buttons: [
            'copy', 'excel', 'pdf', 'print'
        ],
    });

    // 보기
    $('#dealCorpTable tbody').on('click', 'tr', function () {
    	dealCorpCd = dealCorpTable.row( this ).data().dealCorpCd;
        console.log("dealCorpCd = " + dealCorpCd);
        $('#btnSave').addClass('d-none');  // 저장버튼
        $.ajax({
            url: '<c:url value="/bm/dealCorpData"/>',
            type: 'GET',
            data: {
                'dealCorpCd': dealCorpCd
            },
            success: function (res) {
                let data = res.data;
      			let statusYn = res.statusYn;
      			
      			sideView = 'edit';
      	        //$('#btnEdit').removeClass('d-none');    // 수정버튼
                // 보기
                $('#dealCorpCd').val(data.dealCorpCd);
                $('#dealCorpNm').val(data.dealCorpNm);
                $('#initial').val(data.initial);
                $('#presidentNm').val(data.presidentNm);
                $('#country').val(data.country);
                $('#corpNo').val(data.corpNo);
                $('#registNo').val(data.registNo);
                $('#bizCond').val(data.bizCond);
                $('#bizType').val(data.bizType);
                $('#addrNo').val(data.addrNo);
                $('#addrBase').val(data.addrBase);
                $('#addrDtl').val(data.addrDtl);
                $('#telNo').val(data.telNo);
                $('#faxNo').val(data.faxNo);
                $('#emailAddr').val(data.addrDtl);
                $('#tax').val(data.tax);
                $('#officeChrger').val(data.officeChrger);
                $('#bizChrger').val(data.bizChrger);
                $('#dealGubun').val(data.dealGubun);
                $('#useYnCd').val(data.useYnCd);
                $('#dealCorpDesc').val(data.dealCorpDesc);
                 //checkbox처리
                sales = data.dealGubun.substring(0,1);
                purchase = data.dealGubun.substring(1,2);
                inwhs = data.dealGubun.substring(2,3);
                outwhs = data.dealGubun.substring(3,4);
                materials = data.dealGubun.substring(4,5);
                etcetc = data.dealGubun.substring(5,6);

                if(sales == "1") {
                	$('#sales').prop("checked", true);
                }
                if(purchase == "1") {
                	$('#purchase').prop("checked", true);
                }
                if(inwhs == "1") {
                	$('#inwhs').prop("checked", true);
                }
                if(outwhs == "1") {
                	$('#outwhs').prop("checked", true);
                }
                if(materials == "1") {
                	$('#materials').prop("checked", true);
                }
                if(etcetc == "1") {
                	$('#etcetc').prop("checked", true);
                }  

                uiProc(true);
                selectBoxAppend(useYnCode, "useYnCd", data.useYnCd , "");                                                                                                                                                                                                        
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
	        $('#dealCorpNm').val("대한소재");
	        $('#initial').val("D");
	        $('#presidentNm').val("김대한");
	        $('#country').val("대한민국");
	        $('#corpNo').val("1112288888");
	        $('#registNo').val("7204011234567");
	        $('#bizCond').val("제조");
	        $('#bizType').val("부품제조");
	        $('#addrNo').val("02123");
	        $('#addrBase').val("서울시 동대문구 망우로23길");
	        $('#addrDtl').val("삼육창업보육센터 303호");
	        $('#telNo').val("0234567890");
	        $('#faxNo').val("0234567811");
	        $('#emailAddr').val("hygino@naver.com");
	        $('#tax').val("과세");
	        $('#officeChrger').val("박업무");
	        $('#bizChrger').val("김영업");
	        $('#dealCorpDesc').val("거래처정보 테스트 데이타");
      	}        
        uiProc(false); 
        selectBoxAppend(useYnCode, "useYnCd", "", "2");       
        $('#btnSave').removeClass('d-none');  // 등록버튼
        //$('#btnEdit').addClass('d-none');    // 수정버튼
    });

    // 저장 처리
    $('#btnSave').on('click', function() {
        if ( !$.trim($('#dealCorpNm').val()) ) {
            toastr.error('거래처명을 입력해주세요.');
            $('#dealCorpNm').focus();
            return false;
        }

        if ( !$.trim($('#initial').val()) ) {
            toastr.error('이니셜을 입력해주세요.');
            $('#initial').focus();
            return false;
        }

        if ( !$.trim($('#presidentNm').val()) ) {
            toastr.error('대표자명을 입력해 주세요.');
            return false;
        }

        if ( !$.trim($('#country').val()) ) {
            toastr.error('국가명을 입력해 주세요.');
            return false;
        }

        if ( !$.trim($('#corpNo').val()) ) {
            toastr.error('사업자번호를 입력해 주세요.');
            return false;
        }

        if ( !$.trim($('#registNo').val()) ) {
            toastr.error('법인번호를 입력해 주세요.');
            return false;
        }

        if ( !$.trim($('#bizCond').val()) ) {
            toastr.error('업태를 입력해 주세요.');
            return false;
        }

        if ( !$.trim($('#bizType').val()) ) {
            toastr.error('업종을 입력해 주세요.');
            return false;
        }
                
        if ( !$.trim($('#addrNo').val()) ) {
            toastr.error('우편번호를 입력해 주세요.');
            return false;
        }

        if ( !$.trim($('#addrBase').val()) ) {
            toastr.error('기본주소를 입력해 주세요.');
            return false;
        }       

        if ( !$.trim($('#telNo').val()) ) {
            toastr.error('전화번호를 입력해 주세요.');
            return false;
        }  

        if ( !$.trim($('#emailAddr').val()) ) {
            toastr.error('이메일주소를 입력해 주세요.');
            return false;
        }  

        if ( !$.trim($('#tax').val()) ) {
            toastr.error('과세정보를 입력해 주세요.');
            return false;
        } 

        if ( !$.trim($('#officeChrger').val()) ) {
            toastr.error('업무담당자를 입력해 주세요.');
            return false;
        }


        if ( !$.trim($('#bizChrger').val()) ) {
            toastr.error('영업담당자를 입력해 주세요.');
            return false;
        }

        if ( !$.trim($('#bizChrger').val()) ) {
            toastr.error('영업담당자를 입력해 주세요.');
            return false;
        }

        if( $("#useYnCd option:selected").val() == "" ) {
            toastr.error('사용유무를 선택해 주세요.');
            return false;            
        }

        var sales = "0";
        if($('#sales').prop("checked") == true) {
        	sales = "1";
        }

        var purchase = "0";
        if($('#purchase').prop("checked") == true) {
        	purchase = "1";
        }
        
        var inwhs = "0";
        if($('#inwhs').prop("checked") == true) {
        	inwhs = "1";
        }
        
        var outwhs = "0";
        if($('#outwhs').prop("checked") == true) {
        	outwhs = "1";
        }
        
        var materials = "0";
        if($('#materials').prop("checked") == true) {
        	materials = "1";
        } 

        var etcetc = "0";
        if(etcetc == "1") {
        	etcetc = "1";
        }  

        $('#dealGubun').val(sales+purchase+inwhs+outwhs+materials+etcetc);
                                 
        //alert($('#dealGubun').val());
        var url = '/bm/dealCorpCreate';        
        if( sideView == "edit" ) {
            url = '/bm/dealCorpUpdate'
        }

        $.ajax({
            url: url,
            type: 'POST',
            data: {
            	'dealCorpCd'   	:        $('#dealCorpCd').val(),                
            	'dealCorpNm'   	:        $('#dealCorpNm').val(),
	            'initial'       :        $('#initial').val(),
	            'presidentNm'   :        $('#presidentNm').val(),
	            'country'       :        $('#country').val(),
	            'corpNo'        :        $('#corpNo').val(),
	            'registNo'      :        $('#registNo').val(),
	            'bizCond'       :        $('#bizCond').val(),
	            'bizType'       :        $('#bizType').val(),
	            'addrNo'        :        $('#addrNo').val(),
	            'addrBase'      :        $('#addrBase').val(),
	            'addrDtl'       :        $('#addrDtl').val(),
	            'telNo'         :        $('#telNo').val(),
	            'faxNo'         :        $('#faxNo').val(),
	            'emailAddr'     :        $('#emailAddr').val(),
	            'tax'           :        $('#tax').val(),
	            'officeChrger'  :        $('#officeChrger').val(),
	            'bizChrger'     :        $('#bizChrger').val(),
	            'dealGubun'     :        $('#dealGubun').val(),
	            'useYnCd'       :        $("#useYnCd option:selected").val(),
	            'dealCorpDesc' 	:        $('#dealCorpDesc').val(),
	            'regId'			:		'reg_id',
	            'updId'			:		'upd_id'
            },
            beforeSend: function() {
               // $('#btnAddConfirm').addClass('d-none');
               // $('#btnAddConfirmLoading').removeClass('d-none');
            },
            success: function (res) {
                let data = res.data;


                if (res.result == 'ok') {
                    // 보기
					$('#dealCorpCd').val(data.dealCorpCd);
                    $('#dealCorpTable').DataTable().ajax.reload( function () {});
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
                $('#btnAddConfirm').removeClass('d-none');
                $('#btnAddConfirmLoading').addClass('d-none');
            }
        });
    });

    // 수정폼
    $('#btnEdit').on('click', function() {
        //alert(sideView);        
        if(sideView != 'edit') {
        	toastr.error("수정할 목록을 선택해 주세요!");
            return false;
        }

		uiProc(false);
        $('#btnSave').removeClass('d-none');
    });

    // 수정 처리
    $('#btnEditConfirm').on('click', function() {
        if ( !$.trim($('#form input[name=name]').val()) ) {
            toastr.error('이름을 입력해주세요.');
            $('#form input[name=name]').focus();
            return false;
        }

        if ( !$.trim($('#form input[name=userId]').val()) ) {
            toastr.error('아이디를 입력해주세요.');
            $('#form input[name=userId]').focus();
            return false;
        }

        if ( $('#form input[name=verify]').val() == 'n' ) {
            toastr.error('아이디 중복확인을 진행해주세요.');
            return false;
        }

        if ( !$.trim($('#form input[name=phone]').val()) ) {
            toastr.error('전화번호를 입력해주세요.');
            $('#form input[name=phone]').focus();
            return false;
        }

        if ( !$('#form select[name=rankIdx]').val() ) {
            toastr.error('직책을 선택해주세요.');
            return false;
        }

        if ( !$('#form select[name=departmentIdx]').val() ) {
            toastr.error('부서를 선택해주세요.');
            return false;
        }

        $.ajax({
            url: '/user/update',
            type: 'POST',
            data: {
                'idx': viewUsertIdx,
                'rankIdx': $('#form select[name=rankIdx]').val(),
                'departmentIdx': $('#form select[name=departmentIdx]').val(),
                'name': $('#form input[name=name]').val(),
                'userId': $('#form input[name=userId]').val(),
                'phone': $('#form input[name=phone]').val(),
            },
            beforeSend: function() {
                $('#btnUpdateConfirm').addClass('d-none');
                $('#btnUpdateConfirmLoading').removeClass('d-none');
            },
            success: function (res) {
                let data = res.data;
                sideView = 'view';

                if (res.result == 'ok') {
                    // 보기
                    $('#name').text(data.name);
                    $('#userId').text(data.userId);
                    $('#phone').text(data.phone);
                    $('#rank').text(data.rank);
                    $('#department').text(data.department);
                    $('#createdAt').text( moment(data.createdAt).format('YYYY-MM-DD HH:mm') );
                    $('#createdName').text(data.createdName);
                    $('#updatedAt').text( moment(data.updatedAt).format('YYYY-MM-DD HH:mm') );
                    $('#updatedName').text(data.updatedName);

                    // 수정
                    $('#form input[name=name]').val(data.name);
                    $('#form input[name=userId]').val(data.userId);
                    $('#form input[name=phone]').val(data.phone);
                    $('#form input[name=email]').val(data.email);
                    $('#form select[name=rankIdx]').val(data.rankIdx);
                    $('#form select[name=departmentIdx]').val(data.departmentIdx);

                    $('#formText').text(' - 정보');
                    $('#viewBox').removeClass('d-none');
                    $('#formBox').addClass('d-none');

                    $('#goodsCodeTable').DataTable().ajax.reload( function () {});
                    toastr.success('수정되었습니다.');
                } else {
                    toastr.error(res.message);
                }
            },
            complete:function(){
                $('#btnDeleteConfirm').removeClass('d-none');
                $('#btnDeleteConfirmLoading').addClass('d-none');
            }
        });
    });

   	function uiProc(flag)
   	{
        //$("#dealCorpCd").attr("disabled",flag);
        $("#dealCorpNm").attr("disabled",flag);                
        $("#initial").attr("disabled",flag);               
        $("#presidentNm").attr("disabled",flag);                 
        $("#country").attr("disabled",flag);   
        $("#corpNo").attr("disabled",flag);
        $("#registNo").attr("disabled",flag);
        $("#bizCond").attr("disabled",flag);
        $("#bizType").attr("disabled",flag);
        $("#addrNo").attr("disabled",flag);  
        $("#addrBase").attr("disabled",flag); 
        $("#addrDtl").attr("disabled",flag);
        $("#telNo").attr("disabled",flag);
        $("#faxNo").attr("disabled",flag);
        $("#emailAddr").attr("disabled",flag);  
        $("#tax").attr("disabled",flag);
        $("#officeChrger").attr("disabled",flag);
        $("#bizChrger").attr("disabled",flag);                                
        $("#dealGubun").attr("disabled",flag);                                                               
        $("#useYnCd").attr("disabled",flag);
        $("#dealCorpDesc").attr("disabled",flag);       
        $("#sales").attr("disabled",flag);
        $("#purchase").attr("disabled",flag);
        $("#inwhs").attr("disabled",flag);
        $("#outwhs").attr("disabled",flag);
        $("#materials").attr("disabled",flag);
        $("#etcetc").attr("disabled",flag);
   	}

// 	function selectBoxAppend(obj, id, sVal, flag)
// 	{
// 		$('#'+ id).empty();

// 		if(flag=='1') {
// 			$('#'+ id).append($("<option>"+ "전체" +"</option>"));
// 	   	} else if(flag=='2') {
// 	   		$('#'+ id).append($("<option>"+ "선택" +"</option>"));
// 	   	}
	   		
// 		for(key in obj) {
// 			var option;
// 			if(obj[key].baseCd == sVal ) {
// 				option = $("<option value="+ obj[key].baseCd+ " selected>"+obj[key].baseCdNm+"</option>");
// 			} else {
// 				option = $("<option value="+obj[key].baseCd+">"+obj[key].baseCdNm+"</option>");
// 			}	
// 			$('#'+ id).append(option);
// 		}

// 	}
   	   	
   	
   	
</script>

</body>
</html>
