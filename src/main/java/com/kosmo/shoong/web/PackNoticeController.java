package com.kosmo.shoong.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.shoong.service.impl.pack.PackNoticeServiceImpl;
import com.kosmo.shoong.service.pack.PackNoticeDTO;
import com.kosmo.shoong.service.pack.PagingUtil;

@Controller
@RequestMapping("/pack/")
public class PackNoticeController {
	
	@Resource(name="packNoticeService")
	private PackNoticeServiceImpl service;
	
	@Value("${PAGE_SIZE}")
	private int pageSize;
	@Value("${BLOCK_PAGE}")
	private int blockPage;
	
	
	//팩 공지사항
	@RequestMapping("notice/list.do")
	public String notice(@RequestParam Map map,Model model,
						@RequestParam(required = false,defaultValue = "1") int nowPage,
						HttpServletRequest req)
						throws ParseException {

		
		//유저 아이디 설정 , 나중에 세션에 있는 유저 아이디 가져오기
		map.put("loginId", req.getSession().getAttribute("userId").toString());
		
		//팩아이디 설정 , 나중에 세션에 있는 팩 아이디 가져오기
		map.put("packId", req.getSession().getAttribute("packId").toString());
		//map.put("packID", "2");
		
		boolean isManager = service.isManager(map);
		if(isManager) {
			model.addAttribute("manager","manager");
		}
		
		
		//서비스 호출]
		//페이징을 위한 로직 시작]
		//전체 레코드수	
		int totalRecordCount = service.getTotalRecord(map);	
		
		
		//전체 페이지수
		int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize);
		
		//시작 및 끝 ROWNUM구하기
		int start =(nowPage-1) * pageSize+1;
		int end = nowPage * pageSize;		
		//페이징을 위한 로직 끝]
		map.put("start",start);
		map.put("end",end);
		List<PackNoticeDTO> list = service.selectList(map);

		//데이타 저장]
		String path=req.getContextPath();
		if(map.get("searchWord") !=null) {
			path+="/pack/notice/list.do?searchWord="+map.get("searchWord")+"&searchColumn="+map.get("searchColumn")+"&";
		}
		else {
			path+="/pack/notice/list.do?";
		}
		
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,path);
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		
		return "pack/PackNoticeList";
	}///////////////
	
	
	
	@RequestMapping("notice/write.do")
	public String noticeWrite(@RequestParam Map map, Model model,HttpServletRequest req) {
		map.put("userId", req.getSession().getAttribute("userId").toString());
		map.put("packId",req.getSession().getAttribute("packId").toString());
		
		//map.put("userID","park");
		//map.put("packID","2");
		
		
		
		service.insert(map);
		
		return "forward:/pack/notice/list.do";
	}/////////
	
	
	
	@RequestMapping("notice/Edit.do")
	public String noticeEdit(@RequestParam Map map, Model model) {
		
		service.update(map);
		
		model.addAttribute("packNoticeNo",map.get("packNoticeNo"));
		model.addAttribute("nowPage",map.get("nowPage"));
		
		return "forward:/pack/notice/list.do";
	}/////////////////
	
	
	@RequestMapping("notice/delete.do")
	public String noticeDelete(@RequestParam Map map,Model model) {
		
		
		service.delete(map);
		
		
		return "forward:/pack/notice/list.do";
	}///////////////////////

}////////////class
