package com.hm.gcjw.entity.authority;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "authority_config")
public class ConfigEntity {
	
	// 配置名称
	@Id
	private String name = "config";
	
	// 二维码
	private String qrcode;
	
	// 动态图片
	private String picture;
	
	// 悬浮图片
	private String suspension;
	
	// 举报指南
	@Column(length = 16777216)
	private String guide;
	
	public ConfigEntity() {
		// TODO Auto-generated constructor stub
	}

	public ConfigEntity(String qrcode, String picture, String suspension) {
		super();
		this.qrcode = qrcode;
		this.picture = picture;
		this.suspension = suspension;
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

	public String getSuspension() {
		return suspension;
	}

	public void setSuspension(String suspension) {
		this.suspension = suspension;
	}

	public String getGuide() {
		return guide;
	}

	public void setGuide(String guide) {
		this.guide = guide;
	}
	
}
