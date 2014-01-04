package com.lanyuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lanyuan.dao.ArticleDao;
import com.lanyuan.entity.Article;
import com.lanyuan.service.ArticleService;
import com.lanyuan.util.PageView;

@Transactional
@Service("articleService")
public class ArticleServiceImpl implements ArticleService{
	@Autowired
	private ArticleDao articleDao;

	public void add(Article article) {
		articleDao.add(article);
	}

	public void delete(String id) {
		articleDao.delete(id);
	}

	public Article getById(String id) {
		return articleDao.getById(id);
	}

	public void modify(Article article) {
		articleDao.modify(article);
	}

	public PageView query(PageView pageView, Article article) {
		return articleDao.query(pageView, article);
	}

	public List<Article> queryAll(Article article) {
		return articleDao.queryAll(article);
	}

}
