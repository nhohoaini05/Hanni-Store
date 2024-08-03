<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

<!-- belle/home5-cosmetic.html   11 Nov 2019 12:25:38 GMT -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Home</title>
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

.product-image-full {
    width: 100%;
    height: 200px; /* Chiều cao card */
    object-fit: contain; /* Hiển thị toàn bộ hình ảnh trong khung */
}

</style>

</head>

<body ng-app="shopping-app" ng-controller="shopping-ctrl"
	class="template-index belle home5-cosmetic">

	<div class="pageWrapper">
		<%@include file="../layout/_header.jsp"%>

		<!--Body Content-->
		<div id="page-content">
			<!--Home slider-->

			<!--End Home slider-->

			<!--Collection Tab slider-->

			<!--Collection Tab slider-->

			<!--Logo Slider-->

			<!--End Logo Slider-->

			<!--Featured Product-->
			<div class="product-rows section">
				<div class="container">
					<div class="row m-5">
						<div class="col-12 col-sm-12 col-md-12 col-lg-12 ">
							<div class="section-header text-center">
								<h2 class="badge badge-success">GỢI Ý HÔM NAY</h2>
							</div>
						</div>
					</div>
					<div class="grid-products">
						<div class="row">
							<c:set var="maxLengthName" value="18" />
							<c:set var="maxLengthDescription" value="80" />
							<c:forEach var="d" items="${db}" end="15">
								<div class="col-12 col-sm-6 col-md-3 col-lg-3">
									<div class="card shadow p-3 mb-5 bg-white rounded"
										style="width: 18rem;">
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
													<c:when
														test="${fn:length(d.product.description) > maxLengthDescription}">
									                            ${fn:substring(d.product.description, 0, maxLengthDescription)}...
									                        </c:when>
													<c:otherwise>
									                            ${d.product.description}
									                        </c:otherwise>
												</c:choose>
											</p>
										</div>
										<ul class="list-group list-group-flush">
											<li class="list-group-item alert alert-danger" role="alert"
												id="productInfo_${d.product.id}"></li>
										</ul>
										<div class="card-footer d-flex justify-content-between">
											<a href="/product/detail/${d.product.id}"
												class="btn mb-2 btn--secondary"> Chi tiết </a>
											<button ng-click="cart.add(${d.product.id})"
												class="btn btn-custom-cart btn-sm mb-2"
												aria-label="Thêm vào giỏ hàng">
												<i class="fas fa-cart-plus"></i>
											</button>
										</div>
									</div>

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
                                            htmlContent_${d.product.id} += "<span style='text-decoration: line-through; font-weight-light'>đ" + originalPrice_${d.product.id}.toLocaleString() + "</span> ";
                                            htmlContent_${d.product.id} += " | <span class='font-weight-bold'>đ" + discountedPrice_${d.product.id}.toLocaleString() + "</span> ";
                                            htmlContent_${d.product.id} += "<span class='badge badge-pill badge-primary'> - " + discount_${d.product.id} + "%</span>";
                                        } else {
                                            htmlContent_${d.product.id} += "<span>Đ" + originalPrice_${d.product.id}.toLocaleString() + "</span>";
                                        }

                                        // Gán nội dung HTML vào phần tử
                                        listItem.innerHTML = htmlContent_${d.product.id};
                                    </script>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="col-12 col-sm-12 col-md-12 col-lg-12">
						<div class="section-header text-center">
							<a href="/product/list?kw=" class="btn"
								style="vertical-align: middle; text-align: center;">TẤT CẢ
								SẢN PHẨM</a>
						</div>
					</div>
				</div>
			</div>
			<!--End Featured Product-->

			<!--Store Feature-->
			<!-- <div class="store-feature section">
				<div class="container">
					<div class="row">
						<div class="col-12 col-sm-12 col-md-12 col-lg-12">
							<ul class="display-table store-info">
								<li class="display-table-cell"><i
									class="icon anm anm-truck-l"></i>
									<h5>Miễn phí vận chuyển</h5> <span class="sub-text"> Đối
										với đơn từ 200k trong nội thành TPHCM </span></li>
								<li class="display-table-cell"><i
									class="icon anm anm-money-bill-ar"></i>
									<h5>Nhiều khuyến mãi hấp dẫn</h5> <span class="sub-text">
										Hàng ngàn ưu đãi cực sốc được cập nhật mỗi ngày </span></li>
								<li class="display-table-cell"><i
									class="icon anm anm-comments-l"></i>
									<h5>Sản phẩm chính hãng</h5> <span class="sub-text"> Cam
										kết hoàn tiền 300% giá trị sản phẩm nếu phát hiện hàng không
										chính hãng </span></li>
							</ul>
						</div>
					</div>
				</div>
			</div> -->
			<!--End Store Feature-->
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
