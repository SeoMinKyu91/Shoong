<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<!-- 왼쪽 메뉴바 --> 
<div class="col-md-3 left_col">
  <div class="left_col scroll-view">
    <div class="navbar nav_title" style="border: 0;">
      <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>SHOONG!</span></a>
    </div>

    <div class="clearfix"></div>

    <!-- menu profile quick info -->
    <div class="profile clearfix">
      <div class="profile_pic">
        <img src="<c:url value="/admin/images/img.jpg"/>" alt="..." class="img-circle profile_img">
      </div>
      <div class="profile_info">
        <span>Welcome,</span>
        <h2>Manager</h2>
      </div>
    </div>
    <!-- /menu profile quick info -->

    <br />

    <!-- sidebar menu / 왼쪽 메뉴바 -->
    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
      <div class="menu_section">
        <h3>General</h3>
        <ul class="nav side-menu">
          <li><a href="<c:url value="/admin/home/main.do"/>"><i class="fa fa-home"></i> Home </a></li>
          <li><a href="#"><i class="fa fa-bicycle"></i> Course <span class="fa fa-chevron-down"></span></a>
            <ul class="nav child_menu">
              <li><a href="<c:url value="/admin/course/main.do"/>">MAIN</a></li>
              <li><a href="<c:url value="/admin/course/main.do"/>">감성코스</a></li>
              <li><a href="<c:url value="/admin/course/main.do"/>">맛집코스</a></li>
              <li><a href="<c:url value="/admin/course/main.do"/>">숨겨진 코스</a></li>
              <li><a href="<c:url value="/admin/course/main.do"/>">도전코스</a></li>
            </ul>
          </li>
          <li><a href="<c:url value="/admin/ranking/main.do"/>"><i class="fa fa-bar-chart-o"></i> Ranking </a></li>
          <li><a href="<c:url value="/admin/pack/main.do"/>"><i class="fa fa-sitemap"></i> Pack </a></li>
          <li><a href="<c:url value="/admin/member/main.do"/>"><i class="fa fa-users"></i> Member </a></li>
          <li><a href="<c:url value="/admin/setting/main.do"/>"><i class="fa fa-cog"></i> Setting </a></li>
          <li><a href="<c:url value="/admin/report/main.do"/>"><i class="fa fa-exclamation-triangle"></i> Report </a></li>
          <li><a href="<c:url value="/admin/sample/1"/>"> 샘플1 </a></li>
          <li><a href="<c:url value="/admin/sample/2"/>"> 샘플2 </a></li>
          <li><a href="<c:url value="/admin/sample/3"/>"> 샘플3 </a></li>
        </ul>
      </div>
    </div>
    <!-- /sidebar menu -->

    <!-- /menu footer buttons 왼쪽 메뉴바 하단 -->
    <div class="sidebar-footer hidden-small">
      <a data-toggle="tooltip" data-placement="top" title="Settings">
        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
      </a>
      <a data-toggle="tooltip" data-placement="top" title="FullScreen">
        <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
      </a>
      <a data-toggle="tooltip" data-placement="top" title="Lock">
        <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
      </a>
      <a data-toggle="tooltip" data-placement="top" title="Logout" href="#">
        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
      </a>
    </div>
    <!-- /menu footer buttons -->
  </div>
</div>
<!-- 왼쪽메뉴바 끝 -->
<!-- top navigation / 위쪽 메뉴바 -->
<div class="top_nav">
  <div class="nav_menu">
    <nav>
      <div class="nav toggle">
        <a id="menu_toggle"><i class="fa fa-bars"></i></a>
      </div>

      <ul class="nav navbar-nav navbar-right">
        <li class="">
          <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
            <img src="<c:url value="/admin/images/img.jpg"/>" alt="">Manager
            <span class=" fa fa-angle-down"></span>
          </a>
          <ul class="dropdown-menu dropdown-usermenu pull-right">
            <li><a href="#"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
          </ul>
        </li>
      </ul>
    </nav>
  </div>
</div>


