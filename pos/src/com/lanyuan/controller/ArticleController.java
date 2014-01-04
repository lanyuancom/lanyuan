package com.lanyuan.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lanyuan.entity.Article;
import com.lanyuan.entity.User;
import com.lanyuan.service.ArticleService;
import com.lanyuan.util.Common;
import com.lanyuan.util.PageView;

/**
 * 
 * @author Dylan
 *
 */
@Controller
@RequestMapping(value="/background/article/")
public class ArticleController {
	@Autowired
	private ArticleService articleService;
	
	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(){
		return Common.ROOT_PATH+"/background/article/article_add";
	} 
	
	/**
	 * 保存新增文章
	 * @param model
	 * @param article
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(Model model,Article article,HttpServletRequest request){
		User user= (User) request.getSession().getAttribute("userSession");
		article.setUserId(user.getUserId());
		articleService.add(article);
		return "redirect:query.html";
	}
	
	/**
	 * 分页查询文章
	 * @param model
	 * @param article
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="query")
	public String query(Model model,Article article,String pageNow){
		PageView pageView = null;
		if(Common.isEmpty(pageNow)){
			pageView = new PageView(1);
		}else{
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		pageView = articleService.query(pageView, article);
		model.addAttribute("pageView", pageView);
		return Common.ROOT_PATH+"/background/article/article_list";
	}
	
	/**
	 * 根据id删除文章
	 * @param model
	 * @param articleId
	 * @return
	 */
	@RequestMapping(value="deleteById")
	public String deleteById(Model model,String articleId){
		articleService.delete(articleId);
		return "redirect:query.html";
	}
	
	/**
	 * 查询单条记录
	 * @param model
	 * @param articleId
	 * @param type
	 * @return
	 */
	@RequestMapping(value="getById")
	public String getById(Model model,String articleId,int type){
		Article article = articleService.getById(articleId);
		model.addAttribute("article", article);
		if(type == 1){
			return Common.ROOT_PATH+"/background/article/article_edit";
		}else{
			return Common.ROOT_PATH+"/background/article/article_show";
		}
	}
	
	/**
	 * 更新修改的文章信息
	 * @param model
	 * @param article
	 * @return
	 */
	@RequestMapping(value="update")
	public String updateArticle(Model model,Article article){
		articleService.modify(article);
		return "redirect:query.html";
	}
	
	@RequestMapping(value="deleteAll")
	public String deleteAll(String[] check,Model model){
		for(String id : check){
			articleService.delete(id);
		}
		return "redirect:query.html";
	}
}
