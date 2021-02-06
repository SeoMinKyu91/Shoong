package com.kosmo.shoong.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.util.Arrays;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kosmo.shoong.common.FileUpDownUtils;
import com.kosmo.shoong.service.course.CourseDTO;
import com.kosmo.shoong.service.course.CourseService;
import com.kosmo.shoong.service.impl.course.CourseServiceImpl;
import com.kosmo.shoong.service.impl.record.RecordServiceImpl;
import com.kosmo.shoong.service.record.RecordDTO;


@Controller
@RequestMapping("/course")
@SessionAttributes({"userId","packId"})
public class CourseController {

	@Resource(name="courseService")
	private CourseServiceImpl cService;
	
	@Resource(name="recordService")
	public RecordServiceImpl rService;

	@RequestMapping("/main.do")
	public String courseMain(Model model,Map map) {
		//CourseDTO record = cService.selectOne(map);
		//model.addAttribute("courseList",record);
		return "course/CourseList";
	}
	
	/*
	 * record_,course 다보여줌
	 */
	@RequestMapping("/navi.do")
	public String courseNavi(
			@ModelAttribute(value="userId") String userId,Model model) {
		System.out.println("courseNavi:"+userId);
		List<RecordDTO> rList = rService.selectListById(userId);
		
		for(RecordDTO r:rList) {
			System.out.println(r.getRecordDate());
		}
		model.addAttribute("recordList",rList);
		List<CourseDTO> cList = cService.selectList();
		for(CourseDTO c:cList) {
			System.out.println(c.getCourseName());
		}
		model.addAttribute("courseList",cList);
		
		return "course/CourseRecord";
	}

	@PostMapping(value = "/routeLoad",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String routeLoad(
			@RequestParam String fileName,HttpServletRequest req)
											throws IOException {
	
		String filePath = req.getServletContext().getRealPath("/upload")+File.separator+fileName;
		System.out.println("routePath:"+filePath);
		BufferedReader br =
				new BufferedReader(
						new InputStreamReader(
								new FileInputStream(new File(filePath))));
		StringBuffer sb = new StringBuffer();

		int data = -1;
		char[] chars = new char[1024];

		while((data=br.read(chars))!=-1) {
			sb.append(chars,0,data);
		}
		if(br!=null) br.close();
		return sb.toString();
		
	}
	
	//웹 json file 업로드
	@PostMapping(value = "/fileUpload", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String uploadCourse(MultipartHttpServletRequest mhsr) {
		System.out.println("uploadCourse");
		String filePath = mhsr.getServletContext().getRealPath("/upload");
		System.out.println("courseupload:"+filePath);
		Iterator<String> itr = mhsr.getFileNames();

		String fileFullPath = null;
		String renameFilename = null;
		while (itr.hasNext()) { // 받은 파일들을 모두 돌린다.
			//mhsr.getParameterMap().get("routeFile");
			
			MultipartFile upload = mhsr.getFile(itr.next());
			renameFilename = FileUpDownUtils.getNewFileName(filePath, upload.getOriginalFilename());

			System.out.println("renameFilename" + renameFilename);

			fileFullPath = filePath + File.separator + renameFilename; // 파일 전체 경로
			File file = new File(fileFullPath);
			System.out.println("파일이름:"+file.getName());
			try {
				// 파일 저장
				upload.transferTo(file);
			} catch (Exception e) {
				System.out.println("postTempFile_ERROR======>" + fileFullPath);
				e.printStackTrace();
			}
		}
		JSONObject obj = new JSONObject();
		obj.put("fileName", renameFilename);
		return obj.toJSONString();
	}
	
	//코스 등록용
	@RequestMapping(value="/insert.do")
	public String insertCourse(
			@RequestParam Map map,@ModelAttribute(value="userId") String userId) {
		map.put("userId", userId);
		Set<String> keys = map.keySet();
		for(String key:keys) System.out.println(key+":"+map.get(key).toString());
		String courseLength = map.get("courseLength").toString();
		//courseLength = courseLength.substring(0, courseLength.length()-2);
		//System.out.println(Double.valueOf(courseLength.substring(0, courseLength.length()-2)));
		boolean flag = cService.insert(map);
		System.out.println(flag?"코스 입력 성공":"코스 입력 실패");
		return "forward:/mypage/main.do";
	}
	
	@GetMapping(value="/viewcourse",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String viewCourse(
			@RequestParam String courseId,@ModelAttribute(value="userId") String userId) {
		Gson gson = new GsonBuilder().create();
		return gson.toJson(cService.selectOneByCId(courseId));
	}
	
	@RequestMapping("/mainTest.do")
	public String courseMainTest(Map map) {
		map.put("user_ID","kim");
		
		return "/course/CourseMainTest";
	}

}
