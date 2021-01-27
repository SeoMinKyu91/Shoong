package com.kosmo.shoong.service.impl.record;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.service.record.RecordDTO;
import com.kosmo.shoong.service.record.RecordService;

@Repository
public class RecordDAO implements RecordService {
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public boolean insertRecord(RecordDTO record) {
		return (Integer)sqlMapper.insert("insertRecord", record)==1?true:false;
	}

	@Override
	public List<RecordDTO> selectListById(String userId) {
		return sqlMapper.selectList("selectListById", userId);
	}

}
