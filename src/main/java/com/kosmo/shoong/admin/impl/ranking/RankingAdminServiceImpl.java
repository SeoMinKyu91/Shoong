package com.kosmo.shoong.admin.impl.ranking;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.kosmo.shoong.admin.service.RankingAdminService;

@Service("rankingAdminService")
public class RankingAdminServiceImpl implements RankingAdminService {
	
	@Resource(name="rankingAdminDAO")
	private RankingAdminDAO dao;
	
}
