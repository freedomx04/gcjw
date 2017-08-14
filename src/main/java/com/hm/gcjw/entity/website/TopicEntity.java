package com.hm.gcjw.entity.website;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import com.hm.gcjw.entity.BaseEntity;

@Entity
@Table(name = "website_topic")
public class TopicEntity extends BaseEntity {

	/**
	 * 专题标题
	 */
	private String title;

	/**
	 * 专题图片
	 */
	private String imagePath;

	/**
	 * 专题文章
	 */
	@OneToMany(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "topic_id")
	@OrderBy(value = "updateTime desc")
	private List<ArticleEntity> articles = new LinkedList<>();

	public TopicEntity() {
		// TODO Auto-generated constructor stub
	}

	public TopicEntity(String title, String imagePath, Date createTime, Date updateTime) {
		super();
		this.title = title;
		this.imagePath = imagePath;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public List<ArticleEntity> getArticles() {
		return articles;
	}

	public void setArticles(List<ArticleEntity> articles) {
		this.articles = articles;
	}

}
