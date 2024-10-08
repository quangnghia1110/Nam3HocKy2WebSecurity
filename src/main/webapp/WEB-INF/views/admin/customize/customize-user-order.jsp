<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>QUẢN LÝ ĐƠN HÀNG</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="<c:url value='/templates/admin/css/styles.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/templates/admin/css/my-style.css'/>"
	rel="stylesheet" />
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
		integrity="sha512-RXf+QSDCUQs5uwRKaDoXt55jygZZm2V++WUZduaU/Ui/9EGp3f/2KZVahFZBKGH0s774sd3HmrhUy+SgOFQLVQ=="
		crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<%@include file="/common/admin/header/header.jsp"%>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">QUẢN LÝ ĐƠN HÀNG</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a style="text-decoration: none"
						href="/admin/index">Trang chủ</a></li>
					<li class="breadcrumb-item active"><a
						style="text-decoration: none; color: black"
						href="/admin/user-order-update">Cập nhật đơn hàng</a></li>
				</ol>
				<div class="card mb-4">
					<form class="mt-3 ms-3 me-3 mb-3"
						action="/admin/order/saveOrUpdate" method="post">
						<!-- ID Order -->
						<div class="mb-3">
							<label for="exampleInputOrderId" class="form-label">ID
								Order</label> <input readonly placeholder="Order ID" name="idOrder"
								type="text" class="form-control" id="exampleInputOrderId"
								aria-describedby="orderIdHelp" value="${userOrder.idOrder}"
								${loguser} required="required">
						</div>

						<!-- ID User -->
						<div class="mb-3">
							<label for="exampleInputUserId" class="form-label">ID
								User</label> <input readonly name="" type="text" class="form-control"
								id="exampleInputUserId" aria-describedby="userIdHelp"
								value="${userOrder.customerByOrder.id}" required="required">
						</div>

						<!-- Total Product -->
						<div class="mb-3">
							<label for="exampleInputTotalProduct" class="form-label">Tổng
								số sản phẩm</label> <input readonly type="text" class="form-control"
								id="exampleInputTotalProduct"
								aria-describedby="totalProductHelp"
								value="${userOrder.totalProduct}" required="required">
						</div>

						<!-- Total Price -->
						<div class="mb-3">
							<label for="exampleInputTotalPrice" class="form-label">Tổng
								giá sản phẩm</label> <input readonly placeholder="Total Price"
								name="total_price" type="text" class="form-control"
								id="exampleInputTotalPrice" aria-describedby="totalPriceHelp"
								value="${userOrder.totalPrice}" required="required">
						</div>

						<div class="mb-3">
							<label for="exampleInputTotalPrice" class="form-label">Tổng
								giá hóa đơn</label> <input readonly type="text" class="form-control"
								id="exampleInputTotalPrice" aria-describedby="totalPriceHelp"
								value="${userOrder.finalPrice}" required="required">
						</div>

						<!-- Order Time -->
						<div class="mb-3">
							<label for="exampleInputOrderTime" class="form-label">Thời
								gian đặt hàng</label> <input readonly type="datetime-local"
								class="form-control" id="exampleInputOrderTime"
								aria-describedby="orderTimeHelp" value="${userOrder.orderDay}"
								required="required">
						</div>

						<div class="mb-3">
							<label for="exampleInputOrderTime" class="form-label">Thời
								gian giao hàng</label> <input readonly type="datetime-local"
								class="form-control" id="exampleInputOrderTime"
								aria-describedby="orderTimeHelp" value="${userOrder.shipDay}"
								required="required">
						</div>

						<!-- ID Pay Method -->
						<div class="mb-3">
							<label for="exampleInputPayMethodId" class="form-label">ID
								Pay Method</label> <input readonly type="text" class="form-control"
								id="exampleInputPayMethodId" aria-describedby="payMethodIdHelp"
								value="${userOrder.payMethodByOrder.name}" required="required">
						</div>

						<div class="mb-3">
							<label for="exampleInputPayMethodId" class="form-label">Chi
								nhánh</label> <input readonly type="text" class="form-control"
								id="exampleInputPayMethodId" aria-describedby="payMethodIdHelp"
								value="${userOrder.branchByOrder.name}" required="required">
						</div>

						<!-- Order State -->
						<div class="mb-3">
							<label for="exampleInputGender" class="form-label">Trạng
								thái đơn hàng</label> <select name="orderState"
								class="form-select" id="exampleInputGender" required="required">
								<option value="0" ${userOrder.orderState == 0 ? 'selected' : ''}>Chờ
									xử lý</option>
								<option value="1" ${userOrder.orderState == 1 ? 'selected' : ''}>Đã
									xác nhận</option>
								<option value="2" ${userOrder.orderState == 2 ? 'selected' : ''}>Đang
									giao hàng</option>
								<option value="3" ${userOrder.orderState == 3 ? 'selected' : ''}>Đã
									nhận hàng</option>
							</select>
						</div>


						<div class="text-end">
							<button type="submit" class="btn btn-success">
								<c:if test="${branch.isEdit}">
									<span>Update</span>
								</c:if>
								<c:if test="${!branch.isEdit}">
									<span>Save</span>
								</c:if>
							</button>
						</div>
					</form>
					<h6 class="ms-3 text-primary">${message}</h6>
				</div>
			</div>
		</main>
	</div>
</body>
</html>
