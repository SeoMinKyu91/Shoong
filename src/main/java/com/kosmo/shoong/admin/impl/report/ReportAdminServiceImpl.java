package com.kosmo.shoong.admin.impl.report;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.admin.service.ReportAdminService;

@Service("reportAdminService")
public class ReportAdminServiceImpl implements ReportAdminService {

	@Resource(name="reportAdminDAO")
	private ReportAdminDAO dao;
}
