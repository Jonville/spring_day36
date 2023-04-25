<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<link rel="stylesheet" href="css/style.css">
	<title>상세 조회</title>
</head>
<style>
	
</style>
<body>
	<div id="app">
		<div class="container">
			<div class="card">
				<h3 class="card-header p-4">
					{{info.title}}
					<span class="badge badge-pill badge-dark pull-right" style="float: right;">{{info.cdatetime}}</span>
					<span>조회수  :  {{info.cnt}}</span>
					
				</h3>
				<div class="card-body">
				   	<div style="margin: 10px 10px 10px 10px;">
				   		{{info.content}}
				   	</div>
			   	</div>
			   	
			</div>
			<div>
				<button @click="fnList" class="btn" style="float: right;">목록으로</button>
				<button v-if="info.id == sessionId || sessionStatus == 'A' " @click="fnUpdate" class="btn" style="float: right;">수정</button>
			</div>
			<h3 style="margin-top : 50px; margin-bottom : 20px">댓글</h3>
			<div style="clear : both;  border-top : 2px solid black"></div>
			<div v-for="(item, index) in commentList">
				<span v-if="item.delYn == 'N'">
					{{item.id}}({{item.cdatetime}}) : {{item.content}}
					<button v-if="item.id == sessionId" @click="fnRemoveComment(item)" class="btn">삭제</button>
					<button v-if="item.id == sessionId" @click="fnUpdateComment()"  class="btn">수정</button>
				</span>
				
				<span v-else>
					삭제된 댓글 입니다.
				</span>
				
			</div>
			<div style="margin-top : 20px">
				<textarea v-model="comment" rows="3" cols="100" style="width : 90%"></textarea>
				<button @click="fnComment()" class="btn" style="margin-bottom : 30px">댓글 등록</button>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
       list : [] 
       , info : {}
       , boardKey : "${map.boardKey}"	
       , sessionId : "${sessionId}"
       , sessionStatus : "${sessionStatus}"	// request 에있는걸 가져온다는 문법
       , comment : ""
       , commentList : []
       , commentNo : ""
    }   
    , methods: {
    	fnUpdateComment : function(){
            var self = this;
            var nparmap = self.info;
            nparmap.commentNo = self.commentNo;
            $.ajax({
                url:"/bbs/update.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("저장되었습니다.");
                	location.href="/bbs.do";
                }
            }); 
        } 
    	,
    	 fnRemoveComment : function(item) {	//매개변수를 줘야함
    		var self = this;
    		var nparmap = item;
            if(!confirm("정말 삭제하시겠습니까?")){	// confirm 은 조건문이라서 if 붙임
            	return;	// 취소 누르면 완전 빠져나가라는 뜻
            }
            $.ajax({
                url:"/comment/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	alert("삭제되었습니다.")
                	self.fnGetBoard();	// 지우고 나서 댓글 바로 출력
                }
            });  
    	}
    	,
    	fnComment : function () {
            var self = this;
            var nparmap = {boardKey : self.boardKey , comment : self.comment , userid : self.sessionId};
            $.ajax({
                url:"/bbs/comment.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.comment="";
                	alert("댓글이 추가되었습니다.");
                	self.fnGetBoard();
                }
            }); 
           		
    	}
    	,
    	fnList : function(){
    		location.href="/bbs.do";
    	}
    
    	,
    	fnUpdate : function(){
    		var self = this;
    		self.pageChange("/modify.do" , {boardKey : self.boardKey});
    	}
    	,
	    fnGetBoard : function(){
	        var self = this;
	        var nparmap = {boardKey : self.boardKey};
	        $.ajax({
	            url:"/bbs/read.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {
	            	console.log();                                       
	                self.info = data.info;
	                self.commentList = data.commentList;
	            }
	        }); 
	    }
    	
    	, pageChange : function(url, param) {
    		var target = "_self";
    		if(param == undefined){
    		//	this.linkCall(url);
    			return;
    		}
    		var form = document.createElement("form"); 
    		form.name = "dataform";
    		form.action = url;
    		form.method = "post";
    		form.target = target;
    		for(var name in param){
				var item = name;
				var val = "";
				if(param[name] instanceof Object){
					val = JSON.stringify(param[name]);
				} else {
					val = param[name];
				}
				var input = document.createElement("input");
	    		input.type = "hidden";
	    		input.name = item;
	    		input.value = val;
	    		form.insertBefore(input, null);
			}
    		document.body.appendChild(form);
    		form.submit();
    		document.body.removeChild(form);
    	}
    
    }   
    , created: function () {		// 페이지 로드될때 바로 실행됨
    	var self = this;
    	self.fnGetBoard();
	}
});
</script>