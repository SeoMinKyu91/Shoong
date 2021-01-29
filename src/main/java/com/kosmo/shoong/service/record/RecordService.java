package com.kosmo.shoong.service.record;

import java.util.List;

public interface RecordService {
	boolean insertRecord(RecordDTO record);
	List<RecordDTO> selectListById(String userId);

}
