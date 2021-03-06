package com.kosmo.shoong.service.course;

import java.util.List;
import java.util.Map;

public interface CourseService {

	CourseDTO selectOneByCId(String courseId);
	
	boolean insert(Map map);
	int delete(Map map);
	int update(Map map);
	
	List<Map> showCourse(Map map);
	List<CourseDTO> selectList();
}
