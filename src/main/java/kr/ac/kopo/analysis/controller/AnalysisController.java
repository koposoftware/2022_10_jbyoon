package kr.ac.kopo.analysis.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.analysis.service.AnalysisService;
import kr.ac.kopo.util.CookieManager;

@Controller
public class AnalysisController {

	@Autowired
	private AnalysisService anaService;

	// 쿠키 id값 조회
	public String cookieForID() throws Exception {
		CookieManager cookie = new CookieManager();
		return cookie.findCookie("id");
	}

	@GetMapping("/analysis")
	public String moveToAnalysisPage() throws Exception {
		// test
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("key", anaService.selectWeekExpense(cookieForID()));
		System.out.println("결과 : " + map.get("key"));
		
		return "analysis/analysis";
	}

	// 오늘 배달 건수 및 오늘날짜 기준 일주일전 배달 건수
	@ResponseBody
	@PostMapping("/analysis/drawGraph")
	public Map<String, Object> drawGraph(String type) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		switch(type) {
		case "weekly" : // 주별 지출액  (오빠가 맨 처음 줬던 선 그리는 그래프 + x축에 아무것도 쓰지말기)
			map.put("weekly", anaService.selectWeekExpense(cookieForID()));
			break;
		case "monthly" : // 월별 총 지출액
			map.put("monthly", anaService.selectMonthExpense(cookieForID()));
			break;
		case "category" : // 소비 카테고리별 지출 & 비율
			map.put("category", anaService.selectCategoryRate(cookieForID()));
			break;
		case "compareCategory" : // 다른 사람들 그래프 (소비 카테고리별 평균 지출 & 비율)
			map.put("category", anaService.compareCategory());
			break;
		case "payTypeCnt" : // 결제 방법 별 결제 횟수(페이머니 충전 횟수 포함)
			map.put("category", anaService.selectPayTypeCnt(cookieForID()));
			break;
		case "quarterly" : // 분기당 월평균 지출 금액
			map.put("category", anaService.selectQuarterExpense(cookieForID()));
			break;
		default :
			break;
		}
		
		return map;
	}
}
