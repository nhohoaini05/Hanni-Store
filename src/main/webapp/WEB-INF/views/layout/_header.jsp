<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div style="margin-bottom: 100px;">
<%-- 	<!-- Search Form Drawer -->
	<div class="search">
		<div class="search__form">
			<form class="search-bar__form" action="/product/list">
				<button class="go-btn search__button" type="submit">
					<i class="icon anm anm-search-l"></i>
				</button>
				<input class="search__input" type="search" name="kw"
					value="${sessionScope.keywords}"
					placeholder="Nhập Vào Tên Sản Phẩm" aria-label="Search"
					autocomplete="off">
			</form>
			<button type="button" class="search-trigger close-btn">
				<i class="anm anm-times-l"></i>
			</button>
		</div>
	</div>
	<!-- End Search Form Drawer --> --%>
	

	<!-- Top Header -->
	<div class="top-header py-2 bg-dark border-bottom">
		<div class="container-fluid">
			<div class="row align-items-center">
				<div class="col-md-3">
					<p class="phone-no d-inline-block mb-0">
						<i style="font-size: 23px; font-weight: 600;">HN-Store</i> 
					</p>
				</div>

				<div class="col-md-9 text-right">
					<ul class="customer-links list-inline mb-0">
						<c:if test="${not empty sessionScope.user}">
							<li class="list-inline-item"><a class="fw-bold" href="#">
									Xin chào ${sessionScope.user.username}</a></li>
							<li class="list-inline-item"><a href="/logout">Đăng xuất</a></li>
							<li class="list-inline-item"><a href="/order/list">Đơn
									hàng</a></li>
							<li class="list-inline-item"><a href="#">Sản phẩm yêu
									thích</a></li>
						</c:if>
						<c:if test="${empty sessionScope.user}">
							<li class="list-inline-item"><a href="/login">Login</a></li>
							<li class="list-inline-item"><a href="/register">Tạo tài
									khoản</a></li>
						</c:if>
						<c:if test="${not empty sessionScope.userAdmin}">
							<li class="list-inline-item"><a href="/admin">Admin</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End Top Header -->

	<!-- Header -->
	<div class="header-wrap classicHeader animated d-flex py-3">
		<div class="container-fluid">
			<div class="row align-items-center">
				<!-- Desktop Logo -->
				<div class="logo col-md-2 col-lg-2 d-none d-lg-block">
					<a style="text-decoration: none;" href="/">
						<h1 style="font-size: 25px; font-weight: 600;">HN-Store</h1>
					</a>
				</div>
				<!-- End Desktop Logo -->

				<!-- Navigation -->
				<div class="col-2 col-sm-3 col-md-3 col-lg-8">
					<div class="d-block d-lg-none">
						<button type="button"
							class="btn--link site-header__menu js-mobile-nav-toggle mobile-nav--open">
							<i class="anm anm-bars-r"></i>
						</button>
					</div>
					<!-- Desktop Menu -->
					<nav class="grid__item" id="AccessibleNav">
						<!-- Search Form -->
							<div class="search-bar ">
								<form class="search-bar__form d-flex" action="/product/list">
									<select class="search-dropdown col-sm-1" aria-label="All categories"> 
									<option value="all">All</option>
										<!-- Add more options as needed -->
									</select> <input class="search__input form-control" type="search"
										name="kw" value="${sessionScope.keywords}"
										placeholder="DEAL TỐT CHỐT NGAY" aria-label="Search"
										autocomplete="off">
									<button class="go-btn search__button btn" type="submit">
										<i class="icon anm anm-search-l"></i>
										
									</button>
								</form>
							</div>
						
						<ul id="siteNav" class="site-nav medium right hidearrow">
							<li class="lvl1 parent megamenu"><a href="/">Trang chủ <i
									class="anm anm-angle-down-l"></i></a></li>
							<li class="lvl1 parent megamenu"><a href="/product/list?kw=">Sản phẩm <i class="anm anm-angle-down-l"></i>
							</a>
								<div class="megamenu style4">
									<ul class="grid grid--uniform mmWrapper">
										<li class="grid__item lvl-1 col-md-3 col-lg-3"><a
											href="/product/list?kw=" class="site-nav lvl-1">Danh mục sản phẩm</a>
											<ul class="subLinks">
												<c:forEach var="item" items="${cates}" end="4">
													<li class="lvl-2"><a
														href="/product/list?cid=${item.id}" class="site-nav lvl-2">${item.name}</a></li>
												</c:forEach>
											</ul></li>
										<li class="grid__item lvl-1 col-md-3 col-lg-3"><a
											href="#" class="site-nav lvl-1">Thương hiệu</a>
											<ul class="subLinks">
												<c:forEach var="brand" items="${brands}" begin="1">
													<li class="lvl-2"><a
														href="/product/list?cid=${brand.id}" class="site-nav lvl-2">${brand.name}</a></li>
												</c:forEach>
											</ul>
										</li>
									</ul>
								</div>
							</li>

							<li class="lvl1 parent megamenu"><a href="">Thể loại <i class="anm anm-angle-down-l"></i>
							</a>
								<div class="megamenu style4">
									<ul class="grid grid--uniform mmWrapper">
										<li class="grid__item lvl-1 col-md-3 col-lg-3"><a
											href="/product/list?kw=" class="site-nav lvl-1">Thể loại sản phẩm</a>
											<ul class="subLinks">
												<c:forEach var="item" items="${cates}" end="4">
													<li class="lvl-2"><a
														href="/product/list?cid=${item.id}" class="site-nav lvl-2">${item.name}</a></li>
												</c:forEach>
											</ul>
										</li>
									</ul>
								</div>
							</li>
							<li class="lvl1 parent megamenu"><a href="">Hãng Thương Hiệu<i class="anm anm-angle-down-l"></i>
							</a>
								<div class="megamenu style4">
									<ul class="grid grid--uniform mmWrapper">										
										<li class="grid__item lvl-1 col-md-3 col-lg-3"><a
											href="#" class="site-nav lvl-1">Thương hiệu</a>
											<ul class="subLinks">
												<c:forEach var="brand" items="${brands}" begin="1">
													<li class="lvl-2"><a
														href="/product/list?bid=${brand.id}" class="site-nav lvl-2">${brand.name}</a></li>
												</c:forEach>
											</ul>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</nav>
					<!-- End Desktop Menu -->
				</div>
				<!-- Mobile Logo -->
				<div
					class="col-6 col-sm-6 col-md-6 col-lg-2 d-block d-lg-none mobile-logo">
					<div class="logo">
						<a href="/"> <img src="/assets/images/Shopicon1.svg"
							alt="Loot Shop" title="Loot Shop" />
						</a>
					</div>
				</div>
				<!-- End Mobile Logo -->
				<%@include file="../layout/_cart.jsp"%>
			</div>
		</div>
	</div>
	<!-- End Header -->

	<!-- Mobile Menu -->
	<div class="mobile-nav-wrapper" role="navigation">
		<div class="closemobileMenu">
			<i class="icon anm anm-times-l pull-right"></i> Đóng Menu
		</div>
		<ul id="MobileNav" class="mobile-nav">
			<li class="lvl1 parent megamenu"><a href="/home/index">Trang
					chủ </a></li>
			<li class="lvl1 parent megamenu"><a href="#">Sản phẩm <i
					class="anm anm-plus-l"></i></a>
				<ul>
					<li><a href="#" class="site-nav"> </a></li>
					<c:forEach var="cate" items="${categories}">
						<li><a href="/product/list?cate=${cate.id}" class="site-nav">${cate.name}</a></li>
					</c:forEach>
				</ul></li>
			<li class="lvl1 parent megamenu"><a href="#">Thương hiệu <i
					class="anm anm-plus-l"></i></a>
				<ul>
					<li><a href="#" class="site-nav"> </a></li>
				</ul></li>
		</ul>
	</div>
	<!-- End Mobile Menu -->
</div>