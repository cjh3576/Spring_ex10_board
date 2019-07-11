<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:import url="../temp/boot.jsp"/>
</head>
<body>
	<div class="container">
		<h1>${board} List Page </h1>
		
		<div>
			<form class="form-inline" action="./${board}List">
		<div class="form-group col-xs-2">
			<select class="form-control" name="kind">
				<option class="k" value="1">Title</option>
				<option class="k" value="2">Writer</option>
				<option class="k" value="3">Contents</option>
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
		
		<table class="table table-hover">
			<tr>
				<td>NUM</td>
				<td>TITLE</td>
				<td>WRITER</td>
				<td>DATE</td>
				<td>HIT</td>
			</tr>
			
			<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.num}</td>
				<td>
				<c:forEach begin="1" end="${dto.depth}">--</c:forEach>
				<a href="./${board}Select?num=${dto.num}">${dto.title}</a>
				</td>
				<td>${dto.writer}</td>
				<td>${dto.reg_date}</td>
				<td>${dto.hit}</td>
			</tr>
			
			</c:forEach>
			
			
		</table>
		
		<ul class="pagination">
			<c:if test="${pager.curBlock>1}">
				<li><a href="./${board}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">BACK</a></li>
			</c:if>
		    
		    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		    	 <li><a href="./${board}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
		    </c:forEach>
		    
		    <c:if test="${pager.curBlock<pager.totalBlock}" >
		    	<li><a href="./${board}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">NEXT</a></li>
		    </c:if>
		    
  		</ul>
  		
  		<div>
  			<a href="./${board}Write" class="btn btn-primary">Write</a>
  		</div>
		
	
	</div>
<script type="text/javascript">
	var message='${message}';
	if(message != ''){
		alert(message);
	}
	var kind = '${pager.kind}';
	$(".k").each(function() {
		if($(this).val()==kind){
			$(this).prop("selected", true);
		}
	});	
</script>

</body>
</html>