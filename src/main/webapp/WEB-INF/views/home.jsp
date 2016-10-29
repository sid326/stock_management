<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
	<h2>Money Control</h2>
        <jsp:include page="user_maintain.jsp"></jsp:include>
        <jsp:include page="userupdatetodb.jsp"></jsp:include>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</tiles:putAttribute>
</tiles:insertDefinition>
