package com.employee_photo.model;

import java.util.List;

public interface EmpPhotosDAO_interface {
	public void insert(EmpPhotosVO EmpPhotos);
	public void update(EmpPhotosVO EmpPhotos);

//	public void update(String empNo,byte[] empPhoto);
	public void delete(String empPhotoNo);
	public EmpPhotosVO findByPK(String empPhotoNo);
	public List<EmpPhotosVO> getAllByEMPNO(String empNo);
	public List<EmpPhotosVO> getAll();
}
