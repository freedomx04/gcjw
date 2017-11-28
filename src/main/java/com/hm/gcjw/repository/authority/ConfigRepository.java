package com.hm.gcjw.repository.authority;

import org.springframework.data.repository.CrudRepository;

import com.hm.gcjw.entity.authority.ConfigEntity;

public interface ConfigRepository extends CrudRepository<ConfigEntity, Long> {

	ConfigEntity findByName(String name);
	
}
