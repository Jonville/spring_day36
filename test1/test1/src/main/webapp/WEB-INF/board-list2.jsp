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
			<h2>게시글 목록</h2>
			<table class="board_list">
				<colgroup>
					<col width="10%"/>
					<col width="10%"/>
					<col width="*"/>
					<col width="15%"/>
					<col width="15%"/>
					<col width="25%"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(item, index) in list" >                            
	                   <td><input type="checkbox" name="selectBoard" v-bind:id="'idx_' + index" v-bind:value="item" v-model="selectedItemList"></td>                       
	                   <td><a href="javascript:;" @click="fnView(item)">{{item.boardNo}}</a></td> 
	                   <td><a href="javascript:;" @click="fnView(item)">{{item.title}}</a></td> 
	                   <td>{{item.cnt}}</td>
	                   <td>{{item.id}}</td>
	                   <td><label v-bind:for="'idx_' + index">{{item.cdatetime}}</label></td>
	               </tr>
				</tbody>
			</table>
		  	<div>
		  		<button @click="fnAdd" style="float: right;">글쓰기</button>
		  		<button @click="fnRemove" style="float: right; margin-right : 5px;">삭제</button>
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
       , selectedItemList : []
    }   
    , methods: {
        fnGetList : function(){
            var self = this;
            for(var i=2; i<10; i++){
            	for(var j=1; j<10; j++){
            		console.log(i + " * " + j + " = " + (i*j));
            	}
            }
            var nparmap = {};
            $.ajax({
                url:"/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.list = data.list;
                }
            }); 
        }  
    	// 조회
    	, fnView : function(item){
    		var self = this;
    		console.log(item);
    		self.pageChange("./view.do", {boardNo : item.boardNo});
    	}
    	
    	// 작성
    	, fnAdd : function(){
    		var self = this;
    		self.pageChange("./add.do", {});
    	}
	    
    	, fnRemove : function(){
    		var self = this;
    		if(!confirm("정말 삭제하시겠습니까?")){
    			return;
    		}
    		var list = JSON.stringify(self.selectedItemList);
    		var nparmap = {"test" : "1",  "list" : list};
             $.ajax({
                 url:"/remove.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {            
                	 alert("삭제되었습니다.");
                	 self.selectedItemList = [];
                	 self.fnGetList();
                 }
             });  
    	}
    	
    	, fnTest : function(){
    		var self = this;
    		self.pageChange("./test.do", {test1 : "1", test2 : "2"});
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
    , created: function () {
		this.fnGetList();       
	}
});
</script>