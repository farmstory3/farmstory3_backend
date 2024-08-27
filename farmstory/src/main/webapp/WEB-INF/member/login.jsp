<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
</head>
<link rel="stylesheet" href="/farmstory/css/header.css">
<link rel="stylesheet" href="/farmstory/css/login.css">
<link rel="stylesheet" href="/farmstory/css/footer.css">
<script>
	const success= ${success};
	
	if(success == 100){
		alert('로그인에 실패했습니다. \n다시 한번 아이디, 비밀번호를 확인 하시기 바랍니다.');
	} else if(success == 101){
		alert('정상적으로 로그아웃 되었습니다.');
	} else if(success == 102){
		alert('먼저 로그인을 하셔야 합니다.');
	}
</script>
<body>
    <div class="header-wrapper">
        <div class="header-logo-box">
            <div class="header-logo">
                <div class="logo-link-box">
                    <div class="logo-link">
                        <div>Home</div>
                        <div>|</div>
                        <div>로그인</div>
                        <div>|</div>
                        <div>회원가입</div>
                        <div>|</div>
                        <div>고객센터</div>
                    </div>
                </div>

            </div>
        </div>
        <div class="header-gubun-box">
            <div class="menu-1"></div>
            <div class="menu-2"></div>
            <div class="menu-3"></div>
            <div class="menu-4"></div>
            <div class="menu-5"></div>
        </div>
        <div class="header-menu-box">
            <div>
                <div class="menu-gubun"></div>
                <div class="menu-1 menu"></div>
            </div>
            <div>
                <div class="menu-gubun"></div>
                <div class="menu-2 menu"></div>
            </div>
            <div>
                <div class="menu-gubun"></div>
                <div class="menu-3 menu"></div>
            </div>
            <div>
                <div class="menu-gubun"></div>
                <div class="menu-4 menu"></div>
            </div>
            <div>
                <div class="menu-gubun"></div>
                <div class="menu-5 menu"></div>
            </div>
        </div>

        </div>
    </div>
    <div class="main-wrapper">
        <div class="main-box">
            <section class="login">
                <form action="/farmstory/member/login.do" method="POST">
                    <table border="0">
                        <tr>
                            <td><img src="/farmstory/images/login_ico_id.png" alt="아이디"></td>
                            <td><input type="text" name="uid" placeholder="아이디 입력"></td>
                        </tr>
                        <tr>
                            <td><img src="/farmstory/images/login_ico_pw.png" alt="비밀번호"></td>
                            <td><input type="password" name="pass" placeholder="비밀번호 입력"></td>
                        </tr>
                    </table>
                    <input type="submit" value="로그인" class="btnLogin">
                </form>	
                <div>
                    <h3>회원 로그인 안내</h3>
                    <p>
                        아직 회원이 아니시면 회원으로 가입하세요.
                    </p>
                    <a href="/farmstory/member/terms.do">회원가입</a>
                </div>
            </section>
        </div>
        
    </div>
    <div class="footer-wrapper">
        <div class="footer-gubun-box"></div>
        <div class="footer-main-box">
            <div class="footer-logo-box"></div>
            <div class="footer-info-box">
                <div class="footer-info-detail">
                    <div>(주)팜스토리 / 사업자등록번호 123-45-67890 / 통신판매업신고 제 2013-팜스토리구-123호 / 벤처기업확인 서울지방중소기업청 제 012345678-9-01234호</div>
                    <div>등록번호 팜스토리01234 (2013.04.01) / 발행인 : 홍길동</div>
                    <div>대표 : 홍길동 / 이메일 : email@mail.mail / 전화 : 01) 234-5678 / 경기도 성남시 잘한다구 신난다동 345</div>
                    <div class="footer-info-copywriter">Copyright(C)홍길동 All rights reserved.</div>
                </div>
                
            </div>
        </div>
    </div>
</body>
</html>