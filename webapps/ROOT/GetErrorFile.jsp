<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="com.github.fge.largetext.LargeText" %>
<%@ page import="com.github.fge.largetext.LargeTextFactory" %>
<%@ page import="com.github.fge.largetext.SizeUnit" %>

<%
	final LargeTextFactory factory = LargeTextFactory.newBuilder()
		        						.setCharset(StandardCharsets.US_ASCII) // either a Charset instance
		        						.setCharsetByName("windows-1252")      // or by name
		        						.setWindowSize(2047, SizeUnit.MiB)        // set the window size
		        						.build();
	
	String line = null;
    BufferedReader br = null;
    BufferedWriter wr = new BufferedWriter(new FileWriter("stackTrace1.csv",true));
    BufferedWriter wr1 = new BufferedWriter(new FileWriter("stackTraceAss1.csv",true));
    wr.write("Request,Response_Code,Response_Message");
    wr.newLine();
    wr1.write("Request,Assert_Message");
    wr1.newLine();
	br = new BufferedReader(new FileReader("D:\\1Ne\\SSO_SC_JTL\\SSO_SC_2400_JTL_Total_2111217.jtl"));
	Pattern errorPattern = Pattern.compile("httpSample.+?lb=\"(.+?)\" rc=\"([^2|^3].+?)\" rm=\"(.+?)\"");
	Pattern errorPatternAss = Pattern.compile("<httpSample[^\\<|^\\?]+?lb=\"([^\\\"]+?)\" rc=\"([^\\\"]+?)\"[^\\<|^\\?]+?>[\\W]+<assertionResult>[\\W]+<name>Response Assertion</name>[\\W]+<failure>[^\\<|^\\?]+?</failure>[\\W]+<error>[^\\<|^\\?]+?</error>[\\W]+<failureMessage>([^\\<|^\\?]+?)</failureMessage>");
	while((line = br.readLine()) != null) {
                Matcher m = errorPattern.matcher(line);
                Matcher m1 = errorPatternAss.matcher(line);
                if(m.find()) {
                    try {
                        if(Integer.parseInt(m.group(2)) >= 400) {
							
					%>
					<pre>
					Request Name : <%=m.group(1)%>           Response Code    : <%=m.group(2)%>                Response Message : <%=m.group(3)%>
					</pre>
					<%
                            wr.write(m.group(1).trim() + "," + m.group(2).trim() + "," + m.group(3).trim());
                            wr.newLine();
                        }
                    } catch (Exception var10) {
                    }
                }
				if(m1.find()){
					%>
					<pre>
					Request Name : <%=m1.group(1)%>          Response Code    : <%=m.group(2)%>                  Assertion Message    : <%=m1.group(3)%> 
					</pre>
					<%
					wr1.write(m1.group(1).trim() + "," + m1.group(2).trim()	);
                            wr1.newLine();
				}
            }

            wr.close();
            wr1.close();
            br.close();
			
%>
