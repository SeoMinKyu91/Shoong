package com.kosmo.shoong.admin.service;

import java.util.List;
import java.util.Map;

public interface ReportAdminService {

	int insert(Map map);
	
	List<ReportAdminDTO> selectList(Map map);
	ReportAdminDTO selectOne(Map map);
}
