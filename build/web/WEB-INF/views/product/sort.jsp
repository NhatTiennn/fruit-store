<%-- 
    Document   : sort
    Created on : Feb 28, 2023, 1:33:32 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Page Header Start -->
<div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
    <div class="container">
        <h1 class="display-3 mb-3 animated slideInDown">Products</h1>
        <!--        <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a class="text-body" href="#">Home</a></li>
                        <li class="breadcrumb-item"><a class="text-body" href="#">Pages</a></li>
                        <li class="breadcrumb-item text-dark active" aria-current="page">Products</li>
                    </ol>
                </nav>-->
    </div>
</div>
<!-- Page Header End -->


<!-- Product Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="row g-0 gx-5 align-items-end">
            <div class="col-lg-6">
                <div class="section-header text-start mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                    <h1 class="display-5 mb-3">Our Products</h1>
                    <p>List of items about fruits.</p>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="text-start mb-5" data-wow-delay="0.1s" style="display: flex; justify-content: flex-end">
                    <form action="<c:url value="/product/sort.do"/>" method="post">
                        <label for="subscription">Sorting:</label>
                        <select id="sort" name="sort">
                            <option value="alphabet_asc" ${sort=="alphabet_asc"?"selected":""}>Name:  A-Z</option>
                            <option value="alphabet_desc" ${sort=="alphabet_desc"?"selected":""}>Name:  Z-A</option>
                            <option value="price_asc" ${sort=="price_asc"?"selected":""}>Low-High</option>
                            <option value="price_desc" ${sort=="price_desc"?"selected":""}>High-Low</option>
                        </select>
                        <input type="hidden" name="sort_order" value="${sort_order}">
                        <button type="submit" class="btn btn-light" value="Sort">Sort</button>
                    </form>
                </div>
            </div>

            <div>

            </div>
        </div>

        <div class="tab-content">
            <div id="tab-1" class="tab-pane fade show p-0 active">
                <div class="row g-4">
                    <c:forEach var="product" items="${list}" varStatus="loop">
                        <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="product-item">
                                <div class="position-relative bg-light overflow-hidden">
                                    <img style="width: 288px; height: 298px"  class="img-fluid w-100" src="${product.img}" alt="">
                                </div>
                                <div class="text-center p-4">
                                    <span class="d-block h5 mb-2" href="">${product.name}</span>
                                    <span class="text-primary me-1 fs-2">${product.getPrice() - (product.getPrice() * product.getDiscount())}</span>
                                    <span class="text-body text-decoration-line-through">$${product.price}</span>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="w-50 text-center border-end py-2">
                                        <a class="text-body" href="<c:url value="/product/detail.do?id=${product.id}"/>"><i class="fa fa-eye text-primary me-2"></i>View detail</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href="<c:url value="/cart/addToCart.do?id=${product.id}"/>"><i class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
                                    </small>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- Product End -->
<!--Paging-->
<nav aria-label="Page navigation example" class="col-lg-12" style="display: flex; justify-content: center">
    <ul class="pagination">
        <c:forEach begin="1" end="${endP}" step="1" var="i">
            <li class="page-item ${page == i ? 'active' : ''}">
                <a class="page-link" href="<c:url value="/product/sort.do?page=${i}&sort=${param.sort}&sort_order=${param.sort_order}" />">${i}</a>
            </li>
        </c:forEach>
    </ul>
</nav>
<!--Paging End-->