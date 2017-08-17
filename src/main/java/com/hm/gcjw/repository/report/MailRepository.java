package com.hm.gcjw.repository.report;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.gcjw.entity.report.MailEntity;

public interface MailRepository extends CrudRepository<MailEntity, Long> {
	
	MailEntity findByCode(String code);
	
	Iterable<MailEntity> findByIdIn(List<Long> mailIdList);
	
	List<MailEntity> findByOrderByUpdateTimeDesc();

}
