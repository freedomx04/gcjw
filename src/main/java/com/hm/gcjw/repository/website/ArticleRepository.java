package com.hm.gcjw.repository.website;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.gcjw.entity.website.ArticleEntity;

public interface ArticleRepository extends PagingAndSortingRepository<ArticleEntity, Long> {

	ArticleEntity findByPath(String path);
	
	Iterable<ArticleEntity> findByIdIn(List<Long> articleIdList);
	
	List<ArticleEntity> findByTypeOrderByUpdateTimeDesc(Integer type);
	
	Page<ArticleEntity> findByTypeOrderByUpdateTimeDesc(Integer type, Pageable pageable);
	
}
