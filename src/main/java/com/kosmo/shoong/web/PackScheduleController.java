package com.kosmo.shoong.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.shoong.service.impl.pack.PackScheduleServiceImpl;
import com.kosmo.shoong.service.pack.PackScheduleEventsDTO;


@Controller
@RequestMapping("/pack/")
public class PackScheduleController {
	@Resource(name="scheduleServiceImpl")
	private PackScheduleServiceImpl service;

	@RequestMapping("calendar.do")
	public String packCalendar(@RequestParam Map map, Model model,HttpServletRequest req) {
		System.out.println("calendar.do 잘들어옴");
		HttpSession session = req.getSession();

		if(session.getAttribute("userId") != null && session.getAttribute("packId") !=null) {
			System.out.println("아이디,팩pk있음");
			map.put("userId", session.getAttribute("userId").toString());
			map.put("packId",session.getAttribute("packId").toString());

			Set keys = map.keySet();
			for(Object key:keys) System.out.println(key+":"+map.get(key));
		}

		//List<Map> list = service.scheduleSelectList(map);
		List<PackScheduleEventsDTO> jsonForm = service.jsonForm(map);
		System.out.println("디비에서 가져온값:"+jsonForm.size());

		List<Map> jsonList = new Vector<Map>();
		for(PackScheduleEventsDTO item : jsonForm) {
			Map jsonMap = new HashMap();
//			System.out.println("start:"+item.getPackScheduleStart());
//			System.out.println("end:"+item.getPackScheduleEnd());
			if(item!=null) {
				jsonMap.put("title", item.getPackScheduleTitle().toString());
				jsonMap.put("start", item.getPackScheduleStart().toString());
				jsonMap.put("end", item.getPackScheduleEnd().toString());
				jsonMap.put("id", item.getPackId());
			}
			jsonList.add(jsonMap);
		}

		for(Map items : jsonList) {
			System.out.println("어레이 start:"+items.get("start"));
			System.out.println("어레이 end:"+items.get("end"));
		}

		model.addAttribute("calendarJson",JSONArray.toJSONString(jsonList));

		return "pack/PackSchedule";
	}/////////

	@RequestMapping("schedule/insert.do")
	public String scheduleInsert(@RequestParam Map map,Model model,HttpServletRequest req) {
		HttpSession session = req.getSession();
		map.put("userId",session.getAttribute("userId"));
		map.put("packId",session.getAttribute("packId"));

		System.out.println(map.get("packScheduleTitle"));
		System.out.println(map.get("packScheduleStart"));
		System.out.println(map.get("packScheduleEnd"));
		System.out.println(map.get("packScheduleContent"));

		service.scheduleInsert(map);

		return "forward:/pack/calendar.do";
	}

	@RequestMapping(value="calendar/ajax.do",produces="text/html; charset=UTF-8")
	@ResponseBody
	public String calendarAjax(@RequestParam Map map) {


		System.out.println("에이작스 요청 들어옴");
		JSONObject json = new JSONObject();

		json.put("dbData", service.scheduleSelectList(map));

		System.out.println(json);
		return json.toJSONString();
	}

	@RequestMapping(value="schedule/selectOne.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String scheduleSelectOne(@RequestParam Map map,HttpServletRequest req) {
		System.out.println("컨트롤러 들어올때"+map.get("packScheduleNo"));
		String userId =  req.getSession().getAttribute("userId").toString();
		Map selectOne = new HashMap();
		selectOne = service.scheduleSelectOne(map);


		System.out.println("컨트롤러 나갈때"+selectOne.get("PACK_SCHEDULE_NO"));

		JSONObject json = new JSONObject();

		json.put("title", selectOne.get("PACK_SCHEDULE_TITLE"));
		json.put("content", selectOne.get("PACK_SCHEDULE_CONTENT"));
		json.put("start", selectOne.get("PACK_SCHEDULE_START").toString());
		json.put("end", selectOne.get("PACK_SCHEDULE_END").toString());
		json.put("packScheduleNo", selectOne.get("PACK_SCHEDULE_NO"));
		json.put("userId", selectOne.get("USER_ID"));
		json.put("packId", selectOne.get("PACK_ID"));
		if(userId.toLowerCase().equals(selectOne.get("USER_ID").toString().toLowerCase())){
			json.put("isWriter", "yes");
		}
		else {
			json.put("isWriter", "no;");
		}


		return json.toJSONString();
	}

	@RequestMapping("schedule/update.do")
	public String scheduleUpdate(@RequestParam Map map,Model model,HttpServletRequest req) {


		System.out.println("팩 수정 No:"+map.get("packScheduleNo"));

		service.scheduleUpdate(map);

		return "forward:/pack/calendar.do";

	}//////////////

	@RequestMapping("schedule/delete.do")
	public String scheduleDelete(@RequestParam Map map, Model model) {

		service.scheduleDelete(map);

		return "forward:/pack/calendar.do";
	}





}//////////////class
