package com.hm.gcjw.repository.website;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.gcjw.entity.website.ArticleEntity;

public interface ArticleRepository extends PagingAndSortingRepository<ArticleEntity, Long> {

	Iterable<ArticleEntity> findByIdIn(List<Long> articleIdList);
	
	List<ArticleEntity> findByTypeOrderByUpdateTimeDesc(Integer type);
	
	Page<ArticleEntity> findByTypeOrderByUpdateTimeDesc(Integer type, Pageable pageable);
	
	List<ArticleEntity> findByTopicIdOrderByUpdateTimeDesc(Long topicId);
	
	Page<ArticleEntity> findByTopicIdOrderByUpdateTimeDesc(Long topicId, Pageable pageable);
	
	Page<ArticleEntity> findByTitleContainingOrderByUpdateTimeDesc(String title, Pageable pageable);
	
	@Query(value = "select type, count(*) from website_article group by type", nativeQuery = true)
	List<Object[]> listCountByType();
	
	@Query(value = "select type, count(*) from website_article where type in (11, 12, 13, 14, 15, 16, 17) group by type", nativeQuery = true)
	List<Object[]> listDynamicCountByType();
	
}
