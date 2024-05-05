<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600"
	rel="stylesheet" type="text/css">
<link href='<c:url value="/css/user_info.css"/>' rel="stylesheet"
	type="text/css">
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdn.jsdelivr.net/webjars/org.webjars/jquery/3.7.1/jquery.slim.min.js"
	integrity="sha512-sNylduh9fqpYUK5OYXWcBleGzbZInWj8yCJAU57r1dpSK9tP2ghf/SRYCMj+KsslFkCOt3TvJrX2AV/Gc3wOqA=="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha512-Ua/7Woz9L5O0cwB/aYexmgoaD7lw3dWe9FvXejVdgqu71gRog3oJgjSWQR55fwWx+WKuk8cl7UwA1RS6QCadFA=="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.esm.min.js"
	integrity="sha384-HKM/DGX54fRPVLoxgmzVudc2O1bN6VxsaCXlHIeshO3JlsK3KSQHZxcXV4NspkV+"
	crossorigin="anonymous"></script>
</head>
<body>

	<div class="content" style="margin-top: 80px">
		<c:if test="${message != null }">
			<div id="toast">
				<div
					class="toast ${status == 'success' ? 'toast--success' : 'toast--error' }">
					<div class="toast__icon">
						<i
							class="${status == 'success' ? 'fas fa-check-circle' : 'fas fa-exclamation-circle' }"></i>
					</div>
					<div class="toast__body">
						<h3 class="toast__title">${status == 'success' ? 'Success' : 'Error' }</h3>
						<p class="toast__msg">${message }</p>
					</div>
					<div class="toast__close">
						<i class="fas fa-times"></i>
					</div>
				</div>
			</div>
		</c:if>
		<div class="user-infor-title">Thông tin tài khoản</div>
		<div class="user-infor-container">
			<form action="/user_infor/edit/${user.id}" method="post">
				<div class="user-infor user-name">Tên khách hàng</div>
				<div class="user-infor user-name-textbox">
					<input type="text" class="user-lastname-textbox textbox"
						name="name" value="${user.name}" required
						placeholder="Tên khách hàng"> <input type="text"
						class="user-surname-textbox textbox" name="surname"
						value="${user.surname}" required placeholder="Họ khách hàng">
				</div>
				<div class="user-infor user-name">UserName</div>
				<div class="user-infor user-name-textbox">
					<input type="text" class="user-lastname-textbox textbox"
						name="username" value="${user.username}" required
						placeholder="Username" readonly>
				</div>
				<div class="user-infor user-phone">Số điện thoại</div>
				<input type="tel" id="phone" class="user-phone-textbox textbox"
					name="phoneNumber" value="${user.phoneNumber}" pattern="0\d{9}"
					required>
				<div class="user-infor user-birthday">Sinh nhật</div>
				<input type="date" class="user-birthday-textbox textbox"
					name="birthday" value="${user.birthday}" readonly>
				<div class="user-infor user-email">Email</div>
				<input type="email" class="user-email-textbox textbox" name="email"
					value="${user.email}"> <input type="radio"
					name="gender" id="nam" value="1"
					${user.gender == 1 ? 'checked' : ''} required>Nam <input
					type="radio" name="gender" id="nu" value="0"
					${user.gender == 0 ? 'checked' : ''}>Nữ <input
					type="submit" class="user-update-button" value="Cập nhật">

			</form>
		</div>
	</div>

	<script type="text/javascript"
		src='<c:url value="/user/js/toast.js" />'></script>
</body>
</html>