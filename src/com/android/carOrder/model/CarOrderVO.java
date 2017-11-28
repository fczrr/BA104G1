package com.android.carOrder.model;


import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.android.carDetailVO.model.CarDetailVO;

public class CarOrderVO implements Serializable{
    private String orderNo;
    private String memNo;
    private Timestamp orderDate;
    private String orderStatus;
    private Integer carTypeNo;
    private List<CarDetailVO> detailList = new ArrayList<>();

    public CarOrderVO(){}

    public CarOrderVO(String orderNo, String memNo, Timestamp orderDate, String orderStatus,
                      List<CarDetailVO> detailList) {
        super();
        this.orderNo = orderNo;
        this.memNo = memNo;
        this.orderDate = orderDate;
        this.orderStatus = orderStatus;
        this.detailList = detailList;
    }

    public String getOrderNo() {
        return orderNo;
    }
    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }
    public String getMemNo() {
        return memNo;
    }
    public void setMemNo(String memNo) {
        this.memNo = memNo;
    }
    public Timestamp getOrderDate() {
        return orderDate;
    }
    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }
    public String getOrderStatus() {
        return orderStatus;
    }
    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Integer getCarTypeNo() {
        return carTypeNo;
    }

    public void setCarTypeNo(Integer carTypeNo) {
        this.carTypeNo = carTypeNo;
    }

    public List<CarDetailVO> getDetailList() {
        return detailList;
    }

    public void setDetailList(List<CarDetailVO> detailList) {
        this.detailList = detailList;
    }
}
