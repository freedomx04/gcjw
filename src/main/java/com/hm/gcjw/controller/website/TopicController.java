package com.hm.gcjw.controller.website;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hm.gcjw.common.result.Code;
import com.hm.gcjw.common.result.Result;
import com.hm.gcjw.common.result.ResultInfo;
import com.hm.gcjw.entity.website.TopicEntity;
import com.hm.gcjw.service.website.TopicService;

@RestController
public class TopicController {

	static Logger log = LoggerFactory.getLogger(TopicController.class);

	@Autowired
	TopicService topicService;

	@RequestMapping(value = "/api/topic/create", method = RequestMethod.POST)
	public Result create(String title) {
		try {
			Date now = new Date();
			TopicEntity topic = new TopicEntity(title, null, now, now);
			topicService.save(topic);
			
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/topic/update", method = RequestMethod.POST)
	public Result update(Long topicId, String title) {
		try {
			TopicEntity topic = topicService.findOne(topicId);
			topic.setTitle(title);
			topic.setUpdateTime(new Date());
			topicService.save(topic);
			
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/topic/delete")
	public Result delete(Long topicId) {
		try {
			TopicEntity topic = topicService.findOne(topicId);
			topicService.delete(topicId);
			
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/topic/batchDelete")
	public Result batchDelete(@RequestParam("topicIdList[]") List<Long> topicIdList) {
		try {
			for (Long topicId : topicIdList) {
				delete(topicId);
			}
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/topic/get")
	public Result get(Long topicId) {
		try {
			TopicEntity topic = topicService.findOne(topicId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", topic);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/topic/list")
	public Result list(Integer type) {
		try {
			List<TopicEntity> list = topicService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/topic/listPaging")
	public Result listPaging(Integer type, int page, int size) {
		try {
			Page<TopicEntity> list = topicService.list(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
}
