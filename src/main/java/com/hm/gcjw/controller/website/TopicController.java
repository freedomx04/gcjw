package com.hm.gcjw.controller.website;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hm.gcjw.common.PathFormat;
import com.hm.gcjw.common.result.Code;
import com.hm.gcjw.common.result.Result;
import com.hm.gcjw.common.result.ResultInfo;
import com.hm.gcjw.common.utils.FileUtil;
import com.hm.gcjw.entity.website.TopicEntity;
import com.hm.gcjw.service.CommonService;
import com.hm.gcjw.service.website.TopicService;

@RestController
public class TopicController {

	static Logger log = LoggerFactory.getLogger(TopicController.class);

	@Autowired
	TopicService topicService;
	
	@Value("${customize.path.upload}")
	private String uploadPath;
	
	@Value("${customize.path.image}")
	private String imageFormat;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	CommonService commonService;

	@RequestMapping(value = "/api/topic/create", method = RequestMethod.POST)
	public Result create(String title, String imagePath) {
		try {
			Date now = new Date();
			TopicEntity topic = new TopicEntity(title, imagePath, now, now);
			topicService.save(topic);
			
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/topic/update", method = RequestMethod.POST)
	public Result update(Long topicId, String title, String imagePath) {
		try {
			TopicEntity topic = topicService.findOne(topicId);
			topic.setTitle(title);
			topic.setImagePath(imagePath);
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
			if (topic.getImagePath() != null) {
				commonService.deleteImage(topic.getImagePath());
			}
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
	public Result list() {
		try {
			List<TopicEntity> list = topicService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/topic/listPaging")
	public Result listPaging(int page, int size) {
		try {
			Page<TopicEntity> list = topicService.list(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/topic/imageUpload", method = RequestMethod.POST)
	public Result avatarUpload(String base64) {
		try {
			String str = base64.substring(base64.indexOf(",") + 1);
			byte[] bytes = Base64.decodeBase64(new String(str).getBytes());
            ByteArrayInputStream in = new ByteArrayInputStream(bytes);
            
            String imagePath = imageFormat + ".png";
            imagePath = PathFormat.parse(imagePath);
            
            File file = Paths.get(uploadPath, imagePath).toFile();
            FileUtil.sureDirExists(file, true);
            
            FileOutputStream out = new FileOutputStream(file);
            IOUtils.copy(in, out);
            out.close();
			return new ResultInfo(Code.SUCCESS.value(), "updated", request.getContextPath() + imagePath);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
}
