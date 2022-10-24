package kr.ac.kopo.pay.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import org.json.JSONArray;
import org.json.JSONObject;

//@Controller
public class OpenApiController {

	private final static String URL = "http://ecos.bok.or.kr/api";
	private final static String authKey = "/DOW95TXLYBPWJLEL8SVC";
	private final static String reqType = "/json";
	private final static String lang = "/kr";
	//private final static String statCd = "/200Y040";
	

	public static void main(String[] args) throws Exception {
		/* 통계코드 : 
		 * 200Y040 -> 가계의 목적별 최종소비지출(계절조정, 명목, 분기)
		 * 601Y003 -> 신용카드
		 * 601Y002 -> 지역별 소비유형별 개인 신용카드
		 * 631Y001 -> 인터넷뱅킹
		 * */
		URL url = null;
		URLConnection urlConnection = null;
		
		//String serviceName = "/StatisticItemList";
		String serviceName = "/StatisticSearch";
		String reqCntStart = "/1";
		String reqCntEnd = "/3000";
		String statCd = "/601Y002";
		String period = "/M"; // 주기(년:A, 반년:S, 분기:Q, 월:M, 반월:SM, 일: D)
		String startDt = "/202112"; // /200912 부터
		String endDt = "/202201";
		
		StringBuilder stringURL = new StringBuilder();
		stringURL.append(URL);
		stringURL.append(serviceName);
		stringURL.append(authKey);
		stringURL.append(reqType);
		stringURL.append(lang);
		stringURL.append(reqCntStart);
		stringURL.append(reqCntEnd);
		stringURL.append(statCd);
		
//		2차 데이터 조회시 아래 3줄 추가
		stringURL.append(period);
		stringURL.append(startDt);
		stringURL.append(endDt);
		
		System.out.println(stringURL);
		InputStream is = null;
		String json = "";
		try {
			url = new URL(stringURL.toString());
			urlConnection = url.openConnection();
			urlConnection.setDoOutput(true);
			is = urlConnection.getInputStream();
			byte[] buf = new byte[2048];
			int len = -1;
			StringBuffer sb = new StringBuffer();
			while ((len = is.read(buf, 0, buf.length)) != -1) {
				sb.append(new String(buf, 0, len));
			}
			
			json = sb.toString();
			
			// 가장 큰 JSONObject를 가져옵니다.
		    JSONObject jObject = new JSONObject(json);
		    
		 // 첫번째 JSONObject를 가져와서 key-value를 읽습니다.
		    JSONArray array = jObject.getJSONObject("StatisticSearch").getJSONArray("row");
		    int length = array.length();
		    String[] itemName1 = new String[length];
		    String[] itemName2 = new String[length];
		    String[] itemName3 = new String[length];
		    String[] timeYM = new String[length];
		    String[] unitName = new String[length];
		    String[] dataValue = new String[length];
		    String[] resArr = new String[length];
		    String[] category = {"합계", "백화점","대형마트/유통전문점","슈퍼마켓","편의점","의류/잡화","화장품","가구","가전제품/정보통신기기","의료/보건"
		    					,"종합병원","여행/교통","대중교통","스포츠/오락/여가","교육","음식점","금융/보험","기타"};
		    
		    JSONObject temp = new JSONObject();
		    for(int i = 0; i < length; i++) {
		    	temp = array.getJSONObject(i);
		    	itemName1[i] = temp.getString("ITEM_NAME1");
		    	itemName2[i] = temp.getString("ITEM_NAME2");
		    	itemName3[i] = temp.getString("ITEM_NAME3"); 

				if (itemName1[i].equals("경기") /* && itemName3[i].equals("월간 일평균") */) {
		    		for(int j = 0; j < category.length; j++) {
		    			if(itemName2[i].equals(category[j])) {
		    				timeYM[i] = temp.getString("TIME");
		    				unitName[i] = temp.getString("UNIT_NAME");
		    				dataValue[i] = temp.getString("DATA_VALUE"); 
		    				resArr[i] += 
				    				itemName1[i]
				    				+ " | " + itemName2[i]
				    				+ " | " + itemName3[i]
				    				+ " | " + timeYM[i]
				    				+ " | " + unitName[i]
				    				+ " | " + dataValue[i];
		    				System.out.println(resArr[i]);
		    				
		    			} else {
		    				continue;
		    			}
		    			
		    		}
		    		
		    		
		    	} else {
		    		continue;
		    	}
		    }

			//System.out.println(json);
		} catch (MalformedURLException e) {
			e.getMessage();
		} catch (IOException e) {
			e.getMessage();
		} finally {
			if (is != null) {
				is.close();
			}
		}
		
		

//		 Gson gson = new Gson();
//		 gson.fromJson(null, null)
	}
}
