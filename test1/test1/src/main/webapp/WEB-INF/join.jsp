<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<title>회원가입</title>
		<style>
	        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	
	        body {
	            background-color: #1BBC9B;
	        }
	
	        .div1 {
	            margin: auto;
	            width: 300px;
	            background-color: #EEEFF1;
	            border-radius: 5px;
	            text-align: center;
	            padding: 20px;
	        }
	         .div2 {
	            margin: auto;
	            width: 250px;
	            background-color: #EEEFF1;
	            border-radius: 5px;
	            text-align: center;
	            padding: 10px;
	        }
	
	        input {
	            width: 100%;
	            padding: 10px;
	            box-sizing: border-box;
	            border-radius: 5px;
	            border: none;
	        }
	
	        .in {
	            margin-bottom: 10px;
	        }
	
	        #btn {
	            background-color: #1BBC9B;
	            margin-bottom: 30px;
	            color: white;
	        }
	
	        a {
	            text-decoration: none;
	            color: #9B9B9B;
	            font-size: 12px;
	        }
	     
    	</style>
	</head>
	<body>
		<div id="app" class="div1">
			<div class="div2">
				<h2>회원가입</h2>
				<input type="text" class="in" placeholder="아이디" v-model="id"></input>
			</div>
			<div class="div2">
				<input type="password" class="in" placeholder="비밀번호" v-model="pw"></input>
			</div>
			<div class="div2">
				<input type="password" class="in" placeholder="비밀번호 확인" v-model="chpw"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="이름" v-model="name"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="닉네임" v-model="nickname"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="나이" v-model="age"></input>
			</div>
			
			<div class="div2">성별 : 
				<select>
					<option>남자</option>
					<option>여자</option>
				</select>
			</div>
			
			<div class="div2">주소 : 
				<select>
					<option>서울</option>
					<option>부산</option>
					<option>대전</option>
					<option>대구</option>
				</select>
			</div>
			
			<div class="div2">
				<button id="btn" >회원가입</button>
			</div>
		</div> 
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	user : {}
    	, id : ""
    	, pw : ""
    	, chpw : ""
    	, name : ""
    	, nickname : ""
    	, age : ""
    }   
    , methods: {
    	
    }   
    , created: function () {
    
	}
});
</script>