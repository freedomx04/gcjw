package com.hm.gcjw.service.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.gcjw.entity.report.MailEntity;
import com.hm.gcjw.repository.report.MailRepository;

@Service
public class MailServiceImpl implements MailService {
	
	@Autowired
	MailRepository mailRepository;

	@Override
	public MailEntity findOne(Long mailId) {
		return mailRepository.findOne(mailId);
	}
	
	@Override
	public MailEntity findByCode(String code) {
		return mailRepository.findByCode(code);
	}

	@Override
	public void save(MailEntity mail) {
		mailRepository.save(mail);
	}

	@Override
	public void delete(Long mailId) {
		mailRepository.delete(mailId);
	}

	@Override
	public void delete(List<Long> mailIdList) {
		Iterable<MailEntity> it = mailRepository.findByIdIn(mailIdList);
		mailRepository.delete(it);
	}

	@Override
	public List<MailEntity> list() {
		return mailRepository.findByOrderByUpdateTimeDesc();
	}

}
