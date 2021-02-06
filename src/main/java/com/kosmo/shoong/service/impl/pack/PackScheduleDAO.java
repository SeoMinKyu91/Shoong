package com.kosmo.shoong.service.impl.pack;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.service.pack.PackScheduleEventsDTO;
import com.kosmo.shoong.service.pack.PackScheduleService;

@Repository("scheduleDAO")
public class PackScheduleDAO implements PackScheduleService{

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<Map> scheduleSelectList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("scheduleSelectList",map);
	}

	@Override
	public int scheduleUpdate(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("scheduleUpdate",map);
	}

	@Override
	public int scheduleDelete(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("scheduleDelete",map);
	}

	@Override
	public int scheduleInsert(Map map) {

		return sqlMapper.insert("scheduleInsert",map);
	}////////

	@Override
	public boolean isWriter(Map map) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int scheduleJoin(Map map) {
		
		return sqlMapper.insert("packScheduleJoin",map);
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
		return sqlMapper.selectList("jsonForm",map);
	}

	public Map scheduleSeletOne(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("scheduleSelectOne",map);
	}

	public List<Map> ajaxScheduleList(Map map) {
		
		return sqlMapper.selectList("ajaxScheduleList",map);
		
	}

	public List<Map> scheduleJoinList(Map map) {

		return sqlMapper.selectList("scheduleJoinList",map);
	}

}///////////////
