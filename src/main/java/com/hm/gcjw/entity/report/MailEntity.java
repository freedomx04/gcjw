package com.hm.gcjw.entity.report;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.gcjw.entity.BaseEntity;

@Entity
@Table(name = "report_mail")
public class MailEntity extends BaseEntity {
	
	/**
	 * 发件人信息
	 */
	private String info;
	
	/**
	 * 信件标题
	 */
	private String title;
	
	/**
	 *  信件内容
	 */
	@Column(length = 4000)
	private String content;
	
	/**
	 * 查询码
	 */
	private String code;
	
	/**
	 * 回复信息
	 */
	@Column(length = 2000)
	private String reply;
	
	public MailEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MailEntity(String info, String title, String content, Date createTime, Date updateTime) {
		super();
		this.info = info;
		this.title = title;
		this.content = content;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}
	
}
