<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/farmstory/css/adminsidebar.css">
</head>
<body>
	<div id="section1">
          <div id="section1_head">
            <a>주요기능</a>
          </div>
          <div id="section1_menu">
            <ul id="prod_manage">
              상품관리
              <div>
                <li id="prod_list">L 
                  <a href="./product/list.html">상품목록</a>
                </li>
                <li id="prod_register">L 
                  <a href="./product/register.html">상품등록</a>
                </li>
              </div>
            </ul>
            <ul id="order_manage">
              주문관리
              <li id="order_list">L 
                <a href="./order/list.html">주문목록</a>
              </li>
            </ul>
            <ul id="user_manage">
              회원관리
              <li id="user_list">L 
                <a href="./user/list.html">회원목록</a>
              </li>
            </ul>
          </div>
        </div>
</body>
</html>