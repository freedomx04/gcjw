package com.hm.gcjw.service.website;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.gcjw.entity.website.ArticleEntity;

public interface ArticleService {
	
	ArticleEntity findOne(Long articleId);
	
	ArticleEntity findByPath(String path);
	
	void save(ArticleEntity article);
	
	void delete(Long articleId);
	
	void delete(List<Long> articleIdList);
	
	List<ArticleEntity> listByType(Integer type);
	
	Page<ArticleEntity> listByType(Integer type, int page, int size);

	String getArticleTitle(Integer type);
	
	List<ArticleEntity> listByTopicId(Long topicId);
	
	Page<ArticleEntity> listByTopicId(Long topicId, int page, int size);
	
	List<Object[]> listCountByType();
	
	List<Object[]> listDynamicCountByType();
	
}
