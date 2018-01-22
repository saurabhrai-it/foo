<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.*" %>
<%@ page import="java.io.*" %>


<%
	String line = null;
    BufferedReader br = null;
    BufferedWriter wr = new BufferedWriter(new FileWriter("stackTrac111.csv"));
    wr.write("Response_Code,COUNT");
    wr.newLine();
	br = new BufferedReader(new FileReader("D:\\1Ne\\SSO_SC_JTL\\SSO_SC_2400_JTL_Total_2111217.jtl"));
	Pattern errorPattern = Pattern.compile("httpSample.+?rc=\"([^2|^3].+?)\"");
	List<String> responseCodes = new ArrayList<String>();
	while((line = br.readLine()) != null) {
                Matcher m = errorPattern.matcher(line);
                if(m.find()) 
					responseCodes.add(m.group(1).trim());
            }
            br.close();
	Set<String> responseCodeSet = new TreeSet<>(responseCodes);
	String s1="";
	for(String s : responseCodeSet)
	{
		if(s.length()==3)
			s1="HTTP_"+s;
		else
			s1=s;
		wr.write(s1+","+Collections.frequency(responseCodes, s));
        wr.newLine();
	}
    wr.close();
%>
