package com.kosmo.shoong.admin.impl.report;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.admin.service.ReportAdminService;

@Repository("reportAdminDAO")
public class ReportAdminDAO implements ReportAdminService{
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
}
