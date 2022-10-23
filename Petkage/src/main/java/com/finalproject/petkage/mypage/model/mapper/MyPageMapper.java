package com.finalproject.petkage.mypage.model.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.finalproject.petkage.market.model.vo.Payment;
import com.finalproject.petkage.member.model.vo.Member;
import com.finalproject.petkage.member.model.vo.Pet;
import com.finalproject.petkage.member.model.vo.Seller;
import com.finalproject.petkage.mypage.model.vo.Order;
import com.finalproject.petkage.review.model.vo.Review;

@Mapper
public interface MyPageMapper {
	
	int getOrderAllCount();

	List<Payment> getOrderList(RowBounds rowBounds, int no);
	
	int getWhReviewAllCount();

	List<Review> getWhReviewList(RowBounds rowBounds, int no);
	
	int getPdReviewAllCount();

	List<Payment> getPdReviewList(RowBounds rowBounds, int no);

	int review_fupload(Review review);

}
