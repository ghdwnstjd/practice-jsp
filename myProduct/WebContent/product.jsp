<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품</title>
<style>
   main {
      width: 50%;
      margin: 0 auto;
   }
   
   
   .textAreaModify{
  		text-align: center; 
  		line-height: 15px;
  		border:none;
  		background: #ede4e4;
  		resize: none;
  	}
   .productUpdate, .productUpdateClicked{
   		background-size: 60%;
   		background-repeat:no-repeat;
   		background-position: center;
   		width: 45px;
   		height:45px;
   		cursor:pointer;
   }
   
   .productUpdate {
   		background-image:url("modify.png");
   }
   
   .productUpdateClicked{
   		background-image:url("enter.png");
   }

   .productDelete, .productDeleteClicked{
   		background-size: 60%;
   		background-repeat:no-repeat;
   		background-position: center;
   		width: 45px;
   		height:45px;
   		cursor:pointer;
   }
   
    .productDelete {
   		background-image:url("delete.png");
   	}
   	
   	.productDeleteClicked{
   		background-image:url("cancel.png");
   	}
   	
   
</style>
</head>
<body>
   <main>
      <h1>상품 관리</h1>
      <!-- 추가 -->
      <div style="width: 100%; text-align: right">
         <a href="javascript:view()">추가</a>
         <div class="input-wrap" style="width: 100%; text-align: center; display: none;">
            <input type="text" name="productName" placeholder="상품 이름">
            <input type="text" name="productPrice" placeholder="상품 가격">
            <input type="text" name="productStock" placeholder="상품 재고">
            <input type="button" value="상품 등록" style="width: 70%" onclick="insert()">
         </div>
         <!-- 목록 -->
         <div id="productList"></div>
         <!-- 상품별 수정, 삭제 -->
      </div>
   </main>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
   let count = 1;
   
   show();
   
   /* 삭제하기 */
  $("#productList").on("click", ".productDelete", function(){
	  let productListNumber = $(this).data("number");
	  $.ajax({
		url: "${pageContext.request.contextPath}/delete.prod",
		type: "get",
		data: {productNumber: productListNumber},
		contentType: "application/json; charset=utf-8",
		success: function(){show();}
	  })  
  })
  
  
  var check = true;
   
  /* 수정하기 */
  /* 수정 버튼 클릭 시 이미지 변경 */
    $("#productList").on("click", ".productUpdate", function(){
    	if(!check){return;}
    	check=false;
	  const tableLists = $(this).closest("tr").find("td");
	  
	  /* 삭제 텍스트 취소로 바꾸기 */
	  $("th").eq(5).text("취소");
	  
	  /* 이미지 변경하기 */
	  $(this).hide();
	  $(this).next().show();
	  $(this).next().next().hide();
	  $(this).next().next().next().show();	  
	  
	  var name = tableLists.eq(1);
	  var cost = tableLists.eq(2);
	  var stock = tableLists.eq(3);
	  
	  /* 수정할 textarea 나오게하기 */
	  name.replaceWith("<td><textarea class='textAreaModify'>" +name.text()+ "</textarea></td>");
	  cost.replaceWith("<td><textarea class='textAreaModify'>" +cost.text()+ "</textarea></td>");
	  stock.replaceWith("<td><textarea class='textAreaModify'>" +stock.text()+ "</textarea></td>");
  })
  
  /* 수정 취소 버튼 클릭 시 이미지 변경 */
    $("#productList").on("click", ".productDeleteClicked", function(){
    	check = true;
    	const tableLists = $(this).closest("tr").find("td");
		var name = tableLists.eq(1);
		var cost = tableLists.eq(2);
		var stock = tableLists.eq(3);
		
	/* 취소 텍스트 삭제로 바꾸기 */
	$("th").eq(5).text("삭제");	
	  
	/* 이미지 변경 */
	  $(this).hide();
	  $(this).prev().show();
	  $(this).prev().prev().hide();
	  $(this).prev().prev().prev().show();	  
	  
	  /* textarea 원본으로 되돌리기 */
	  name.replaceWith("<td>" +name.text()+ "</td>");
	  cost.replaceWith("<td>" +cost.text()+ "</td>");
	  stock.replaceWith("<td>" +stock.text()+ "</td>");
  })
  
  /* 진짜 수정 */
  $("#productList").on("click", ".productUpdateClicked", function(){
	  const tableLists = $(this).closest("tr").find("td");
	  var name = tableLists.eq(1).children().val();
	  var price = tableLists.eq(2).children().val();
	  var stock = tableLists.eq(3).children().val();
	  
 	  $.ajax({
		 url: "${pageContext.request.contextPath}/modify.prod",
		 type: "get",
		 data: {
			 productNumber: $(this).data("number"),
			 productName: name,
			 productPrice: price,
			 productStock: stock
		 },
		 success: function(){show();check=true;}
	  })
	
  })

  
   
   
   function view(){
      $(".input-wrap").slideToggle(function(){
         count *= -1;
         $(this).prev().text(count > 0 ? "추가" : "닫기");
      });
   }
   
   function insert(){
      const $productNameInput = $("input[name='productName']");
      const $productPriceInput = $("input[name='productPrice']");
      const $productStockInput = $("input[name='productStock']");
      
      if(!$productNameInput.val()){
         $productNameInput.focus();
         return;
      }
      if(!$productPriceInput.val()){
         $productPriceInput.focus();
         return;
      }
      if(!$productStockInput.val()){
         $productStockInput.focus();
         return;
      }
      
      $.ajax({
         url: "${pageContext.request.contextPath}/create.prod",
         type: "post",
         data: {productName: $productNameInput.val(), productPrice: $productPriceInput.val(), productStock: $productStockInput.val()},
         success: function(){
            $productNameInput.val("");
            $productPriceInput.val("");
            $productStockInput.val("");
            show();
         }
      });
}
   
 
  	function show(){
  		$.ajax({
  			url: "${pageContext.request.contextPath}/list.prod",
  			type: "post",
  			dataType:"json",
  			contentType: "application/json; charset=utf-8",
  			success: function(result){
  				if(result.length >0){
  		  			let text ="";
  				
  		  			text +=`<table border="1" style="width: 100%; text-align: center; margin-top: 15px;"><tr style="height:50px; background: #e2ebe2;"><th>번호</th><th>제품명</th><th>가격</th><th>재고</th><th>수정</th><th>삭제</th></tr>`;
  		  			
  		  			result.forEach(productList =>{
  		  				text += `<tbody>`;
  		  				text += `<td class="productNumber">` + productList.productNumber + `</td>`;
  		  				text += `<td class="productName">` + productList.productName + `</td>`;
  		  				text += `<td class="productPrice">` + productList.productPrice + `</td>`;
  		  				text += `<td class="productStock">` + productList.productStock + `</td>`;
  		  				text += `<td class="productUpdate" data-number=` + productList.productNumber + `></td>`;
  		  				text += `<td class="productUpdateClicked" style="display:none;" data-number=` + productList.productNumber + `></td>`;
  		  				text += `<td class="productDelete" data-number=` + productList.productNumber + `></td>`;
  		  				text += `<td class="productDeleteClicked" style="display:none;" data-number=` + productList.productNumber + `></td>`;
  		  				text += `</tbody>`;
  		  			});
  		  			text += `</table>`;
  		  			
  				$("#productList").html(text);
  		  		} 
  			}
  		});
  	}
  	
</script>
</html>



