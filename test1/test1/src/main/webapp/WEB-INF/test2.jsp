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
	<div id="app" >
		<div class="container">
	        <div style="margin : 20px;">
	            <label>입력 : <input type="text" v-model="keyword" @keyup.enter="fnSearch()"></label>
	            <select id="selectBox" v-model="selectItem">
	                <option id="0" value="">:: 전체 ::</option>
	                <option id="1" value="기계">기계</option>
	                <option id="2" value="전기전자">전기전자</option>
	                <option id="3" value="컴퓨터정보">컴퓨터정보</option>
	                <option id="4" value="ㅋㅋㅋ">ㅋㅋㅋ</option>
	            </select>
	            <button @click="fnSearch()">검색</button>
	        </div>
	        <div class="table-list">
	            <table class="board_list">                   
	                <thead>
	                    <tr>            
	                        <th scope="col"></th>                
	                        <th scope="col">No.</th>
	                        <th scope="col">학번</th>
	                        <th scope="col">이름</th>
	                        <th scope="col">학과</th>
	                        <th scope="col">학년</th>
	                        <th scope="col">키</th>
	                        <th scope="col">몸무게</th>
	                        <th scope="col" v-if="addFlg"></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr v-for="(item, index) in list" > 
                            <td><input type="checkbox" name="selectBoard" v-bind:id="'idx_' + index" v-bind:value="item" v-model="selectedItemList"></td>                 
                            <td>{{index + 1}}</td> 
                            <td>{{item.stuNo}}</td>
                            <td>{{item.stuName}}</td>
                            <td>{{item.stuDept}}</td>     
                            <td>{{item.stuGrade}}</td>     
                            <td>{{item.stuHeight}}</td>     
                            <td>{{item.stuWeight}}</td>  
                        </tr>                                       
	                </tbody>                   
	            </table>
	            <div>
	            </div>
	        </div>
        </div>
        <div>
        	<button @click="fnRemove()">삭제</button>
        </div>
    </div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	list : []
        , keyword : ""
        , searchTxt : ""
        , selectItem : ""      
        , checkItem : []
        , addFlg : false
        , updateNo : ""
        , info : {}
		, selectedItemList : []
    }   
    , methods: {
        fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"/student/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.list = data.list;
                }
            }); 
        }  	
    	, fnRemove : function(){
    		var self = this;
    		if(!confirm("정말 삭제하시겠습니까?")){
    			return;
    		}
    		var list = JSON.stringify(self.selectedItemList);
    		var nparmap = {"test" : "1",  "list" : list};
             $.ajax({
                 url:"/student/remove.dox",
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
    }   
    , created: function () {
		this.fnGetList();    
	}
});
</script>