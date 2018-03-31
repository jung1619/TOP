<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:400,300,500);
*:focus {
  outline: none;
}

body {
  margin: 0;
  padding: 0;
  background: #DDD;
  font-size: 16px;
  color: #222;
  font-family: 'Roboto', sans-serif;
  font-weight: 300;
}

#login-box {
  position: relative;
  margin: 5% auto;
  width: 310px;
  height: 450px;
  background: #FFF;
  border-radius: 2px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
}

.left {
  position: absolute;
  top: 0;
  left: 0;
  box-sizing: border-box;
  padding: 40px;
  width: 300px;
  height: 400px;
}

h1 {
  margin: 0 0 20px 0;
  font-weight: 300;
  font-size: 28px;
}

input[type="text"].joinText,
input[type="password"].joinText {
  display: block;
  box-sizing: border-box;
  margin-bottom: 20px;
  padding: 4px;
  width: 220px;
  height: 32px;
  border: none;
  border-bottom: 1px solid #AAA;
  font-family: 'Roboto', sans-serif;
  font-weight: 400;
  font-size: 15px;
  transition: 0.2s ease;
}

input[type="text"]:focus.joinText,
input[type="password"]:focus.joinText {
  border-bottom: 2px solid #16a085;
  color: #16a085;
  transition: 0.2s ease;
}

input[type="submit"] {
  margin-top: 28px;
  width: 120px;
  height: 45px;
  background: #16a085;
  border: none;
  border-radius: 2px;
  color: #FFF;
  font-family: 'Roboto', sans-serif;
  font-weight: 500;
  text-transform: uppercase;
  transition: 0.1s ease;
  cursor: pointer;
}

input[type="submit"]:hover,
input[type="submit"]:focus {
  opacity: 0.8;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
  transition: 0.1s ease;
}

input[type="submit"]:active {
  opacity: 1;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.4);
  transition: 0.1s ease;
}

button.social-signin {
  margin-bottom: 20px;
  width: 220px;
  height: 36px;
  border: none;
  border-radius: 2px;
  color: #FFF;
  font-family: 'Roboto', sans-serif;
  font-weight: 500;
  transition: 0.2s ease;
  cursor: pointer;
}

button.social-signin:hover,
button.social-signin:focus {
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
  transition: 0.2s ease;
}


.checkText{
  border:none;
  border-right:0px;
  border-top:0px; 
  boder-left:0px;
  boder-bottom:0px;
  color : rgb(255,0,0);
  
}
</style>


<script type="text/javascript" src="<c:url value='resources/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	/*UserName Check  */
	
	$('#username').keydown(function(){
		console.log($('#username').val());
		var username = $('#username').val();
		$.ajax({
			type : 'GET'
			,url :'UserNameCheck'
			,dataType:'text'
			,data :{ 
					"username":username}
			,success	:function(data){
				console.log('data확인'+data);
				$('#UserNameCheckDiv').html(data);
			}
			, error:function(err){
				console.log("에러발생");
			}
		})
		
	});
	
	
	/*e-mail중복 Check form*/
	
	$('#email').keydown(function(){
		console.log($('#email').val());
		var email = $('#email').val();
		
		$.ajax({
			type: 'GET'
			,url: 'emailCheck'
			,dataType:'text'
			,data : {
					"email":email
			}
			,success : function(data){
				console.log('result 확인 '+data);
				$('#emailCheckDiv').html(data);
				
			}
			,error:function(err){
				console.log("에러발생");
			}
			
		});
		
	});
	
	
	
	/* 비밀번호 Check form */
	$('#pwCheckDiv').html('비밀번호를 입력해주세요.');
	$('#pw2').keydown(function(){
		
		var pw1_length  = $('#pw1').val().length;
		var pw2_length = $('#pw2').val().length;
		
		console.log('p_length1 : '+pw1_length);
		console.log('p_length2 : '+pw2_length);
		console.log('pw1 : '+$('#pw1').val());
		console.log('pw2 : '+$('#pw2').val());
		
		
		if(pw2_length>=10){
			var pw1 = $('#pw1').val();
			var pw2 = $('#pw2').val();
			
			
			
			if(pw1==pw2){
				$('#pwCheckDiv').html("비밀번호가 일치합니다.");
			}else{
				$('#pwCheckDiv').html("비밀번호가 일치하지 않습니다.");
			}
				
		}	
	});
	
	
});



</script>
</head>
<body>


<div id="login-box">
  <div class="left">
    <h1>Sign up</h1>
    
    <input type="text" name="username" placeholder="Username" class="joinText" id="username" />
	<div id="UserNameCheckDiv"></div>
    <input type="text" name="email" placeholder="E-mail" class="joinText" id="email"/>
    <div id="emailCheckDiv"></div>
    <input type="password" name="password" placeholder="Password" class="joinText"  id="pw1"/>
    <input type="password" name="password2" placeholder="Retype password" class="joinText" id="pw2"/>
    <div id="pwCheckDiv"></div>
    <input type="text" name="email" placeholder="NickName" class="joinText"/>
    <input type="submit" name="signup_submit" value="Sign up"/>
  </div>
</div>

</body>
</html>