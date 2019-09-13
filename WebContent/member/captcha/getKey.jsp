<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page contentType="application/json; charset=utf-8"%>

<%
String clientId = "lXzey2jtwrfEAAWo9Lxn";// 애플리케이션 클라이언트 아이디값";
String clientSecret = "UH4P_T111V";// 애플리케이션 클라이언트 시크릿값";
StringBuffer resp = new StringBuffer();
try {
	String code = "0"; // 키 발급시 0, 캡차 이미지 비교시 1로 세팅
	String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
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
	out.println(resp.toString());
} catch (Exception e) {
	System.out.println(e);
}
%>
