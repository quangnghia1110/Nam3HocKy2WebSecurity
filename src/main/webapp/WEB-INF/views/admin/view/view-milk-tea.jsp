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
<title>DANH SÁCH TRÀ SỮA</title>
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
	<script
			src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"
			integrity="sha512-MRDODtdVPB+P6eG8RPTGDxaK55jJ8j+Iu2eJFUa+3lmeOLTrXfDbQ4ThAw7vx0iqYlAZodtE4ps23rd/NQHoXg=="
			crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<%@include file="/common/admin/header/header.jsp"%>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">DANH SÁCH TRÀ SỮA</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a style="text-decoration: none"
						href="/admin/index">Trang chủ</a></li>
					<li class="breadcrumb-item active"><a
						style="text-decoration: none; color: black" href="#">Danh sách
							trà sữa</a></li>
				</ol>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i>BẢNG DANH SÁCH TRÀ SỮA
						<button class="btn btn-primary" onclick="exportToExcel()"
							style="margin-left: 15px">
							<svg xmlns="http://www.w3.org/2000/svg" height="1em"
								viewBox="0 0 384 512">
                                <style>
svg {
	fill: #e8e8e8
}
</style>
								<path
									d="M48 448V64c0-8.8 7.2-16 16-16H224v80c0 17.7 14.3 32 32 32h80V448c0 8.8-7.2 16-16 16H64c-8.8 0-16-7.2-16-16zM64 0C28.7 0 0 28.7 0 64V448c0 35.3 28.7 64 64 64H320c35.3 0 64-28.7 64-64V154.5c0-17-6.7-33.3-18.7-45.3L274.7 18.7C262.7 6.7 246.5 0 229.5 0H64zm90.9 233.3c-8.1-10.5-23.2-12.3-33.7-4.2s-12.3 23.2-4.2 33.7L161.6 320l-44.5 57.3c-8.1 10.5-6.3 25.5 4.2 33.7s25.5 6.3 33.7-4.2L192 359.1l37.1 47.6c8.1 10.5 23.2 12.3 33.7 4.2s12.3-23.2 4.2-33.7L222.4 320l44.5-57.3c8.1-10.5 6.3-25.5-4.2-33.7s-25.5-6.3-33.7 4.2L192 280.9l-37.1-47.6z" />
                            </svg>
							Xuất Excel
						</button>
						<button class="btn btn-success" onclick="exportToWord()"
							style="margin-left: 15px">
							<svg xmlns="http://www.w3.org/2000/svg" height="1em"
								viewBox="0 0 384 512">
                                <style>
svg {
	fill: #e8e8e8
}
</style>
								<path
									d="M48 448V64c0-8.8 7.2-16 16-16H224v80c0 17.7 14.3 32 32 32h80V448c0 8.8-7.2 16-16 16H64c-8.8 0-16-7.2-16-16zM64 0C28.7 0 0 28.7 0 64V448c0 35.3 28.7 64 64 64H320c35.3 0 64-28.7 64-64V154.5c0-17-6.7-33.3-18.7-45.3L274.7 18.7C262.7 6.7 246.5 0 229.5 0H64zm55 241.1c-3.8-12.7-17.2-19.9-29.9-16.1s-19.9 17.2-16.1 29.9l48 160c3 10.2 12.4 17.1 23 17.1s19.9-7 23-17.1l25-83.4 25 83.4c3 10.2 12.4 17.1 23 17.1s19.9-7 23-17.1l48-160c3.8-12.7-3.4-26.1-16.1-29.9s-26.1 3.4-29.9 16.1l-25 83.4-25-83.4c-3-10.2-12.4-17.1-23-17.1s-19.9 7-23 17.1l-25 83.4-25-83.4z" />
                            </svg>
							Xuất Word
						</button>
					</div>
					<div class="card-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>ID trà sữa</th>
									<th>Tên trà sữa</th>
									<th>Giá</th>
									<th>Mô tả</th>
									<th>Tên loại Trà Sữa</th>
									<th>Hình ảnh</th>
									<th>Edit</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="milkTea" items="${milkTeas}">
									<tr>
										<td>${milkTea.idMilkTea}</td>
										<td>${milkTea.name}</td>
										<td>${milkTea.cost}</td>
										<td>${milkTea.description}</td>
										<td>${milkTea.milkTeaTypeByMilkTea.name}</td>
										<td><c:url
												value="/admin/milk-tea/image/${milkTea.image != null ? milkTea.image : 'uploads/abc.jpg' }"
												var="imgUrl" /> <img width="50px" height="50px"
											src="${imgUrl }" /></td>
										<td><a class="btn btn-success"
											href="/admin/milk-tea/edit/${milkTea.idMilkTea}">edit</a></td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>
	</div>
	<script>
		function exportToExcel() {
			var tableClone = $('#example1').clone();
			tableClone.find('tr').each(function() {
				$(this).find('th:last, td:last').remove();
			});
			var wb = XLSX.utils.table_to_book(tableClone[0], {
				sheet : "Sheet JS"
			});
			XLSX.writeFile(wb, "Danh Sách Trà Sữa.xlsx");
		}

		function exportToWord() {
			var tableClone = $('#example1').clone();
			tableClone.find('tr').each(function() {
				$(this).find('th:last, td:last').remove();
			});
			var newHtml = tableClone.prop('outerHTML');
			var blob = new Blob([ '\ufeff', newHtml ], {
				type : 'application/msword'
			});
			var url = URL.createObjectURL(blob);
			var a = document.createElement('a');
			a.href = url;
			a.download = 'Danh Sách Trà Sữa.doc';
			document.body.appendChild(a);
			a.click();
			document.body.removeChild(a);
			URL.revokeObjectURL(url);
		}
	</script>
</body>
</html>
