package com.kosmo.shoong.admin.impl.ranking;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kosmo.shoong.admin.service.RankingAdminService;

@Repository("rankingAdminDAO")
public class RankingAdminDAO implements RankingAdminService{
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
}
