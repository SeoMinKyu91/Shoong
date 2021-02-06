package com.kosmo.shoong.service.impl.pack;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.service.pack.PackScheduleEventsDTO;
import com.kosmo.shoong.service.pack.PackScheduleService;

@Service("scheduleServiceImpl")
public class PackScheduleServiceImpl implements PackScheduleService{

	@Resource(name="scheduleDAO")
	private PackScheduleDAO dao;


	@Override
	public List<Map> scheduleSelectList(Map map) {
		// TODO Auto-generated method stub
		return dao.scheduleSelectList(map);
	}

	@Override
	public int scheduleUpdate(Map map) {
		// TODO Auto-generated method stub
		return dao.scheduleUpdate(map);
	}

	@Override
	public int scheduleDelete(Map map) {
		// TODO Auto-generated method stub
		return dao.scheduleDelete(map);
	}

	@Override
	public int scheduleInsert(Map map) {

		return dao.scheduleInsert(map);
	}////////

	@Override
	public boolean isWriter(Map map) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int scheduleJoin(Map map) {
		return dao.scheduleJoin(map);
	}

	@Override
	public int scheduleJoinCancle(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int scheduleJoinOk(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int scheduleJoinNo(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<PackScheduleEventsDTO> jsonForm(Map map) {
		Set keys = map.keySet();
		for(Object key:keys) System.out.println(key+":"+map.get(key));
		// TODO Auto-generated method stub
		return dao.jsonForm(map);
	}

	public Map scheduleSelectOne(Map map) {
		// TODO Auto-generated method stub
		return dao.scheduleSeletOne(map);
	}

	public List<Map> ajaxScheduleList(Map map) {
		
		return dao.ajaxScheduleList(map);
	}

	public List<Map> scheduleJoinList(Map map) {
 
		return dao.scheduleJoinList(map);
	}

	

}/////////////////class
