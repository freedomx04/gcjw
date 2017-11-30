package com.hm.gcjw.service.website;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.gcjw.entity.website.ArticleEntity;
import com.hm.gcjw.repository.website.ArticleRepository;

@Service
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
	ArticleRepository articleRepository;

	@Override
	public ArticleEntity findOne(Long articleId) {
		return articleRepository.findOne(articleId);
	}

	@Override
	public void save(ArticleEntity article) {
		articleRepository.save(article);
	}

	@Override
	public void delete(Long articleId) {
		articleRepository.delete(articleId);
	}
	
	@Override
	public void delete(List<Long> articleIdList) {
		Iterable<ArticleEntity> it = articleRepository.findByIdIn(articleIdList);
		articleRepository.delete(it);
	}

	@Override
	public List<ArticleEntity> listByType(Integer type) {
		return articleRepository.findByTypeOrderByUpdateTimeDesc(type);
	}

	@Override
	public Page<ArticleEntity> listByType(Integer type, int page, int size) {
		return articleRepository.findByTypeOrderByUpdateTimeDesc(type, new PageRequest(page, size));
	}

	@Override
	public String getArticleTitle(Integer type) {
		String title = "";
		switch (type) {
		case 0:		title = "通知公告";		break;
		case 1:		title = "图片新闻";		break;
		case 3:		title = "廉情在线";		break;
		case 4:		title = "曝光台";		break;
		case 5:		title = "党纪法规";		break;
		case 6:		title = "莲廉文化";		break;
		case 7:		title = "专题文章";		break;
		case 8:		title = "信息公开";		break;
		
		case 11:	title = "党风政风";		break;
		case 12:	title = "纪律审查";		break;
		case 13:	title = "巡察工作";		break;
		case 14:	title = "信访举报";		break;
		case 15:	title = "基层风采";		break;
		case 16:	title = "宣传工作";		break;
		case 17:	title = "队伍建设";		break;
		
		default:	break;
		}
		
		return title;
	}

	@Override
	public List<ArticleEntity> listByTopicId(Long topicId) {
		return articleRepository.findByTopicIdOrderByUpdateTimeDesc(topicId);
	}

	@Override
	public Page<ArticleEntity> listByTopicId(Long topicId, int page, int size) {
		return articleRepository.findByTopicIdOrderByUpdateTimeDesc(topicId, new PageRequest(page, size));
	}

	@Override
	public List<Object[]> listCountByType() {
		return articleRepository.listCountByType();
	}

	@Override
	public List<Object[]> listDynamicCountByType() {
		return articleRepository.listDynamicCountByType();
	}

	@Override
	public Page<ArticleEntity> search(String input, int page, int size) {
		return articleRepository.findByTitleContainingOrderByUpdateTimeDesc(input, new PageRequest(page, size));
	}

}
