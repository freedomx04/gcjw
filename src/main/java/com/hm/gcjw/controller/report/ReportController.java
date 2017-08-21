package com.hm.gcjw.controller.report;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hm.gcjw.common.PathFormat;
import com.hm.gcjw.common.result.Code;
import com.hm.gcjw.common.result.Result;
import com.hm.gcjw.common.result.ResultInfo;
import com.hm.gcjw.entity.report.ReportEntity;
import com.hm.gcjw.service.report.ReportService;

@RestController
public class ReportController {

	static Logger log = LoggerFactory.getLogger(RestController.class);

	@Autowired
	ReportService reportService;

	private String reportFormat = "R{yyyy}{mm}{dd}{rand:6}";

	@RequestMapping(value = "/api/report/create", method = RequestMethod.POST)
	public Result create(String name, String telephone, String idCards, String address, String reportUnit,
			String reportName, String position, String level, String politics, String type, String content) {
		try {
			Date now = new Date();
			String clazz = type.substring(0, 4);
			ReportEntity report = new ReportEntity(name, telephone, idCards, address, reportUnit, reportName, position,
					level, politics, type, clazz, content, now, now);

			// 生成信件查询码
			String code = PathFormat.parse(reportFormat);
			report.setCode(code);

			reportService.save(report);
			return new ResultInfo(Code.SUCCESS.value(), "created", code);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/report/delete")
	public Result delete(Long reportId) {
		try {
			reportService.delete(reportId);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/report/batchDelete")
	public Result batchDelete(@RequestParam("topicIdList[]") List<Long> reportIdList) {
		try {
			reportService.delete(reportIdList);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/report/get")
	public Result get(Long reportId) {
		try {
			ReportEntity report = reportService.findOne(reportId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", report);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/report/list")
	public Result list() {
		try {
			List<ReportEntity> list = reportService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/report/getByCode")
	public Result getByCode(String code) {
		try {
			ReportEntity report = reportService.findByCode(code);
			return new ResultInfo(Code.SUCCESS.value(), "ok", report);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/report/reply", method = RequestMethod.POST)
	public Result reply(Long reportId, String reply) {
		try {
			ReportEntity report = reportService.findOne(reportId);
			report.setReply(reply);
			reportService.save(report);
			return new Result(Code.SUCCESS.value(), "reply");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/report/listCountByClazz")
	public Result listCountByClazz() {
		try {
			List<Map<String, Object>> resultList = new ArrayList<>();
			List<Object[]> list = reportService.listCountByClazz();
			
			for (Object[] object: list) {
				Map<String, Object> map = new HashMap<>();
				map.put("title", object[0]);
				map.put("count", object[1]);
				resultList.add(map);
			}
			
			return new ResultInfo(Code.SUCCESS.value(), "ok", resultList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}
