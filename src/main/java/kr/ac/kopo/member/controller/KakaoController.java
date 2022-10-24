package kr.ac.kopo.member.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

@Controller
public class KakaoController {

	private final static String K_CLIENT_ID = "0159e5dab59b8eb8fb6255812ba87853";
	private final static String K_REDIRECT_URI = "http://localhost:8080/kakaoOauth?type=K";

	public String getAuthorizationUrl(HttpSession session) {

		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + K_CLIENT_ID + "&redirect_uri="
				+ K_REDIRECT_URI + "&response_type=code";
		
		return kakaoUrl;
	}

	public String getAccessToken(String autorize_code) {
		final String RequestUrl = "https://kauth.kakao.com/oauth/token";
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", K_CLIENT_ID)); // REST API KEY
		postParams.add(new BasicNameValuePair("redirect_uri", K_REDIRECT_URI)); // 리다이렉트 URI
		postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정 중 얻은 code 값
		
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		JsonNode returnNode = null;

		try {

			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
			
			System.out.println("getAccessToken / responseCode :" + responseCode);
			System.out.println("getAccessToken / response :" + response);
			
			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			System.out.println("returnNode 값은?? : " + returnNode);
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();

		} catch (ClientProtocolException e) {

			e.printStackTrace();

		} catch (IOException e) {

			e.printStackTrace();

		} finally {
			// clear resources
		}
		return returnNode.get("access_token").toString();
	}

	public JsonNode getKakaoUserInfo(String autorize_code) {
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
		// String CLIENT_ID = K_CLIENT_ID; // REST API KEY
		// String REDIRECT_URI = K_REDIRECT_URI; // 리다이렉트 URI
		// String code = autorize_code; // 로그인 과정중 얻은 토큰 값
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		String accessToken = getAccessToken(autorize_code);
		accessToken = accessToken.replaceAll("\"", "");	

		System.out.println("2번 : "+ accessToken);
		// add header
		post.addHeader("Authorization", "Bearer " + accessToken);

		JsonNode returnJson = null;
		
		try {

			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Response Code : " + responseCode);

			// JSON 형태 반환값 처리 (JSON string)
			ObjectMapper mapper = new ObjectMapper();
			returnJson = mapper.readTree(response.getEntity().getContent());
			((ObjectNode)returnJson).put("accessToken", accessToken);
			
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		} catch (ClientProtocolException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		} finally {
			// clear resources
		}
		return returnJson;
	}
}