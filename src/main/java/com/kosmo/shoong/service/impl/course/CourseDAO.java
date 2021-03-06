package com.kosmo.shoong.service.impl.course;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.service.course.CourseDTO;
import com.kosmo.shoong.service.course.CourseService;


@Repository
public class CourseDAO implements CourseService {
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public boolean insert(Map map) {
		return sqlMapper.insert("courseInsert", map)==1?true:false;
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
		Set keys = map.keySet();
		for(Object key:keys) System.out.println(key+"-:-"+map.get(key));
		return sqlMapper.selectList("showCourse",map);
	}
	
	@Override
	public List<CourseDTO> selectList() {
		return sqlMapper.selectList("courseSelect");
	}

	@Override
	public CourseDTO selectOneByCId(String courseId) {
		return sqlMapper.selectOne("courseSelectByCId", courseId);
	}
}
