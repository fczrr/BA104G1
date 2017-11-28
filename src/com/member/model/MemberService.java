package com.member.model;


import java.sql.Timestamp;
import java.util.List;


public class MemberService {
	private MemberDAO_interface dao;
	
	public MemberService(){
		dao = new MemberJNDIDAO();
	}
	
	public MemberVO addMember(String memName,String memPhone,String memGender,String memEmail,
			String address,Integer point,String memId,String memPwd,String memSratus,String chkIp,Timestamp memLoginTime){
		MemberVO memberVO = new MemberVO();
		memberVO.setMemName(memName);
		memberVO.setMemPhone(memPhone);
		memberVO.setMemGender(memGender);
		memberVO.setMemEmail(memEmail);
		memberVO.setAddress(address);
		memberVO.setPoint(point);
		memberVO.setMemId(memId);
		memberVO.setMemPwd(memPwd);
		memberVO.setMemSratus(memSratus);
		memberVO.setChkIp(chkIp);
		memberVO.setMemLoginTime(memLoginTime);
		
		dao.insert(memberVO);
		return memberVO;
	}
	public List<MemberVO> getStatus(String status){
		return dao.getStatus(status);
	}
	public MemberVO findByPrimaryKey(String memNo){
		return dao.findByPrimaryKey(memNo);
	}
	
	
	
	public MemberVO updateMember(String memName,String memEmail,String memId,String memPwd,Timestamp memLoginTime){
		MemberVO memberVO = new MemberVO();
		memberVO.setMemName(memName);
		memberVO.setMemEmail(memEmail);
		memberVO.setMemId(memId);
		memberVO.setMemPwd(memPwd);
		memberVO.setMemLoginTime(memLoginTime);
		dao.update(memberVO);
		return memberVO;
	}
	
	
	public MemberVO updateMember(MemberVO memberVO){
		MemberVO memVO = memberVO;
		dao.update(memVO);
		return memVO;
	}
	public void updateStatus(String memSratus){
		MemberVO memVO = new MemberVO();
		memVO.setMemSratus(memSratus);
		
		dao.update(memVO);
	}
	
	
	public void deleteEmp(String memNo) {
		dao.delete(memNo);
	}
	
	public MemberVO getOneMemById(String memId){
		return dao.findByMemId(memId);
	}
	
	
	public MemberVO getOneMemByNo(String memNo) {
		return dao.findByPrimaryKey(memNo);
	}

	public List<MemberVO> getAll() {
		return dao.getAll();
	}
	public void updatePoint(Integer point, String memNo){	
		dao.update_point(point, memNo);
	}
	
}
