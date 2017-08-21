package com.hm.gcjw.service.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.gcjw.entity.report.ReportEntity;
import com.hm.gcjw.repository.report.ReportRepository;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	ReportRepository reportRepository;

	@Override
	public ReportEntity findOne(Long reportId) {
		return reportRepository.findOne(reportId);
	}

	@Override
	public ReportEntity findByCode(String code) {
		return reportRepository.findByCode(code);
	}

	@Override
	public void save(ReportEntity report) {
		reportRepository.save(report);
	}

	@Override
	public void delete(Long reportId) {
		reportRepository.delete(reportId);
	}

	@Override
	public void delete(List<Long> reportIdList) {
		Iterable<ReportEntity> it = reportRepository.findByIdIn(reportIdList);
		reportRepository.delete(it);
	}

	@Override
	public List<ReportEntity> list() {
		return reportRepository.findByOrderByUpdateTimeDesc();
	}

	@Override
	public List<Object[]> listCountByClazz() {
		return reportRepository.listCountByClazz();
	}

}
