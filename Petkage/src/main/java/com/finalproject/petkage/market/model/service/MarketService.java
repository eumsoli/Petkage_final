package com.finalproject.petkage.market.model.service;

import java.util.List;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.vo.Cart;
import com.finalproject.petkage.market.model.vo.Product;
import com.finalproject.petkage.review.model.vo.Review;

public interface MarketService {

	int getProductCount();
	
	List<Product> getProductList(PageInfo pageInfo);

	List<Product> getProductList(PageInfo pageInfo, Product product);

	List<Product> sortProductListFromLowest(PageInfo pageInfo, Product product);

	List<Product> sortProductListFromHighest(PageInfo pageInfo, Product product);
	
	Product findProductByNo(int proNo);
	
	int save(Product product);

	int delete(int proNo);

	int addCart(Cart cart);

	int deleteCart(int cartNo);
	
	int updateCart(Cart cart);
	
	List<Cart> getCartList(int no);

	void setProductRating(int proNo);
	
	int getReviewCount(int proNo);
	
	List<Review> getReviewList(PageInfo pageInfo, Review review, int proNo);

    List<Product> getListProductBest();
}
