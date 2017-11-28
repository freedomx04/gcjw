package com.hm.gcjw.service.authority;

import java.util.List;

import com.hm.gcjw.entity.authority.ConfigEntity;

public interface ConfigService {
	
	ConfigEntity find();
	
	void save(ConfigEntity config);
	
	List<ConfigEntity> list();

}
