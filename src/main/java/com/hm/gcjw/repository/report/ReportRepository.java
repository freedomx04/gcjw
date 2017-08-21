package com.hm.gcjw.repository.report;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.hm.gcjw.entity.report.ReportEntity;

public interface ReportRepository extends CrudRepository<ReportEntity, Long> {
	
	ReportEntity findByCode(String code);
	
	Iterable<ReportEntity> findByIdIn(List<Long> reportIdList);
	
	List<ReportEntity> findByOrderByUpdateTimeDesc();
	
	@Query(value = "select clazz, count(*) from report_report group by clazz order by count(*) asc", nativeQuery = true)
	List<Object[]> listCountByClazz();

}
