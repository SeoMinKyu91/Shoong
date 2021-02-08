package com.kosmo.shoong.service.impl.record;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.service.record.RecordDTO;
import com.kosmo.shoong.service.record.RecordService;

@Service("recordService")
public class RecordServiceImpl implements RecordService {
	
	@Resource(name="recordDAO")
	private RecordDAO dao;

	@Override
	public boolean insertRecord(RecordDTO record) {
		return dao.insertRecord(record);
	}

	@Override
	public List<RecordDTO> selectListById(String userId) {
		return dao.selectListById(userId);
	}

	@Override
	public List<String> selectMileageById(String userId) {
		return dao.selectMileageById(userId);
	}

}
