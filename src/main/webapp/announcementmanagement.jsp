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

    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="css/vertical-layout-light/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="images/images/favicon.png"/>
    <link rel="stylesheet" href="css/announcementmanagement.css">
    <script src="js/iconpro.js"></script>
</head>
<body>
<div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
            <a class="navbar-brand brand-logo mr-5" href="dashboard.jsp"><img src="images/LMSU LOGO DASHBOARD.svg"
                                                                              class="mr-2" alt="logo"
                                                                              style="margin-left: 40px;"/></a>
            <a class="navbar-brand brand-logo-mini" href="dashboard.jsp"><img src="images/LMSU LOGO MINI DASHBOARD.svg"
                                                                              alt="logo"/></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
            <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                <span class="icon-menu"></span>
            </button>
            <ul class="navbar-nav mr-lg-2">
                <li class="nav-item nav-search d-none d-lg-block">
                    <div class="input-group">
                        <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                                <span class="input-group-text" id="search">
                                    <i class="icon-search"></i>
                                </span>
                        </div>
                        <input type="text" class="form-control" id="navbar-search-input" placeholder="Search now"
                               aria-label="search" aria-describedby="search">
                    </div>
                </li>
            </ul>
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item dropdown">
                    <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#"
                       data-toggle="dropdown">
                        <i class="icon-bell mx-0"></i>
                        <span class="count"></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
                         aria-labelledby="notificationDropdown">
                        <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
                        <a class="dropdown-item preview-item">
                            <div class="preview-thumbnail">
                                <div class="preview-icon bg-success">
                                    <i class="ti-info-alt mx-0"></i>
                                </div>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject font-weight-normal">Application Error</h6>
                                <p class="font-weight-light small-text mb-0 text-muted">
                                    Just now
                                </p>
                            </div>
                        </a>
                        <a class="dropdown-item preview-item">
                            <div class="preview-thumbnail">
                                <div class="preview-icon bg-warning">
                                    <i class="ti-settings mx-0"></i>
                                </div>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject font-weight-normal">Settings</h6>
                                <p class="font-weight-light small-text mb-0 text-muted">
                                    Private message
                                </p>
                            </div>
                        </a>
                        <a class="dropdown-item preview-item">
                            <div class="preview-thumbnail">
                                <div class="preview-icon bg-info">
                                    <i class="ti-user mx-0"></i>
                                </div>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject font-weight-normal">New user registration</h6>
                                <p class="font-weight-light small-text mb-0 text-muted">
                                    2 days ago
                                </p>
                            </div>
                        </a>
                    </div>
                </li>
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                        <img src="images/images/faces/fn2.png" alt="profile" style="border-radius: 50%;"/>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                        <a class="dropdown-item" href="ShowProfileServlet">
                            <i class="ti-settings text-primary"></i> Profile
                        </a>
                        <a class="dropdown-item" href="LogoutServlet">
                            <i class="ti-power-off text-primary"></i> Logout
                        </a>
                    </div>
                </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                    data-toggle="offcanvas">
                <span class="icon-menu"></span>
            </button>
        </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial -->
        <!-- partial:../../partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" href="dashboard.jsp">
                        <i class="icon-grid menu-icon"></i>
                        <span class="menu-title">Dashboard</span>
                    </a>
                </li>
                <c:set var="role" value="${sessionScope.LOGIN_USER}"/>
                <c:if test="${role.roleID eq '2' or role.roleID eq '3'}">
                    <li class="nav-item">
                        <a class="nav-link" href="IndexServlet">
                            <i class="icon-paper menu-icon"></i>
                            <span class="menu-title">Library</span>
                        </a>
                    </li>
                </c:if>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#user-management" aria-expanded="false"
                       aria-controls="ui-basic">
                        <i class="icon-head menu-icon"></i>
                        <span class="menu-title">Users</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="user-management">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"><a class="nav-link" href="ShowMemberServlet">Member</a></li>
                            <li class="nav-item"><a class="nav-link" href="ShowStaffServlet">Staff</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ShowBookServlet">
                        <i class="icon-book menu-icon"></i>
                        <span class="menu-title">Books</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ShowAuthorServlet">
                        <i class="fal fa-user-edit menu-icon"></i>
                        <span class="menu-title">Authors</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="BookRentalManagement.html">
                        <i class="icon-archive menu-icon"></i>
                        <span class="menu-title">Book Rental</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="log.jsp">
                        <i class="icon-file-subtract menu-icon"></i>
                        <span class="menu-title">Import Log</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="announcementmanagement.jsp">
                        <i class="icon-bell menu-icon"></i>
                        <span class="menu-title">Announcement</span>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="card">
                    <div class="card-body">
                        <form>
                            <div class="d-flex flex-column align-items-center mb-5">
                                <h6><b>INFORMATION AND LIBRARY CENTER</b></h6>
                                <h3><b>ANNOUNCEMENT</b></h3>
                            </div>
                            <div>
                                <p>Dear Library Users,</p>
                                <p>
                                    Delivering textbook schedule for <input type="text" placeholder="Enter semester"
                                                                            id="semester" name="semester" value=""
                                                                            required>
                                    <input type="text" placeholder="Enter year" id="year" required
                                           name="year" value=""> semester at FPT University Library.
                                    Library users are required to follow below schedule:
                                </p>
                                <p class="text-danger">
                                    <b>
                                        Start: <input type="text" placeholder="Enter day from" id="defaultDayFrom"
                                                      name="defaultDayFrom" value="" required> <input type="date"
                                                                                                      id="date"
                                                                                                      name="defaultDateFrom"
                                                                                                      value="" required>
                                        to
                                        <input type="text" placeholder="Enter day to" id="defaultDayTo" required
                                               name="defaultDayTo" value=""> <input type="date" id="defaultDateTo"
                                                                                    name="defaultDateTo" value=""
                                                                                    required> at room no LB102.
                                    </b>
                                </p>
                                <p>
                                    Textbook for subjects: <input type="text" placeholder="Enter subject" id="subject"
                                                                  name="subject" value="" required>
                                    <b class="text-danger">from <input type="text" placeholder="Enter day" id="day"
                                                                       name="day" value="" required>
                                        <input type="date" id="dateFrom" name="dateFrom" value="" required>
                                        to <input type="date" id="dateTo" name="dateTo" value="" required> at room no LB101</b> .
                                </p>
                                <h3><b>Time:</b></h3>
                                <p>
                                    - Morning: From 08:30 to 11:30 <br> - Afternoon: From 13:30 to 16:30
                                </p>
                                <h3><b>Notes:</b></h3>
                                <p>
                                    - Students must return old textbooks before borrow new textbooks; <br> -
                                    Students who don't borrow and get textbooks as schedule must take responsibility
                                    of having no textbooks; <br> - Students can view infomartion of textbooks at
                                    here
                                </p>
                                <h3><b>Should you have any inquiry, please contact us via:</b></h3>
                                <p>
                                    <b>Phone No:</b> 024-6680 5912 <br>
                                    <b>Email:</b> lmsu@gmail.com <br> <b>Fanpage:</b> https://www.facebook.com/lmsu
                                </p>
                                <div class="d-flex flex-row justify-content-center">
                                    <button class="btn btn-secondary m-3" type="button" data-toggle="modal"
                                            id="ViewDraft" data-target="#ViewDraftModal" title="View Draft">View draft
                                    </button>
                                    <button class="btn btn-primary m-3" type="submit"
                                            name="btAction" value="Update Announcement">Save
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="ViewDraftModal" tabindex="-1" role="dialog"
                 aria-labelledby="ariaViewDraftModal" style="display: none" aria-modal="true">
                <div class="modal-dialog mt-4" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">View Draft</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="d-flex flex-column align-items-center mb-5">
                                <h6><b>INFORMATION AND LIBRARY CENTER</b></h6>
                                <h3><b>ANNOUNCEMENT</b></h3>
                            </div>
                            <div>
                                <p>Dear Library Users,</p>
                                <p>
                                    Delivering textbook schedule for <span id="semesterDraft"></span> <span
                                        id="yearDraft"></span>
                                    semester at FPT University Library. Library users are required to follow below
                                    schedule:
                                </p>
                                <p class="text-danger">
                                    <b>
                                        Start: <span id="defaultDayFromDraft"></span> <span
                                            id="defaultDateFromDraft"></span> to
                                        <span id="defaultDayToDraft"></span> <span id="defaultDateToDraft"></span> at
                                        room no LB102.
                                    </b>
                                </p>
                                <p>
                                    Textbook for subjects: <span id="subjectDraft"></span> <b class="text-danger">
                                    from <span id="dayDraft"></span> <span id="dateFromDraft"></span> to <span
                                        id="dateToDraft"></span> at room no LB101</b> .
                                </p>
                                <h3><b>Time:</b></h3>
                                <p>
                                    - Morning: From 08:30 to 11:30 <br> - Afternoon: From 13:30 to 16:30
                                </p>
                                <h3><b>Notes:</b></h3>
                                <p>
                                    - Students must return old textbooks before borrow new textbooks; <br> -
                                    Students who don't borrow and get textbooks as schedule must take responsibility
                                    of having no textbooks; <br> - Students can view infomartion of textbooks at
                                    here
                                </p>
                                <h3><b>Should you have any inquiry, please contact us via:</b></h3>
                                <p>
                                    <b>Phone No:</b> 024-6680 5912 <br>
                                    <b>Email:</b> lmsu@gmail.com <br> <b>Fanpage:</b> https://www.facebook.com/lmsu
                                </p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" name="btAction" value="Update Announcement" class="btn btn-primary">
                                Save
                            </button>
                            <button type="button" class="btn btn-outline-primary" data-dismiss="modal">
                                Close
                            </button>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="js/announcementmanagement.js"></script>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->

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
</body>
</html>