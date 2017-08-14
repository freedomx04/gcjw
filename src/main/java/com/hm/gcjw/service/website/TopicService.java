package com.hm.gcjw.service.website;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.gcjw.entity.website.TopicEntity;

public interface TopicService {
	
	TopicEntity findOne(Long topicId);
	
	void save(TopicEntity topic);
	
	void delete(Long topicId);
	
	void delete(List<Long> topicIdList);
	
	List<TopicEntity> list();
	
	Page<TopicEntity> list(int page, int size);
	
}
