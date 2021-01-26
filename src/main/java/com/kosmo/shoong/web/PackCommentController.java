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
	
	@RequestMapping("myComment.do")
	public String myComment(@RequestParam Map map,Model model, HttpServletRequest req) {
		System.out.println("Mycomment.do");
		
		String userId = "";
		String packId = "";
		
		HttpSession session = req.getSession();
		if(session.getAttribute("userId") != null && session.getAttribute("packId") != null) {
			userId = (String) session.getAttribute("userId");
			packId = (String) session.getAttribute("packId");
		}
		map.put("userId", userId);
		map.put("packId", packId);
		
		
		
		List<PackCommentDTO> myCommentList = service.myCommentList(map);
		model.addAttribute("commentList",myCommentList);
		
		return "pack/PackMyComment";
	}/////////
	
	@RequestMapping("comment/view.do")
	public String packCommentView(@RequestParam Map map, Model model,HttpSession session) {		
		System.out.println("commentView페이지 commentNo:"+map.get("packCommentNo"));
		
		map.put("packId", session.getAttribute("packId"));
		map.put("userId", session.getAttribute("userId"));
		
		
		
		PackCommentDTO dto = service.packCommentView(map);
		System.out.println("view페이지 글내용"+dto.getPackCommentContent());
		System.out.println("view페이지 글쓴놈"+dto.getPackCommentWriter());
		System.out.println("view페이지 좋아요 수:"+dto.getPackCommentLikeCount());
		System.out.println("view페이지 댓글 수:"+dto.getPackCommentReplyCount());
		
		if(dto.getPackCommentReply() !=null) {
			List<PackCommentReplyDTO> rpdto = dto.getPackCommentReply();
			for(PackCommentReplyDTO r1 : rpdto) {
				System.out.println("댓글내용:"+r1.getPackCommentReplyContent());
				System.out.println("댓글단놈:"+r1.getPackCommentReplyWriter());
			}
		}
		
		model.addAttribute("packCommentView",dto);
		
		
		return "pack/PackCommentView";
	}
	
	
	
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
    public String upload(MultipartHttpServletRequest multipartRequest ,@RequestParam Map map)  throws IllegalStateException, IOException { //Multipart로 받는다.
        System.out.println("verify:"+map.get("verify"));
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
		obj.put("verify", map.get("verify"));
				
        
        return obj.toJSONString();
    }
    
    @RequestMapping(value="comment/filedelete/post",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String delete(@RequestParam Map map) {
    	//여기서 서버에서 삭제하는 로직 짜야함. 아직 안짬.
    	
    	
    	System.out.println((String)map.get("filename"));
		return "삭제된 파일이름은 : "+(String)map.get("filename");
	}
    
    @RequestMapping(value="comment/selectOne.do", produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String packCommentSelectOne(@RequestParam Map map) {
    	System.out.println("selectOne.do");
    	System.out.println(map.get("packCommentNo"));
    	
    	Map commentMap = service.packCommentSelectOne(map);
    	
    	
    	System.out.println(commentMap.get("PACK_COMMENT_CONTENT"));
    	JSONObject json = new JSONObject(commentMap);
    	
    	
    	
    	return json.toJSONString();
    }
    
    @RequestMapping("comment/update.do")
    public String packCommentUpdate(@RequestParam Map map, Model model,HttpSession session) {
    	System.out.println("packCommentUpdate.do");
    	System.out.println(map.get("packCommentUpdate"));
    	System.out.println(map.get("packCommentNo"));
    	System.out.println(map.get("packCommentContent"));
    	
    	service.packCommentUpdate(map);
    	service.packCommentImgDelete(map);
    	//이미지 등록
		String[] imgArray = map.get("imgArray").toString().split(",");
		for(String imgName : imgArray) {
			System.out.println("이미지 이름:"+imgName);
			Map imgMap = new HashMap();
			imgMap.put("packCommentImgName", imgName);
			imgMap.put("packCommentNo",map.get("packCommentNo"));
			service.packCommentImgUpdate(imgMap);
			
		}
    	
    	
    	
    	model.addAttribute("packCommentNo",map.get("packCommentNo"));
    	
    	return "forward:/pack/comment/view.do";
    }
    
    @RequestMapping("comment/delete.do")
    public String packCommentDelete(@RequestParam Map map, Model model) {
    	System.out.println("피드 삭제 들어옴");
    	System.out.println(map.get("packCommentNo"));
    	service.packCommentDelte(map);
    	
    	
    	return "forward:/pack/myComment.do";
    }
    
    @RequestMapping("comment/reply/write")
    public String packCommentReplyWrite(@RequestParam Map map, Model model) {
    	System.out.println("댓글등록 controller들어옴");
    	System.out.println("글번호:"+map.get("packCommentNo"));
    	System.out.println("댓글 내용:"+map.get("replyContent"));
    	
    	
    	return "시부레";
    }
    
    
}








