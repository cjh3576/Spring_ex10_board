<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp"/>
</head>
<body>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>
						전체선택
						<input type="checkbox" id="checkAll">
					</th>
					<th>제품명</th>
					<th>Option</th>
					<th>수량</th>
					<th>가격</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${cartList }" var="cart" varStatus="i">
				<tr>
					<td><input type="checkbox" class="check" value="${cart.num }"></td>
					<td>${cart.title }</td>
					<td>${cart.contents }</td>
					<td><input type="number" value="${cart.amount }" id="amount${i.index }" class="amount">
					<input title="amount${i.index}" data-num="${cart.num }" type="button" value="수정" class="cartUpdate">
					</td>
					<td>${cart.price }</td>
					<td>${cart.amount * cart.price }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div>
			<button class="btn btn-danger" id="del">Delete</button>
		</div>
	</div>
	<script type="text/javascript">
		$('.cartUpdate').click(function(){
			var amount = $(this).prev().val();
			var num =$(this).attr("data-num");
			$.ajax({
				url: "./cartUpdate",
				type:"POST",
				data:{
					amount : amount,
					num : num
				},
			success:function(data){
				if(data =='1'){
					location.reload();
				}
			}
			
			})
		});
		
		$('#del').click(function(){
			var nums = [];
			$(".check").each(function(){
				if($(this).prop("checked")){
					nums.push($(this).val());
				}
			});
			jQuery.ajaxSettings.traditional=true;
			var result = confirm('정말로 삭제하시겠습니까?');
			if(result){
				$.ajax({
					url:"./cartDelete",
					type:"POST",
					data:{num:nums},
					success:function(data){
						location.reload();
					}
				});
			}
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
	</script>
</body>
</html>