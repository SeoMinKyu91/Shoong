package com.kosmo.shoong.service.impl.course;

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
	public List<Map> selectList(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return 0;
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
	public CourseDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

}
