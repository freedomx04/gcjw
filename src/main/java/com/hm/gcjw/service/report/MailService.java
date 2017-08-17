package com.hm.gcjw.service.report;

import java.util.List;

import com.hm.gcjw.entity.report.MailEntity;

public interface MailService {
	
	MailEntity findOne(Long mailId);
	
	MailEntity findByCode(String code);
	
	void save(MailEntity mail);
	
	void delete(Long mailId);
	
	void delete(List<Long> mailIdList);
	
	List<MailEntity> list();
	

}
