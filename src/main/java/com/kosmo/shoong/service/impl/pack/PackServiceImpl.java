package com.kosmo.shoong.service.impl.pack;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.service.pack.PackDTO;
import com.kosmo.shoong.service.pack.PackService;

@Service("packService")
public class PackServiceImpl implements PackService{

	@Resource(name="packDAO")
	private PackDAO packDAO;

	@Override
	public List<PackDTO> selectList(Map map) {
		// TODO Auto-generated method stub
		return packDAO.selectList(map);
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return packDAO.insert(map);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return packDAO.delete(map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return packDAO.update(map);
	}

	@Override
	public int insertCreate(Map map) {
		// TODO Auto-generated method stub
		return packDAO.insertCreate(map);
	}

	@Override
	public int insertJoin(Map map) {
		// TODO Auto-generated method stub
		return packDAO.insertJoin(map);
	}

	@Override
	public int insertManager(Map map) {
		// TODO Auto-generated method stub
		return packDAO.insertManager(map);
	}

	@Override
	public int selectPackName(Map map) {
		// TODO Auto-generated method stub
		return packDAO.selectPackName(map);
	}

	@Override
	public Map selectOneUserAddr(String id) {
		// TODO Auto-generated method stub
		return packDAO.selectOneUserAddr(id);
	}
	
}
