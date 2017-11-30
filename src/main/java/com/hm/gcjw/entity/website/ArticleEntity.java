package com.hm.gcjw.entity.website;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

import com.hm.gcjw.entity.BaseEntity;

@Entity
@Table(name = "website_article", indexes = {
	@Index(name = "index_website_article_type", columnList = "type"),
	@Index(name = "index_website_article_type_updatetime", columnList = "type, updateTime"),
	@Index(name = "index_website_article_topic_updatetime", columnList = "topic_id, updateTime"),
	@Index(name = "index_website_article_title_updatetime", columnList = "title, updateTime")
})
public class ArticleEntity extends BaseEntity {

	/**
	 * 类型分类
	 */
	public class ArticleType {
		public static final int ANNOUNCE = 0;			// 通知公告
		public static final int PHOTONEWS = 1; 			// 图片新闻
		public static final int FOCUSNEWS = 3;			// 廉情在线
		public static final int EXPOSURE = 4;			// 曝光台
		public static final int POLICY = 5;				// 党纪法规
		public static final int CULTURE = 6;			// 莲廉文化
		public static final int TOPICNEWS = 7;			// 专题文章
		public static final int INFORMATION = 8;		// 信息公开
		
		public static final int DYNAMIC_PARTY = 11;		// 党风政风
		public static final int DYNAMIC_EXAMINE = 12;	// 纪律审查
		public static final int DYNAMIC_PATROL = 13;	// 巡察工作
		public static final int DYNAMIC_PETITION = 14;	// 信访举报
		public static final int DYNAMIC_BASIC = 15;		// 基层风采
		public static final int DYNAMIC_PUBLIC = 16;	// 宣传工作
		public static final int DYNAMIC_TEAM = 17;		// 队伍建设
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
	 * 文章内容
	 */
	@Column(length = 16777216)
	private String content;
	
	/**
	 * 专题Id
	 */
	@Column(name = "topic_id")
	private Long topicId;

	public ArticleEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArticleEntity(Integer type, String title, String source, String imagePath, String content, Date createTime,
			Date updateTime) {
		super();
		this.type = type;
		this.title = title;
		this.source = source;
		this.imagePath = imagePath;
		this.content = content;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getTopicId() {
		return topicId;
	}

	public void setTopicId(Long topicId) {
		this.topicId = topicId;
	}
	
}
