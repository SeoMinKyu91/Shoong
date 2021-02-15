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

import org.json.simple.JSONArray;
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

import com.google.gson.JsonObject;
import com.kosmo.shoong.common.FileUpDownUtils;
import com.kosmo.shoong.service.impl.member.MemberServiceImpl;
import com.kosmo.shoong.service.impl.pack.PackCommentServiceImpl;
import com.kosmo.shoong.service.pack.PackCommentDTO;
import com.kosmo.shoong.service.pack.PackCommentReplyDTO;
import com.kosmo.shoong.service.pack.PackGalleryService;

@Controller
@RequestMapping("/pack/")
public class PackCommentController {
	
	@Resource(name="packCommentService")
	private PackCommentServiceImpl service;
	
	@Resource(name = "memberService")
	private MemberServiceImpl memberService;
	
	@Resource(name="packGalleryService")
	private PackGalleryService galleryService;

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
		
		for(PackCommentDTO dto : commentList) {
			if(dto.getMemberProfileImg() == null) {
				dto.setMemberProfileImg("shoongBadge6.png");
			}
		}
		
		if(commentList != null) {
			model.addAttribute("commentList",commentList);
		}
		
		
		
		
		
		
		return "pack/PackComment";
	}///////////
	
	@RequestMapping("myComment.do")
	public String myComment(@RequestParam Map map,Model model, HttpServletRequest req) {
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
		map.put("packId", session.getAttribute("packId"));
		map.put("userId", session.getAttribute("userId"));
		
		PackCommentDTO commentView = service.packCommentView(map);
		if(commentView.getMemberProfileImg() == null) {
			commentView.setMemberProfileImg("shoongBadge6.png");
		}
		if(commentView.getPackCommentReply() !=null) {
			List<PackCommentReplyDTO> rpdto = commentView.getPackCommentReply();
			for(PackCommentReplyDTO r1 : rpdto) {
				System.out.println("댓글내용:"+r1.getPackCommentReplyContent());
				System.out.println("댓글단놈:"+r1.getPackCommentReplyWriter());
			}
		}
		model.addAttribute("packCommentView",commentView);
		return "pack/PackCommentView";
	}
	
	@RequestMapping(value= "comment/write.do", produces = "text/html; charset=UTF-8")
	public String commentWrite(@RequestParam Map map,Model model,HttpServletRequest req) {
		HttpSession session = req.getSession();
		map.put("packId",session.getAttribute("packId"));
		map.put("userId",session.getAttribute("userId"));
		
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
    	
		return "삭제된 파일이름은 : "+(String)map.get("filename");
	}
    
    @RequestMapping(value="comment/selectOne.do", produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String packCommentSelectOne(@RequestParam Map map) {
    	Map commentMap = service.packCommentSelectOne(map);
    	
    	JSONObject json = new JSONObject(commentMap);
    	
    	return json.toJSONString();
    }
    
    @RequestMapping("comment/update.do")
    public String packCommentUpdate(@RequestParam Map map, Model model,HttpSession session) {
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
    	service.packCommentDelte(map);
    	return "forward:/pack/myComment.do";
    }
    
    @RequestMapping(value="comment/reply/write",produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String packCommentReplyWrite(@RequestParam Map map, Model model,HttpSession session) {
    	map.put("userId", session.getAttribute("userId"));
    	service.packCommentReplyInsert(map);
    	Map replySelectOne  = service.packCommentReplySelectOne(map);
    	replySelectOne.put("PACK_COMMENT_REPLY_DATE", replySelectOne.get("PACK_COMMENT_REPLY_DATE").toString());
    	JSONObject json = new JSONObject(replySelectOne);
    	
    	return json.toJSONString();
    }
    
    @RequestMapping(value="comment/reply/delete",produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String packCommentReplyDelete(@RequestParam Map map) {
    	
    	service.packCommentReplyDelete(map);
    	String packCommentNo = (String) map.get("packCommentNo");
    	String packCommentReplyCount = service.packCommentReplyCount(map);
    	
    	JSONObject json = new JSONObject();
    	json.put("packCommentReplyCount", packCommentReplyCount);
    	json.put("packCommentNo",packCommentNo );
    	return json.toJSONString();
    }
    
    @RequestMapping(value="comment/like.do")
    @ResponseBody
    public String packCommentLike(@RequestParam Map map,HttpSession session) {
    	String userId = (String) session.getAttribute("userId");
    	map.put("userId", userId);
    	String isLike = service.packCommentLike(map);
    	String likeCount = service.packCommentLikeCount(map);
    	JSONObject json = new JSONObject();
    	json.put("result",isLike);
    	json.put("likeCount", likeCount);
    	
    	
    	return json.toJSONString();
    }
    
    @RequestMapping(value="comment/replyMore.do",produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String packCommentReplyMore(@RequestParam Map map) {
    	
    	JSONObject json = new JSONObject();
    	List<Map> replyMap = service.replyMore(map);
    	JSONArray jsonArray = new JSONArray();
    	jsonArray.add(replyMap);
    	
    	return jsonArray.toJSONString();
    }
    
}

