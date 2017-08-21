package com.hm.gcjw.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hm.gcjw.common.result.Code;
import com.hm.gcjw.common.result.Result;
import com.hm.gcjw.common.utils.CiphersUtils;
import com.hm.gcjw.entity.authority.UserEntity;
import com.hm.gcjw.service.authority.UserService;

@RestController
public class InitController {
	
	static Logger log = LoggerFactory.getLogger(InitController.class);
	
	@Autowired
	UserService userService;
	
	String adminUsername = "admin";
	String adminPassword = "admin123456";
	
	@RequestMapping(value = "/api/init/admin")
	public Result admin() {
		try {
			Date now = new Date();
			UserEntity user = userService.findByUsername(adminUsername);
			if (user == null) {
				user = new UserEntity(adminUsername, CiphersUtils.getInstance().MD5Password(adminPassword), now, now);
				userService.save(user);
			}
			return new Result(Code.SUCCESS.value(), "成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}
