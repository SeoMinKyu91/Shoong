package com.kosmo.shoong.service.impl.pack;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.service.pack.PackDTO;
import com.kosmo.shoong.service.pack.PackService;

@Repository
public class PackDAO implements PackService {
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<PackDTO> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("PackSelectList",map);
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("PackInsert",map);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("PackDelete",map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("PackUpdate",map);
	}

	@Override
	public int insertCreate(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("PackCreateInsert",map);
	}

	@Override
	public int insertJoin(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("PackJoinInsert",map);
	}

	@Override
	public int insertManager(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("PackManagerInsert",map);
	}

	@Override
	public int selectPackName(Map map) {
		
		return sqlMapper.selectOne("PackNameCheckSelect",map);
	}

	@Override
	public Map selectOneUserAddr(String id) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("selectOneUserAddr",id);
	}

	public List<Map> selectRankList(Map map) {

		return sqlMapper.selectList("packRankList",map);
	}
}
