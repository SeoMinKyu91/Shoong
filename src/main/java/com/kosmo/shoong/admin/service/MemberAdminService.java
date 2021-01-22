package com.kosmo.shoong.admin.service;

import java.util.List;
import java.util.Map;

public interface MemberAdminService {

	List<Map> memberList();
	List<Map> memberSearch(Map map);
	int deleteMember(Map map);
}
