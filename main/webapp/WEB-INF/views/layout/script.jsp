<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<script src="<c:url value='/resources/assets/vendor/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/bootstrap/js/popper.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/pace/pace.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/stacked-menu/stacked-menu.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/parsleyjs/parsley.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/parsleyjs/i18n/ko.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/moment/moment-with-locales.min.js'/>"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.20/af-2.3.4/b-1.6.1/cr-1.5.2/fc-3.3.0/fh-3.1.6/kt-2.5.1/r-2.2.3/rg-1.1.1/rr-1.2.6/sc-2.0.1/sp-1.0.1/sl-1.3.1/datatables.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/AlertifyJS/1.13.1/alertify.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>
<script src="<c:url value='/resources/assets/javascript/theme.min.js'/>"></script>
<script>
    // 토스트 메시지가 2초후 사라짐
    toastr.options.timeOut = 2000;

    // moment 언어 설정
    moment.locale('ko');

    //dataTables 한글화
    let lang_kor = {
        "decimal" : "",
        "emptyTable" : "데이터가 없습니다.",
        "info" : "_START_ - _END_ (총 _TOTAL_ 건)",
        "infoEmpty" : "0건",
        "infoFiltered" : "(전체 _MAX_ 건 중 검색결과)",
        "infoPostFix" : "",
        "thousands" : ",",
        "lengthMenu" : "_MENU_ 개씩 보기",
        "loadingRecords" : "로딩중...",
        "processing" : "처리중...",
        "search" : "검색 : ",
        "zeroRecords" : "검색된 데이터가 없습니다.",
        "paginate" : {
            "first" : "첫 페이지",
            "last" : "마지막 페이지",
            "next" : "다음",
            "previous" : "이전"
        },
        "aria" : {
            "sortAscending" : " :  오름차순 정렬",
            "sortDescending" : " :  내림차순 정렬"
        }
    };

	function selectBoxAppend(obj, id, sVal, flag)
	{
		$('#'+ id).empty();

		if(flag == '1') {
			$('#'+ id).append($("<option value=''>"+ "전체" +"</option>"));
	   	} else if(flag == '2') {
	   		$('#'+ id).append($("<option value=''>"+ "선택" +"</option>"));
	   	}
	   		
		for(key in obj) {
			var option;
			if(obj[key].baseCd == sVal ) {
				option = $("<option value="+ obj[key].baseCd+ " selected>"+obj[key].baseCdNm+"</option>");
			} else {
				option = $("<option value="+obj[key].baseCd+">"+obj[key].baseCdNm+"</option>");
			}	
			$('#'+ id).append(option);
		}

	}
   	    
    /*
    let current = null;
    let controllerUrl = null;
    let subControllerUrl = null;
    let viewMainTable = null;
    let mainTable = '';
    let formItems = null;				// 메인항목 - 등록, 수정에 보여줄 항목
    let viewItems = null;				// 메인항목 - 보기에 보여줄 항목
    let theadItems = null;				// 메인항목 - 테이블 항목
    let columns = null;					// 메인항목 - 목록, 칼럼(columns)
    let orderLot = null;				// 메인항목 - 목록, 정렬(orderLot)
    let columnDefs = null;				// 메인항목 - 목록, 칼럼상태(columnDefs)
    let subTable = '';
    let subFormItems = null;			// 서브항목 - 등록, 수정에 보여줄 항목
    let subViewItems = null;			// 서브항목 - 보기에 보여줄 항목
    let subTheadItems = null;			// 서브항목 - 테이블 항목
    let subColumns = null;				// 서브항목 - 목록, 칼럼(columns)
    let subOrderLot = null;				// 서브항목 - 목록, 정렬(orderLot)
    let subColumnDefs = null;			// 서브항목 - 목록, 칼럼상태(columnDefs)
    let searchData = null;
    let showAddAfterViewDetail = false;	// 상세보기가 선택된 상태에서 등록을 누른경우, 취소하면 다시 상세보기항목을 보여주기 위해서 사용
    */
</script>
