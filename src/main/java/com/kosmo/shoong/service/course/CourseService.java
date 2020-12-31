package com.kosmo.shoong.service.course;

import java.util.List;
import java.util.Map;

public interface CourseService {

	List<Map> selectList(Map map);
	
	CourseDTO selectOne(Map map);
	
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
	
	List<Map> showCourse(Map map);
}
