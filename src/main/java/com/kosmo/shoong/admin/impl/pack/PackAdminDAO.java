package com.kosmo.shoong.admin.impl.pack;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.admin.service.PackAdminDTO;
import com.kosmo.shoong.admin.service.PackAdminService;


@Repository("packAdminDAO")
public class PackAdminDAO implements PackAdminService {

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<Map> selectList() {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("packList");
	}

	@Override
	public int deletePack(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("packDelete",map);
	}
	
	
}
