package com.hcorder.modal;
import java.sql.Date;


public class HcOrderDetailVO implements java.io.Serializable{
		
		private String orderDetailNo;
		private String orderNo;
		private Date serviceDate;
		private String serviceTime;
		private String empNo ;
		private String orderDetailStataus;
		
		public HcOrderDetailVO() {
			super();
			
		}

		
		public HcOrderDetailVO(String orderDetailNo, String orderNo, Date serviceDate, String serviceTime,
				String empNo) {
			this();
			this.orderDetailNo = orderDetailNo;
			this.orderNo = orderNo;
			this.serviceDate = serviceDate;
			this.serviceTime = serviceTime;
			this.empNo = empNo;
		}

		public String getOrderDetailNo() {
			return orderDetailNo;
		}

		public String getOrderDetailStataus() {
			return orderDetailStataus;
		}


		public void setOrderDetailStataus(String orderDetailStataus) {
			this.orderDetailStataus = orderDetailStataus;
		}


		public void setOrderDetailNo(String orderDetailNo) {
			this.orderDetailNo = orderDetailNo;
		}

		public String getOrderNo() {
			return orderNo;
		}

		public void setOrderNo(String orderNo) {
			this.orderNo = orderNo;
		}

		public Date getServiceDate() {
			return serviceDate;
		}

		public void setServiceDate(Date serviceDate) {
			this.serviceDate = serviceDate;
		}

		public String getServiceTime() {
			return serviceTime;
		}

		public void setServiceTime(String serviceTime) {
			this.serviceTime = serviceTime;
		}

		public String getEmpNo() {
			return empNo;
		}

		public void setEmpNo(String empNo) {
			this.empNo = empNo;
		}

}
