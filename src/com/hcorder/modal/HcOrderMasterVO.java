package com.hcorder.modal;
import java.io.Serializable;
import java.sql.Date;

public class HcOrderMasterVO implements Serializable{
		
		private String orderNo;
		private String memNo;
		private Date orderDate;
		private String caredNo;
		private String orderStatus;
		public HcOrderMasterVO() {
			super();

		}		
		
		public HcOrderMasterVO(String orderNo, String memNo, Date orderDate, String caredNo, String orderStatus) {
			super();
			this.orderNo = orderNo;
			this.memNo = memNo;
			this.orderDate = orderDate;
			this.caredNo = caredNo;
			this.orderStatus = orderStatus;
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
		public Date getOrderDate() {
			return orderDate;
		}
		public void setOrderDate(Date orderDate) {
			this.orderDate = orderDate;
		}
		public String getCaredNo() {
			return caredNo;
		}
		public void setCaredNo(String caredNo) {
			this.caredNo = caredNo;
		}
		public String getOrderStatus() {
			return orderStatus;
		}
		public void setOrderStatus(String orderStatus) {
			this.orderStatus = orderStatus;
		}
		
		
}
