<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Tradr - Trading Platform</title>
	<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<spring:url value="css/default.css" var="defaultCSS" />
<spring:url value="css/fonts.css" var="fontsCSS" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="${defaultCSS}" rel="stylesheet" />
<link href="${fontsCSS}" rel="stylesheet" />
</head>
<body>
	<div class="page">
	<div>
		<tiles:insertAttribute name="header" />
		</div>
		<div class="maintype">
			<tiles:insertAttribute name="body" />
		</div>
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>