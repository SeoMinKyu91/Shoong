package com.kosmo.shoong.admin.impl.course;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.shoong.admin.service.CourseAdminService;


@Service("courseAdminService")
public class CourseAdminServiceImpl implements CourseAdminService {

	@Resource(name="courseAdminDAO")
	private CourseAdminDAO dao;
}
