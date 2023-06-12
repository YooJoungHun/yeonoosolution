<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/tiles/layout/preset.jsp" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여누솔루션</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/layout/layout.js"></script>
<link rel="stylesheet" href="https://unpkg.com/sanitize.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/themes/base/jquery-ui.min.css" integrity="sha512-ELV+xyi8IhEApPS/pSj66+Jiw+sOT1Mqkzlh8ExXihe4zfqbWkxPRi8wptXIO9g73FSlhmquFlUOuMSoXz5IRw==" crossorigin="anonymous" referrerpolicy="no-referrer">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/css/layout/font-awesome.min.css"/> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/layout/layout.css">
<tiles:insertAttribute name="include"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js" integrity="sha512-57oZ/vW8ANMjR/KQ6Be9v/+/h6bq9/l3f0Oc7vn6qMqyhvPd1cvKBRWWpzu0QoneImqr2SkmO4MSqU+RpHom3Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
	<div class="master-container">
		<div class="main-top">
			<div class="top-menu">
				<div class="top-left">
					<button type="button" class="menuBtn" id="hideBtn"></button>
					<span style="font-size: 22px; color: white; margin-left: 10px; font-weight: 900; cursor: pointer;" onclick="location.href = location.protocol + '//' + location.host + '/';">TEAM PROJECT</span>
				</div>
				<div class="top-right">
					<button type="button" class="logout-button" title="로그아웃">
						<svg viewBox="0 0 512 512">
							<path d="M378 108a191.41 191.41 0 0170 148c0 106-86 192-192 192S64 362 64 256a192 192 0 0169-148M256 64v192"/>
						</svg>
					</button>
				</div>
			</div>
			<div class="contents-main">
				<div class="left-menu">
					<div class="list-group">
						<div class="list-item-title">
							<img/>
							<span title="${loginInfo.memberName }">${loginInfo.memberName }</span>
							<button type="button" class="left-plus allplus" data-toggle="false">
								<svg viewBox="0 0 512 512">
									<path/>
								</svg>
							</button>
						</div>
						<div class="menusearch">
							<button>
								<svg viewBox="0 0 512 512">
									<path d="M221.09 64a157.09 157.09 0 10157.09 157.09A157.1 157.1 0 00221.09 64z"/>
									<path d="M338.29 338.29L448 448"/>
								</svg>
							</button>
							<input type="text" id="menusearch" placeholder="Search menu…" list="menu-search-list">
							<datalist id="menu-search-list">
								
							</datalist>
						</div>
						<!-- <div class="list-item">
							<div class="menu-text">
								즐겨찾기
							</div>
						</div> -->
						<div id="menu-list-group">
							
						</div>
					</div>
				</div>
				<div class="right-menu">
					<div class="main-container">
						<tiles:insertAttribute name="body"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>