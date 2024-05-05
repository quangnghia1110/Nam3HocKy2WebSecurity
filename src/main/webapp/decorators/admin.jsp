<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>TRANG CHỦ</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="<c:url value='/admin/css/styles.css'/>" rel="stylesheet" />
<link href="<c:url value='/admin/css/my-style.css'/>" rel="stylesheet" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	integrity="sha512-RXf+QSDCUQs5uwRKaDoXt55jygZZm2V++WUZduaU/Ui/9EGp3f/2KZVahFZBKGH0s774sd3HmrhUy+SgOFQLVQ=="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"
	integrity="sha512-MRDODtdVPB+P6eG8RPTGDxaK55jJ8j+Iu2eJFUa+3lmeOLTrXfDbQ4ThAw7vx0iqYlAZodtE4ps23rd/NQHoXg=="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha512-pax4MlgXjHEPfCwcJLQhigY7+N8rt6bVvWLFyUMuxShv170X53TRzGPmPkZmGBhk+jikR8WBM4yl7A9WMHHqvg=="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	integrity="sha512-mf78KukU/a8rjr7aBRvCa2Vwg/q0tUjJhLtcK53PHEbFwCEqQ5durlzvVTgQgKpv+fyNMT6ZQT1Aq6tpNqf1mg=="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	integrity="sha512-H3/W5Uiq9yIE092unlW/ilqxP6tWSaVE7ZRv5isMBooElrZ5m2RLy0usp1pVQkCKTelHxvKK2/2mfeyw1ZeCeQ=="
	crossorigin="anonymous"></script>
<script src="<c:url value='/admin/assets/demo/chart-area-demo.js'/>"></script>
<script src="<c:url value='/admin/assets/demo/chart-bar-demo.js'/>"></script>
<script src="<c:url value='/admin/js/scripts.js'/>"></script>
<script src="<c:url value='/user/js/plugins.js'/>"></script>
<script	src="<c:url value='/admin/js/bootstrap.bundle.min.js'/>"></script>
<script	src="<c:url value='/admin/js/buttons.bootstrap4.min.js'/>"></script>
<script	src="<c:url value='/admin/js/buttons.colVis.min.js'/>"></script>
<script src="<c:url value='/admin/js/buttons.html5.min.js'/>"></script>
<script src="<c:url value='/admin/js/buttons.print.min.js'/>"></script>
<script	src="<c:url value='/admin/js/dataTables.bootstrap4.min.js'/>"></script>
<script	src="<c:url value='/admin/js/dataTables.buttons.min.js'/>"></script>
<script	src="<c:url value='/admin/js/dataTables.responsive.min.js'/>"></script>
<script src="<c:url value='/admin/js/jquery.dataTables.min.js'/>"></script>
<script src="<c:url value='/admin/js/jquery.min.js'/>"></script>
<script src="<c:url value='/admin/js/jszip.min.js'/>"></script>
<script src="<c:url value='/admin/js/pdfmake.min.js'/>"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js"
	integrity="sha512-sZLif02pOYdWSGSO18HakvSGGR7qB+dwhVOElFJrXQK4BYUi31NcTyD6ah7iWUHzn8e5PRqLMjfFFrtt8QqGDw=="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/he/1.2.0/he.min.js"
	integrity="sha512-PEsccDx9jqX6Dh4wZDCnWMaIO3gAaU0j46W//sSqQhUQxky6/eHZyeB3NrXD2xsyugAKd4KPiDANkcuoEa2JuA=="
	crossorigin="anonymous"></script>

<script>
	$(window).on("load", function() {
		$('body').addClass('loaded');
	});
</script>
</head>
<body>
	<sitemesh:write property="body"/>
</body>
</html>