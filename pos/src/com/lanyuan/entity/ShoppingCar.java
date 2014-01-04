package com.lanyuan.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * 购物车
 */
public class ShoppingCar {
	/* 购物项集合 */
	private List<BuyItem> items = new ArrayList<BuyItem>();
	
	/**
	 * 添加购物项
	 * @param item
	 */
	public void addBuyItem(BuyItem item){
		if(items.contains(item)){//如果购物项已经存在于购物车,累加其购买数量
			//循环出来，，再数量加一
			for(BuyItem bItem : items){
				if(bItem.equals(item)){
					bItem.setAmount(bItem.getAmount()+1);break;
				}
			}
		}else{
		
			items.add(item);
		}
	}
	/**
	 * 删除购物项
	 * @param item
	 */
	public void deleteBuyItem(BuyItem item){
		//表示集合中是否相等
		if(this.items.contains(item))
			this.items.remove(item);
	}
	/**
	 * 清空购物车
	 */
	public void deleteAll(){
		items.clear();
	}
	public List<BuyItem> getItems() {
		return items;
	}
	/**
	 * 计算商品的总金额
	 */
	public float getTotalSellPrice(){
		float result = 0f;
		for(BuyItem item : items){
			if(null!=item.getProduct())
			result += item.getProduct().getPrice() * item.getAmount();
		}
		return result;
	}
}
	