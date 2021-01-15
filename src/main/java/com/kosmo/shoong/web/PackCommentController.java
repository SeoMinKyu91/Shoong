package com.kosmo.shoong.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.shoong.common.FileUpDownUtils;
import com.kosmo.shoong.service.impl.pack.PackCommentServiceImpl;
import com.kosmo.shoong.service.pack.PackCommentDTO;
import com.kosmo.shoong.service.pack.PackCommentReplyDTO;

@Controller
@RequestMapping("/pack/")
public class PackCommentController {
	
	@Resource(name="packCommentService")
	private PackCommentServiceImpl service;
	
	@RequestMapping(value="comment.do")
	public String packComment(@RequestParam Map map, HttpServletRequest req, Model model) {
		System.out.println("comment.do");
		
		String userId = "";
		String packId = "";
		
		HttpSession session = req.getSession();
		if(session.getAttribute("userId") != null && session.getAttribute("packId") != null) {
			userId = (String) session.getAttribute("userId");
			packId = (String) session.getAttribute("packId");
		}
		
		map.put("userId", userId);
		map.put("packId", packId);
		
		List<PackCommentDTO> commentList = service.packCommentMainSelectList(map);
		
		if(commentList != null) {
			model.addAttribute("commentList",commentList);
		}
		
		
		System.out.println("==================디비 들어갔다 나온 후 값 확인=======================");
		for(PackCommentDTO dto : commentList) {
			System.out.println(dto.getPackCommentContent());
			System.out.println(dto.getPackCommentLikeCount());
			System.out.println(dto.getPackCommentNo());
			System.out.println(dto.getPackCommentReplyCount());
			System.out.println(dto.getPackCommentWriter());
			List<PackCommentReplyDTO> rps = dto.getPackCommentReply();
			for(PackCommentReplyDTO rp : rps) {
				System.out.println("****************댓글 들**************");
				System.out.println("댓글 단 놈:" + rp.getPackCommentReplyWriter());
				System.out.println("댓글 :" + rp.getPackCommentReplyContent());
			}
			List<String> images = dto.getPackCommentImages();
			for(String image: images) {
				System.out.println("!!!!!!!!!사진 이름!!!!!!!");
				System.out.println(image);
			}
			
		}
		
		
		
		return "pack/PackComment";
	}///////////
	
	@RequestMapping(value= "comment/write.do", produces = "text/html; charset=UTF-8")
	public String commentWrite(@RequestParam Map map,Model model,HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		map.put("packId",session.getAttribute("packId"));
		map.put("userId",session.getAttribute("userId"));
		
		
		System.out.println(map.get("imgArray"));
		System.out.println(map.get("packCommentContent"));
		
		int result = service.packCommentWrite(map);
		
		//이미지 등록
		String[] imgArray = map.get("imgArray").toString().split(",");
		for(String imgName : imgArray) {
			Map imgMap = new HashMap();
			imgMap.put("packCommentImgName", imgName);
			imgMap.put("userId",session.getAttribute("userId"));
			service.packCommentImgWrite(imgMap);
			
		}
		System.out.println(result==1? "성공":"실패");
		
		return "forward:/pack/comment.do";
	}///////////////
	
	
	
	
	@RequestMapping(value = "comment/fileUpload/post",produces = "text/html; charset=UTF-8") //ajax에서 호출하는 부분
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
    
    @RequestMapping(value="comment/filedelete/post",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String delete(@RequestParam Map map) {
    	//여기서 서버에서 삭제하는 로직 짜야함. 아직 안짬.
    	
    	
    	System.out.println((String)map.get("filename"));
		return "삭제된 파일이름은 : "+(String)map.get("filename");
	}
}
