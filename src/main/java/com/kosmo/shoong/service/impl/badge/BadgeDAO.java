package com.kosmo.shoong.service.impl.badge;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.service.badge.BadgeService;

@Repository
public class BadgeDAO implements BadgeService{
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public int insertBadge(Map map) {
		List<Integer> rList = sqlMapper.selectList("whereIsMyBadge", map);
		
		//for(int result:rList) System.out.println(result);
		//map.put("badgeIdList", rList);
		map.put("badgeId", rList.get(0)-1);
		Set keys = map.keySet();
		for(Object key:keys) System.out.println(key+":"+map.get(key));
		return sqlMapper.insert("insertMileageBadge", map);
	}

}
