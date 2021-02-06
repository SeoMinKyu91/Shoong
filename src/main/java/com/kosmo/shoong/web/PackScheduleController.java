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

import com.google.gson.JsonArray;
import com.kosmo.shoong.service.impl.pack.PackScheduleServiceImpl;
import com.kosmo.shoong.service.pack.PackScheduleEventsDTO;


@Controller
@RequestMapping("/pack/")
public class PackScheduleController {
	@Resource(name="scheduleServiceImpl")
	private PackScheduleServiceImpl service;

	@RequestMapping("calendar.do")
	public String packCalendar(@RequestParam Map map, Model model,HttpServletRequest req) {
		HttpSession session = req.getSession();

		if(session.getAttribute("userId") != null && session.getAttribute("packId") !=null) {
			map.put("userId", session.getAttribute("userId").toString());
			map.put("packId",session.getAttribute("packId").toString());

			Set keys = map.keySet();
			for(Object key:keys) System.out.println(key+":"+map.get(key));
		}

		List<PackScheduleEventsDTO> jsonForm = service.jsonForm(map);

		List<Map> jsonList = new Vector<Map>();
		for(PackScheduleEventsDTO item : jsonForm) {
			Map jsonMap = new HashMap();
			if(item!=null) {
				jsonMap.put("title", item.getPackScheduleTitle().toString());
				if(item.getPackScheduleStart()!=null) {
					jsonMap.put("start", item.getPackScheduleStart().substring(0,10));
				}
				if(item.getPackScheduleEnd() != null) {
					jsonMap.put("end", item.getPackScheduleEnd().substring(0,10));
				}
				
				jsonMap.put("id", item.getPackId());
			}
			jsonList.add(jsonMap);
		}

		model.addAttribute("calendarJson",JSONArray.toJSONString(jsonList));

		return "pack/PackSchedule";
	}/////////

	@RequestMapping("schedule/insert.do")
	public String scheduleInsert(@RequestParam Map map,Model model,HttpServletRequest req) {
		HttpSession session = req.getSession();
		map.put("userId",session.getAttribute("userId"));
		map.put("packId",session.getAttribute("packId"));

		service.scheduleInsert(map);

		return "forward:/pack/calendar.do";
	}

	@RequestMapping(value="calendar/ajax.do",produces="text/html; charset=UTF-8")
	@ResponseBody
	public String calendarAjax(@RequestParam Map map) {
		JSONObject json = new JSONObject();
		json.put("dbData", service.scheduleSelectList(map));

		return json.toJSONString();
	}

	@RequestMapping(value="schedule/selectOne.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String scheduleSelectOne(@RequestParam Map map,HttpServletRequest req) {
		String userId =  req.getSession().getAttribute("userId").toString();
		
		Map selectOne = new HashMap();
		selectOne = service.scheduleSelectOne(map);
		Map selectJoinList = new HashMap();
		selectJoinList.put("packScheduleNo", selectOne.get("PACK_SCHEDULE_NO"));
		List<Map> scheduleJoiner = service.scheduleJoinList(selectJoinList);

		JSONObject json = new JSONObject();
		
		json.put("title", selectOne.get("PACK_SCHEDULE_TITLE"));
		json.put("content", selectOne.get("PACK_SCHEDULE_CONTENT"));
		json.put("start", selectOne.get("PACK_SCHEDULE_START").toString().substring(0,10));
		json.put("end", selectOne.get("PACK_SCHEDULE_END").toString().substring(0,10));
		json.put("packScheduleNo", selectOne.get("PACK_SCHEDULE_NO"));
		json.put("userId", selectOne.get("USER_ID"));
		json.put("packId", selectOne.get("PACK_ID"));
		if(userId.toLowerCase().equals(selectOne.get("USER_ID").toString().toLowerCase())){
			json.put("isWriter", "yes");
		}
		else {
			json.put("isWriter", "no;");
		}
		json.put("scheduleJoiner",scheduleJoiner);


		return json.toJSONString();
	}

	@RequestMapping("schedule/update.do")
	public String scheduleUpdate(@RequestParam Map map,Model model,HttpServletRequest req) {

		service.scheduleUpdate(map);

		return "forward:/pack/calendar.do";

	}//////////////

	@RequestMapping("schedule/delete.do")
	public String scheduleDelete(@RequestParam Map map, Model model) {

		service.scheduleDelete(map);

		return "forward:/pack/calendar.do";
	}
	
	@RequestMapping(value="schedule/join.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String packScheduleJoin(@RequestParam Map map) {
		
		
		return (int)service.scheduleJoin(map) == 1?"참가 성공":"참가 실패";
	}



}//////////////class
