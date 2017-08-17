package com.hm.gcjw.service.report;

import java.util.List;

import com.hm.gcjw.entity.report.ReportEntity;

public interface ReportService {
	
	ReportEntity findOne(Long reportId);
	
	ReportEntity findByCode(String code);
	
	void save(ReportEntity report);
	
	void delete(Long reportId);
	
	void delete(List<Long> reportIdList);
	
	List<ReportEntity> list();

}
