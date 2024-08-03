<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<!-- belle/home5-cosmetic.html   11 Nov 2019 12:25:38 GMT -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title th:replace="${title}"></title>
<meta name="description" content="description">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Plugins CSS -->
<link rel="stylesheet" href="/assets/css/plugins.css">
<!-- Bootstap CSS -->
<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
<!-- Main Style CSS -->
<link rel="stylesheet" href="/assets/css/style.css">
<link rel="stylesheet" href="/assets/css/custom.css">
<link rel="stylesheet" href="/assets/css/responsive.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-">

<!-- angularjs -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
	
<style type="text/css">
.product-card {
    min-height: 400px; /* Giữ card cùng kích thước */
}

.card-body {
    min-height: 130px; /* Đảm bảo chiều cao của card giống nhau */
    display: flex;
    flex-direction: column;
}

.card-body .btn {
    margin-top: auto; /* Hiệu ứng margin cho nút */
    width: 100%;
}

.card-body .btn-group {
    display: flex;
    justify-content: space-between;
}	

/* CSS tùy chỉnh để đổi màu nút */
.btn-custom-info {
    background-color: 0066FF;
    color: white;
}

.btn-custom-cart {
    background-color: Gray;
    color: white;
}

.btn-custom-info:hover, .btn-custom-cart:hover {
    opacity: 0.8;
}

.product-image-full {
    width: 100%;
    height: 200px; /* Chiều cao card */
    object-fit: contain; /* Hiển thị toàn bộ hình ảnh trong khung */
}

</style>
</head>

<body ng-app="shopping-app" ng-controller="shopping-ctrl"
	class="template-index belle home5-cosmetic">
	<div id="pre-loader">
		<img src="/assets/images/loader.gif" alt="Loading..." />
	</div>
	<div class="pageWrapper">
		<%@include file="../layout/_header.jsp"%>

		<!--Body Content-->
		<div id="page-content">
			<!--Collection Banner-->
			<div class="collection-header">
				<div class="collection-hero">
					<div class="collection-hero__image">
						
					</div>
					<div class="">
						<h1 class="collection-hero__title page-width">LIST PRODUCT</h1>
					</div>
				</div>
			</div>
			<!--End Collection Banner-->

			<div class="container mt-5">
				<div class="row">
					<!--Sidebar-->
					<div class="col-12 col-sm-12 col-md-3 col-lg-3 sidebar filterbar">
						<div class="closeFilter d-block d-md-none d-lg-none">
							<i class="icon icon anm anm-times-l"></i>
						</div>
						<div class="sidebar_tags">
							<!--Categories-->
							<div class="sidebar_widget categories filter-widget">
								<div class="widget-title">
									<h2>Danh mục sản phẩm</h2>
								</div>
								<div class="widget-content">
									<ul class="sidebar_categories">
										<li class="lvl-1">
											<c:forEach var="c" items="${cates}">
												<a href="/product/list?cid=${c.id}" class="site-nav">${c.name}</a>
											</c:forEach>
										</li>

									</ul>
								</div>
							</div>
							<!--Categories-->
							<!--Price Filter-->
							<div class="sidebar_widget filterBox filter-widget">
								<div class="widget-title">
									<h2>Giá</h2>
								</div>
								<form action="">
									<button formaction="/product/list/price/under10"
										class="btn mb-2 btn--secondary">Dưới 2tr</button>
									<button formaction="/product/list/price/4-5"
										class="btn mb-2 btn--secondary">Từ 4tr - 5tr</button>
									<button formaction="/product/list/price/7-10"
										class="btn mb-2 btn--secondary">Từ 7tr - 10tr</button>
									<button formaction="/product/list/price/over20"
										class="btn mb-2 btn--secondary">Trên 20tr</button>
								</form>
							</div>
							<!--End Price Filter-->

							<!--Brand-->
							<div class="sidebar_widget filterBox filter-widget">
								<div class="widget-title">
									<h2>Thương Hiệu</h2>
								</div>
								<ul>
									<form action="/product/list/brand">
										<c:forEach var="b" items="${brands}">
											<li>
												<input type="checkbox" name="bid" value="${b.id}"
													id="check1">
												<label for="check1"><span><span></span></span>${b.name}</label>
												</li>
											</c:forEach>
										<button class="btn mt-2">Lọc</button>
									</form>
								</ul>
							</div>
							<!--End Brand-->

						</div>
					</div>
					<!--End Sidebar-->
					<!--Main Content-->
					<div class="col-12 col-sm-12 col-md-9 col-lg-9 main-col">
						<div class="productList">
							<!--Toolbar-->
							<button type="button"
								class="btn btn-filter d-block d-md-none d-lg-none">
								Product Filters</button>
							<div class="toolbar">
								<div class="filters-toolbar-wrapper">
									<div class="row">


										<div class="col-4 col-md-4 col-lg-4 text-left">
											<div class="filters-toolbar__item">
												<label for="SortBy" class="hidden">Sort</label> <select
													name="SortBy" id="SortBy"
													class="filters-toolbar__input filters-toolbar__input--sort">
													<option value="title-ascending" selected="selected">Sort</option>
													<option>Bán chạy</option>
													<option>A-Z</option>
													<option>Z-A</option>
													<option>Giá, thấp đến cao</option>
													<option>Giá, cao đến thấp</option>
												</select> <input class="collection-header__default-sort"
													type="hidden" value="manual">
											</div>
										</div>

									</div>
								</div>
							</div>
							<!--End Toolbar-->
							<div class="grid-products grid--view-items">
								<div class="row">
									
									<c:set var="maxLengthName" value="18" />
									<c:set var="maxLengthDescription" value="50" />

									<c:forEach var="d" items="${products}" end="15" varStatus="loop">
									    <div class="col-12 col-sm-6 col-md-4">
									        <div class="card shadow p-3 mb-3 bg-white rounded product-card" style="width: 18rem;">
									            <img src="/images/product/${d.images[0]}" class="card-img-top product-image-full" alt="${d.product.name}">
									            <div class="card-body">
									                <h5 class="card-title">
									                    <c:choose>
									                        <c:when test="${fn:length(d.product.name) > maxLengthName}">
									                            ${fn:substring(d.product.name, 0, maxLengthName)}...
									                        </c:when>
									                        <c:otherwise>
									                            ${d.product.name}
									                        </c:otherwise>
									                    </c:choose>
									                </h5>
									                <p class="card-text">
									                    <c:choose>
									                        <c:when test="${fn:length(d.product.description) > maxLengthDescription}">
									                            ${fn:substring(d.product.description, 0, maxLengthDescription)}...
									                        </c:when>
									                        <c:otherwise>
									                            ${d.product.description}
									                        </c:otherwise>
									                    </c:choose>
									                </p>
									            </div>
									            <ul class="list-group list-group-flush">
									                <li class="list-group-item alert alert-danger" role="alert" id="productInfo_${d.product.id}"></li>
									            </ul>									            
									            <div class="card-footer d-flex justify-content-between">
									                <a href="/product/detail/${d.product.id}" class="btn mb-2 btn--secondary">
									                    Chi tiết
									                </a>
									                <button ng-click="cart.add(${d.product.id})" class="btn btn-custom-cart btn-sm mb-2" aria-label="Thêm vào giỏ hàng">
									                    <i class="fas fa-cart-plus"></i>
									                </button>
									            </div>
									        </div>
									    </div>
									    <%-- Chia cột mới sau mỗi 3 sản phẩm --%>
									    <c:if test="${loop.index % 3 == 2 && !loop.last}">
									        </div><div class="row">
									    </c:if>
									    <script>
	                                        // Lấy phần tử HTML chứa thông tin sản phẩm
	                                        var listItem = document.getElementById("productInfo_${d.product.id}");
	
	                                     	// Lấy giá và giảm giá từ đối tượng d
	                                        var price_${d.product.id} = ${d.product.price};
	                                        var discount_${d.product.id} = ${d.product.discount};
	
	                                        // Tính giá đã giảm và giá gốc
	                                        var discountedPrice_${d.product.id} = price_${d.product.id} * (1 - discount_${d.product.id} / 100);
	                                        var originalPrice_${d.product.id} = price_${d.product.id};
	
	                                        // Tạo nội dung HTML để hiển thị
	                                        var htmlContent_${d.product.id} = "";
	                                        if (discount_${d.product.id} > 0) {
	                                            htmlContent_${d.product.id} += "<span style='text-decoration: line-through; font-weight-light; font-size: 9px;'>đ" + originalPrice_${d.product.id}.toLocaleString() + "</span> ";
	                                            htmlContent_${d.product.id} += "<br><span class='font-size: 30px; font-weight-bold;'>đ" + discountedPrice_${d.product.id}.toLocaleString() + "</span> ";
	                                            htmlContent_${d.product.id} += "<span class='badge badge-pill badge-primary'> - " + discount_${d.product.id} + "%</span>";
	                                        } else {
	                                            htmlContent_${d.product.id} += "<span>Đ" + originalPrice_${d.product.id}.toLocaleString() + "</span>";
	                                        }
	
	                                        // Gán nội dung HTML vào phần tử
	                                        listItem.innerHTML = htmlContent_${d.product.id};
	                                    </script>
									</c:forEach>
								</div>
							</div>
						</div>
						<hr class="clear">
						<div class="pagination">
							<ul>
								<li class="active mr-2"><a href="/product/list?p=0">|<</a></li>
								<li class="active mr-2"><a
									href="/product/list?p=${page.number-1}"><<</a></li>
								<li class="active mr-2"><a
									href="/product/list?p=${page.number+1}">>></a></li>
								<li class="active mr-2"><a
									href="/product/list?p=${page.totalPages-1}">>|</a></li>
							</ul>
						</div>
					</div>
					<!--End Main Content-->
				</div>
			</div>

		</div>
		<!--End Body Content-->

		<!--Footer-->
		<%@include file="../layout/_footer.jsp"%>
		<!--End Footer-->

		<!--Scoll Top-->
		<span id="site-scroll"><i class="icon anm anm-angle-up-r"></i></span>
		<!--End Scoll Top-->

		<!-- Including Jquery -->
		<script src="/assets/js/vendor/jquery-3.3.1.min.js"></script>
		<script src="/assets/js/vendor/modernizr-3.6.0.min.js"></script>
		<script src="/assets/js/vendor/jquery.cookie.js"></script>
		<script src="/assets/js/vendor/wow.min.js"></script>
		<!-- Incing Jascript -->
		<script src="/assets/js/bootstrap.min.js"></script>
		<script src="/assets/js/plugins.js"></script>
		<script src="/assets/js/popper.min.js"></script>
		<script src="/assets/js/lazysizes.js"></script>
		<script src="/assets/js/main.js"></script>
		<!-- Shopping cart -->
		<script src="/assets/js/shopping-cart.js"></script>
		<!--For Newsletter Popup-->
		<script>
			jQuery(document).mouseup(
					function(e) {
						var container = jQuery('#popup-container');
						if (!container.is(e.target)
								&& container.has(e.target).length === 0) {
							container.fadeOut();
							jQuery('#modalOverly').fadeIn(200);
							jQuery('#modalOverly').hide();
						}
					});
		</script>
		<!--End For Newsletter Popup-->
	</div>
</body>


</html>