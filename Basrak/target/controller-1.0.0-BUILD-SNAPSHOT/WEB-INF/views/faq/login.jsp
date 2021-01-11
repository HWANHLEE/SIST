<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link rel = "stylesheet" href = "css/bootstrap.css">
    <link rel = "stylesheet"  href = "css/style.css">

<!-- logimForm1 CSS-->
<style>
.form-block {
	background-color: rgb(221, 220, 220);
	height: 220px;
	width: 400px;
	text-align: center;
	/* margin-left: auto;
            margin-right: auto; */
	margin: 0px auto; /* 가운데 정렬. */
	border-radius: 25px;
	margin-top: 50px;
}

.form-group {
	width: 250px;
	margin: 0px auto;
}

.btn-primary {
	margin-bottom: 5px;
}

.form-control {
	margin-top: 5px;
}

img {
	width: 30px;
	height: 30px;
	/* display: block; */
}
</style>


<!-- loginForm1 -->
<!--  회원가입 입력 폼. -->
<form class="form-block">
	<div class="form-group">

		<div class="input-group">
			<div class="input-group-addon">
				<img src="/images/user.png" alt="User Images">
			</div>
			<input type="email" class="form-control" id="exampleInputAmount"
				placeholder="aaa@basrak.com">
		</div>
		<br />

		<div class="input-group">
			<div class="input-group-addon">
				<img src="/images/key.png" alt="Key Images">
			</div>
			<input type="password" class="form-control" id="exampleInputAmount"
				placeholder="비밀번호 입력">
		</div>
		<br />

		<button type="submit" class="btn btn-primary">회원가입</button>
		<br />

		<button type="submit" class="btn btn-success">회원으로 이용하고 싶으시다면
			클릭</button>

	</div>
</form>