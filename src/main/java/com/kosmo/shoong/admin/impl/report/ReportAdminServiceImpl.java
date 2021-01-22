package com.kosmo.shoong.admin.impl.report;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.admin.service.ReportAdminDTO;
import com.kosmo.shoong.admin.service.ReportAdminService;

@Service("reportAdminService")
public class ReportAdminServiceImpl implements ReportAdminService {

	@Resource(name="reportAdminDAO")
	private ReportAdminDAO dao;
	
	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}//////////
	
	@Override
	public List<ReportAdminDTO> selectList(Map map){
		return dao.selectList(map);
	}
	
	@Override
	public ReportAdminDTO selectOne(Map map) {
		return dao.selectOne(map);
	}
}
