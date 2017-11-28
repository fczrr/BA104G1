package com.android.member.model;

import java.util.List;

public interface MemberDAO_interface {
	public void insert(MemberVO memberVO);
	public void update(MemberVO memberVO);
	public void delete(String memNo);
	public MemberVO findByPrimaryKey(String memNo);
	public MemberVO findByMemId(String memId);
	public List<MemberVO> getAll();
	public List<TheCaredVO> getCared(String memNo);
}
