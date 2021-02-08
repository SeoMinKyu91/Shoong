package com.kosmo.shoong.admin.impl.pack;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.admin.service.PackAdminDTO;
import com.kosmo.shoong.admin.service.PackAdminService;

@Service("packAdminService")
public class PackAdminServiceImpl implements PackAdminService {
	
	@Resource(name="packAdminDAO")
	private PackAdminDAO dao;

	@Override
	public List<Map> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public int deletePack(Map map) {
		// TODO Auto-generated method stub
		return dao.deletePack(map);
	}
	
	
}
