package kr.ac.kopo.util;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HanaBankUtil {

	@GetMapping("/faq")
	public String faqView() {
		return "include/faq";
	}
}
