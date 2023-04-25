<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<link rel="stylesheet" href="css/style.css">
	<title>Insert title here</title>
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
				</h3>
				<div class="card-body">
				   	<div style="margin: 10px 10px 10px 10px;">
				   		{{info.content}}
				   	</div>
			   	</div>
			</div>
			<button @click="fnList" class="btn" style="float: right;">목록으로</button>
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
       , idx : "${map.boardNo}"
    }   
    , methods: {
    	fnGetBoard : function(){
            var self = this;
            var nparmap = {boardNo : self.idx};
            $.ajax({
                url:"/view.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	console.log();                                       
	                self.info = data.board;
                }
            }); 
        }
    	, fnList : function(){
    		location.href="/board.do";
    	}
    }   
    , created: function () {
    	var self = this;
    	self.fnGetBoard();
	}
});
</script>