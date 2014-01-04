package com.lanyuan.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lanyuan.entity.Product;
import com.lanyuan.entity.ProductBrand;
import com.lanyuan.service.ProductBrandService;
import com.lanyuan.service.ProductService;
import com.lanyuan.upload.UploadUtil;
import com.lanyuan.util.Common;
import com.lanyuan.util.PageView;

/**
 * 
 * @author Dylan
 *
 */
@Controller
@RequestMapping(value="/background/product/")
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductBrandService productBrandService;
	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(Model model,ProductBrand productBrand){
		model.addAttribute("brandNameList", productBrandService.queryAll(productBrand));
		return Common.ROOT_PATH+"/background/product/add";
	} 
	
	/**
	 * 保存新增文章
	 * @param model
	 * @param product
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(Model model,Product product,HttpServletRequest request){
		//转型为MultipartHttpRequest(重点的所在)   
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;   
         //  获得第1张图片（根据前台的name名称得到上传的文件）    
        MultipartFile imgFile1  =  multipartRequest.getFile("upload");   
        if(imgFile1!=null){
        	 UploadUtil uploadutil = new UploadUtil();
             try {
     			uploadutil.uploadImage1(request, imgFile1, imgFile1.getContentType(), imgFile1.getOriginalFilename());
     		} catch (IOException e) {
     			
     		}
             product.setProductImagesUrl(uploadutil.getImagepath());
        }
		productService.add(product);
		return "redirect:query.html";
	}
	
	/**
	 * 分页查询文章
	 * @param model
	 * @param product
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="query")
	public String query(Model model,Product product,ProductBrand productBrand,String pageNow){
		PageView pageView = null;
		if(Common.isEmpty(pageNow)){
			pageView = new PageView(1);
		}else{
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		pageView = productService.query(pageView, product);
		model.addAttribute("pageView", pageView);
		model.addAttribute("brandNameList", productBrandService.queryAll(productBrand));
		return Common.ROOT_PATH+"/background/product/list";
	}
	
	/**
	 * 根据id删除文章
	 * @param model
	 * @param productId
	 * @return
	 */
	@RequestMapping(value="deleteById")
	public String deleteById(Model model,String productId){
		productService.delete(productId);
		return "redirect:query.html";
	}
	
	/**
	 * 查询单条记录
	 * @param model
	 * @param productId
	 * @param type
	 * @return
	 */
	@RequestMapping(value="getById")
	public String getById(Model model,String productId,int type,ProductBrand productBrand){
		model.addAttribute("brandNameList", productBrandService.queryAll(productBrand));
		Product product = productService.getById(productId);
		model.addAttribute("product", product);
		if(type == 1){
			return Common.ROOT_PATH+"/background/product/edit";
		}else{
			return Common.ROOT_PATH+"/background/product/show";
		}
	}
	
	/**
	 * 更新修改的文章信息
	 * @param model
	 * @param product
	 * @return
	 */
	@RequestMapping(value="update")
	public String updateProduct(Model model,Product product){
		productService.modify(product);
		return "redirect:query.html";
	}
	
	@RequestMapping(value="uploadUI")
	public String uploadUI(Model model,Product product){
		productService.modify(product);
		return Common.ROOT_PATH+"/background/product/upload";
	}
	@RequestMapping(value="upload")
	public String upload(Model model,Product product,HttpServletRequest request){
		//转型为MultipartHttpRequest(重点的所在)   
        MultipartHttpServletRequest multipartRequest  =  (MultipartHttpServletRequest) request;   
         //  获得第1张图片（根据前台的name名称得到上传的文件）    
        MultipartFile imgFile1  =  multipartRequest.getFile("upload");   
        
        UploadUtil uploadutil = new UploadUtil();
        try {
			uploadutil.uploadImage1(request, imgFile1, imgFile1.getContentType(), imgFile1.getOriginalFilename());
		} catch (IOException e) {
			return Common.ROOT_PATH+"/background/product/edit";
		}
        String path = uploadutil.getImagepath();
		deleteImages(path, request);
		product.setProductImagesUrl(path);
		productService.updateImages(product);
		Product pro = productService.getById(product.getProductId()+"");
		model.addAttribute("product", pro);
		return Common.ROOT_PATH+"/background/product/edit";
	}
	/**
	 * 删除产品时同时删除图片
	 * @param path
	 */
	public void deleteImages(String path,HttpServletRequest request){
		String imagePath = request.getSession().getServletContext().getRealPath(path);
		if (imagePath != null) {
			File images = new File(imagePath);
			if(images.exists()){ 
				images.delete();
			}
		}
	}
	@RequestMapping(value="deleteAll")
	public String deleteAll(String[] check,Model model){
		for(String id : check){
			productService.delete(id);
		}
		return "redirect:query.html";
	}
}
