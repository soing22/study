<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/CustomUtil" prefix="fnlb" %>
<!-- jquery 관련 -->
<script type="text/javascript" src="${fnlb:fnContextPathNormalize(pageContext.request)}/jquery-1.11.0.min.js"></script> 
<link rel="stylesheet" href="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/jui.css" />
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/lib/jquery-1.8.0.min.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/lib/jquery.binder.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/base.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/core.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/ui/dropdown.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/ui/modal.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/uix/table.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/uix/xtable.js"></script>
<script type="text/javascript">
	var contextRoot = "${fnlb:fnContextPathNormalize(pageContext.request)}";
	
	//게시판 등록
	function boardSave(){
		var url = contextRoot + "/boardWrite.do";
		var params = {
				procMode :	"insert"
		};
		locationToPost(url, params);
	};
	
	//게시판 상세
	function boardView(num){
		var url = contextRoot + "/boardView.do";
		var params = {
				boardNo	:	num
		};
		locationToPost(url, params);
	};
	
	$(function(){
		boardList(1);
	});
	
	//목록 조회 ajax
	function boardList(page){
		//boardListAjax
		var url = contextRoot + "/boardListAjax.do";
		var params = {
				page			:	page,
				rec				:	10,
				searchOption	:	$("#searchOption").val(),
				searchItems		:	$("#searchItems").val()
		};
		$.ajax({
			url: url,
			type:"post",
			data:params,
			datatype:"json",
			success:function(data) {
				setBoardList(data);
			}
		});
	};
	
	//목록 셋팅
	function setBoardList(data){
		var page = data.page;
		var rec = data.rec;
		var records = data.records;
		var tempList = data.results;
		var trrArray = [];
		var temp = 0;
		
		$("#tbodyList").empty();
		$("#pagenation").empty();
		
		if(tempList != null && tempList.length > 0){
			for(var i=0; i<tempList.length; i++){
				trrArray[temp++] = "<tr>";
				trrArray[temp++] = "<td>"+tempList[i].numb+"</td>";
				if(tempList[i].step > 0){
					trrArray[temp++] = "<td><p style='padding-left:"+tempList[i].step+"0px'><a href='javascript:boardView("+tempList[i].boardNo+");'>└ "+tempList[i].boardTitle+"</a></p></td>";
				}else{
					trrArray[temp++] = "<td><a href='javascript:boardView("+tempList[i].boardNo+");'>"+tempList[i].boardTitle+"</a></td>";
				}
				if(tempList[i].fileNo != 0){
					trrArray[temp++] = "<td> <img src='${fnlb:fnContextPathNormalize(pageContext.request)}/syj/img/ico_down2.gif'/></td>";
				}else{
					trrArray[temp++] = "<td></td>";
				}
				trrArray[temp++] = "<td>"+tempList[i].createUser+"</td>";
				trrArray[temp++] = "<td>"+tempList[i].createDate+"</td>";
				trrArray[temp++] = "<td>"+tempList[i].readCount+"</td>";
				trrArray[temp++] = "</tr>";
			}
			Set_Pager("pagenation", page, records, rec, "boardList");
		}else{
			trrArray[temp++] = "<tr align='center'>";
			trrArray[temp++] = "<td colspan='6'>조회 결과가 없습니다. </td>";
			trrArray[temp++] = "</tr>";
		}
		$("#tbodyList").append(trrArray.join(''));
	};
	
</script>
<body class="jui">
<div  align="ceneter">
	<!-- 버튼 시작 -->
		<div style="text-align: left;">
			<a href="#self" onclick="boardSave();" class="btn btn-mini btn-black-purple"><span><span> 게시글 등록 </span></span></a>&nbsp;&nbsp;&nbsp;
			<select id="searchOption" class="combo combo-black">
				<option value="create_user">작성자</option>
				<option value="board_title">제목</option>
				<option value="board_content">내용</option>
			</select>
			<span class="ac group">
				<label class="label label-small label-purple"><i class="icon-search icon-white"></i></label>
				<input type="text" id="searchItems" class="input input-small input-purple" style="width: 100px">
			</span>
			<a href="javascript:boardList(1);" class="btn btn-mini btn-purple"><span><span> 조회 </span></span></a>
		</div>
		
	<!-- //버튼 끝 -->
</div>

<!-- 테이블 시작 -->
<div>
	<table summary="게시판 리스트 테이블" class="table table-classic">
		<caption>게시판 리스트</caption>
		<colgroup>
			<col style="width: 84px" />
			<col style="width: 415px" />
			<col style="width: 83px" />
			<col style="width: 105px" />
			<col style="width: 105px" />
			<col style="width: 83px" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">파일</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody id="tbodyList">
		</tbody>
	</table>
</div>
<div id="pagenation" class="paging" style="margin-top: 3px;">
</div>

<!-- <div id="paging_2" class="paging" style="margin-top: 3px;">
<a href="#" class="start">Next</a>
			<a href="#" class="prev">Previous</a>
			<div class="list">
			
				<a href="#" class="page">1</a>
			
				<a href="#" class="page">2</a>
			
				<a href="#" class="page">3</a>
			
				<a href="#" class="page">4</a>
			
				<a href="#" class="page">5</a>
			
			</div>
			<a href="#" class="end">Next</a>
			<a href="#" class="next">Next</a>
			
			
		</div>
		
 -->
</body>
<script type="text/javascript">
/* 페이징 관련 function start *****************************************************************************/

/*
 * pageAreaId : 페이징을 넣을 DIV ID
 * pageNum : 요청페이지
 * records : 총 게시건수
 * recordPerPage : 페이지당 표시할 게시건수
 * goFunction : 페이지클릭시 실행할 Function
 */
Set_Pager = function(pageAreaId, pageNum, records, recordPerPage, goFuncName)
{
	var pageHtml = "";
	
	var totalPage = Math.ceil(records/recordPerPage);
	var countPerBlock = 10;								// 한화면에 보여줄 페이지개수
	var curBlock = Math.ceil(pageNum/countPerBlock);	// 현재 화면영역 (1~10/ 11~20)
	var startPage = (curBlock-1) * 10 + 1;
	var lastPage = (curBlock)*10;
	
	var prev = $("<a href='javascript:;' id='first'class='start' title='이전 10개 페이지'> 이전 </a>");
	var next = $("<a href='javascript:;' id='next' class='end' title='다음 10개 페이지'> 다음 </a>");
	
	var first = $("<a href='javascript:;' id='prev' class='prev' title='첫 페이지'> 처음 </a>");
	var last = $("<a href='javascript:;' id='last' class='next' title='마지막 페이지'> 맨끝 </a>");
	
	if(lastPage > totalPage) lastPage = totalPage;
	
	pageHtml += "<div class='list'>";
		
	// 페이징 생성
	for(var i = startPage; i <= lastPage; i++)
	{ 
		if(parseInt(pageNum) === i)
			pageHtml += "<a href='#self' class='page active'>" + i + "</a>";
		else
			pageHtml += "<a href='javascript:" + goFuncName + "(" + i + " , " + recordPerPage + ")'  class='page'> " + i + " </a>";
	}
	
	pageHtml += "</div>";
	
	// 이전블록 유효하면 이전버튼 이벤트 생성
	if(pageNum > startPage) {
		prev.attr("href", "javascript:" + goFuncName + "("+ (pageNum - 1) + " , " + recordPerPage + ")");
	}
	
	// 다음블록 유효하면 다음버튼 이벤트 생성
	if(pageNum < totalPage) {
		next.attr("href", "javascript:" + goFuncName + "("+ (pageNum + 1) + " , " + recordPerPage + ")");
	}
	
	// 첫페이지가 아니면 이벤트 생성
	if(pageNum != 1){
		first.attr("onclick", "javascript:" + goFuncName + "(" + 1 + " , " + recordPerPage + ")");
	}
	
	// 마지막 페이지가 아니면 이벤트 생성
	if(pageNum != totalPage){
		last.attr("onclick", "javascript:" + goFuncName + "(" + totalPage + " , " + recordPerPage + ")");
	}
	
	$("#" + pageAreaId)
	.append(prev)
	.append(first)
	.append(pageHtml)
	.append(next)
	.append(last)
	;
};

//Post Submit (window.location.href)
function locationToPost(url, params) 
{
	var temp=document.createElement("form");
	temp.action = url;
	temp.method = "POST";
	temp.style.display = "none";
	for(var x in params) {
		var opt = document.createElement("textarea");
		opt.name = x;
		opt.value = params[x];
		temp.appendChild(opt);
	}
	
	document.body.appendChild(temp);
	temp.submit();
	return temp;
};
</script>