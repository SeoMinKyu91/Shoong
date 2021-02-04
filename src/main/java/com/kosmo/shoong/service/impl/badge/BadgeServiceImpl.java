package com.kosmo.shoong.service.impl.badge;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.service.badge.BadgeService;

@Service("badgeService")
public class BadgeServiceImpl implements BadgeService{
	
	@Resource(name="badgeDAO")
	private BadgeDAO dao;
	
	@Override
	public int insertBadge(Map map) {
		return dao.insertBadge(map);
	}

}
