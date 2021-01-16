package com.kosmo.shoong.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.shoong.common.FileUpDownUtils;
import com.kosmo.shoong.service.pack.PackGalleryDTO;
import com.kosmo.shoong.service.pack.PackGalleryService;


@Controller
@RequestMapping("/pack/")
public class PackGalleryController {

	@Resource(name="packGalleryService")
	private PackGalleryService service;
	
	//팩 메인 페이지로  이동get
	@RequestMapping("gallery.do")
	public String packGallery(@RequestParam Map map ,Model model) {
		
		List<PackGalleryDTO> packGalleryList=service.selectList(map);
		model.addAttribute("packGalleryList",packGalleryList);

		return "pack/PackGallery";
	}
	
	@RequestMapping("pictureInput.do")
	public String packGalleryinput(@RequestParam Map map) {
		System.out.println("a"+map.get("imgArry").toString());
		String[] imgArray = map.get("imgArry").toString().split(",");
		for(String imgName : imgArray) {
			Map imgMap = new HashMap();
			imgMap.put("pictureName", imgName);
			//팩 joinId 세션에서 가져 와야 한다.#{}
			imgMap.put("joinId", 2);
			service.insert(imgMap);
			
		}
		return "forward:/pack/gallery.do";
	}
	
	
	/*파일 업로드 관련*/
	/*선생님 로직을 참고 했더니 변수명, 요청값 명에 일관성이 없네요 다음에 수정할께요 ㅠ*/
	
	@RequestMapping("fileDownload.do")
	public String fileDownload(Model model,HttpServletRequest req){
			/*컨트롤러 메소드에서는 다운로드할 파일을 
			모델에 저장만 하면됨]
			File객체를 생성해서 모델계열에 저장만 하면
			컨트롤러의 역할은 끝남.
			즉 Model이나 Map이나 ModelMap으로만.*/
			//1]파일 객체 생성
			String path = req.getServletContext().getRealPath("/upload");
			String filename = req.getParameter("filename");
			File file = new File(path+File.separator+filename);
			//2]모델에 파일객체 저장-다운로드 처리용 View객체의 메소드의 
			//  매개변수인 Map으로 전달됨
			model.addAttribute("file", file);
			//3]반환값은 빈 설정파일에 등록한 다운로드 처리용 View객체
			//  의 id속성에 지정한 값.	
	
		return "downloadView";
	}
	
	@RequestMapping("fileDelete.do")
	public String fileDelete(@RequestParam Map map,Model model){
			service.delete(map);
	   return "forward:/pack/gallery.do";
	}

	
	
	@RequestMapping(value = "/fileUpload/post",produces = "text/html; charset=UTF-8") //ajax에서 호출하는 부분
    @ResponseBody
    public String upload(MultipartHttpServletRequest multipartRequest)  throws IllegalStateException, IOException { //Multipart로 받는다.
      
        
       //1]서버의 물리적 경로 얻기		
	   String filePath=multipartRequest.getServletContext().getRealPath("/upload");
       Iterator<String> itr =  multipartRequest.getFileNames();
        
       String fileFullPath=null;
       String renameFilename=null;
        
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
            
          
        	MultipartFile upload= multipartRequest.getFile(itr.next());
        	
        	       	
            renameFilename = FileUpDownUtils.getNewFileName(filePath, upload.getOriginalFilename());
    		
    		 System.out.println("renameFilename"+renameFilename);

            fileFullPath = filePath+File.separator+renameFilename; //파일 전체 경로
            File file = new File(fileFullPath);
            try {
                //파일 저장
            	upload.transferTo(file); 

            } catch (Exception e) {
                System.out.println("postTempFile_ERROR======>"+fileFullPath);
                e.printStackTrace();
            }
                         
       }
        JSONObject obj = new JSONObject();
		
      
		obj.put("fileName", renameFilename);
				
        
        return obj.toJSONString();
    }
    
    @RequestMapping(value="/filedelete/post",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String delete(@RequestParam Map map) {
    	//여기서 서버에서 삭제하는 로직 짜야함. 아직 안짬.
    	
    	
    	System.out.println((String)map.get("filename"));
		return "삭제된 파일이름은 : "+(String)map.get("filename");
	}
}
