<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
	String baselineLoadTestNumber = "";
	String currLoadTestNumber     = (String)session.getAttribute("name");
	String currLoadTestDuration   = (String)session.getAttribute("testValue");
	    baselineLoadTestNumber = request.getParameter("baselineLoadTestNumber");
		String currDir = (String)session.getAttribute("currDir");
		String desiredFolder = currLoadTestNumber+"_"+currLoadTestDuration;
		FileWriter baselineFileWriter = new FileWriter(currDir +"\\"+desiredFolder+"\\BaselineTestNum.txt",true);
		baselineFileWriter.write(baselineLoadTestNumber);
		baselineFileWriter.close();
%>
<div class="jumbotron text-center">
	<h3>Baseline test number successfully added!!! Refresh page to see the results!!!</h3>
</div>