package com.finalproject.petkage.wherego.model.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.finalproject.petkage.common.util.MultipartFileUtil;
import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.review.model.vo.Review;
import com.finalproject.petkage.wherego.model.mapper.WheregoMapper;
import com.finalproject.petkage.wherego.model.vo.Heart;
import com.finalproject.petkage.wherego.model.vo.Room;
import com.finalproject.petkage.wherego.model.vo.Wherego;
import com.finalproject.petkage.wherego.model.vo.avgReview;

@Service
public class WheregoServiceImpl implements WheregoService {
	@Autowired
	private WheregoMapper mapper;
	
	@Override
	public List<Wherego> lodging_board() {

		return mapper.lodging_board();
	}

	@Override
	public List<Wherego> cafe_board() {
		
		return mapper.cafe_board();
	}

	@Override
	public List<Wherego> food_board() {
		
		return mapper.food_board();
	}

	@Override
	public List<Wherego> hair_board() {
		
		return mapper.hair_board();
	}

	@Override
	public List<Wherego> trip_board() {
		
		return mapper.trip_board();
	}

	@Override
	public List<Wherego> hospital_board() {
		
		return mapper.hospital_board();
	}

	@Override
	public List<Wherego> preschool_board() {
		
		return mapper.preschool_board();
	}

	@Override
	public List<Wherego> bath_board() {

		return mapper.bath_board();
	}

	@Override
	public List<Wherego> petsitter_board() {

		return mapper.petsitter_board();
	}

	@Override
	public int search_list_lod(String search) {

		return mapper.search_list_lod(search);
	}

	@Override
	public List<Wherego> search_board_lod(PageInfo pageInfo, String search) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
        int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);
        
		return mapper.search_board_lod(rowBounds, search);
	}

	// ?????? ????????? ??????
    @Override
    @Transactional
    public int insertWherego_lodging(Wherego wherego) {
        int result = 0;
        int roomNum = wherego.getRoomNum();
        String roomTypeNo = wherego.getRoom().getRoomTypeNo();
        String roomName = wherego.getRoom().getRoomName();
        String roomPrice = wherego.getRoom().getRoomPrice();
        String roomImg = wherego.getRoom().getRoomImg();
        String renameRoomImg = wherego.getRoom().getRenameRoomImg();
        String MInfo = wherego.getRoom().getMInfo();
        String MAmeni = wherego.getRoom().getMAmeni();
        
        System.out.println("????????? : " + roomNum);
        System.out.println("?????????????????? : " + roomTypeNo); 
        System.out.println("????????? : " + roomName); 
        System.out.println("???????????? : " + roomPrice); 
        System.out.println("??????????????? : " + roomImg); 
        System.out.println("????????????????????? : " + renameRoomImg); 
        System.out.println("?????? ?????? : " + MInfo); 
        System.out.println("?????? ?????? : " + MAmeni);
        
        String[] roomTypeNoArr = roomTypeNo.split(",");
        String[] roomNameArr = roomName.split(",");
        String[] roomPriceArr = roomPrice.split(",");
        String[] roomImgArr = roomImg.split(", ");
        String[] renameRoomImgArr = renameRoomImg.split(", ");
        String[] mInfoArr = MInfo.split(",");
        String[] mAmeniArr = MAmeni.split(",");
       
        // ?????? ??????
        result = mapper.insertWherego_lodging(wherego);
       
        wherego.getRoom().setSpotNo(wherego.getSpotNo());

        // ?????? ?????? 
        for (int i = 0; i < roomNum; i++) {
            wherego.getRoom().setRoomTypeNo(roomTypeNoArr[i]);
            wherego.getRoom().setRoomName(roomNameArr[i]);
            wherego.getRoom().setRoomPrice(roomPriceArr[i]);
            wherego.getRoom().setRoomImg(roomImgArr[i]);
            wherego.getRoom().setRenameRoomImg(renameRoomImgArr[i]);
            wherego.getRoom().setMInfo(mInfoArr[i]);
            wherego.getRoom().setMAmeni(mAmeniArr[i]);
            
            System.out.println("??????" + i + "??? ?????? " + wherego.getRoom());
            
            result = mapper.insertRoom(wherego.getRoom());
        }
        
        return result;
    }

    // ?????? ?????? ?????? ???????????? ????????? ??????
    @Override
    @Transactional
    public int insertWherego_others(Wherego wherego) {
        int result = 0;
        
        result = mapper.insertWherego_others(wherego);
        
        return result;
    }
    
    @Override
    public Wherego findBoardByNo_lodging(int no) {
    
        return mapper.findBoardByNo_lodging(no);
    }
    
    @Override
    public Wherego findBoardByNo_cafe(int no) {
    
        return mapper.findBoardByNo_cafe(no);
    }

    // ???????????? ????????? ?????? ??? 10??? ????????? 
    @Override
    public List<Wherego> getListWheregoRecommend() {
        
        return mapper.getListWheregoRecommend();
    }

	@Override
	public int wherego_like(Heart heart) {

		return mapper.wherego_like(heart);
	}

	@Override
	public int insert_like(Heart heart) {

		return mapper.insert_like(heart);
	}

	@Override
	public int delete_like(Heart heart) {
		
		return mapper.delete_like(heart);
		
	}

	@Override
	public List<Wherego> lodging_board_cate(String filter, String location) {

		return mapper.lodging_board_cate(filter, location);
	}

	@Override
	public List<Wherego> cafe_board_cate(String location, String opt) {
		
		return mapper.cafe_board_cate(location, opt);
	}

    @Override
    public Room findBoardByNo_room(int no) {
        
        return mapper.findBoardByNo_room(no);
    }


	
    






}
