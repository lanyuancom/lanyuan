package com.lanyuan.entity;


/**
 * 购物项
 */
public class BuyItem {
	/* 所购商品 */
	
	private Product product = new Product();
	/* 购买数量 */
	private int amount = 1;
	public BuyItem(){}

	public BuyItem(Product product){
		this.product = product;
	}
	
	public BuyItem(Product product, int amount) {
		super();
		this.product = product;
		this.amount = amount;
	}
	
	
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((product == null) ? 0 : product.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BuyItem other = (BuyItem) obj;
		if (product == null) {
			if (other.product != null)
				return false;
		} else if (product.getProductId()!=other.product.getProductId())
			return false;
		return true;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
}

