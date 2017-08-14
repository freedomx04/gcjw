package com.hm.gcjw.repository.authority;

import org.springframework.data.repository.CrudRepository;

import com.hm.gcjw.entity.authority.UserEntity;

public interface UserRepository extends CrudRepository<UserEntity, Long> {
	
	UserEntity findByUsername(String username);

}
