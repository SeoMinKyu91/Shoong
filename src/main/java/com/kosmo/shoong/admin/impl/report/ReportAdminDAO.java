package com.kosmo.shoong.admin.impl.report;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.admin.service.ReportAdminDTO;
import com.kosmo.shoong.admin.service.ReportAdminService;

@Repository("reportAdminDAO")
public class ReportAdminDAO implements ReportAdminService{
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public int insert(Map map) {
		return sqlMapper.insert("ReportAdminInsert",map);
	}//////////
	
	@Override
	public List<ReportAdminDTO> selectList(Map map){
		return sqlMapper.selectList("ReportAdminSelectList",map);
	}/////////
	
	@Override
	public ReportAdminDTO selectOne(Map map) {
		return sqlMapper.selectOne("ReportAdminSelectOne",map);
	}
}
