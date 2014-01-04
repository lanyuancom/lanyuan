package com.lanyuan.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.entity.BuyItem;
import com.lanyuan.entity.OrderList;
import com.lanyuan.entity.OrderManager;
import com.lanyuan.entity.Product;
import com.lanyuan.entity.ProductBrand;
import com.lanyuan.entity.ShoppingCar;
import com.lanyuan.entity.User;
import com.lanyuan.entity.UserLoginList;
import com.lanyuan.service.OrderListService;
import com.lanyuan.service.OrderManagerService;
import com.lanyuan.service.ProductBrandService;
import com.lanyuan.service.ProductService;
import com.lanyuan.service.UserLoginListService;
import com.lanyuan.service.UserService;
import com.lanyuan.util.Common;
import com.lanyuan.util.Md5Tool;
import com.lanyuan.util.PageView;
import com.lanyuan.util.SiteSessionListener;

/**
 * 
 * @author Dylan
 * 
 */
@Controller
@RequestMapping(value = "/")
public class IndexController {
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductBrandService productBrandService;
	@Autowired
	private UserService userService;
	@Autowired
	private UserLoginListService userLoginListService;
	@Autowired
	private OrderManagerService orderManagerService;
	@Autowired
	private OrderListService orderListService;

	@RequestMapping(value = "index")
	public String addUI(Model model, ProductBrand productBrand, Product product) {
		model.addAttribute("resultList", productService.queryAll(product));
		model.addAttribute("brandList", productBrandService.queryAll(productBrand));
		return "/web/shopping/index";
	}
	@RequestMapping(value = "lianxi")
	public String lianxi(Model model, ProductBrand productBrand) {
		model.addAttribute("brandList", productBrandService.queryAll(productBrand));
		return "/web/shopping/lianxi";
	}
	@RequestMapping(value = "baozhangzhongxin")
	public String baozhangzhongxin(Model model, ProductBrand productBrand) {
		model.addAttribute("brandList", productBrandService.queryAll(productBrand));
		return "/web/shopping/baozhangzhongxin";
	}
	@RequestMapping(value = "payOrher")
	public String payOrher(Model model, ProductBrand productBrand) {
		model.addAttribute("brandList", productBrandService.queryAll(productBrand));
		return "/web/shopping/payOrher";
	}
	@RequestMapping(value = "tuihuho")
	public String tuihuho(Model model, ProductBrand productBrand) {
		model.addAttribute("brandList", productBrandService.queryAll(productBrand));
		return "/web/shopping/tuihuho";
	}
	@RequestMapping(value = "yinsi")
	public String yinsi(Model model, ProductBrand productBrand) {
		model.addAttribute("brandList", productBrandService.queryAll(productBrand));
		return "/web/shopping/yinsi";
	}
	@RequestMapping(value = "gouwuzhinan")
	public String gouwuzhinan(Model model, ProductBrand productBrand) {
		model.addAttribute("brandList", productBrandService.queryAll(productBrand));
		return "/web/shopping/gouwuzhinan";
	}
	@RequestMapping(value = "shopInfo")
	public String shopInfo(Model model, ProductBrand productBrand, Product product) {
		model.addAttribute("brandList", productBrandService.queryAll(productBrand));
		model.addAttribute("resultList", productService.queryAll(product));
		product = productService.getById(String.valueOf(product.getProductId()));
		updateLookNums(product);
		model.addAttribute("product", product);
		return "/web/shopping/shopInfo";
	}

	@RequestMapping(value = "shopSearch")
	public String shopSearch(Model model, ProductBrand productBrand, Product product) {
		model.addAttribute("brandList", productBrandService.queryAll(productBrand));
		model.addAttribute("resultList", productService.queryAll(product));
		return "/web/shopping/shopSearch";
	}

	@RequestMapping(value = "productBrandList")
	public String productBrandList(Model model, ProductBrand productBrand, String pageNow, Product product) {
		model.addAttribute("brandList", productBrandService.queryAll(productBrand));
		PageView pageView = null;
		if (Common.isEmpty(pageNow)) {
			pageView = new PageView(1);
		} else {
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		pageView = productService.query(pageView, product);
		model.addAttribute("pageView", pageView);
		return "/web/shopping/productBrandList";
	}

	// ############## 购物车　　##########################
	@RequestMapping(value = "shoppingCar")
	public String shoppingCar(HttpServletRequest request, ProductBrand productBrand, Product product) {
		request.setAttribute("brandList", productBrandService.queryAll(productBrand));
		ShoppingCar shoppingCar = (ShoppingCar) request.getSession().getAttribute("shoppingCar");
		// 如果不存在
		if (shoppingCar == null) {
			// 再看看用户是否打开新窗口．获得原来的sessionID从而获得购物车
			String sid = SiteSessionListener.getSessionID();
			System.out.println("获得原来的sessionID从而获得购物车           " + sid);
			if (sid != null) {
				// 获得原先的session
				HttpSession session = SiteSessionListener.getSession(sid);
				// 从以前session获得
				shoppingCar = (ShoppingCar) session.getAttribute("shoppingCar");

			}

		}

		// 如果以前都不存在购物车　则要创建购物车
		if (shoppingCar == null) {
			shoppingCar = new ShoppingCar();
			request.getSession().setAttribute("shoppingCar", shoppingCar);

		}
		String pid = product.getProductId() + "";
		if (!"0".equals(pid)) {

			// System.out.println("你要购买的商品ID       " + productId);
			product = this.productService.getById(pid);
			BuyItem item = new BuyItem(product);
			// 放进购物车
			shoppingCar.addBuyItem(item);
		}
		request.setAttribute("shoppingCar", shoppingCar);
		return "/web/shopping/shoppingCar";
	}

	// 删除某个商品
	@RequestMapping(value = "deleteCar")
	public String deleteCar(Product product, ProductBrand productBrand, HttpServletRequest request) throws Exception {
		request.setAttribute("brandList", productBrandService.queryAll(productBrand));
		ShoppingCar shoppingCar = (ShoppingCar) request.getSession().getAttribute("shoppingCar");
		shoppingCar.deleteBuyItem(new BuyItem(product));
		return "/web/shopping/shoppingCar";
	}

	// 修改数量
	@ResponseBody
	@RequestMapping(value = "updateAmount")
	public Map<String, String> updateAmount(HttpServletRequest request) throws Exception {
		ShoppingCar shoppingCar = (ShoppingCar) request.getSession().getAttribute("shoppingCar");
		Map<String, String> map = new HashMap<String, String>();
		// 循环取得购物车所有的shoppingCar.getItems()商品
		for (BuyItem item : shoppingCar.getItems()) {
			// //循环取得商品的ID
			String key = "amount_" + item.getProduct().getProductId();
			System.out.println("数量 id      " + key);
			// 取得数量
			String amountStr = request.getParameter(key);
			System.out.println("修改数量       " + amountStr);
			if (amountStr != null && !"".equals(amountStr)) {
				int amount = Integer.parseInt(amountStr);
				if (amount > 0) {
					item.setAmount(amount);
					System.out.println("修改后　　　　　" + item.getAmount());
				}
				map.put("amount", (item.getProduct().getPrice() * amount) + "");
				break;
			}
		}
		map.put("totalPrice", shoppingCar.getTotalSellPrice() + "");
		return map;

	}

	// 清空购物车
	@RequestMapping(value = "deleteAll")
	public String deleteAll(ProductBrand productBrand, HttpServletRequest request) throws Exception {
		ShoppingCar shoppingCar = (ShoppingCar) request.getSession().getAttribute("shoppingCar");
		shoppingCar.deleteAll();
		request.setAttribute("brandList", productBrandService.queryAll(productBrand));
		return "/web/shopping/shoppingCar";
	}

	// -------------定单
	// 管理----------------------------------------------------------------------------
	// 确认定单
	@RequestMapping(value = "confirmOrder")
	public String confirmOrder(ProductBrand productBrand, HttpServletRequest request) throws Exception {
		request.setAttribute("brandList", productBrandService.queryAll(productBrand));
		// 判断用户是否有登录
		if (request.getSession().getAttribute("webUser") == null) {
			return "/web/shopping/shopdenglu";
		} else {
			// 客户下单时..自动生成一个当前时期编号
			int orderId1 = (int) (8999999 * Math.random() + 10000000);
			int orderId2 = (int) (8999999 * Math.random() + 10000000);
			StringBuffer strb = new StringBuffer();
			strb.append(orderId1);
			strb.append(orderId2);
			System.out.println("定单编号   " + strb);
			request.getSession().setAttribute("code", strb);
			// 购物车已经在session中了，，可以这里只要生成定单号
			return "/web/shopping/confirmOrder";
		}

	}

	// 提交定单
	@RequestMapping(value = "submitOrder")
	public String submitOrder(ProductBrand productBrand, HttpServletRequest request) throws Exception {
		request.setAttribute("brandList", productBrandService.queryAll(productBrand));
		// 获得定单code
		String orderId =request.getSession().getAttribute("code").toString();
		// 判断用户是否有登录//判断购物车是否空
		if (request.getSession().getAttribute("webUser") == null) {
			return "/web/shopping/denglu";
		} else if (request.getSession().getAttribute("shoppingCar") == null || orderId == null) {
			return "/web/shopping/shoppingCar";
		} else {
			
			User user = (User)request.getSession().getAttribute("webUser");
			// 获得用户id
			String userId = user.getUserId()+"";
			ShoppingCar shoppingCar = (ShoppingCar) request.getSession().getAttribute("shoppingCar");

			if (userId != null && shoppingCar != null) {
				for (BuyItem item: shoppingCar.getItems()) {

					OrderList orderList = new OrderList();
					orderList.setOrderId(orderId);
					orderList.setPrice(item.getProduct().getPrice());
					orderList.setProductId(item.getProduct().getProductId());
					orderList.setProductName(item.getProduct().getProductName());
					// 购买单个商品的数量
					orderList.setProductNum(item.getAmount());
					// 单个商品总价
					orderList.setProductSumPrice(item.getProduct().getPrice()*item.getAmount());
					// 这样可以从FormMap中获得某个商品buyItem.getFormMap().get("productName")
					orderList.setUserAddress(user.getUserAddress());
					orderList.setUserId(Integer.parseInt(userId));
					orderList.setUserPhone(user.getUserPhone());
					this.orderListService.add(orderList);
				}

			}
			OrderManager orderManager = new OrderManager();
			orderManager.setOrderId(orderId);
			orderManager.setOrderSunPrice(shoppingCar.getTotalSellPrice());
			orderManager.setUserId(Integer.parseInt(userId));
			// 所有商品总和
			this.orderManagerService.add(orderManager);

			request.setAttribute("orderId", orderId);
			request.setAttribute("orderSunPrice", shoppingCar.getTotalSellPrice() + "");
			
			// 提交定单成功后清空购物车
			request.getSession().removeAttribute("code");
			request.getSession().removeAttribute("shoppingCar");

			return "/web/shopping/submitSuccess";
		}

	}

	/**
	 * 登录界面
	 * 
	 * @param productBrand
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "denglu")
	public String denglu(ProductBrand productBrand, User user, HttpServletRequest request) {
		request.setAttribute("brandList", productBrandService.queryAll(productBrand));
		request.getSession().removeAttribute("webUser");
		return "/web/shopping/denglu";
	}

	/**
	 * 登录处理
	 * 
	 * @param productBrand
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "login")
	public String login(ProductBrand productBrand, User user, HttpServletRequest request) {
		request.setAttribute("brandList", productBrandService.queryAll(productBrand));
		request.getSession().removeAttribute("webUser");
		String pass = Md5Tool.getMd5(user.getUserPassword());
		if (!Common.isEmpty(user.getUserName()) || !Common.isEmpty(pass)) {
			user.setUserPassword(pass);
			User u = userService.login(user);
			if (u != null) {
				request.getSession().setAttribute("webUser", u);
				request.getSession().setAttribute("webUserId", u.getUserId());
				// 增加登录次数
				UserLoginList userLoginList = new UserLoginList();
				userLoginList.setUserId(u.getUserId());
				userLoginList.setLoginIp(Common.toIpAddr(request));
				this.userLoginListService.add(userLoginList);
				request.getSession().removeAttribute("error");
				return "redirect:userInfo.html";
			} else {
				request.getSession().setAttribute("error", "error");
				return "/web/shopping/denglu";
			}
		} else {
			return "/web/shopping/denglu";
		}
	}

	@RequestMapping(value = "userInfo")
	public String userInfo(ProductBrand productBrand, String pageNow, HttpServletRequest request) {
		request.setAttribute("brandList", productBrandService.queryAll(productBrand));
		if (request.getSession().getAttribute("webUser") == null) {
			return "/web/shopping/denglu";
		}

		PageView pageView = null;
		if (Common.isEmpty(pageNow)) {
			pageView = new PageView(1);
		} else {
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		pageView.setPageSize(5);
		OrderManager orderManager = new OrderManager();
		orderManager.setUserId(Integer.parseInt(request.getSession().getAttribute("webUserId").toString()));
		pageView = orderManagerService.query(pageView, orderManager);
		request.setAttribute("pageView", pageView);
		return "/web/shopping/userInfo";
	}
	@RequestMapping(value = "deleteOrderById")
	public String deleteOrderById(String orderId){
		this.orderManagerService.delete(orderId);
		return "redirect:userInfo.html";
	}
	// 先登录后提交订单
	@RequestMapping(value = "shopdenglu")
	public String shopdenglu(ProductBrand productBrand, User user, HttpServletRequest request) {
		request.setAttribute("brandList", productBrandService.queryAll(productBrand));
		String pass = Md5Tool.getMd5(user.getUserPassword());
		if (!Common.isEmpty(user.getUserName()) || !Common.isEmpty(pass)) {
			user.setUserPassword(pass);
			User u = userService.login(user);
			if (u != null) {
	
				request.getSession().setAttribute("webUser", u);
				request.getSession().setAttribute("webUserId", u.getUserId());
				request.getSession().removeAttribute("err");
	
				// 增加登录次数
				UserLoginList userLoginList = new UserLoginList();
				userLoginList.setUserId(u.getUserId());
				userLoginList.setLoginIp(Common.toIpAddr(request));
				this.userLoginListService.add(userLoginList);
				return "redirect:confirmOrder.html";
			}
		}
		request.getSession().setAttribute("err", "err");
		return "/web/shopping/shopdenglu";
	}
	// 先登录后提交订单
	@RequestMapping(value = "orderByIdList")
	public String orderByIdList(ProductBrand productBrand,String pageNow, HttpServletRequest request) {
		request.setAttribute("brandList", productBrandService.queryAll(productBrand));
		if (request.getSession().getAttribute("webUser")==null) {
			return "/web/shopping/denglu";
		}
		OrderManager resultMap = orderManagerService.getById(request.getParameter("orderId"));
		request.setAttribute("resultMap",resultMap);
		PageView pageView = null;
		if (Common.isEmpty(pageNow)) {
			pageView = new PageView(1);
		} else {
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		pageView.setPageSize(5);
		OrderList orderList = new OrderList();
		orderList.setOrderId(request.getParameter("orderId"));
		pageView = orderListService.query(pageView, orderList);
		//分页对象
		request.setAttribute("pageView",pageView);
		return "/web/shopping/orderInfo";
	}
	@RequestMapping(value = "updateUI")
	public String updateUI(ProductBrand productBrand,HttpServletRequest request) {
		request.setAttribute("brandList", productBrandService.queryAll(productBrand));
		if (request.getSession().getAttribute("webUser")==null) {
			return "/web/shopping/denglu";
		}
		return "/web/shopping/updateInfo";
	}
	@RequestMapping(value = "registerUI")
	public String registerUI(ProductBrand productBrand,HttpServletRequest request) {
		request.setAttribute("brandList", productBrandService.queryAll(productBrand));
		if (request.getSession().getAttribute("webUser")==null) {
			return "/web/shopping/registerUI";
		}
		return "/web/shopping/updateInfo";
	}
	@ResponseBody
	@RequestMapping(value = "ajaxName")
	public Map<String, String> ajaxName(Model model, String userName) {
		User user=userService.querySingleUser(userName);
		Map<String, String> map = new HashMap<String, String>();
		if (user == null) {
			map.put("messages", "true");
		}else{
			map.put("messages", "false");
		}
		return map;
	}
	@RequestMapping(value = "register")
	public String register(User user,HttpServletRequest request) {
		try {
			user.setUserPassword(Md5Tool.getMd5(user.getUserPassword()));
			userService.add(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/web/shopping/registerOK";
	}
	
	@RequestMapping(value = "updateInfo")
	public String updateInfo(ProductBrand productBrand,User user, HttpServletRequest request) {
		request.setAttribute("brandList", productBrandService.queryAll(productBrand));
		if (request.getSession().getAttribute("webUser")==null) {
			return "/web/shopping/denglu";
		}
		this.userService.modify(user);
		User resultMap = userService.getById(user.getUserId()+"");
		request.getSession().setAttribute("webUser", resultMap);
		request.getSession().setAttribute("webUserId", resultMap.getUserId());
		request.setAttribute("update", "0");
		return "/web/shopping/updateInfo";
	}
	
	/**
	 * 提交订单时修改收货信息
	 * @param productBrand
	 * @param user
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "updateUser")
	public Map<String, String> updateUser(User user, HttpServletRequest request) {
		this.userService.modify(user);
		User resultMap = userService.getById(user.getUserId()+"");
		Map<String, String> map = new HashMap<String, String>();
		if (resultMap == null) {
			map.put("messages", "false");
		}else{
			request.getSession().setAttribute("webUser", resultMap);
			request.getSession().setAttribute("webUserId", resultMap.getUserId());
			map.put("messages", "true");
		}
		return map;
	}
	@RequestMapping(value = "logoOut")
	public String logoOut(HttpServletRequest request){
		request.getSession().removeAttribute("webUser");
		return "redirect:denglu.html";
	}
	/**
	 * 更新浏览次数
	 */
	public void updateLookNums(Product product) {
		if (null != product) {
			String s = product.getProductLookNuns();
			if (!Common.isEmpty(s)) {
				int sum = Integer.parseInt(s);
				sum += 1;
				product.setProductLookNuns(String.valueOf(sum));
				this.productService.updateLookNuns(product);
			}
		}
	}
}
