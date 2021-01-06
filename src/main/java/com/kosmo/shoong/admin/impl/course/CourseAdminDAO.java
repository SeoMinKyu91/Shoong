package com.kosmo.shoong.admin.impl.course;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.shoong.admin.service.CourseAdminService;

@Repository("courseAdminDAO")
public class CourseAdminDAO implements CourseAdminService {
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
}
