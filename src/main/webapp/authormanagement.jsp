<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>LMSU Dashboard</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="vendors/feather/feather.css">
    <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="css/vertical-layout-light/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="images/images/favicon.png"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/iconpro.js"></script>
</head>
<body>
<c:set var="role" value="${sessionScope.LOGIN_USER.roleID}"/>
<c:if test="${role eq '4' or role eq 'null'}">
    <c:redirect url="IndexServlet"></c:redirect>
</c:if>

<c:if test="${role eq '3'}">
    <c:redirect url="ShowDashboardServlet"></c:redirect>
</c:if>

<c:if test="${role eq '1' or role eq '2'}">
    <div class="container-scroller">
        <!-- partial:../../partials/_navbar.html -->
        <jsp:include page="adminheader.jsp"/>
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial -->
            <jsp:include page="sidebar.jsp"/>
            <!-- partial:../../partials/_sidebar.html -->
            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Data table</h4>
                            <div class="table-responsive">
                                <div id="order-listing_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                    <div class="row">
                                        <div class="table-responsive">
                                            <div class="col-sm-12">
                                                <table id="author-datatable" class="table dataTable no-footer my-2"
                                                       role="grid"
                                                       aria-describedby="order-listing_info">
                                                    <thead>
                                                    <tr>
                                                        <th style="width: 0px; text-align: center">#</th>
                                                        <th style="width: 96px; text-align: left">NAME</th>
                                                            <%--<th style="width: 67px; text-align: left"></th>--%>
                                                        <th style="width: 64px; text-align: center">Actions</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:set var="authorMap" value="${requestScope.AUTHOR_MAP}"/>
                                                    <c:set var="keyAuthorID" value="${authorMap.keySet()}"/>
                                                    <c:set var="authorList" value="${requestScope.AUTHOR_LIST}"/>
                                                    <c:forEach var="author" items="${authorList}"
                                                               varStatus="counter">
                                                        <tr>
                                                            <td class="sorting_1"
                                                                style="text-align: center">${counter.count}</td>
                                                            <td style="text-align: left">
                                                                    ${author.authorName}
                                                            </td>
                                                            <c:set var="listOfCannotDeleteAuthor"
                                                                   value="${requestScope.DO_NOT_DELETE_AUTHOR_LIST}"/>

                                                            <td style="text-align: center;">
                                                                <form action="DispatchServlet"
                                                                      enctype="multipart/form-data"
                                                                      method="POST">
                                                                    <input type="hidden" value="${author.authorID}"
                                                                           name="pk">
                                                                    <input type="hidden" value="${author.authorID}"
                                                                           name="authorPk">
                                                                    <input type="hidden" name="txtSearchValue"
                                                                           value="${param.txtSearchValue}"/>
                                                                    <div class="btn-group">
                                                                            <%--<button type="submit" class="btn btn-light"
                                                                                    name="btAction" value="View Authors"
                                                                                    title="Details">
                                                                                <i class="fa fa-eye text-primary"></i>
                                                                            </button> --%>
                                                                        <button type="button" class="btn btn-light"
                                                                                data-toggle="modal"
                                                                                data-target="#viewModal${counter.count}"
                                                                                title="View"
                                                                                data-original-title="View">
                                                                            <i class="fa fa-eye text-primary"></i>
                                                                        </button>
                                                                        <button type="button" class="btn btn-light"
                                                                                data-toggle="modal"
                                                                                data-target="#updateModal${author.authorID}"
                                                                                title="Update"
                                                                                data-original-title="Edit">
                                                                            <i class="fa fa-pencil text-primary"></i>
                                                                        </button>
                                                                        <button type="button" class="btn btn-light"
                                                                                data-toggle="modal"
                                                                                data-target="#deleteModal${author.authorID}"
                                                                                title="Delete"
                                                                                data-original-title="Remove">
                                                                            <i class="fa fa-times text-primary"></i>
                                                                        </button>
                                                                        <!--Start: View Author Modal-->
                                                                        <div class="modal fade"
                                                                             id="viewModal${counter.count}"
                                                                             tabindex="-1"
                                                                             role="dialog"
                                                                             aria-labelledby="exampleModalLongTitle"
                                                                             aria-hidden="true">
                                                                            <div class="modal-dialog modal-xl"
                                                                                 role="document">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h5 class="modal-title"
                                                                                            id="modalTitle${counter.count}">
                                                                                            Author Log</h5>
                                                                                        <button type="button"
                                                                                                class="close"
                                                                                                data-dismiss="modal"
                                                                                                aria-label="Close">
                                                                                        <span
                                                                                                aria-hidden="true">&times;</span>
                                                                                        </button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <fieldset disabled>
                                                                                            <div class="form-group row">
                                                                                                <label class="col-sm-1 col-form-label">Author
                                                                                                    Cover
                                                                                                </label>

                                                                                                <div class="col-sm-10">
                                                                                                    <img class="rounded float-right"
                                                                                                         style="height: 280px; width: auto;"
                                                                                                         src="${pageContext.request.contextPath}/image/${author.coverPath}"
                                                                                                         id="coverPictureUpdate2${author.authorID}"
                                                                                                         alt="Book cover"
                                                                                                         onerror="this.onerror=null; this.src='images/imagenotfound.jpg';"
                                                                                                    />
                                                                                                    <input type="hidden"
                                                                                                           name="txtCoverFile"
                                                                                                           class="form-control"
                                                                                                           value="${author.coverPath}">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group row">
                                                                                                <label class="col-sm-1 col-form-label">Name</label>
                                                                                                <div class="col-sm-10">
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           value="${author.authorName}">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group row">
                                                                                                <label class="col-sm-1 col-form-label">
                                                                                                    Author Bio
                                                                                                </label>
                                                                                                <div class="col-sm-10">
                                                                                        <textarea
                                                                                                class="form-control"

                                                                                                rows="10"> ${author.authorBio}
                                                                                        </textarea>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group row">
                                                                                                <div class="table-responsive">
                                                                                                    <table class="table table-hover">
                                                                                                        <thead>
                                                                                                        <tr>
                                                                                                            <th scope="col">
                                                                                                                Book ID
                                                                                                            </th>
                                                                                                            <th scope="col">
                                                                                                                Book
                                                                                                                Title
                                                                                                            </th>
                                                                                                            <th scope="col">
                                                                                                                Publisher
                                                                                                            </th>
                                                                                                            <th scope="col">
                                                                                                                Publish
                                                                                                                Date
                                                                                                            </th>
                                                                                                            <th scope="col">
                                                                                                                Price
                                                                                                            </th>
                                                                                                            <th scope="col">
                                                                                                                Quantity
                                                                                                            </th>
                                                                                                            <th scope="col">
                                                                                                                Rating
                                                                                                            </th>
                                                                                                        </tr>
                                                                                                        </thead>
                                                                                                        <tbody>
                                                                                                            <%--<c:set var="authorMap" value="${requestScope.AUTHOR_MAP}"/>
                                                                                                            <c:set var="keyAuthorID" value="${authorMap.keySet()}"/> --%>
                                                                                                        <c:set var="authorBook"
                                                                                                               value="${authorMap.get(author.authorID)}"/>
                                                                                                        <c:forEach
                                                                                                                var="bookOfAuthor"
                                                                                                                items="${authorBook}">
                                                                                                            <tr>
                                                                                                                <td>${bookOfAuthor.bookDTO.bookID} </td>
                                                                                                                <td>${bookOfAuthor.bookDTO.title} </td>
                                                                                                                <td>${bookOfAuthor.bookDTO.publisher} </td>
                                                                                                                <td>${bookOfAuthor.bookDTO.publicationDate} </td>
                                                                                                                <td>${bookOfAuthor.bookDTO.price} </td>
                                                                                                                <td>${bookOfAuthor.bookDTO.quantity} </td>
                                                                                                                <td>${bookOfAuthor.bookDTO.avgRating} </td>
                                                                                                            </tr>
                                                                                                        </c:forEach>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </div>

                                                                                            </div>
                                                                                        </fieldset>
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button"
                                                                                                class="btn btn-primary"
                                                                                                data-dismiss="modal">
                                                                                            Close
                                                                                        </button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <!--End: View Author Modal-->

                                                                        <!--Start: Update Author Modal-->
                                                                        <div class="modal fade"
                                                                             id="updateModal${author.authorID}"
                                                                             tabindex="-1"
                                                                             role="dialog"
                                                                             aria-labelledby="ariaUpdateModal${author.authorID}"
                                                                             aria-hidden="true">
                                                                            <div class="modal-dialog" role="document">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h5 class="modal-title"
                                                                                            id="exampleModalLongTitle3">
                                                                                            Edit Author Details
                                                                                        </h5>
                                                                                        <button type="button"
                                                                                                class="close"
                                                                                                data-dismiss="modal"
                                                                                                aria-label="Close">
                                                                                            <span aria-hidden="true">&times;</span>
                                                                                        </button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <div class="form-group row">
                                                                                            <label class="col-sm-3 col-form-label">Author
                                                                                                Cover
                                                                                            </label>
                                                                                            <div class="col-sm-9">
                                                                                                <img class="rounded float-right"
                                                                                                     style="height: 280px; width: auto;"
                                                                                                     src="${pageContext.request.contextPath}/image/${author.coverPath}"
                                                                                                     id="coverPictureUpdate${author.authorID}"
                                                                                                     alt="Book cover"
                                                                                                     onerror="this.onerror=null; this.src='images/imagenotfound.jpg';"
                                                                                                />
                                                                                                <input type="hidden"
                                                                                                       name="txtCoverFile"
                                                                                                       value="${author.coverPath}">
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="form-group row">
                                                                                            <div class="col-sm-3">
                                                                                            </div>
                                                                                            <div class="col-sm-9">
                                                                                                <div class="custom-file">
                                                                                                    <input type="file"
                                                                                                           class="custom-file-input"
                                                                                                           id="customFileUpdate${author.authorID}"
                                                                                                           name="coverPicture"
                                                                                                           onchange="readURL(this, 'coverPictureUpdate${author.authorID}');"
                                                                                                    >
                                                                                                    <label class="custom-file-label"
                                                                                                           for="customFileUpdate${author.authorID}">Choose
                                                                                                        Image
                                                                                                    </label>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="form-group row">
                                                                                            <label class="col-sm-3 col-form-label">Name</label>
                                                                                            <div class="col-sm-9">
                                                                                                <input type="text"
                                                                                                       class="form-control textField"
                                                                                                       name="txtUpdateAuthorName"
                                                                                                       value="${author.authorName}">
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="form-group row">
                                                                                            <label class="col-sm-3 col-form-label">
                                                                                                Author Bio
                                                                                            </label>
                                                                                            <div class="col-sm-9">
                                                                                        <textarea
                                                                                                class="form-control descriptionField"
                                                                                                name="txtUpdateAuthorBio"
                                                                                                rows="10"> ${author.authorBio}
                                                                                        </textarea>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="submit"
                                                                                                name="btAction"
                                                                                                value="Update Author"
                                                                                                class="btn btn-primary"
                                                                                        >
                                                                                            Save
                                                                                        </button>
                                                                                        <button type="button"
                                                                                                class="btn btn-outline-primary"
                                                                                                data-dismiss="modal">
                                                                                            Close
                                                                                        </button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <!--End: Update Author Modal-->

                                                                        <!--Start: Delete Author Modal-->
                                                                        <div class="modal fade"
                                                                             id="deleteModal${author.authorID}"
                                                                             tabindex="-1"
                                                                             role="dialog"
                                                                             aria-labelledby="ariaDeleteModal${author.authorID}"
                                                                             aria-hidden="true">
                                                                            <div class="modal-dialog" role="document">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h5 class="modal-title"
                                                                                            id="exampleModalLongTitle2">
                                                                                            WARNING
                                                                                        </h5>
                                                                                        <button type="button"
                                                                                                class="close"
                                                                                                data-dismiss="modal"
                                                                                                aria-label="Close">
                                                                                            <span aria-hidden="true">&times;</span>
                                                                                        </button>
                                                                                    </div>
                                                                                    <c:if test="${listOfCannotDeleteAuthor!=null}">

                                                                                        <c:choose>
                                                                                            <c:when test="${listOfCannotDeleteAuthor
                                                                                    .contains(author.authorID)==true}">
                                                                                                <div class="modal-body">
                                                                                                    <div class="row">
                                                                                                        <div class="col-12 text-center">
                                                                                                            You haven't
                                                                                                            deleted
                                                                                                            all
                                                                                                            the
                                                                                                            books from
                                                                                                            this author
                                                                                                        </div>

                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="modal-footer">
                                                                                                    <button type="button"
                                                                                                            class="btn btn-outline-primary"
                                                                                                            data-dismiss="modal">
                                                                                                        Close
                                                                                                    </button>
                                                                                                </div>
                                                                                            </c:when>
                                                                                            <c:when test="${listOfCannotDeleteAuthor
                                                                                    .contains(author.authorID) == false}">
                                                                                                <div class="modal-body">
                                                                                                    Do you want to
                                                                                                    delete
                                                                                                    this
                                                                                                    author?
                                                                                                </div>
                                                                                                <div class="modal-footer">
                                                                                                    <button type="submit"
                                                                                                            name="btAction"
                                                                                                            value="Delete Author"
                                                                                                            class="btn btn-primary"
                                                                                                    >
                                                                                                        Save
                                                                                                    </button>
                                                                                                    <button type="button"
                                                                                                            class="btn btn-outline-primary"
                                                                                                            data-dismiss="modal">
                                                                                                        Close
                                                                                                    </button>
                                                                                                </div>
                                                                                            </c:when>
                                                                                        </c:choose>
                                                                                    </c:if>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <!--End: Delete Author Modal-->
                                                                    </div>
                                                                </form>

                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- content-wrapper ends -->
                <!-- partial:../../partials/_footer.html -->
                <footer class="footer">
                    <div class="d-sm-flex justify-content-center justify-content-sm-between">
                        <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2021.
                            Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin
                                template</a> from BootstrapDash. All rights reserved.</span>
                        <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made
                            with <i class="ti-heart text-danger ml-1"></i></span>
                    </div>
                </footer>
                <!-- partial -->
            </div>
            <!-- main-panel ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <%--<script src="vendors/js/vendor.bundle.base.js"></script>--%>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="vendors/datatables.net/jquery.dataTables.js"></script>
    <script src="vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="js/off-canvas.js"></script>
    <script src="js/hoverable-collapse.js"></script>
    <script src="js/template.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->

    <!-- End custom js for this page-->
</c:if>
</body>
<script src="js/authormanagement.js"></script>
</html>
