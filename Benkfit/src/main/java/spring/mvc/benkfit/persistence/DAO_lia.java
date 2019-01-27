package spring.mvc.benkfit.persistence;

import java.util.Map;

public interface DAO_lia {

	// id 중복확인
	public int id_check(String strId);
	
	// 실명확인
	public int name_check(Map<String, Object> map);
}
