package com.hm.gcjw.entity.website;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.gcjw.entity.BaseEntity;

@Entity
@Table(name = "website_article")
public class ArticleEntity extends BaseEntity {

	/**
	 * 类型分类
	 */
	public class ArticleType {
		public static final int PHOTONEWS = 1; 	// 图片新闻
		public static final int HEADLINE = 2;	// 廉政头条
		public static final int FOCUSNEWS = 3;	// 廉情在线
		public static final int EXPOSURE = 4;	// 曝光台
		public static final int POLICY = 5;		// 党纪法规
		public static final int CULTURE = 6;	// 莲廉文化
		public static final int TOPICNEWS = 7;	// 专题文章
		
		public static final int DYNAMIC_PARTY = 8;		// 党风政风
		public static final int DYNAMIC_EXAMINE = 9;	// 纪律审查
		public static final int DYNAMIC_PATROL = 10;	// 巡查工作
		public static final int DYNAMIC_PUBLIC = 11;	// 宣传工作
		public static final int DYNAMIC_TEAM = 12;		// 队伍建设
	}

	/**
	 * 文章类型
	 */
	private Integer type;

	/**
	 * 文章标题
	 */
	private String title;

	/**
	 * 文章来源
	 */
	private String source;

	/**
	 * 图片路径
	 */
	private String imagePath;

	/**
	 * 文章路径标识
	 */
	private String path;

	/**
	 * 文章内容
	 */
	private String content;

	public ArticleEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArticleEntity(Integer type, String title, String source, String imagePath, String path, Date createTime,
			Date updateTime) {
		super();
		this.type = type;
		this.title = title;
		this.source = source;
		this.imagePath = imagePath;
		this.path = path;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
