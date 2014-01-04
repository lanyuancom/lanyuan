package com.lanyuan.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lanyuan.entity.ProductBrand;
import com.lanyuan.service.ProductBrandService;
import com.lanyuan.util.Common;
import com.lanyuan.util.PageView;

@Controller
@RequestMapping(value="/background/productBrand/")
public class ProductBrandController {
	@Autowired
	private ProductBrandService productBrandService;
	
	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(Model model,ProductBrand productBrand){
		model.addAttribute("brandNameList", productBrandService.queryAll(productBrand));
		return Common.ROOT_PATH+"/background/productBrand/add";
	} 
	
	/**
	 * 保存新增文章
	 * @param model
	 * @param productBrand
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(Model model,ProductBrand productBrand,HttpServletRequest request){
		productBrandService.add(productBrand);
		return "redirect:query.html";
	}
	
	/**
	 * 分页查询文章
	 * @param model
	 * @param productBrand
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="query")
	public String query(Model model,ProductBrand productBrand,String pageNow){
		PageView pageView = null;
		if(Common.isEmpty(pageNow)){
			pageView = new PageView(1);
		}else{
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		pageView = productBrandService.query(pageView, productBrand);
		model.addAttribute("pageView", pageView);
		model.addAttribute("brandNameList", productBrandService.queryAll(productBrand));
		
		return Common.ROOT_PATH+"/background/productBrand/list";
	}
	
	/**
	 * 根据id删除文章
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deleteById")
	public String deleteById(Model model,String id){
		productBrandService.delete(id);
		return "redirect:query.html";
	}
	
	/**
	 * 查询单条记录
	 * @param model
	 * @param id
	 * @param type
	 * @return
	 */
	@RequestMapping(value="getById")
	public String getById(Model model,String id,int type){
		ProductBrand productBrand = productBrandService.getById(id);
		model.addAttribute("productBrand", productBrand);
		model.addAttribute("brandNameList", productBrandService.queryAll(productBrand));
		if(type == 1){
			return Common.ROOT_PATH+"/background/productBrand/edit";
		}else{
			return Common.ROOT_PATH+"/background/productBrand/show";
		}
	}
	
	/**
	 * 更新修改的文章信息
	 * @param model
	 * @param productBrand
	 * @return
	 */
	@RequestMapping(value="update")
	public String updateProductBrand(Model model,ProductBrand productBrand){
		productBrandService.modify(productBrand);
		return "redirect:query.html";
	}
	
	@RequestMapping(value="deleteAll")
	public String deleteAll(String[] check,Model model){
		for(String id : check){
			productBrandService.delete(id);
		}
		return "redirect:query.html";
	}
}
