package com.hm.gcjw.entity.report;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.gcjw.entity.BaseEntity;

@Entity
@Table(name = "report_report")
public class ReportEntity extends BaseEntity {

	/**
	 * 查询码
	 */
	private String code;

	/**
	 * 举报人姓名
	 */
	private String name;

	/**
	 * 联系方式
	 */
	private String telephone;

	/**
	 * 身份证号
	 */
	private String idCards;

	/**
	 * 工作单位或地址
	 */
	private String address;

	/**
	 * 被举报单位
	 */
	private String reportUnit;

	/**
	 * 被举报人
	 */
	private String reportName;

	/**
	 * 职务
	 */
	private String position;

	/**
	 * 级别
	 */
	private Integer level;

	/**
	 * 政治面貌
	 */
	private Integer politics;

	/**
	 * 问题类别
	 */
	private Integer type;

	/**
	 * 问题内容
	 */
	@Column(length = 4000)
	private String content;

	/**
	 * 回复
	 */
	private String reply;

	public ReportEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReportEntity(String name, String telephone, String idCards, String address, String reportUnit,
			String reportName, String position, Integer level, Integer politics, Integer type, String content,
			Date createTime, Date updateTime) {
		super();
		this.name = name;
		this.telephone = telephone;
		this.idCards = idCards;
		this.address = address;
		this.reportUnit = reportUnit;
		this.reportName = reportName;
		this.position = position;
		this.level = level;
		this.politics = politics;
		this.type = type;
		this.content = content;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getIdCards() {
		return idCards;
	}

	public void setIdCards(String idCards) {
		this.idCards = idCards;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getReportUnit() {
		return reportUnit;
	}

	public void setReportUnit(String reportUnit) {
		this.reportUnit = reportUnit;
	}

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getPolitics() {
		return politics;
	}

	public void setPolitics(Integer politics) {
		this.politics = politics;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

}
