package com.android.websocket;

import java.util.List;

public interface EmpServiceDetailDAO_interface {
	public void insert(String empNo, String memNo);
	public List<EmpServiceDetailVO> getByMemNo(String memNo);
	public List<EmpServiceDetailVO> getByEmpNo(String empNo);
	public EmpServiceDetailVO getOne(EmpServiceDetailVO empServiceDetailVO);
	public void update(EmpServiceDetailVO empServiceDetailVO);
}
