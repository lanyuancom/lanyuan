package com.lanyuan.entity;
public class Product {

	private static final long serialVersionUID = 1L;

	private int productId;

	private int productBrandId;
	
	private int parentId;
	
	private String productBrandName;
	
	private String bigBrandName;

	private String productName;

	private String productImagesUrl;

	private float price;

	private String productUnit;

	private String productLookNuns;

	private String productProfile;

	private String productProduce;

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getProductBrandId() {
		return productBrandId;
	}

	public void setProductBrandId(int productBrandId) {
		this.productBrandId = productBrandId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductImagesUrl() {
		return productImagesUrl;
	}

	public void setProductImagesUrl(String productImagesUrl) {
		this.productImagesUrl = productImagesUrl;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getProductUnit() {
		return productUnit;
	}

	public void setProductUnit(String productUnit) {
		this.productUnit = productUnit;
	}

	public String getProductLookNuns() {
		return productLookNuns;
	}

	public void setProductLookNuns(String productLookNuns) {
		this.productLookNuns = productLookNuns;
	}

	public String getProductProfile() {
		return productProfile;
	}

	public void setProductProfile(String productProfile) {
		this.productProfile = productProfile;
	}

	public String getProductProduce() {
		return productProduce;
	}

	public void setProductProduce(String productProduce) {
		this.productProduce = productProduce;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public String getProductBrandName() {
		return productBrandName;
	}

	public void setProductBrandName(String productBrandName) {
		this.productBrandName = productBrandName;
	}

	public String getBigBrandName() {
		return bigBrandName;
	}

	public void setBigBrandName(String bigBrandName) {
		this.bigBrandName = bigBrandName;
	}

}