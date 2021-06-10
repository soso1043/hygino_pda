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
	                <h5 class="page-title mr-sm-auto">&nbsp;&nbsp;자재코드관리 > 자재코드목록</h5>
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
	                    <table id="matrlCdTable" class="table table-bordered">
	                        <thead>
	                        <tr>
                              <th> 자재코드 </th>
                              <th> 자재명 </th>
                              <th> 이니셜 </th>
                              <th> 재질 </th>
                              <th> 구분(연질/경질) </th>
                              <th> 면취(압연)</th>
                              <th> 두께 </th>
                              <th> 폭 </th>
                              <th> 너비 </th>
                              <th> 길이 </th>
                              <th> 피치 </th>
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
	            <h6> 자재 정보 <span id="formText"></span></h6>
	
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
	                            <th>자재코드</th>
	                            <td><input type="text" class="form-control" id="matrlCd" name="matrlCd"></td>
	                        </tr>
	                        <tr>
	                            <th>자재명</th>
	                            <td><input type="text" class="form-control" id="matrlNm"  name="matrlNm"></td>
	                            <th>이니셜</th>
	                            <td><input type="text" class="form-control" id="matrlInitial"  name="matrlInitial"></td>
	                        </tr>
	                        <tr>
	                            <th>재질</th>
	                            <td><select id="qutyCd" ></select></td>
	                            <th>구분(연질/경질)</th>
	                            <td><select id="gubunCd" ></select></td>
	                        </tr>
	                        <tr>
	                            <th>두께</th>
	                            <td><input type="text" class="form-control" id="thickness"  name="thickness"></td>
	                            <th>면취(압연)</th>
	                            <td><select id="chamferYnCd" ></select></td>
	                        </tr>
	                        <tr>
	                            <th>폭</th>
	                            <td><input type="text" class="form-control" id="depth"  name="depth"></td>
	                            <th>너비</th>
	                            <td><input type="text" class="form-control" id="width"  name="width"></td>
	                        </tr>
	                        <tr>
	                            <th>길이</th>
	                            <td><input type="text" class="form-control" id="length"  name="length"></td>
	                            <th>피치</th>
	                            <td><input type="text" class="form-control" id="pitch"  name="pitch"></td>
	                        </tr>
	                        <tr>
	                            <th>표면처리</th>
	                            <td><select id="surfaceTrtmtCd" ></select></td>
	                        </tr>
	                        <tr>
	                            <th>생산단위</th>
	                            <td><select id="productUnitCd" ></select></td>
	                            <th>재고단위</th>
	                            <td><select id="tmUnitCd" ></select></td>
	                        </tr>
	                        <tr>
	                            <th>입고처</th>
	                            <input type="hidden" class="form-control" id="dealCorpCd"  name="dealCorpCd">
	                            <td><input type="text" class="form-control" id="dealCorpNm"  name="dealCorpNm"></td>
	                            <th>유수명주기</th>
	                            <td><input type="text" class="form-control" id="lifeCycle"  name="lifeCycle"></td>
	                        </tr>	
	                        <tr>
	                            <th>체크1</th>
	                            <td><input type="text" class="form-control" id="etc1"  name="etc1"></td>
	                            <th>체크2</th>
	                            <td><input type="text" class="form-control" id="etc2"  name="etc2"></td>
	                        </tr>		                                                
	                        <tr>
	                            <th>상태유무</th>
	                            <td><select id="statusYnCd" ></select></td>
	                            <th>비고</th>
	                            <td><input type="text" class="form-control" id="matrlDesc"  name="matrlDesc"></td>
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
    let currentPage = 'matrlCd';
    let viewIdx;
    let sideView = 'add';
    uiProc(true);
    
	//공통코드 처리 시작
	var qutyCode=new Array(); // 재질
    <c:forEach items="${qutyCd}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseCdNm="${info.baseCdNm}";
		qutyCode.push(json);
    </c:forEach>

	var gubunCode=new Array(); // 구분(연질/결질)
    <c:forEach items="${gubunCd}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseCdNm="${info.baseCdNm}";
		gubunCode.push(json);
    </c:forEach>
        
	var chamferYnCode=new Array(); // 면취(압연)
    <c:forEach items="${chamferYnCd}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseCdNm="${info.baseCdNm}";
		chamferYnCode.push(json);
    </c:forEach>

	var surfaceTrtmtCode=new Array(); // 면취(압연)
    <c:forEach items="${surfaceTrtmtCd}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseCdNm="${info.baseCdNm}";
		surfaceTrtmtCode.push(json);
    </c:forEach>
        
	var productUnitCode=new Array(); // 생산단위
    <c:forEach items="${productUnitCd}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseCdNm="${info.baseCdNm}";
		productUnitCode.push(json);
    </c:forEach>

	var tmUnitCode=new Array(); // 재고단위
    <c:forEach items="${tmUnitCd}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseCdNm="${info.baseCdNm}";
		tmUnitCode.push(json);
    </c:forEach>

	var statusYnCode=new Array(); // 상태유무
    <c:forEach items="${statusYnCd}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseCdNm="${info.baseCdNm}";
		statusYnCode.push(json);
    </c:forEach>
    //공통코드 처리 종료  
                     
    //alert("test ="+JSON.stringify(statusYnCode));
    
    $('#'+currentPage+'Menu').closest('.has-child','li').addClass('has-open');
    $('#'+currentPage+'Menu').css('color','#0000FF');

    $("#matrlCd").attr("disabled",true);
    $("#dealCorpNm").attr("disabled",true);
	//uiProc(true);
		    
    // 목록
    let matrlCdTable = $('#matrlCdTable').DataTable({
        language: lang_kor,
        paging: true,
        info: true,
        ordering: true,
        processing: true,
        autoWidth: false,
        ajax: {
            url: '<c:url value="/bm/matrlCdDataList"/>',
            type: 'GET',
            data: {
            },
            /*
            success : function(res) {
                console.log(res);
            }
            */
        },
        rowId: 'matrlCd',
        columns: [
            { data: 'matrlCd' },
            { data: 'matrlNm' },
            { data: 'matrlInitial' },
            { data: 'qutyNm' },
            { data: 'gubunNm' },
            { data: 'chamferYnNm' },
            { data: 'thickness' },
            { data: 'depth' }, 
            { data: 'width' },
            { data: 'length' },                       
            { data: 'pitch' }                                              
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
    $('#matrlCdTable tbody').on('click', 'tr', function () {
    	matrlCd = matrlCdTable.row( this ).data().matrlCd;
        console.log("matrlCd = " + matrlCd);
        $('#btnSave').addClass('d-none');  // 저장버튼
        $.ajax({
            url: '<c:url value="/bm/matrlCdData"/>',
            type: 'GET',
            data: {
                'matrlCd': matrlCd
            },
            success: function (res) {
                let data = res.data;
      			sideView = 'edit';
      	        //$('#btnEdit').removeClass('d-none');    // 수정버튼
                // 보기
				$('#matrlCd').val(data.matrlCd);
				$('#matrlNm').val(data.matrlNm);
				$('#matrlInitial').val(data.matrlInitial);
				$('#thickness').val(data.thickness);
				$('#depth').val(data.depth);
				$('#length').val(data.length);
				$('#width').val(data.width);
				$('#pitch').val(data.pitch);
				$('#dealCorpCd').val(data.dealCorpCd);
				$('#dealCorpNm').val(data.dealCorpNm);
				$('#lifeCycle').val(data.lifeCycle);
				$('#etc1').val(data.etc1);
				$('#etc2').val(data.etc2);
				$('#matrlDesc').val(data.matrlDesc);

				//화면처리
                uiProc(true);

                //선택박스 처리
                selectBoxAppend(qutyCode, "qutyCd", data.qutyCd , "");
                selectBoxAppend(gubunCode, "gubunCd", data.gubunCd , "");
                selectBoxAppend(chamferYnCode, "chamferYnCd", data.chamferYnCd , "");
                selectBoxAppend(surfaceTrtmtCode, "surfaceTrtmtCd", data.surfaceTrtmtCd , "");
                selectBoxAppend(productUnitCode, "productUnitCd", data.productUnitCd , "");
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
			//$('#matrlCd').val(data.matrlCd);
			$('#matrlNm').val("Al H0 0.2*45 압연");
			$('#matrlInitial').val("A");
			$('#thickness').val("2.4");
			$('#depth').val("30");
			$('#length').val("300");
			$('#width').val("40.5");
			$('#pitch').val("5.5");
			$('#dealCorpCd').val("00003");
			$('#dealCorpNm').val("대한소재");
			$('#lifeCycle').val("20221231");
			$('#etc1').val("체크1");
			$('#etc2').val("체크2");
			$('#matrlDesc').val("자재코드 등록 테스트 입니다.");

      	}

      	//화면처리        
        uiProc(false); 

        //선택박스처리
        selectBoxAppend(qutyCode, "qutyCd", "" , "2");
        selectBoxAppend(gubunCode, "gubunCd", "" , "2");
        selectBoxAppend(chamferYnCode, "chamferYnCd","" , "2");
        selectBoxAppend(surfaceTrtmtCode, "surfaceTrtmtCd", "" , "2");
        selectBoxAppend(productUnitCode, "productUnitCd", "" , "2");
        selectBoxAppend(tmUnitCode, "tmUnitCd", "" , "2"); 
        selectBoxAppend(statusYnCode, "statusYnCd", "" , "2");    
        $('#btnSave').removeClass('d-none');  // 저장버튼
        //$('#btnEdit').addClass('d-none');    // 수정버튼
    });

    // 저장 처리
    $('#btnSave').on('click', function() {
        if ( !$.trim($('#matrlNm').val()) ) {
            toastr.error('자재명을 입력해주세요.');
            $('#matrlNm').focus();
            return false;
        }

        if ( !$.trim($('#matrlInitial').val()) ) {
            toastr.error('이니셜을 입력해주세요.');
            $('#matrlInitial').focus();
            return false;
        }

        if ( $("#qutyCd option:selected").val() == "" ) {
            toastr.error('재질을 선택해 주세요.');
            return false;
        }

        if ( $("#gubunCd option:selected").val() == "" ) {
            toastr.error('구분(연질/경질)을 선택해 주세요.');
            return false;
        }

        if ( $("#chamferYnCd option:selected").val() == "" ) {
            toastr.error('면취(압연) 유무를 선택해 주세요.');
            return false;
        }

        if ( !$.trim($('#thickness').val()) ) {
            toastr.error('두께를 입력해 주세요.');
            $('#thickness').focus();
            return false;
        }

        if ( !$.trim($('#depth').val()) ) {
            toastr.error('폭을 입력해 주세요.');
            $('#depth').focus();
            return false;
        }

        if ( !$.trim($('#width').val()) ) {
            toastr.error('너비를 입력해 주세요.');
            $('#width').focus();
            return false;
        }

        if ( !$.trim($('#length').val()) ) {
            toastr.error('길이를 입력해 주세요.');
            $('#length').focus();
            return false;
        }

        if ( !$.trim($('#pitch').val()) ) {
            toastr.error('피치를 입력해 주세요.');
            return false;
        }
                
        if ( $("#surfaceTrtmtCd option:selected").val() == "" ) {
            toastr.error('표면처리를 선택해 주세요.');
            return false;
        }

        if ( $("#productUnitCd option:selected").val() == "" ) {
            toastr.error('생산단위를 선택해 주세요.');
            return false;
        }

        if ( $("#tmUnitCd option:selected").val() == "" ) {
            toastr.error('재고단위를 선택해 주세요.');
            return false;
        }

        if ( !$.trim($('#dealCorpCd').val()) ) {
            toastr.error('입고처를 선택해 주세요.');
            return false;
        }        
                
        if ( !$.trim($('#lifeCycle').val()) ) {
            toastr.error('유수명주기를 입력해 주세요.');
            $('#lifeCycle').focus();
            return false;
        }
                
        if ( $("#statusYnCd option:selected").val() == "" ) {
            toastr.error('상태유무를 입력해 주세요.');
            return false;
        }

                                 
        //alert($('#dealGubun').val());
        var url = '/bm/matrlCdCreate';        
        if( sideView == "edit" ) {
            url = '/bm/matrlCdUpdate'
        }

        $.ajax({
            url: url,
            type: 'POST',
            data: {
            	'matrlCd'        :        $('#matrlCd').val(),     
            	'matrlNm'	     :	      $('#matrlNm').val(),    
            	'matrlInitial'	 :	      $('#matrlInitial').val(), 
            	'qutyCd'		 :	      $('#qutyCd option:selected ').val(),          
            	'thickness'	     :	      $('#thickness').val(),    
            	'depth'	    	 :	      $('#depth').val(),        
            	'length'	     :	      $('#length').val(),       
            	'width'	    	 :	      $('#width').val(),        
            	'pitch'		     :	      $('#pitch').val(),         
            	'gubunCd'	     :	      $('#gubunCd option:selected ').val(),       
            	'chamferYnCd'    :	      $('#chamferYnCd option:selected ').val(),  
            	'surfaceTrtmtCd' :	      $('#surfaceTrtmtCd option:selected ').val(),
            	'productUnitCd'  :	      $('#productUnitCd option:selected ').val(),
            	'tmUnitCd'	     :	      $('#tmUnitCd option:selected ').val(),   
            	'dealCorpCd'	 :	      $('#dealCorpCd').val(), 
            	'lifeCycle'	     :	      $('#lifeCycle').val(),     
            	'etc1'		     :	      $('#etc1').val(),          
            	'etc2'		     :	      $('#etc2').val(),          
            	'statusYnCd'     :	      $('#statusYnCd option:selected ').val(),     
            	'matrlDesc'	     :	      $('#matrlDesc').val(),   
	            'regId'			 :		  'reg_id',
	          	'updId'	         :	      'upd_id' 		       
            },
            beforeSend: function() {
               // $('#btnAddConfirm').addClass('d-none');
               // $('#btnAddConfirmLoading').removeClass('d-none');
            },
            success: function (res) {
                let data = res.data;

                if (res.result == 'ok') {
                    // 보기
					$('#matrlCd').val(data.matrlCd);
                    $('#matrlCdTable').DataTable().ajax.reload( function () {});
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


   	function uiProc(flag)
   	{
   		//$("#matrlCd").attr("disabled",flag);
   		$("#matrlNm").attr("disabled",flag);
   		$("#matrlInitial").attr("disabled",flag);
   		$("#qutyCd").attr("disabled",flag);
   		$("#thickness").attr("disabled",flag);
   		$("#depth").attr("disabled",flag);
   		$("#length").attr("disabled",flag);
   		$("#width").attr("disabled",flag);
   		$("#pitch").attr("disabled",flag);
   		$("#gubunCd").attr("disabled",flag);
   		$("#chamferYnCd").attr("disabled",flag);
   		$("#surfaceTrtmtCd").attr("disabled",flag);
   		$("#productUnitCd").attr("disabled",flag);
   		$("#tmUnitCd").attr("disabled",flag);
   		//$("#dealCorpCd").attr("disabled",flag);
   		$("#lifeCycle").attr("disabled",flag);
   		$("#etc1").attr("disabled",flag);
   		$("#etc2").attr("disabled",flag);
   		$("#statusYnCd").attr("disabled",flag);
   		$("#matrlDesc").attr("disabled",flag);
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
