package com.hm.gcjw.controller.authority;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hm.gcjw.common.result.Code;
import com.hm.gcjw.common.result.Result;
import com.hm.gcjw.common.result.ResultInfo;
import com.hm.gcjw.common.utils.CiphersUtils;
import com.hm.gcjw.common.utils.CurrentUserUtils;
import com.hm.gcjw.entity.authority.UserEntity;
import com.hm.gcjw.entity.authority.UserEntity.UserStatus;
import com.hm.gcjw.service.authority.UserService;

@RestController
public class UserController {
	
	static Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/api/user/create", method = RequestMethod.POST)
	public Result create(String username, String password) {
		try {
			UserEntity user = userService.findByUsername(username);
			if (user != null) {
				return new Result(Code.EXISTED.value(), "用户名已存在");
			}
			
			Date now = new Date();
			user = new UserEntity(username, CiphersUtils.getInstance().MD5Password(password), now, now);
			userService.save(user);
			
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/user/list")
	public Result list() {
		try {
			List<UserEntity> userList = userService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", userList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/user/login", method = RequestMethod.POST)
	public Result login(String username, String password) {
		try {
			UserEntity user = userService.findByUsername(username);
			
			if (user == null) { 
				return new Result(Code.NULL.value(), "用户不存在"); 
			}
			
			if (user.getStatus() == UserStatus.STATUS_NO_VALID) { 
				return new Result(Code.USER_NO_VALID.value(), "该用户已被禁用");
			}
			
			if (!StringUtils.equals(CiphersUtils.getInstance().MD5Password(password), user.getPassword())) {
				return new Result(Code.USER_PWD_ERROR.value(), "密码错误");
			}

			CurrentUserUtils.getInstance().serUser(user);
			
			return new Result(Code.SUCCESS.value(), "login success");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/user/logout")
	public Result logout() {
		try {
			CurrentUserUtils.getInstance().removeUser();
			return new Result(Code.SUCCESS.value(), "logout success");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/user/password", method = RequestMethod.POST)
	public Result password(Long userId, String oldPassword, String newPassword) {
		try {
			UserEntity user = userService.findOne(userId);
			if (!StringUtils.equals(CiphersUtils.getInstance().MD5Password(oldPassword), user.getPassword())) {
				return new Result(Code.USER_PWD_ERROR.value(), "原密码错误");
			}

			user.setPassword(CiphersUtils.getInstance().MD5Password(newPassword));
			userService.save(user);
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/user/password2", method = RequestMethod.POST)
	public Result password2(Long userId, String password) {
		try {
			UserEntity user = userService.findOne(userId);
			user.setPassword(CiphersUtils.getInstance().MD5Password(password));
			userService.save(user);
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/user/status") 
	public Result status(Long userId, Integer status) {
		try {
			UserEntity user = userService.findOne(userId);
			user.setStatus(status);
			userService.save(user);
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
}
