package com.hm.gcjw.controller.authority;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hm.gcjw.common.result.Code;
import com.hm.gcjw.common.result.Result;
import com.hm.gcjw.entity.authority.ConfigEntity;
import com.hm.gcjw.service.authority.ConfigService;

@RestController
public class ConfigController {

	static Logger log = LoggerFactory.getLogger(ConfigController.class);
	
	@Autowired
	ConfigService configService;
	
	@RequestMapping(value = "/api/config/save", method = RequestMethod.POST)
	public Result save(String qrcode, String picture, String suspension) {
		try {
			ConfigEntity config = configService.find();
			config.setQrcode(qrcode);
			config.setPicture(picture);
			config.setSuspension(suspension);
			configService.save(config);
			return new Result(Code.SUCCESS.value(), "success");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/config/guide", method = RequestMethod.POST)
	public Result guide(String content) {
		try {
			ConfigEntity config = configService.find();
			config.setGuide(content);
			configService.save(config);
			return new Result(Code.SUCCESS.value(), "保存成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
}
