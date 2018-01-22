<!DOCTYPE html>
<%@ page isErrorPage="true" %>
<%@ page errorPage="index.jsp" %> 
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../QAminiLogo.ico">

    <title>Gale Reports</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <script>
        var testNumber = prompt("Please enter the load test number(eg. PC2193)", "PC2193");
		if(testNumber!=null)
            window.location = "home.jsp?currLoadTestNumber=" + encodeURIComponent(testNumber);
    </script>
</head>
</html>