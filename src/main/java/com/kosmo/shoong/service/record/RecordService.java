package com.kosmo.shoong.service.record;

import java.util.List;
import java.util.Map;

public interface RecordService {
	boolean insertRecord(RecordDTO record);
	List<RecordDTO> selectListById(String userId);
	Map<String,String> selectMileageById(String userId);

}
