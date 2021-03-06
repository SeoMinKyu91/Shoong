package com.kosmo.shoong.service.impl.course;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.service.course.CourseDTO;
import com.kosmo.shoong.service.course.CourseService;

@Service("courseService")
public class CourseServiceImpl implements CourseService{
	
	@Resource(name="courseDAO")
	private CourseDAO courseDao;

	@Override
	public boolean insert(Map map) {
		return courseDao.insert(map);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public List<Map> showCourse(Map map) {
		return courseDao.showCourse(map);
	}
	
	@Override
	public List<CourseDTO> selectList() {
		List<CourseDTO> list = courseDao.selectList();
		//SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
		//for(CourseDTO item:list) item.setCourseRegiDate(sdf.));
		return list;
	}

	@Override
	public CourseDTO selectOneByCId(String courseId) {
		return courseDao.selectOneByCId(courseId);
	}


}
