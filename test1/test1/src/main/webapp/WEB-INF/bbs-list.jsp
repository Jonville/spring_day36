<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<link rel="stylesheet" href="css/style.css">
	<title>게시판</title>

</head>
<style>
</style>
<body>
	<div id="app" >
		<div class="container">
			<label>검색어 : <input type="text" v-model="keyword"></label>
			<select v-model="selectItem">
				<option value="">:: 전체 ::</option>
				<option value="1">공지사항</option>
				<option value="3">자유게시판</option>
			</select>
			<button class="btn" @click="fnGetList()">검색</button>
	        <div class="table-list">
	            <table class="board_list">                   
	                <thead>
	                    <tr>            
	                        <!-- <th scope="col"></th> -->
	                        <th scope="col">No.</th>
	                        <th scope="col">제목</th>
	                        <th scope="col">아이디</th>
	                        <th scope="col">작성일</th>
	                        <th scope="col">조회수</th>
	                        <th scope="col"></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr v-for="(item, index) in list" > 
                            <!-- <td><input type="checkbox" v-bind:value="item" v-model="checkList"></td> -->
                            
                            <td>{{index + 1}}</td>
                            <td @click="fnView(item.boardNo)"><a href="javascript:;">{{item.title}}</a></td>
                            <td>{{item.id}}</td>     
                            <td>{{item.cdatetime}}</td>     
                            <td>{{item.cnt}}</td>     
                            <td><button v-if="item.id == sessionId || sessionStatus == 'A'" class="btn" @click="fnRemove(item)">삭제</button></td>     
                        </tr>                                       
	                </tbody>                   
	            </table>
	        </div>
	        <div>
	        	<!-- <button class="btn">삭제</button> -->
	        	<button class="btn" @click="fnAdd()">등록</button>
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
    	, checkList : []
    	, keyword : ""
    	, selectItem : ""
    	, sessionId : "${sessionId}" 	// request 에있는걸 가져온다는 뜻
    	, sessionStatus : "${sessionStatus}"
    	, updateCnt : "${updateCnt}"
    }   
    , methods: {
        fnGetList : function(){
            var self = this;
            var nparmap = {keyword : self.keyword , kind : self.selectItem};
            $.ajax({
                url:"/bbs/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	console.log(data);
	                self.list = data.list;
                }
            }); 
        }
    	, fnAdd : function() {
    		location.href = "insert.do"
    	}
    	
    	, fnRemove : function(item) {	//매개변수를 줘야함
    		var self = this;
    		console.log(item);
            var nparmap = item;		// item 자체가 맵이라서 {} 이거 안씀
            if(!confirm("정말 삭제하시겠습니까?")){	// confirm 은 조건문이라서 if 붙임
            	return;	// 취소 누르면 완전 빠져나가라는 뜻
            }
            
            $.ajax({
                url:"/bbs/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {   
                	console.log(data);
                	alert("삭제되었습니다.")
                	self.fnGetList();	// 지우고 나서 리스트 바로 출력
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
    	
    	, fnView : function(boardNo){
    		var self = this;
    		self.pageChange("./read.do", {boardKey : boardNo});
    	}
    	
    }   
    , created: function () {
		this.fnGetList();    
	}
});
</script>