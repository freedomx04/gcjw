package com.hm.gcjw.controller.report;

import java.util.Date;
import java.util.List;

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
import com.hm.gcjw.entity.report.MailEntity;
import com.hm.gcjw.service.report.MailService;

@RestController
public class MailController {

	static Logger log = LoggerFactory.getLogger(MailController.class);
	
	@Autowired
	MailService mailService;
	
	private String mailFormat = "M{yyyy}{mm}{dd}{rand:6}";
	
	@RequestMapping(value = "/api/mail/create", method = RequestMethod.POST)
	public Result create(String info, String title, String content) {
		try {
			Date now = new Date();
			MailEntity mail = new MailEntity(info, title, content, now, now);
			
			// 生成信件查询码
			String code = PathFormat.parse(mailFormat);
			mail.setCode(code);
			
			mailService.save(mail);
			return new ResultInfo(Code.SUCCESS.value(), "created", code);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/mail/delete") 
	public Result delete(Long mailId) {
		try {
			mailService.delete(mailId);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/mail/batchDelete")
	public Result batchDelete(@RequestParam("topicIdList[]") List<Long> mailIdList) {
		try {
			mailService.delete(mailIdList);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/mail/get")
	public Result get(Long mailId) {
		try {
			MailEntity mail = mailService.findOne(mailId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", mail);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/mail/list")
	public Result list() {
		try {
			List<MailEntity> list = mailService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/mail/getByCode")
	public Result getByCode(String code) {
		try {
			MailEntity mail = mailService.findByCode(code);
			return new ResultInfo(Code.SUCCESS.value(), "ok", mail);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/mail/reply", method = RequestMethod.POST)
	public Result reply(Long mailId, String reply) {
		try {
			MailEntity mail = mailService.findOne(mailId);
			mail.setReply(reply);
			mailService.save(mail);
			return new Result(Code.SUCCESS.value(), "reply");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
}
