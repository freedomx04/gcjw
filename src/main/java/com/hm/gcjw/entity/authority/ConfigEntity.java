package com.hm.gcjw.entity.authority;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "authority_config")
public class ConfigEntity {
	
	/**
	 * 配置名称
	 */
	@Id
	private String name = "config";
	
	/**
	 * 二维码
	 */
	private String qrcode;
	
	/**
	 * 动态图片
	 */
	private String picture;
	
	public ConfigEntity() {
		// TODO Auto-generated constructor stub
	}

	public ConfigEntity(String qrcode, String picture) {
		super();
		this.qrcode = qrcode;
		this.picture = picture;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getQrcode() {
		return qrcode;
	}

	public void setQrcode(String qrcode) {
		this.qrcode = qrcode;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
}
