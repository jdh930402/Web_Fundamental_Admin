<%@page import="java.net.URL"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URI"%>
<%@page contentType="text/html; charset=utf-8"%>

<%
	String oriUrl = request.getParameter("url");
	boolean isSuccess = false;
	String clientId = "xAtQJBgVYPgYJQS1i5UE";// 애플리케이션 클라이언트 아이디값";
	String clientSecret = "Rp1KnO3PJw";// 애플리케이션 클라이언트 시크릿값";
	StringBuffer resp = new StringBuffer();
	try {
		String text = oriUrl;
		String apiURL = "https://openapi.naver.com/v1/util/shorturl?url=" + text;
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("X-Naver-Client-Id", clientId);
		con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		while ((inputLine = br.readLine()) != null) {
			resp.append(inputLine);
		}
		br.close();
		isSuccess = true;
	} catch (Exception e) {
        System.out.println(e);
    }
	%>
	<%if(isSuccess){%>
	<%=resp.toString()%>
<%	}else{ %>
{"message" : "fail"}
<%} %>