<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- Define menu items here -->
<spring:url value="/" var="homeUrl" htmlEscape="true" />
<spring:url value="/login" var="loginUrl" htmlEscape="true" />

<spring:url value="/userManage" var="userManageUrl" htmlEscape="true" />
<spring:url value="/buysell" var="buySellUrl" htmlEscape="true" />
<spring:url value="/getquote" var="quoteUrl" htmlEscape="true" />

<!-- Portfolio -->
<spring:url value="/getStatement" var="getStatementUrl" htmlEscape="true" />
<spring:url value="/watchlist" var="watchlistUrl" htmlEscape="true" />
<spring:url value="/getIndReports" var="IndReportsUrl" htmlEscape="true" />
<spring:url value="/getHshReports" var="HshReportsUrl" htmlEscape="true" />

<!--  Stocks-->
<spring:url value="/getNseData" var="getNseUrl" htmlEscape="true" />
<spring:url value="/getMoneyControlData" var="getMoneyControltUrl" htmlEscape="true" />
<spring:url value="/getYahooFinData" var="getYahooUrl" htmlEscape="true" />

<!--  End of menu items -->

<!--  Start of content -->
<div id="header-wrapper">

	<div id="header" class="container">
		<div id="logo">
			<h1>
				<a href="${homeUrl}">TRADR</a>
			</h1>
			<button id="userbutton"> Guest </button>
		</div>
		
		<div id="menu">
			<ul>
				<li>
					<div class="dropdown">
						<button class="dropbtn">Trade</button>
						<div class="dropdown-content">
							<a href="${buySellUrl}">Buy/Sell</a>

							<a href="${quoteUrl}">Get Quote</a>
						</div>
					</div>
				</li>
				<li>
					<div class="dropdown">
						<button class="dropbtn">Stocks</button>
						<div class="dropdown-content">
							<a href="${getNseUrl}">NSE</a>
							<a href="${getMoneyControltUrl}">MoneyControl</a>
							<a href="${getYahooUrl}">Yahoo Finance</a>
						</div>
					</div>
				</li>
				<li>
					<div class="dropdown">
						<button class="dropbtn">PortFolio</button>
						<div class="dropdown-content">
							<a href="${getStatementUrl}">Statement</a>
							<a href="${watchlistUrl}">WatchList</a>
							<a href="${IndReportsUrl}">Industry Reports</a>
							<a href="${HshReportsUrl}">HouseHold Reports</a>
						</div>
					</div>
				</li>
				<button id="loginbutton" onclick="location.href='${loginUrl}'">Login/Register</button>
				
				
			</ul>
			
		</div>
	
	</div>
</div>