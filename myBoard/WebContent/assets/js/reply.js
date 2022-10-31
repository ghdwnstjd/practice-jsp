/**
 * 댓글 
 */
const $modfiyButtons = $("div.modify-button"); 
const $deleteButtons = $("div.delete-button"); 

show();

function show(){
	$.ajax({
		url: "/reply/listOk.re",
		type: "get",
		/*boardNumber는 jsp의 javascript에 선언해놨음*/
		data: {boardNumber: boardNumber},
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: showList
	});
}

function showList(replies){
	if(replies.length > 0){
		let text = "";
		
		replies.forEach(reply => {
			text += `<div class="reply">`;
			text += `<div class="info">`
			text += `<p class="writer">` + reply.memberId + `</p>`;
			text += `<p class="date">` + reply.replyDate + `</p>`;
			text += `</div>`
			text += `<div class="content" style="width:100%">`;
			text += `<pre>` + reply.replyContent + `</pre>`;
			text += `</div>`;
			/*data-뒤에 쓰고 싶은 변수명을 적어도 된다.*/
			/*자기가 쓴 게시글에만 수정, 삭제 버튼이 나와야 하기 때문에 if문으로 감싸준다.*/
			if(reply.memberId == memberId){
				text += `<div class="button-wrap">`;
				text += `<div class="modify-ready-button" data-number=` + reply.replyNumber +`></div>`;
				text += `<div class="modify-button" data-number=` + reply.replyNumber +` style="display:none"></div>`;
				text += `<div class="delete-button" data-number=` + reply.replyNumber +`></div>`;
				text += `<div class="cancel-button" data-number=` + reply.replyNumber +`style="display:none"></div>`;
				text += `</div>`;
			}
			text += `</div>`;
		});
		/*append는 이전 것을 포함해서 계속 누적시키기 때문에 이전 것은 버리기 위해 html로 추가한다.*/
		$("#replies").html(text);
	}
}

function send(){
	let replyContent = replyForm.replyContent.value;
	if(!replyContent){
		alert("댓글 내용을 작성해주세요.");
		return;
	}
	
	$.ajax({
		url: "/reply/writeOk.re",
		type: "get",
		data: {
					replyContent: replyContent, 
					boardNumber: boardNumber, 
					memberNumber: memberNumber
		},
		contentType: "application/json; charset=utf-8",
		success: function(){show();}
	});
}

// 이벤트 위임
// 미리 작성된 HTML 태그에 이벤트를 부여하고, DOM으로 추가될 자식에게 이벤트를 위임해준다.
$("#replies").on("click", "div.delete-button", function(){
	/*data-number로 변수 명을 설정해줬기 때문에 불러올 때는 data("number")로 불러올 수 있다.*/
	let replyNumber = $(this).data("number");
	$.ajax({
		url: "/reply/deleteOk.re",
		type: "get",
		data: {replyNumber: replyNumber},
		contentType: "application/json; charset=utf-8",
		success: function(){show();}
	});
});

$("#replies").on("click", ".modify-ready-button", function(){
	const buttons = $(this).closest(".button-wrap").children();
	buttons.eq(0).hide();
	buttons.eq(1).show();
	buttons.eq(2).hide();
	buttons.eq(3).show();
	
})

$("#replies").on("click", ".cancel-button", function(){
	const buttons = $(this).closest(".button-wrap").children();
	buttons.eq(0).show();
	buttons.eq(1).hide();
	buttons.eq(2).show();
	buttons.eq(3).hide();
})



$("#replies").on("click", ".modify-button", function(){
	$.ajax({
		url: "/reply/modifyOk.re",
		type: "get",
		data: {
			replyContent: "김인영 칼집함",
			replyNumber: $(this).data("number")
		},
		contentType: "application/json; charset=utf-8",
		success: function(){show();}
	})
})









