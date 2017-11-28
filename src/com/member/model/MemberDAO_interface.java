package com.member.model;

import java.util.List;

import com.member.model.MemberVO;

public interface MemberDAO_interface {
	public void insert(MemberVO memberVO);
	public void update(MemberVO memberVO);
	public void delete(String memNo);
	public MemberVO findByPrimaryKey(String memNo);
	public MemberVO findByMemId(String memId);
	public List<MemberVO> getStatus(String memSratus);
	public List<MemberVO> getAll();
	public void update_point(Integer point, String memNo);
	public void update_status(String sratus);
}
