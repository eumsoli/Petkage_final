package com.finalproject.petkage.market.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
    /* request */
    
    private String payNo;
    
    private int no;
    
    private String address;
    
    private String subaddress;
    
    private String payMethod;
    
    private int totalDelFee;

    private int totalPrice;
    
    private int usingPoint;
    
    private int totalSavingPoint;
    
    private int totalPriceAfterUsingPoint;
    
    private String orderComment;
    
    private String orderStatus;
    
    private String payCreatedAt;
    
    private List<PayItems> orders;
    
    public void getPriceInfo() {
    	
    	totalPriceAfterUsingPoint = totalPrice + totalDelFee - usingPoint;
    }
    
 // view에서 받아올 값
    private int payItemNo;
    
 	private int proNo;
 	
 	private int proCount;
    
 // DB에서 받아올 값
 	private String proName;
 	
 	private String proBrand;
 	
 	private int proOPrice;
 	
 	private int proSPrice;
 	
 	private String renamedFileName;
 	
 	private int proDelFee;
 	
 	private int proLTime;
}
