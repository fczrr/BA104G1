<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cartype.model.*"%>
<%@ page import="com.carschedul.model.*"%>
<%@ page import="java.util.*"%>


<!DOCTYPE html>
<html>
<head>
	
	<!-- 基本css -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/back/carschedul/fullcalendar-3.7.0/fullcalendar.min.css">
	<link rel="stylesheet" media='print' type="text/css" href="<%=request.getContextPath()%>/back/carschedul/fullcalendar-3.7.0/fullcalendar.print.css">
	
	<!-- 班表css -->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/theme.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/images/ui-bg_gloss-wave_35_f6a828_500x100.png">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/images/ui-bg_highlight-soft_100_eeeeee_1x100.png">
	
	<link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
	<link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
	<link rel="canonical" href="https://codepen.io/akhil_001/pen/XNqQjw?depth=everything&order=popularity&page=58&q=translate&show_forks=false" />
	
	
	
	
	<jsp:useBean id="carSchedulSvc" scope="page" class="com.carschedul.model.CarSchedulService" />
    <jsp:useBean id="empSvc" scope="page" class="com.employee.model.EmployeeService" />

 		<%! String emp_no =null; %>
 		<%! String empName =null; %>
   		<%! String empTitle = null;%>
    	
 
<style>
body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	}
		
	#wrap {
		width: 1100px;
		margin: 0 auto;
	}
		
	#external-eventsbox {
		float: left;
	    width: 150px;
	    padding: 10px 10px;
	    border: 1px solid #ccc0;
	    background: #eee0;
	    text-align: left;

	} 
		
	#external-eventsbox h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
	}
		
	#external-eventsbox .fc-event {
		margin: 10px 0;
		cursor: pointer;
	}
		
	#external-eventsbox p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
	}
		
	#external-eventsbox p input {
		margin: 0;
		vertical-align: middle;
	} 

	#calendar {
		float: right;
		width: 900px;
	}
	
	#deleter{
	width: 100px;
	height: 100px;
	opacity: 0.8;
	background : url("<%=request.getContextPath()%>/back/images/trashcan.png") no-repeat;
	-moz-background-size:contain;
    -webkit-background-size:contain;
    -o-background-size:contain;
    background-size:contain;
	}

	
	span.input-group-addon.custom__addon.blue_addon {
    color: #fff;
    border: none;
    font-size: 12px;
    border-radius: 2px;
    text-transform: uppercase;
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
	}
	span.input-group-addon.custom__addon.blue_addon {
    background-color: #428fdc;
	}
	
	select.form-control.custom__select {
    border: none;
    border-radius: 2px;
    bx-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
    }
    
	
	.fc-event, .fc-event-dot {
    background-color: #5bc0de;
    border: 1px solid #9ebece;
	}
	
	.fc-day-grid-event .fc-content {
    white-space: nowrap;
    overflow: hidden;
    box-shadow: 4px 4px 3px rgba(20%,20%,40%,0.5);
	}
	
	.event_icon {
    padding-left: 20px;
    background-image: url("<%=request.getContextPath()%>/back/images/sedan-512.png");
    background-size: 100%;
    background-repeat: no-repeat;
    background-position: 2px 50%;
    background-color: #3a87ad00;
    font-family: Microsoft JhengHei;
    font-weight: bold;
    text-align: left;
    position: relative;
    display: block;
    font-size: 30px;
    line-height: 1.3;
    border-radius: 3px;
    border: 1px solid #bdbdbd00;
    height: 50px;
    width: auto;
    color: #e8bb14;
    opacity: 0.8;
	}
	
	/* 車型按鈕 */
	.btn {
	  position: relative;
	  display: inline-block;
	  letter-spacing: 1.2px;
	  padding: 12px 32px;
	  text-align: center;
	  text-transform: uppercase;
	  overflow: hidden;
	  z-index: 1;
	  cursor: pointer;
	}
	.btn:focus {
	  outline: none;
	}
	.btn--primary {
	  color: lightslategray;
	}
	.btn--border {
	  border-width: 1px;
	  border-style: solid;
	  border-radius: 10px;
	  box-sizing: border-box;
	}
	.btn--animated {
	  transition-property: color;
	  transition-duration: 0.5s;
	}
	.btn--animated.btn--border.btn--primary {
	  border: 1px solid lightslategray;
	}
	.btn--animated:before {
	  content: "";
	  position: absolute;
	  top: 0;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  background: lightslategray;
	  transform: scaleX(0);
	  transform-origin: 0 50%;
	  transition-property: transform;
	  transition-duration: 0.5s;
	  transition-timing-function: ease-out;
	  z-index: -1;
	}
	.btn--animated:hover {
	  color: white;
	}
	.btn--animated:hover:before {
	  transform: scaleX(1);
	  transition-timing-function: cubic-bezier(0.45, 1.64, 0.47, 0.66);
	}
	/* 3D按鈕 */
	.btn3d {
    position:relative;
    top: -6px;
    border:0;
     transition: all 40ms linear;
     margin-top:10px;
     margin-bottom:10px;
     margin-left:2px;
     margin-right:2px;
	}
	.btn3d:active:focus,
	.btn3d:focus:hover,
	.btn3d:focus {
	    -moz-outline-style:none;
	         outline:medium none;
	}
	.btn3d:active, .btn3d.active {
	    top:2px;
	}
	
	.btn3d.btn-success {
    box-shadow:0 0 0 1px #31c300 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #5eb924, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#78d739;
	}
	.btn3d.btn-success:active, .btn3d.btn-success.active {
    box-shadow:0 0 0 1px #30cd00 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #78d739;
	}
	.media-object {
    display: block;
    position: absolute;
    /* top: 120px; */
    left: 38px;
	}
	/* 員工BANNER */
	.titleName {
    background-image: url(<%=request.getContextPath()%>/back/image/car/titleName.png);
    background-size: 100%;
    background-repeat: no-repeat;
    background-position: 2px 50%;
    background-color: #3a87ad00;
    display: block;
    border-radius: 3px;
    border: 1px solid #bdbdbd00;
    height: 50px;
    width: auto;
    color: #dde8e8;
    opacity: 0.8;
    text-align:center
    
	}
	.media-heading {
    display: block;
    position: absolute;
    margin-left: 186px;
    top: 8px;
	}
	.media, .media-body {
    margin-left: 120px;
    overflow: hidden;
    zoom: 1;
    margin-top: 0;
	}
	/* 事件圖示 */
	.hot
	{ position: absolute;
		top:25%;
		left:20%;
		background:linear-gradient( to top right, rgba(255,87,34,1) 0%,
		rgba(251,140,0 ,1) 100%);
		box-shadow: 1px 1px 30px rgba(255,111,0 ,1);
	}
	.sun
	{
		position: absolute;
		top:-10%;
		left:65%;
		width:50px;
		height: 50px;
		border-radius: 100%;
		background:linear-gradient( to bottom left, rgba(255,235,59,1) 0%,
		rgba(249,168,37 ,1) 90%);
		box-shadow: 1px 1px 30px rgba(255,160,0 ,1);
		animation: inex 3s infinite linear ;
		
	}
	
	.sunx
	{
		position: absolute;
		top:30%;
		left:45%;
		width:10px;
		height: 10px;
		border-radius: 100%;
		background-color: #fff;
		opacity:0.2;
	}
	.cloudy
	{ position: absolute;
		top:25%;
		left:45%;
		background:linear-gradient( to top right, rgba(63,81,181,1) 0%,
		rgba(3,155,229 ,1) 40%);
		box-shadow: 1px 1px 30px rgba(2,119,189 ,1);
	
	}
	.cloud
	{
	position: absolute;
		top:5%;
		left:70%;
		width:60px;
		height: 20px;
		border-radius:10px;
		background-color: rgba(129,212,250 ,1);
		box-shadow: 1px 1px 30px rgba(0,151,167 ,1);
	animation: move 3s infinite linear ;
	
	}
	.cloudx
	{
		position: absolute;
		top:23%;
		left:55%;
		width:60px;
		height: 20px;
		border-radius:10px;
		background-color: rgba(129,212,250 ,1);
		animation: move 3s infinite linear ;
	
	}
	
	
	
	.cloudr
	{
	position: absolute;
		top:5%;
		left:60%;
		width:60px;
		height: 20px;
		border-radius:10px;
		background-color: rgba(96,125,139 ,1);
		box-shadow: 1px 1px 30px rgba(84,110,122 ,1);
	animation: flash 1.5s infinite linear;
	
	}
	
	.moon
	{
		position: absolute;
		top:-10%;
		left:65%;
		width:50px;
		height:50px;
		border-radius: 100%;
		background:rgba(255,241,118 ,1);
		box-shadow: 1px 1px 30px rgba(224,224,224 ,1);
	}
	.spot1
	{
		position: absolute;
		top:0%;
		left:85%;
		width:10px;
		height: 10px;
		border-radius: 100%;
		background-color: #777;
	}
	.spot2
	{
		position: absolute;
		top:30%;
		left:75%;
		width:5px;
		height: 5px;
		border-radius: 100%;
		background-color: #777;
	}




@keyframes inex {


	50% {
	opacity: 0.4;

	}
	60%
	{
		opacity: 1;
	}
}
@keyframes move {


	50% {
	transform: translateX(-10px);

	}
}
@keyframes fall {
10%
{
	opacity:0.8;
}

	50% {
		opacity:1;
	transform: translate(-10px,30px);

	}
	100%
	{
		transform: translate(-25px,70px);

		
	}
}
@keyframes flash
{
	48%
	{
		background-color: rgba(96,125,139 ,1);
	}
	50%
	{
		background-color: #fff;
	}
	55%
	{
		background-color: rgba(96,125,139 ,1);
	}
	57%
	{
		background-color: #fff;	
	}
	}
	@keyframes meteor
	{
	
	10%
	{opacity: 1;
	}
	80%	
	{
	left:10%;
	top:75%;
	opacity: 0;
	}
	}
	
	/* 事件選單 */
	  .animate {
		-webkit-transition: all 0.3s ease-in-out;
		-moz-transition: all 0.3s ease-in-out;
		-o-transition: all 0.3s ease-in-out;
		-ms-transition: all 0.3s ease-in-out;
		transition: all 0.3s ease-in-out;
	}

	.navbar-fixed-left {
		position: fixed;
		top: 0px;
		left: 0px;
		border-radius: 0px;
	}

	.navbar-minimal {
		width: 60px;		
		min-height: 60px;
		max-height: 100%;
		background-color: rgb(51, 51, 51);
		background-color: rgba(51, 51, 51, 0.8);
		border-width: 0px;
		z-index: 1000;
	}

	.navbar-minimal > .navbar-toggler {
		position: relative;
		min-height: 60px;
		border-bottom: 1px solid rgb(81, 81, 81);
		z-index: 100;
		cursor: pointer;
	}

	.navbar-minimal.open > .navbar-toggler,
	.navbar-minimal > .navbar-toggler:hover {
		background-color: rgb(158, 202, 59);
	}

	.navbar-minimal > .navbar-toggler > span {
		position: absolute;
		top: 50%;
		right: 50%;
		margin: -8px -8px 0 0;
		width: 16px;
		height: 16px;
		background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE2LjIuMSwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPgo8IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPgo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxheWVyXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IgoJIHdpZHRoPSIxNnB4IiBoZWlnaHQ9IjMycHgiIHZpZXdCb3g9IjAgMCAxNiAzMiIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTYgMzIiIHhtbDpzcGFjZT0icHJlc2VydmUiPgo8cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIgZmlsbD0iI0ZGRkZGRiIgZD0iTTEsN2gxNGMwLjU1MiwwLDEsMC40NDgsMSwxcy0wLjQ0OCwxLTEsMUgxQzAuNDQ4LDksMCw4LjU1MiwwLDgKCVMwLjQ0OCw3LDEsN3oiLz4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGZpbGw9IiNGRkZGRkYiIGQ9Ik0xLDEyaDE0YzAuNTUyLDAsMSwwLjQ0OCwxLDFzLTAuNDQ4LDEtMSwxSDFjLTAuNTUyLDAtMS0wLjQ0OC0xLTEKCVMwLjQ0OCwxMiwxLDEyeiIvPgo8cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIgZmlsbD0iI0ZGRkZGRiIgZD0iTTEsMmgxNGMwLjU1MiwwLDEsMC40NDgsMSwxcy0wLjQ0OCwxLTEsMUgxQzAuNDQ4LDQsMCwzLjU1MiwwLDMKCVMwLjQ0OCwyLDEsMnoiLz4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGZpbGw9IiNGRkZGRkYiIGQ9Ik0xLjMzLDI4Ljk3bDExLjY0LTExLjY0YzAuNDU5LTAuNDU5LDEuMjA0LTAuNDU5LDEuNjYzLDAKCWMwLjQ1OSwwLjQ1OSwwLjQ1OSwxLjIwNCwwLDEuNjYzTDIuOTkzLDMwLjYzM2MtMC40NTksMC40NTktMS4yMDQsMC40NTktMS42NjMsMEMwLjg3MSwzMC4xNzQsMC44NzEsMjkuNDMsMS4zMywyOC45N3oiLz4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGZpbGw9IiNGRkZGRkYiIGQ9Ik0yLjk5MywxNy4zM2wxMS42NDEsMTEuNjRjMC40NTksMC40NTksMC40NTksMS4yMDQsMCwxLjY2MwoJcy0xLjIwNCwwLjQ1OS0xLjY2MywwTDEuMzMsMTguOTkzYy0wLjQ1OS0wLjQ1OS0wLjQ1OS0xLjIwNCwwLTEuNjYzQzEuNzg5LDE2Ljg3MSwyLjUzNCwxNi44NzEsMi45OTMsMTcuMzN6Ii8+Cjwvc3ZnPgo=);
		background-repeat: no-repeat;
		background-position: 0 0;
		-webkit-transition: -webkit-transform .3s ease-out 0s;
		-moz-transition: -moz-transform .3s ease-out 0s;
		-o-transition: -moz-transform .3s ease-out 0s;
		-ms-transition: -ms-transform .3s ease-out 0s;
		transition: transform .3s ease-out 0s;
		-webkit-transform: rotate(0deg);
		-moz-transform: rotate(0deg);
		-o-transform: rotate(0deg);
		-ms-transform: rotate(0deg);
		transform: rotate(0deg);
	}

	.navbar-minimal > .navbar-menu {
		position: absolute;
		top: -1000px;
		left: 0px;
		margin: 0px;
		padding: 0px;
		list-style: none;
		z-index: 50;
		background-color: rgb(51, 51, 51);
		background-color: rgba(51, 51, 51, 0.8);
	}
	.navbar-minimal > .navbar-menu > li {
		margin: 0px;
		padding: 0px;
		border-width: 0px;
		height: 54px;
	}
	.navbar-minimal > .navbar-menu > li > a {
		position: relative;
		display: inline-block;
		color: rgb(255, 255, 255);
		text-align: left;
		cursor: pointer;
		border-bottom: 1px solid rgb(81, 81, 81);
		width: 100%;
		text-decoration: none;
		margin: 0px;
	}

	.navbar-minimal > .navbar-menu > li > a:last-child {
		border-bottom-width: 0px;
	}
	.navbar-minimal > .navbar-menu > li > a:hover {
		background-color: rgb(158, 202, 59);
	}
	.navbar-minimal > .navbar-menu > li > a > .glyphicon {
		float: right;
	}

	.navbar-minimal.open {
		width: 320px;
	}

	.navbar-minimal.open > .navbar-toggler > span {
		background-position: 0 -16px;
		-webkit-transform: rotate(-180deg);
		-moz-transform: rotate(-180deg);
		-o-transform: rotate(-180deg);
		-ms-transform: rotate(-180deg);
		transform: rotate(-180deg);
	}

	.navbar-minimal.open > .navbar-menu {
		top: 60px;
		width: 100%;
		min-height: 100%;
	}

	@media (min-width: 768px) {
		.navbar-minimal.open {
			width: 60px;
		}
		.navbar-minimal.open > .navbar-menu {
			overflow: visible;
		}
		.navbar-minimal > .navbar-menu > li > a > .desc {
			position: absolute;
			display: inline-block;
			top: 50%;
			left: 130px;
			margin-top: -20px;
			margin-left: 20px;
			text-align: left;
			white-space: nowrap;
			padding: 10px 13px;
			border-width: 0px !important;
			background-color: rgb(51, 51, 51);
			background-color: rgba(51, 51, 51, 0.8);
			opacity: 0;
		}
		.navbar-minimal > .navbar-menu > li > a > .desc:after {
			z-index: -1;
			position: absolute;
			top: 50%;
			left: -10px;
			margin-top: -10px;
			content:'';
			width: 0;
			height: 0;
			border-top: 10px solid transparent;
			border-bottom: 10px solid transparent; 	
			border-right: 10px solid rgb(51, 51, 51);
			border-right-color: rgba(51, 51, 51, 0.8);
		}
		.navbar-minimal > .navbar-menu > li > a:hover > .desc {
			left: 60px;
			opacity: 1;
		}
		}
		.navbar-minimal.open > .navbar-toggler, .navbar-minimal > .navbar-toggler:hover {
   		 background-color: rgb(248, 182, 74);
		}
		#sendSCbtn{
			width: 50px;
			height: 50px;
			margin-left: 5px;
		}
		#deleter{
			width: 100px;
			height: 100px;
			margin-left: 5px;
			margin-top: 0px;
		}
		#reload{
			width: 50px;
			height: 50px;
			margin-left: 5px;
		}
		
</style>
<title>有我罩你-派車人員排班表</title>
</head>
<body onload="connect();" onunload="disconnect();">

<%@ include file="/back/production/BA104G1_navbar_sidebar.jsp" %> 

  <!-- page content -->
     <div class="right_col" role="main">
          <div class="">

            <div class="page-title">
               <div class="title_left" style="background-color:#337ab7;height:100px;width:100%">
			      <h1 class="text-center" style="color:white;margin-top:30px">查詢班表</h1>
			</div>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <!-- <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div> -->
                </div>
              </div>
            </div>


            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                   
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content"> 
         <!-- =================================排班表start================================= -->            
		
		
		<div id='wrap'>
		 <!-- =================================派車員工列表================================= -->  
		
		<!-- 排班事件表-------------------------------- -->
	
		<!-- =================================派車員工列表================================= -->  
		
		<div id='calendar'></div>

		<div style='clear:both'></div>
		
	</div>

	<!-- =================================排班表end================================= -->	
               </div>
                </div>
              </div>
            </div>

          </div>
        </div> 
        <!-- /page content -->
	<input type="hidden" name="empNo" 	id="empNo" value="${empVO.empNo}" >
	 <%@ include file="/back/production/BA104G1_footer.jsp" %>
	 
	 		<script src="<%=request.getContextPath()%>/back/js/carschedul/moment.min.js"></script><!-- -->
			<script src="<%=request.getContextPath()%>/back/carschedul/fullcalendar-3.7.0/lib/jquery.min.js"></script>
			<script src="<%=request.getContextPath()%>/back/carschedul/fullcalendar-3.7.0/lib/jquery-ui.min.js"></script>
			<script src="<%=request.getContextPath()%>/back/carschedul/fullcalendar-3.7.0/fullcalendar.js"></script><!-- -->
			<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.all.js"></script><!-- 甜甜的sweetalert2 -->
			<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
		<script>
		var emp_no="EMP0021";
	$(document).ready(function() {
		//載入頁面初始設定
		var empNameSelected =  $('.form-control :selected').text()
		$('.fc-event').attr('c' , empNameSelected);
		$('.media-heading').text(empNameSelected);
		$('.media-heading').text(empNameSelected);
		emp_no =$('#empNo').val();
		console.log('目前員工編號:'+emp_no);
		//事件選單
		
	    $('.navbar-toggler').on('click', function(event) {
			event.preventDefault();
			$(this).closest('.navbar-minimal').toggleClass('open');
		})
		

		/* initialize the external events
		-----------------------------------------------------------------*/

		$('#external-events .fc-event').each(function() {

			// store data so the calendar knows to render an event upon drop
			$(this).data('event', {
				title: $.trim($(this).attr('c')), // use the element's text as the event title
				start: $.trim($(this).attr('b')),
				stick: true, // maintain when user navigates (see docs on the renderEvent method)
				editable : true,
				overlap : false
			});

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});

		});


		/* initialize the calendar
		-----------------------------------------------------------------*/
		
		
		var day = new Date();
		var month = day.getMonth()+1;
		console.log("這個月"+month)
		var toDay = "2017-"+month+"-01";
		var work_hours =0;
		var empName;
		var cartype_no = 1001;
		
			$('#reload').click(function(){
				emp_no=	$('#empSelect').val();
				console.log(emp_no);
				$('#calendar').fullCalendar( 'refetchEvents' )
			}); 
			
		
		$('.cartype_btn').click(function(){
			cartype_no =$(this).attr('cartypeno');
			console.log(cartype_no);
			selectInfo(cartype_no,toDay);
			$('.form-control').empty();		
			$('#calendar').fullCalendar( 'refetchEvents' );
			
		});
		
			
			//班表切換員工
			$('#empSelect').change(function(){
					
				emp_no=	$(this).val();
				console.log("切換器找到的員工編號:"+emp_no);
				$('#calendar').fullCalendar( 'refetchEvents' ) 
			    
				
				//切換員工資料區
				//切換員工照片
				var emp_photoNO = emp_no.replace(/EMP/, "EPH");
				var empPicURL = "<%=request.getContextPath() %>/DBGifReader4?emp_photo_no=" + emp_photoNO;
				console.log("empPicURL:"+empPicURL);
				$('.empPic').attr('src',empPicURL);
				
				
				
				empNameSelected =  $('.form-control :selected').text();
				$('.fc-event').attr('c' , empNameSelected);
				console.log(empNameSelected);
				//切換姓名
				$('.media-heading').text(empNameSelected);
				//切換工時
				empWorkHoursSelected = "本月服務時數:"+$('.form-control :selected').attr('work_hours')+"小時";
				$('.workhours').text(empWorkHoursSelected);
				//切換車型
				empCarTypeName = $('.form-control :selected').attr('car_type_name');
				$('.cartype').text(empCarTypeName);
				
				//切換車型
				empCarLoc = $('.form-control :selected').attr('empCarLoc');
				$('.loc').text(empCarLoc);
				
				
				
				
				//把時段事件替換成該員工的
				$('#external-events .fc-event').each(function() {

					// store data so the calendar knows to render an event upon drop
					$(this).data('event', {
						title: $.trim($(this).attr('c')), // use the element's text as the event title
						start: $.trim($(this).attr('b')),
						stick: true, // maintain when user navigates (see docs on the renderEvent method)
						editable : true,
						overlap : false
						
					});

					// make the event draggable using jQuery UI
					$(this).draggable({
						zIndex: 999,
						revert: true,      // will cause the event to go back to its
						revertDuration: 0  //  original position after the drag
					});

				});
				
			});
			
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultView: 'month',
			validRange:function(currentDate) { 
			    return { 
			        start: currentDate.clone().subtract(1, 'days'), 
			    };
			 },
			themeSystem: 'jquery-ui',
			editable: true,
			droppable: true, // this allows things to be dropped onto the calendar
			drop: function() {
				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
			},
			allDay: false,
			businessHours: { 
				dow: [ 0, 1, 2, 3, 4 ,5, 6], // 周一 - 周四 
			    start:'08:00',  
			    end: '22:00', 
			},
			
			slotDuration:'01:00:00',
			defaultTimedEventDuration:'04:00:00',
			
			//取回班表
			events:function(start, end, timezone, callback) {
				console.log(toDay)
                $.ajax({
                	
                    url:"<%=request.getContextPath()%>/carschedul/carschedul.do?action=fullCalendarSource&year_month="+toDay+"&emp_no="+ emp_no+"&cartype_no="+cartype_no,
                    cache:false,
                    success:function(data) {
                        
                        eval("var j=" + data);
                        var events = [];
                        console.log(j);
                        var info = j.eventinfo;
                        for (var i = 0; i < info.length; i++) {
                            var ev = info[i];
                            var title = ev.title;
                           var evtstart = ev.start;
                            var evtend = ev.end; 
                            /* console.log(evtstart); */
                            events.push({
                                title:title,
                                start:evtstart,
                                end:evtend 
                            });
                        }
                        
                       /*  var info2 = j.empScList;
                        //emp_no = info2[0];
                        $('.form-control').empty();	
                        for (var i = 0; i < info2.length; i++) {
                            var ev = info2[i];
                            var emp_no = ev.emp_no;
                           	var work_hours = ev.work_hours;
                            var empName = ev.empName; 
                            if(i == 0){
                            $("#empSelect").append($("<option value='"+emp_no+"' work_hours='"+work_hours+"'>"+empName+"</option>"))
                            }else{
                            $("#empSelect").append($("<option value='"+emp_no+"' work_hours='"+work_hours+"'>"+empName+"</option>"))	
                            } 
                            
                        }*/
                        
                        
                        callback(events);
                    },
                    error:function() {
                        
                    }
                })
            },
		        
			//判斷是否全天的CODE
		                   /*  var x;   
		                    if(ev.allDay=='true'){  
		                      x=true;  
		                    }else{  
		                        x=false;  
		                        
		                    }*/
		            
		           eventReceive:function(event) {
		        	   console.log('eventReceive:', event);
		           },
		           eventDrop:function(event) {
		        	   console.log('eventDrop:', event);
		           },
		           
		           eventDragStop:function(event , jsEvent) {
		        	   
		        	   var trashEl = $('#deleter');
		        	   var ofs = trashEl.offset();
		        	   
		        	   var x1 = ofs.left;
		        	   var x2 = ofs.left + trashEl.outerWidth(true);
		        	   var y1 = ofs.top;
		        	   var y2 = ofs.top + trashEl.outerHeight(true);
		        	   if(jsEvent.pageX >= x1 && jsEvent.pageX <= x2 &&
		        			   jsEvent.pageY  >= y1 && jsEvent.pageY <= y2) {
		        		   	
		        		   $(this).remove();
		        		   $('#calendar').fullCalendar('removeEvents', event._id);
		        			 
		        	   }
		         },
		          
			
			
			eventClick: function(calEvent, jsEvent, view) { 
		        alert('Event: ' + calEvent.title); 
		        alert('Id: ' + calEvent.id); 
		        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY); 
		        alert('View: ' + view.name); 
		        $('#calendar').fullCalendar('removeEvents',calEvent.id)
		        // change the border color just for fun 
		        $(this).css('border-color', 'red'); 
		 
		    },
		    
		 	 
		});
		
		/* function toDay(){
			var moment = $('#calendar').fullCalendar('getDate');
			 today = moment.format("YYYY-MM");
			 toDay = today + "-01";
			 // 轉為 MM/DD/YYYY 字串格式
			 console.log("本月:"+toDay);
			return toDay;
 		}; */
 		
		 $('.ui-button').click(function(){
		//得到今日年月日
	    var moment = $('#calendar').fullCalendar('getDate');
		 today = moment.format("YYYY-MM");
		 toDay = today + "-01";
		 // 轉為 MM/DD/YYYY 字串格式
		 $('#calendar').fullCalendar( 'refetchEvents' ) 
		 console.log("本月:"+toDay);
		}); 
	   	
		 $('#sendSCbtn').click(function(){
			 var fullCalendarArray =[];
			 var eventsList=[];
			 fullCalendarArray = $('#calendar').fullCalendar('clientEvents');
			 console.log("排班表array:"+fullCalendarArray);
		
		 
		 for(i = 0;i<fullCalendarArray.length;i++){
			 
			 var evtitle = fullCalendarArray[i].title;
			 var evstart = fullCalendarArray[i].start;
			 //console.log("前端排班title:"+ title);
			 var sfd = moment(evstart).format('YYYY-MM-DD,HH');
			 //console.log("前端排班start:"+  sfd);	
			 eventsList.push({title:evtitle,start:evstart});
		 }
			 var jsonText = JSON.stringify(eventsList);
			 var eventSendString = {action:"fullCalendarInsert",empno:emp_no,setEventsInfo:jsonText};
			 console.log("AAA:"+eventsList);
			 $.ajax({
				 type: "POST",
				 url: "<%=request.getContextPath()%>/carschedul/carschedul.do",
				 data: eventSendString,
				 dataType: "json",
				 
				 success: function (data){
					 sendMessage();
					 alert("班表更新成功!");
			     },
	            error: function(){alert("班表更新!!")
	            	
	            	sendMessage();
	            }
	       })
		 
		});
		   

		 function creatQueryString(year_month, emp_no){
				console.log("year_month:"+year_month+"; emp_no:"+emp_no);
				var queryString= {"action":"fullCalendarSource", "year_month":year_month, "emp_no":emp_no};
				return queryString;
		
	 	};
	 function selectInfo(cartype_no,toDay){
	 	 var SendString = {"action":"getEmpNo","cartype_no":cartype_no,"year_month":toDay};
	 	 
		 console.log("3.送出資料檢查:"+SendString);
		 $.ajax({
			 type: "POST",
			 url: "<%=request.getContextPath()%>/carschedul/carschedul.do",
			 data: SendString,
			 dataType: "json",
			 
			 success: function (data){
				 
               
                 var info = data.empScList;
                 console.log("ajax接到的選單資料:"+info);
                 //emp_no = info2[0];
                 $('.form-control').empty();
                 $("#empSelect").append($("<option value='0'>請選擇員工</option>"))
                 for (var i = 0; i < info.length; i++) {
                     var ev = info[i];
                     var emp_no = ev.emp_no;
                    	var work_hours = ev.work_hours;
                     var empName = ev.empName; 
                     var car_type_name = ev.carTypeName;
                     var empCarLoc = ev.empCarLoc;
                    
                     $("#empSelect").append($("<option value='"+emp_no+"' work_hours='"+work_hours+"'car_type_name='"+car_type_name+
                    		 "'empCarLoc='"+empCarLoc+"'>"+empName+"</option>"))
                     
                 }
                 
		     },
            error: function(){alert("撈選單資料失敗!!請再重新選擇車型")}
       })
	 }; 
	 	
		
		/* $('#testbtn').click(function(){
			$('#calendar').fullCalendar('removeEvents')
			alert('HIHI'); 
		}); */
		
		
		
		/* $('.drop').droppable({
			over: function( event, ui ){
				$(ui.draggable).remove();
				 $('#calendar').fullCalendar('removeEvents',Event.id)
				 $(this).css('border-color', 'red'); 
			}
		}); */
		/* $('.fc-content').draggable(); */
		
	
		
	});
	
	//推播 接收端(員工)
 	var MyPoint = "/SchedulEchoServer/shift/"+emp_no;
    var host = window.location.host;
    var path = window.location.pathname;
    var webCtx = path.substring(0, path.indexOf('/', 1));
    var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
    
	var webSocket;
	
	function connect() {
		// 建立 websocket 物件
		webSocket = new WebSocket(endPointURL);
		console.log("現在連線為:"+endPointURL);
		webSocket.onopen = function(event) {
			console.log("WebSocket 成功連線");
		
		};

		webSocket.onmessage = function(event) {
			var messagesArea = document.getElementById("messagesArea");
	        var jsonObj = JSON.parse(event.data);
	        swal({
				  position: 'center',
				  type: 'success',
				  title: jsonObj.message,
				  showConfirmButton: false,
				});
	        swal({
	        	  title: jsonObj.message,
	        	  text: "是否要更新班表頁面?",
	        	  type: 'warning',
	        	  showCancelButton: true,
	        	  confirmButtonColor: '#3085d6',
	        	  cancelButtonColor: '#d33',
	        	  confirmButtonText: '更新'
	        	}).then((result) => {
	        	  if (result.value) {
	        	    swal(
	        	      '更新!',
	        	      '你的班表已更新.',
	        	      'success'
	        	    )
	        	  }
	        	  window.location.reload();
	        	  disconnect ();
	        	  connect();
	        	})
	       
		};

		webSocket.onclose = function(event) {
			console.log("WebSocket 已離線");
		}
	}
	
	
	function sendMessage() {
	 
	}

	
	function disconnect () {
		webSocket.close();
		
	}
	
	
	

</script>
							
</body>
</html>