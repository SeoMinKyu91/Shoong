package com.kosmo.shoong.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Iterator;
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
import com.kosmo.shoong.service.course.CourseDTO;
import com.kosmo.shoong.service.course.CourseService;


@Controller
@RequestMapping("/course")
public class courseController {

	@Resource(name="courseService")
	private CourseService service;

	@RequestMapping("/main.do")
	public String courseMain(Model model,Map map) {
		map.put("user_ID","kim");
		CourseDTO record = service.selectOne(map);
		model.addAttribute("courseList",record);
		return "course/CourseList";
	}

	@RequestMapping("/navi.do")
	public String courseNavi() {
		return "course/Navi";
	}

	@RequestMapping(value = "",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String routeLoad(
			@RequestParam String fileName,HttpServletRequest req)
											throws IOException {
		String routePath = req.getServletContext().getRealPath("/upload")+fileName;
		File file = new File(fileName);

		BufferedReader br =
				new BufferedReader(
						new InputStreamReader(new FileInputStream(file)));
		String data;
		while((data=br.readLine())!=null) {
			data += data;
		}


		JSONObject obj = new JSONObject();


		return obj.toJSONString();
	}

	@RequestMapping(value = "/fileUpload", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String uploadCourse(MultipartHttpServletRequest mhsr) {
		String filePath = mhsr.getServletContext().getRealPath("/upload");
		System.out.println("courseupload:"+filePath);
		Iterator<String> itr = mhsr.getFileNames();

		String fileFullPath = null;
		String renameFilename = null;
		while (itr.hasNext()) { // 받은 파일들을 모두 돌린다.
			MultipartFile upload = mhsr.getFile(itr.next());
			renameFilename = FileUpDownUtils.getNewFileName(filePath, upload.getOriginalFilename());

			System.out.println("renameFilename" + renameFilename);

			fileFullPath = filePath + File.separator + renameFilename; // 파일 전체 경로
			File file = new File(fileFullPath);
			try {
				// 파일 저장
				upload.transferTo(file);
			} catch (Exception e) {
				System.out.println("postTempFile_ERROR======>" + fileFullPath);
				e.printStackTrace();
			}
		}
		JSONObject obj = new JSONObject();
		obj.put("fileName", obj);
		return obj.toJSONString();
	}

}
