package kr.ac.kopo.account.controller;

import java.io.File;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class VisionController {
	
	/* license 이미지 파일로 신분 인증 */
	@RequestMapping(value = "/fileUpload", method = RequestMethod.GET)
    public String dragAndDrop(Model model) {
        
        return "fileUpload";
        
    }
	
	/* license 이미지 파일 로컬서버에 저장 & 썸네일을 위해 뷰한테 이미지 정보 넘겨줌 */
	@RequestMapping(value = "/fileUpload/post") //ajax에서 호출하는 부분
    @ResponseBody
	public String upload(MultipartHttpServletRequest multipartRequest, HttpServletRequest request) { //Multipart로 받는다.
		HttpSession session = request.getSession();
		String fileFullPath = "";
		
		Iterator<String> itr =  multipartRequest.getFileNames();
		
	    String root_path = request.getSession().getServletContext().getRealPath("/");
	    String attach_path = "/upload/";
	      
	    // 위 경로의 폴더가 없으면 폴더 생성
	    File file = new File(root_path + attach_path);
	    if(file.exists() == false) {
	    	file.mkdir();
	    }
        
        String filePath = "C:/dev"; // 설정 파일로 뺀다.
        System.out.println(multipartRequest.getServletContext().getRealPath("/"));
        // System.out.println(request.getServletContext().getRealPath("/"));
        
        while (itr.hasNext()) { // 받은 파일들을 모두 돌린다.
            
            /* 기존 주석처리
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            String originFileName = mpf.getOriginalFilename();
            System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
            */
            
        	MultipartFile mpf = multipartRequest.getFile(itr.next());
             
            String originalFilename = mpf.getOriginalFilename(); //파일명
      
            fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로
            
            // fileFullPath = filePath + "\\" + originalFilename; //파일 전체 경로
            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                
                //memberService.saveFile(); // file 저장할거 VO에 만들기
                //Service, DAO로 넘겨서 처리할 OCR 작업 여기서 하기
                
                System.out.println("originalFilename => " + originalFilename);
                System.out.println("fileFullPath => " + fileFullPath);
                
                
                //model.addAttribute("fileFullPath" , fileFullPath); // 화면에 띄울 이미지의 경로를 전달
                session.setAttribute("fileFullPath" , fileFullPath);
                
            } catch (Exception e) {
                System.out.println("postTempFile_ERROR ======> " + fileFullPath);
                e.printStackTrace();
            }
            
        }
        //String textFromImage = visionService.extractText(fileFullPath);
        //System.out.println("controller / " + textFromImage);
        
        return fileFullPath;
	}

	

	/*
	public static void main(String[] args) {
		String result = "";
		try {
			result = extractText("C:\\dev\\KakaoTalk_20220826_154643577.jpg");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(result);
	}
	*/
}
