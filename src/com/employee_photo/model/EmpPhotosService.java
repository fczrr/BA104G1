package com.employee_photo.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public class EmpPhotosService {
	private EmpPhotosDAO_interface dao = null;
	
	public EmpPhotosService(){
		dao = new EmpPhotosDAO();
	}
	public EmpPhotosVO addEmpPhoto(String empPhtoNo ,String empNo,byte[] empPhoto) {
		EmpPhotosVO empPhotosVO = new EmpPhotosVO();
		empPhotosVO.setEmpPhtoNo(empPhtoNo);
		empPhotosVO.setEmpNo( empNo);
		empPhotosVO.setEmpPhoto(empPhoto);
		dao.insert(empPhotosVO);
		return empPhotosVO;
		
	}
	
	public void addEmpPhoto(EmpPhotosVO empPhotosVO){
		dao.insert(empPhotosVO);
	}
	
	public EmpPhotosVO updateEmpPhoto (String empPhotoNo ,String empNo,byte[] empPhoto) {
		EmpPhotosVO empPhotosVO = new EmpPhotosVO();
		empPhotosVO.setEmpPhtoNo(empPhotoNo);
		empPhotosVO.setEmpNo( empNo);
		empPhotosVO.setEmpPhoto(empPhoto);
		dao.update(empPhotosVO);
		
		return empPhotosVO;

	}
	
	public void updateEmpPhoto(EmpPhotosVO empPhotosVO){
		dao.insert(empPhotosVO);
	}
	
	public void delete(String empPhotoNo){
		dao.delete(empPhotoNo);
	}
	
	public EmpPhotosVO getOneEmpPhoto (String empPhotoNo){
		EmpPhotosVO empPhotosVO = dao.findByPK(empPhotoNo);
		return empPhotosVO;
	}
	
	public List<EmpPhotosVO> getAllByEMPNO(String empNo){
		return dao.getAllByEMPNO(empNo);
	}
	
	
	public static byte[] getPictureByteArray(String path)  {
		FileInputStream fis;
		ByteArrayOutputStream baos = null;
		try {
			fis = new FileInputStream(new File(path));

		baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();
		
		
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(System.err);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(System.err);
		}
		
		return baos.toByteArray();
	}

}
