package com.hm.gcjw.service.website;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.gcjw.entity.website.TopicEntity;
import com.hm.gcjw.repository.website.TopicRepository;

@Service
public class TopicServiceImpl implements TopicService {
	
	@Autowired
	TopicRepository topicRepository;

	@Override
	public TopicEntity findOne(Long topicId) {
		return topicRepository.findOne(topicId);
	}

	@Override
	public void save(TopicEntity topic) {
		topicRepository.save(topic);
	}

	@Override
	public void delete(Long topicId) {
		topicRepository.delete(topicId);
	}

	@Override
	public void delete(List<Long> topicIdList) {
		Iterable<TopicEntity> it = topicRepository.findByIdIn(topicIdList);
		topicRepository.delete(it);
	}

	@Override
	public List<TopicEntity> list() {
		return topicRepository.findAllByOrderByUpdateTimeDesc();
	}

	@Override
	public Page<TopicEntity> list(int page, int size) {
		return topicRepository.findAllByOrderByUpdateTimeDesc(new PageRequest(page, size));
	}

}
