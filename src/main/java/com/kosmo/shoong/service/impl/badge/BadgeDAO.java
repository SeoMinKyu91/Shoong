package com.kosmo.shoong.service.impl.badge;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.service.badge.BadgeDTO;
import com.kosmo.shoong.service.badge.BadgeService;

@Repository
public class BadgeDAO implements BadgeService{
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public int insertBadge(Map map) {
		List<BadgeDTO> badgeList = sqlMapper.selectList("whereIsMyBadge", map);
		if(badgeList.size()==0) return -1;
		map.put("badgeList", badgeList);
		Set keys = map.keySet();
		for(Object key:keys) System.out.println(key+":"+map.get(key));
		return sqlMapper.insert("insertMileageBadge", map);
	}

}
