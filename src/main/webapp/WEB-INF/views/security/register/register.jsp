<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

<script src="https://unpkg.com/validator@latest/validator.min.js"
		integrity="sha512-hbPvueZAJx8GdjaqfRAA7FEz9UahrMeTaePHz/LDMDvDQaGSGxavizrTmww82nQmtfCUFW7wL9QmtTq8X/qM5A=="
		crossorigin="anonymous">
</script>
<script>
	function checkPasswordMatch() {
		var password = document.getElementById("password").value;
		var retype = document.getElementById("floatingRetype").value;
		var submitButton = document.getElementById("submit");

		if (password === retype && validatePasswordRequirements(password)) {
			submitButton.disabled = false;
		} else {
			submitButton.disabled = true;
		}
	}
</script>
<script>
// Hàm kiểm tra mật khẩu
function validatePassword(input) {
    var password = input.value;
    var passwordError = document.getElementById("passwordError");
    passwordError.innerHTML = ""; // Xóa thông báo lỗi trước khi kiểm tra lại
    if (!containsUpperCase(password)) {
        passwordError.innerHTML += "Mật khẩu cần chứa ít nhất một chữ cái in hoa.<br>";
    }
    if (!containsLowerCase(password)) {
        passwordError.innerHTML += "Mật khẩu cần chứa ít nhất một chữ cái thường.<br>";
    }
    if (!containsDigit(password)) {
        passwordError.innerHTML += "Mật khẩu cần chứa ít nhất một chữ số.<br>";
    }
    if (!containsSpecialCharacter(password)) {
        passwordError.innerHTML += "Mật khẩu cần chứa ít nhất một ký tự đặc biệt.<br>";
    }
    if (!isLongEnough(password)) {
        passwordError.innerHTML += "Mật khẩu cần ít nhất 12 ký tự.<br>";
    }
}
function containsUpperCase(password) {// Hàm kiểm tra chứa ít nhất một chữ cái in hoa
    return /[A-Z]/.test(password);
}
function containsLowerCase(password) {// Hàm kiểm tra chứa ít nhất một chữ cái thường
    return /[a-z]/.test(password);
}
function containsDigit(password) {// Hàm kiểm tra chứa ít nhất một chữ số
    return /\d/.test(password);
}
function containsSpecialCharacter(password) {// Hàm kiểm tra chứa ít nhất một ký tự đặc biệt
    return /[@$!%*?&]/.test(password);
}
function isLongEnough(password) {// Hàm kiểm tra độ dài mật khẩu
    return password.length >= 12;
}
function validatePasswordRequirements(password) {//Hàm kiểm tra xem mật khẩu có đáp ứng các yêu cầu không
    return containsUpperCase(password) && containsLowerCase(password) && containsDigit(password) && containsSpecialCharacter(password) && isLongEnough(password);
}
// Hàm kiểm tra số điện thoại
function validatePhoneNumber(input) {
	var phoneNumber = input.value;
	var phoneNumberError = document.getElementById("phoneNumberError");
	phoneNumberError.innerHTML = ""; // Xóa thông báo lỗi trước khi kiểm tra lại
	if (!validator.isMobilePhone(phoneNumber, "vi-VN")) {
		phoneNumberError.innerHTML += "Số điện thoại không hợp lệ.";
	}
}
// Hàm kiểm tra email
function validateEmail(input) {
	var email = input.value;
	var emailError = document.getElementById("emailError");
	emailError.innerHTML = ""; // Xóa thông báo lỗi trước khi kiểm tra lại
	if (!validator.isEmail(email)) {
		emailError.innerHTML += "Email không hợp lệ.";
	}
}
// Hàm kiểm tra họ
function validateSurname(input) {
	var surname = input.value;
	var surnameError = document.getElementById("surnameError");
	surnameError.innerHTML = ""; // Xóa thông báo lỗi trước khi kiểm tra lại
	if (validator.isEmpty(surname)) {
		surnameError.innerHTML += "Họ không được để trống.";
	}
}
// Hàm kiểm tra tên
function validateName(input) {
	var name = input.value;
	var nameError = document.getElementById("nameError");
	nameError.innerHTML = ""; // Xóa thông báo lỗi trước khi kiểm tra lại
	if (validator.isEmpty(name)) {
		nameError.innerHTML += "Tên không được để trống.";
	}
}
// Hàm kiểm tra tên đăng nhập
function validateUserName(input) {
	var userName = input.value;
	var userNameError = document.getElementById("userNameError");
	userNameError.innerHTML = ""; // Xóa thông báo lỗi trước khi kiểm tra lại
	if (validator.isEmpty(userName)) {
		userNameError.innerHTML += "Tên đăng nhập không được để trống.";
	}
}

</script>
</head>
<body>
	<section class="bg-white">
		<div class="container py-2">
			<div
				class="row d-flex justify-content-center align-content-start align-items-center"
				style="margin-top: 65px; margin-bottom: 50px">
				<div class="col-md-6">
					<img src='<c:url value="/security/img/register.jpg" />' alt="Image"
						class="img-fluid me-3" style="margin-left: -50px;">
				</div>
				<div class="col-12 col-md-8 col-lg-8 col-xl-6">
					<div class="card rounded-4 shadow">
						<div class="card-body p-md-5 p-sm-2">
							<h2 class="fw-bold mb-4">Sign up for free</h2>
							<div class="alert">
								<c:if test="${not empty message}">
									<div class="alert alert-success">${message}</div>
								</c:if>
							</div>
							<form action="/security/register" method="post"
								class="needs-validation" novalidate="true">
								<sec:csrfInput />
								<div class="">
									<div class="mb-3">
										<div class="form-floating">
											<input type="text" name="surname" id="floatingUsername"
												class="form-control rounded-3" required="required"
												placeholder="Surname" oninput="validateSurname(this);"/> <label for="floatingUsername">Surname</label>
										</div>
										<div class="alert">
											<div class="alert alert-danger" id="surnameError"></div>
											<!-- Hiển thị thông báo lỗi họ -->
									</div>
									<div class="mb-3">
										<div class="form-floating">
											<input type="text" name="name" id="floatingUsername"
												class="form-control rounded-3" required="required"
												placeholder="Name" oninput="validateName(this);" /> <label for="floatingUsername">Name</label>
										</div>
										<div class="alert">
											<div class="alert alert-danger" id="nameError"></div>
											<!-- Hiển thị thông báo lỗi tên -->
									</div>
									<div class="mb-3">
										<div class="form-floating">
											<input type="text" name="phoneNumber" id="floatingPhoneNumber"
												class="form-control rounded-3" required="required"
												placeholder="Phonenumber" oninput="validatePhoneNumber(this);"/> <label for="floatingUsername">Phonenumber</label>
										</div>
										<div class="alert">
											<div class="alert alert-danger" id="phoneNumberError"></div>
											<!-- Hiển thị thông báo lỗi số điện thoại -->
										</div>
									</div>

									<div class="mb-3">
										<label for="exampleInputGender" style="margin-left: 2px"
											class="form-label">Giới tính*</label> <select name="gender"
											class="form-select" id="exampleInputGender"
											required="required">
											<option value="1">Nam</option>
											<option value="0">Nữ</option>
										</select>
									</div>
									<div class="mb-3  ">
										<div class="form-floating">
											<input type="email" name="email" id="floatingEmail"
												class="form-control rounded-3" required="required"
												placeholder="name@example.com" oninput="validateEmail(this);" /> <label
												for="floatingEmail">E-mail: </label>
										</div>
										<div class="alert">
											<div class="alert alert-danger" id="emailError"></div>
											<!-- Hiển thị thông báo lỗi email -->
										</div>
									</div>
									<hr>
									<div class="mb-3">
										<div class="form-floating">
											<input type="text" name="username" id="floatingUsername"
												class="form-control rounded-3" required="required"
												placeholder="Username" oninput="validateUserName(this);"/> <label for="floatingUsername">Username</label>
										</div>
										<div class="alert">
											<div class="alert alert-danger" id="userNameError"></div>
											<!-- Hiển thị thông báo lỗi tên đăng nhập -->
									</div>
									<div class="mb-3  ">
										<div class="form-floating">
											<input type="password" id="password" name="password"
												class="form-control rounded-3" required="required"
												minlength="8" placeholder="Password"
												oninput="validatePassword(this);" /> <label for="password">Password:
											</label>
											<div class="alert">
												<div class="alert alert-danger" id="passwordError"></div>
												<!-- Hiển thị thông báo lỗi mật khẩu -->
											</div>
										</div>
									</div>

									<div class="mb-3">
										<div class="form-floating">
											<input type="password" id="floatingRetype" name="retype"
												class="form-control  rounded-3" required="required"
												minlength="8" oninput="checkPasswordMatch(this);"
												placeholder="Retype" /> <label for="floatingRetype">Retype:
											</label>
										</div>
									</div>
									<div class="d-grid gap-2 mb-2">
										<button type="submit" id="submit" disabled="disabled"
											class="btn btn-lg rounded-3 btn-primary">Sign Up</button>
										<small class="text-muted">By clicking Sign up, you
											agree to the <a href="" data-bs-toggle="modal"
											data-bs-target="#termModal">terms of use</a>.
										</small>
									</div>
									<hr class="my-4">
									<h2 class="fs-5 fw-bold mb-3 text-center">Or use a
										third-party</h2>
									<a
										href="${pageContext.request.contextPath}/oauth2/authorization/google"
										class="w-100 py-2 mb-2 btn btn-outline-danger rounded-3">
										<i class="fab fa-google me-2"></i> Sign up with google
									</a> <a
										href="${pageContext.request.contextPath}/oauth2/authorization/facebook"
										class="w-100 py-2 mb-2 btn btn-outline-primary rounded-3">
										<i class="fab fa-facebook-f me-2"></i>Sign up with facebook
									</a>
									<div class="d-grid gap-2 mb-2" style="margin-top: 15px">
										<a href="/security/login"
											class="text-dark text-decoration-none d-inline text-center"><b>Back
												to login</b></a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
