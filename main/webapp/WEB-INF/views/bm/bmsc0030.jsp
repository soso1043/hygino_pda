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
			<div style="width:50%">	
	        <header class="page-title-bar">
	            <!-- floating action -->
	            <button type="button" class="btn btn-success btn-floated"><span class="fa fa-plus"></span></button> <!-- /floating action -->
	            <!-- title and toolbar -->
	
	            <!-- title and toolbar -->
	            <div class="d-md-flex align-items-md-start">
	                <h5 class="page-title mr-sm-auto">&nbsp;&nbsp;설비코드관리 > 설비코드목록</h5>
	                <div class="btn-toolbar">
	                    <button type="button" class="btn btn-success">Excel</button>	                
	                    &nbsp;
	                    <button type="button" class="btn btn-primary" id="btnShowCreate">조회</button>
	                </div>
	            </div>
	            <!-- /title and toolbar -->
	        </header>
	        	<!-- 설비코드 전체 조회 -->
				<div class="table-responsive">
					<table class="table table-bordered" id="equipCodeAdmTable">
						<thead class="thead-">
							<tr>
								<th style="min-width: 100px">설비코드</th>
								<th style="min-width: 100px">설비분류</th>
								<th style="min-width: 100px">설비명</th>
								<th style="min-width: 100px">모델명</th>
								<th style="min-width: 100px">전압</th>
								<th style="min-width: 100px">공압</th>
								<th style="min-width: 100px">제작업체</th>
								<th style="min-width: 100px">구입업체</th>
								<th style="min-width: 100px">전화번호</th>
								<th style="min-width: 100px">구매일자</th>
							</tr>
						</thead>
					</table>
				</div>
				<!-- 설비코드 전체 조회 끝-->
	    </div>
	    <!-- 사이드 페이지 -->
	    <!-- <div class="page-sidebar"> -->
		<!-- <div class="col-md-6"> -->
			<div style="width:50%;">
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
	            <span id="formText"><h6>설비 정보 </h6></span>
					<div class="mt-2">
	                    <button type="button" class="btn btn-primary" id="btnAdd">등록</button>
	                    <button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중</button>
	                    <button type="button" class="btn btn-warning" id="btnEdit" disabled>수정</button>
	                    <button class="btn btn-warning d-none" id="btnEditConfirmLoading" type="button" disabled><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중</button>
					</div>
	            	<!-- 상세정보 -->
					<div id="viewBox">
						<table class="table table-striped">
							<colgroup><col width="120"></colgroup>
							<tr>
								<th>설비코드	</th><td colspan="3"><span id="viewEquipCd"></span></td>
							</tr>
							<tr>
								<th>설비명	</th><td><span id="viewEquipNm"></span></td>
								<th>설비분류	</th><td><span id="viewEquipCtrgy"></span></td>
							</tr>
							<tr>
								<th>모델명	</th><td><span id="viewModelNm"></span></td>
								<th>제조업체	</th><td><span id="viewManufactr"></span></td>
							</tr>
							<tr>
								<th>구입업체	</th><td><span id="viewBuyCorp"></span></td>
								<th>구매일	</th><td><span id="viewBuyDate"></span></td>
							</tr>
							<tr>
								<th>전압		</th><td><span id="viewVoltage"></span></td>
								<th>공압		</th><td><span id="viewPressure"></span></td>
							</tr>
							<tr>
								<th>전화번호	</th><td><span id="viewTelNo"></span></td>
								<th>팩스번호	</th><td><span id="viewFaxNo"></span></td>
							</tr>
							<tr>
								<th>설치장소	</th><td><span id="viewInstallLocation"></span></td>
								<th>Capa(용량)</th><td><span id="viewCapa"></span></td>
							</tr>
							<tr>
								<th>etc1	</th><td><span id="viewEtc1"></span></td>
								<th>etc2	</th><td><span id="viewEtc2"></span></td>
							</tr>
							<tr>
								<th>사용유무	</th><td><span id="viewUseYn"></span></td>
								<th>비고		</th><td><span id="viewDealCorpDesc"></span></td>
							</tr>
							<tr>
								<th>등록자	</th><td><span id="viewRegId"></span></td>
								<th>등록일	</th><td><span id="viewRegDate"></span></td>
							</tr>
							<tr>
								<th>수정자	</th><td><span id="viewUpdId"></span></td>
								<th>수정일	</th><td><span id="viewUpdDate"></span></td>
							</tr>
						</table>
					</div>
					<!-- 상세정보 끝-->
	
		            <!-- 등록, 수정 -->
		            <div id="formBox" class="d-none">           
		                <form id="form">
		                <!-- 설비코드 입력  & 수정 폼 -->
						<hr>
						<h4 class="card-title mb-4">설비코드 등록, 수정 입력란</h4>
							<table class="table table-striped">
								<colgroup><col width="120"></colgroup>
								<tr>
									<th>설비코드	</th><td colspan="3"><input type="text" class="form-control" id="equipCd" name="equipCd" disabled></td>
								</tr>
								<tr>
									<th>설비명	</th><td><input type="text" class="form-control" id="equipNm" name="equipNm"></td>
		                            <th>설비분류	</th><td><select id="equipCtrgy" ></select></td>
								</tr>
								<tr>
									<th>모델명	</th><td><input type="text" class="form-control" id="modelNm" name="modelNm"></td>
									<th>제조업체	</th><td><input type="text" class="form-control" id="manufactr" name="manufactr"></td>
								</tr>
								<tr>
									<th>구입업체	</th><td><input type="text" class="form-control" id="buyCorp" name="buyCorp"></td>
									<th>구매일	</th><td><input type="date" class="form-control" id="buyDate" name="buyDate"></td>
								</tr>
								<tr>
									<th>전압		</th><td><input type="text" class="form-control" id="voltage" name="voltage"></td>
									<th>공압		</th><td><input type="text" class="form-control" id="pressure" name="pressure"></td>
								</tr>
								<tr>
									<th>전화번호	</th><td><input type="text" class="form-control" id="telNo" name="telNo"></td>
									<th>팩스번호	</th><td><input type="text" class="form-control" id="faxNo" name="faxNo"></td>
								</tr>
								<tr>
									<th>설치장소	</th><td><select id="installLocation" ></select></td>
									<th>Capa(용량)</th><td><input type="text" class="form-control" id="capa" name="capa"></td>
								</tr>
								<tr>
									<th>etc1	</th><td><input type="text" class="form-control" id="etc1" name="etc1"></td>
									<th>etc2	</th><td><input type="text" class="form-control" id="etc2" name="etc2"></td>
								</tr>
								<tr>
									<th>사용유무	</th>
									<td><select id="statusYnCd" name="useYn"></select></td>
									<th>비고		</th><td><input type="text" class="form-control" id="dealCorpDesc" name="dealCorpDesc" disabled></td>
								</tr>
							</table>
		                </form>
		            </div>
                    <div class="mt-2">
                        <button type="button" class="btn btn-primary d-none" id="btnSave">저장</button>
                        <button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled=""><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중</button>
                    </div>	
	            <!-- 등록, 수정 끝 -->
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
	var installLocationCode = new Array(); // 설치장소
    <c:forEach items="${installLocation}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseCdNm="${info.baseCdNm}";
		installLocationCode.push(json);
    </c:forEach>

	var equipCtrgyCode = new Array(); // 설비분류
    <c:forEach items="${equipCtrgy}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseCdNm="${info.baseCdNm}";
		equipCtrgyCode.push(json);
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
    let equipCodeAdmTable = $('#equipCodeAdmTable').DataTable({
        language: lang_kor,
        paging: true,
        info: true,
        ordering: true,
        processing: true,
        autoWidth: false,
        ajax: {
            url: '<c:url value="bm/equipCodeAdmDataList"/>',
            type: 'GET',
            data: {
            },
            /*
            success : function(res) {
                console.log(res);
            }
            */
        },
        rowId: 'equipCd',
		columns: [
			{ data: 'equipCd' },
			{ data: 'equipCtrgy' },
			{ data: 'equipNm' },
			{ data: 'modelNm' },
			{ data: 'voltage' },
			{ data: 'pressure' },
			{ data: 'manufactr' },
			{ data: 'buyCorp' },
			{ data: 'telNo' },
	        {
	            render: function(data, type, row) {
	                return moment(row['buyDate']).format('YYYY-MM-DD');
	            }
	        },
		],
        columnDefs: [
            {
                //'targets': [0],
                //'orderable': false,
                //'searchable': false,
            },
        ],
		order: [
			[ 0, 'asc' ],
		],
/*         buttons: [
            'copy', 'excel', 'pdf', 'print'
        ], */
    });

    // 보기
    $('#equipCodeAdmTable tbody').on('click', 'tr', function () {
    	equipCd = equipCodeAdmTable.row( this ).data().equipCd;
        console.log("equipCd = " + equipCd);
		$('#viewBox').removeClass('d-none');
		$('#formBox').addClass('d-none');
        $('#btnSave').addClass('d-none');  // 저장버튼
        $('#btnEdit').attr('disabled', false);  //수정버튼
        $.ajax({
        	url: '<c:url value="bm/equipCodeAdmView"/>',
            type: 'GET',
            data: {
                'equipCd': equipCd
            },
            success: function (res) {
                let data = res.data;
      			sideView = 'edit';	//클릭 시 edit 줘서 클릭 했는지 안했는지 판단
      	        //$('#btnEdit').removeClass('d-none');    // 수정버튼
      	        
                // 보기
				$('#viewEquipCd').text(data.equipCd);
				$('#viewEquipNm').text(data.equipNm);
				$('#viewEquipCtrgy').text(data.equipCtrgy);
				$('#viewModelNm').text(data.modelNm);
				$('#viewManufactr').text(data.manufactr);
				$('#viewBuyCorp').text(data.buyCorp);
				$('#viewBuyDate').text( moment(data.buyDate).format('YYYY-MM-DD') );
				$('#viewVoltage').text(data.voltage);
				$('#viewPressure').text(data.pressure);
				$('#viewTelNo').text(data.telNo);
				$('#viewFaxNo').text(data.faxNo);
				$('#viewInstallLocation').text(data.installLocation);
				$('#viewCapa').text(data.capa);
				$('#viewEtc1').text(data.etc1);
				$('#viewEtc2').text(data.etc2);
				$('#viewUseYn').text(data.useYn);
				$('#viewDealCorpDesc').text(data.dealCorpDesc);
				$('#viewRegId').text(data.regId);
				$('#viewRegDate').text( moment(data.regDate).format('YYYY-MM-DD') );
				$('#viewUpdId').text(data.updId);
				$('#viewUpdDate').text( moment(data.updDate).format('YYYY-MM-DD') );

				//수정 단
				$('#form input[name="equipCd"]').val(data.equipCd);      			
				$('#form input[name="equipNm"]').val(data.equipNm);      			
				$('#form input[name="equipCtrgy"]').val(data.equipCtrgy);      		
				$('#form input[name="modelNm"]').val(data.modelNm);      			
				$('#form input[name="manufactr"]').val(data.manufactr);      		
				$('#form input[name="buyCorp"]').val(data.buyCorp);      			
				$('#form input[name="buyDate"]').val( moment(data.buyDate).format('YYYY-MM-DD') );      			
				$('#form input[name="voltage"]').val(data.voltage);      			
				$('#form input[name="pressure"]').val(data.pressure);      			
				$('#form input[name="telNo"]').val(data.telNo);      				
				$('#form input[name="faxNo"]').val(data.faxNo);      				
				$('#form input[name="installLocation"]').val(data.installLocation); 
				$('#form input[name="capa"]').val(data.capa);      					
				$('#form input[name="etc1"]').val(data.etc1);      					
				$('#form input[name="etc2"]').val(data.etc2);      					
				$('#form input[name="useYn"]').val(data.useYn);      				
				$('#form input[name="dealCorpDesc"]').val(data.dealCorpDesc);      	
				$('#form input[name="regId"]').val(data.regId);      				
				$('#form input[name="regDate"]').val( moment(data.regDate).format('YYYY-MM-DD') );      			
				$('#form input[name="updId"]').val(data.updId);
				$('#form input[name="updDate"]').val( moment(data.updDate).format('YYYY-MM-DD') );

				/*                 
				$('#equipCd').text(data.equipCd);                                
				$('#equipNm').text(data.equipNm);                                
				$('#equipCtrgy').text(data.equipCtrgy);                          
				$('#modelNm').text(data.modelNm);                                
				$('#manufactr').text(data.manufactr);                            
				$('#buyCorp').text(data.buyCorp);                                
				$('#buyDate').text(data.buyDate);                                
				$('#voltage').text(data.voltage);                                
				$('#pressure').text(data.pressure);                              
				$('#telNo').text(data.telNo);                                    
				$('#FaxNo').text(data.faxNo);                                    
				$('#installLocation').text(data.installLocation);                
				$('#capa').text(data.capa);                                      
				$('#etc1').text(data.etc1);                                      
				$('#etc2').text(data.etc2);                                      
				$('#useYn').text(data.useYn);                                    
				$('#dealCorpDesc').text(data.dealCorpDesc);                      
				$('#regId').text(data.regId);                                    
				$('#regDate').text( moment(data.regDate).format('YYYY-MM-DD') ); 
				$('#updId').text(data.updId);                                    
				$('#updDate').text( moment(data.updDate).format('YYYY-MM-DD') );
				 */
				 
				//화면처리
                uiProc(true);

                //선택박스 처리
                selectBoxAppend(installLocationCode, "installLocation", data.installLocation , "");
                selectBoxAppend(equipCtrgyCode, "equipCtrgy", data.equipCtrgy , "");
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
			/* $('#matrlNm').val("Al H0 0.2*45 압연");
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
			$('#matrlDesc').val("자재코드 등록 테스트 입니다."); */

      	}
      	//화면처리        
        uiProc(false); //맨밑에 함수로 만들어 두셨음

        //선택박스처리
		selectBoxAppend(installLocationCode, "installLocation", "" , "2");
        selectBoxAppend(equipCtrgyCode, "equipCtrgy", "" , "2");
        selectBoxAppend(statusYnCode, "statusYnCd", "" , "2");
        
		$('#viewBox').addClass('d-none');
		$('#formBox').removeClass('d-none');
        $('#btnEdit').attr('disabled', true);  //수정버튼
        $('#btnSave').removeClass('d-none');  // 등록버튼
        //$('#btnEdit').addClass('d-none');    // 수정버튼
    });

    // 저장 처리
    $('#btnSave').on('click', function() {
        if ( !$.trim($('#equipCd').val()) ) {
            toastr.error('설비코드을 입력해주세요.');
            $('#equipCd').focus();
            return false;
        }
        else if ( !$.trim($('#equipNm').val()) ) {
            toastr.error('설비명을 입력해주세요.');
            $('#equipNm').focus();
            return false;
        }
        else if ( $("#equipCtrgy option:selected").val() == "" ) {
            toastr.error('설비분류를 선택해 주세요.');
            return false;
        }
        else if ( !$.trim($('#modelNm').val()) ) {
            toastr.error('모델명을 입력해주세요.');
            $('#modelNm').focus();
            return false;
        }
        else if ( !$.trim($('#manufactr').val()) ) {
            toastr.error('제조업체를 입력해주세요.');
            $('#manufactr').focus();
            return false;
        }
        else if ( !$.trim($('#buyCorp').val()) ) {
            toastr.error('구입업체를 입력해주세요.');
            $('#buyCorp').focus();
            return false;
        }
        else if ( !$.trim($('#buyDate').val()) ) {
            toastr.error('구매일을 선택해주세요.');
            $('#buyDate').focus();
            return false;
        }
        else if ( !$.trim($('#voltage').val()) ) {
            toastr.error('전압을 입력해 주세요.');
            $('#voltage').focus();
            return false;
        }
        else if ( !$.trim($('#pressure').val()) ) {
            toastr.error('공압 입력해 주세요.');
            $('#pressure').focus();
            return false;
        }
        else if ( !$.trim($('#telNo').val()) ) {
            toastr.error('전화번호를 입력해 주세요.');
            $('#telNo').focus();
            return false;
        }
        else if ( !$.trim($('#faxNo').val()) ) {
            toastr.error('팩스번호를 입력해 주세요.');
            $('#faxNo').focus();
            return false;
        }
        else if ( $("#installLocation option:selected").val() == "" ) {
            toastr.error('설치위치를 선택해 주세요.');
            return false;
        }
        else if ( !$.trim($('#capa').val()) ) {
            toastr.error('길이를 입력해 주세요.');
            $('#capa').focus();
            return false;
        }
        else if ( !$.trim($('#etc1').val()) ) {
            toastr.error('체크1를 입력해 주세요.');
            $('#etc1').focus();
            return false;
        }
        else if ( !$.trim($('#etc2').val()) ) {
            toastr.error('체크2를 입력해 주세요.');
            $('#etc2').focus();
            return false;
        }
        else if ( $("#statusYnCd option:selected").val() == "" ) {
            toastr.error('상용유무를 입력해 주세요.');
            return false;
        }
        else if ( !$.trim($('#dealCorpDesc').val()) ) {
            toastr.error('비고를 입력해 주세요.');
            $('#dealCorpDesc').focus();
            return false;
        }          
        //alert($('#dealGubun').val());
        var url = '<c:url value="bm/equipCodeAdmCreate"/>';        
        if( sideView == "edit" ) {
        	url = '<c:url value="bm/equipCodeAdmUpdate"/>';
        }
        $.ajax({
            url: url,
            type: 'POST',
            data: {
            	'equipCd' 		:         $('#equipCd').val(),     
            	'equipNm' 		:	      $('#equipNm').val(),    
            	'equipCtrgy' 	:	      $('#equipCtrgy option:selected').val(), 
            	'modelNm' 		:	      $('#modelNm').val(),          
            	'manufactr' 	:	      $('#manufactr').val(),    
            	'buyCorp' 		:	      $('#buyCorp').val(),        
            	'buyDate' 		:	      $('#buyDate').val(),       
            	'voltage' 		:	      $('#voltage').val(),        
            	'pressure' 		:	      $('#pressure').val(),         
            	'telNo'			:	      $('#telNo').val(),         
            	'faxNo' 		:	      $('#faxNo').val(),    
            	'installLocation':	      $('#installLocation option:selected').val(),
            	'capa' 			:	      $('#capa').val(),  
            	'etc1'			:	      $('#etc1').val(),          
            	'etc2' 			:	      $('#etc2').val(),          
            	'useYn'			:	      $('#statusYnCd option:selected').val(),
            	'dealCorpDesc' 	:	      $('#dealCorpDesc').val(),
	            'regId' 		:		  'reg_id',
	            'updId' 		:		  'upd_id',
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
            	$('#equipCodeAdmTable').DataTable().ajax.reload();
                $('#btnAddConfirm').removeClass('d-none');
                $('#btnAddConfirmLoading').addClass('d-none');
            }
        });
    });

    // 수정폼
    $('#btnEdit').on('click', function() {
        alert(sideView);
        if(sideView != 'edit') {
        	toastr.error("수정할 목록을 선택해 주세요!");
            return false;
        }
		uiProc(false);
		$('#viewBox').addClass('d-none');
		$('#formBox').removeClass('d-none');
        $('#btnSave').removeClass('d-none');
        
    });
    
   	function uiProc(flag)
   	{
   		$("#equipNm").attr("disabled",flag);
   		$("#equipCtrgy").attr("disabled",flag);
   		$("#modelNm").attr("disabled",flag);
   		$("#manufactr").attr("disabled",flag);
   		$("#buyCorp").attr("disabled",flag);
   		$("#buyDate").attr("disabled",flag);
   		$("#pitch").attr("disabled",flag);
   		$("#voltage").attr("disabled",flag);
   		$("#pressure").attr("disabled",flag);
   		$("#telNo").attr("disabled",flag);
   		$("#faxNo").attr("disabled",flag);
   		$("#installLocation").attr("disabled",flag);
   		$("#capa").attr("disabled",flag);
   		$("#etc1").attr("disabled",flag);
   		$("#etc2").attr("disabled",flag);
   		$("#statusYnCd").attr("disabled",flag);
   		$("#dealCorpDesc").attr("disabled",flag);
   		$("#regId").attr("disabled",flag);
   		$("#regDate").attr("disabled",flag);
   		$("#updId").attr("disabled",flag);
   		$("#updDate").attr("disabled",flag);
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