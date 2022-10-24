package kr.ac.kopo.message.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class KakaoAPI {
	private final static String K_CLIENT_ID = "0159e5dab59b8eb8fb6255812ba87853";
	private final static String K_REDIRECT_URI = "http://localhost:8080/kakaoOauth?type=K";

	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=" + K_CLIENT_ID);
			sb.append("&redirect_uri=" + K_REDIRECT_URI);
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return access_Token;
	}

	public HashMap<String, Object> getUserInfo(String access_Token) {

		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			userInfo.put("nickname", nickname);
			userInfo.put("email", email);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return userInfo;
	}

	public void kakaoLogout(String access_Token) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			System.out.println("실제 넘어온 값 : " + access_Token);

			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			String result = "";
			String line = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			System.out.println(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void SendKakaoMessage(String access_Token, String status, String amount) {
		String reqURL = "https://kapi.kakao.com/v2/api/talk/memo/default/send";

		try {
			String msg = "";
			
			switch (status) {
			case "fail": // 지출 > 예산
				msg += "설정하신 예산 금액보다 " + amount + "원 초과했어요..!\n"
						+ "이 달의 가계부를 참고하여 다음 챌린지에는 더 힘을 내보아요!\n\n"
						+ "예산 챌린지 결과를 확인하시려면 아래 버튼을 눌러주세요.";
				break;
			case "success": // 지출 > 예산
				msg += "예산 챌린지 성공!\n이번 달은 " + amount + "원을 아꼈어요.\n"
						+ "이 달의 가계부를 참고하여 다음 챌린지도 도전해보아요!\n\n"
						+ "예산 챌린지 결과를 확인하시려면 아래 버튼을 눌러주세요.";
				break;
			case "limit": // 권장 지출 < 5000원
				msg += "오늘까지 권장 지출이 5000원 미만입니다. 가계부를 한 번 확인해보는건 어떨까요?";
				break;
			default:
				break;
			}

			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			System.out.println("conn 객체 : " + conn);
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			JsonObject json = new JsonObject();

			if (!json.isJsonNull()) {
				json.addProperty("object_type", "text");
				json.addProperty("text", msg); // 텍스트는 최대 200자 길이
				
			}
			
			JsonObject link = new JsonObject();
			link.addProperty("web_url", "http://localhost:8080/acctbook");
//	         link.addProperty("mobile_web_url", "https://www.google.com");

			json.add("link", link.getAsJsonObject());

			sb.append("template_object=" + json);

			System.out.println(sb.toString());
			bw.write(sb.toString());
			bw.flush();

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			// System.out.println("실제 넘어온 값 : " + access_Token);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String result = "";
			String line = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println(result);

			bw.close();
			br.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
