package com.hm.gcjw.entity.authority;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.gcjw.entity.BaseEntity;

@Entity
@Table(name = "authority_user")
public class UserEntity extends BaseEntity {
	
	/**
	 * 用户状态 0: 有效 1：无效
	 */
	public class UserStatus {
		public static final int STATUS_VALID = 0;
		public static final int STATUS_NO_VALID = 1;
	}
	
	/**
	 * 用户名,唯一
	 */
	@Column(unique = true)
	private String username;
	
	/**
	 * MD5加密后的密码
	 */
	private String password;
	
	private Integer status = UserStatus.STATUS_VALID;
	
	public UserEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public UserEntity(String username, String password, Date createTime, Date updateTime) {
		super();
		this.username = username;
		this.password = password;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
}
