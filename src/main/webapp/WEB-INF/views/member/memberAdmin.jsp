<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp" />
</head>
<body>
	<div class="container">
	<h1> Member Admin Page</h1>
	<!-- 회원들의 정보 -->
	<!-- ID, Email, Grade -->
		<div class="row">
			<form class="form-inline" action="./memberAdmin">
				<div class="form-group col-xs-2">
					<select class="form-control" name="kind">
						<option class="k" value="1">ID</option>
						<option class="k" value="2">EMAIL</option>
						<option class="k" value="3">GRADE</option>
					</select>
				</div>
			
				<div class="form-group col-xs-2">
				  <input type="text" class="form-control" value="${pager.search}" name="search">
				</div>
			
				<div class="form-group col-xs-2">
					<button class="form-control">Search</button>
				</div>
			
			</form>
		</div>
	
	<div class="row">
		<div>
			<input id="btn" type="button" value="MemberDelete">
		</div>
		<form id="frm" action="./memberAdmin" method="post">
		<table class="table table-hover">
			<tr>
				<td>
					<input type="checkbox" id="checkAll">
				</td>
				<td>ID</td><td>EMAIL</td><td>Grade</td>
			</tr>
			
			<c:forEach items="${list}" var="dto">
				<tr>
					<td><input type="checkbox" name="id" value="${dto.id}" class="check"> </td>
					<td>${dto.id}</td>
					<td>${dto.email}</td>
					<td>${dto.grade}</td>
				</tr>
			</c:forEach>
		</table>
		</form>
	<!-- Pageing -->
		<ul class="pagination">
			<c:if test="${pager.curBlock>1}">
				<li><a href="./memberAdmin?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">BACK</a></li>
			</c:if>
		    
		    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		    	 <li><a href="./memberAdmin?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
		    </c:forEach>
		    
		    <c:if test="${pager.curBlock<pager.totalBlock}" >
		    	<li><a href="./memberAdmin?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">NEXT</a></li>
		    </c:if>
		    
  		</ul>
  		</div>
	</div>
	<script type="text/javascript">
	
	$("#btn").click(function() {
		var ids = [];
		$(".check").each(function() {
			if($(this).prop("checked")){
				ids.push($(this).val());
			}
		});
		//ajax로 배열을 전송하고자 할때 추가
		jQuery.ajaxSettings.traditional=true;
		
		$.ajax({
			url:"./memberAdmin",
			type: "POST",
			data:{id:ids},
			success:function(data){
				console.log(data);
				location.reload();
			},
			error:function(){
				console.log('error');
			}
		});
	});
	
	
	$("#checkAll").click(function() {
		var c = $(this).prop("checked");
		$(".check").prop("checked", c);
	});
	
	$(".check").click(function () {
		var c2 = true;
		$(".check").each(function() {
			if(!$(this).prop("checked")){
				c2=false;
			}
		});
		$("#checkAll").prop("checked", c2);
	});
	
	
	
	var kind = '${pager.kind}';
	$(".k").each(function() {
		if($(this).val()==kind){
			$(this).prop("selected", true);
		}
	});	
	
	</script>
	
</body>
</html>








