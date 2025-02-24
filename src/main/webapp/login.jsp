<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <!-- inject:css -->
    <link rel="stylesheet" href="css/vertical-layout-light/style.css">
    <!-- endinject -->
    <!--Main css-->
    <link rel="stylesheet" href="css/login.css">
    <!--Fontawsome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <!--Bootstrap CDN-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <!--FAVICON-->
    <link rel="shortcut icon" href="images/images/favicon.png"/>
</head>
<body>
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-stretch auth auth-img-bg">
            <div class="row flex-grow">
                <div class="col-lg-6 d-flex align-items-center justify-content-center" style="background-color: #fff;">
                    <div class="left-login">
                        <p style="font-size: 1.8rem"><b>Sign In</b></p>
                        <div class="btn-google">
                            <a class="button btn d-flex"
                               href="https://accounts.google.com/o/oauth2/auth?scope=profile email&redirect_uri=http://localhost:8084/SWP391-LMSU/login-google&response_type=code&client_id=981682774153-sfufdg7q80dvt2rl5iqt714b7q5di332.apps.googleusercontent.com&approval_prompt=force"
                               class="fb-btn" style="text-decoration: none">
                                <img src="images/google-icon.svg" class="mx-2"/> <b>Sign in with @fpt.edu.vn</b>
                            </a>
                        </div>

                        <small class="signin-with-email">
                            <span>___________________</span>
                            &nbsp;or Sign in with Email&nbsp;
                            <span>___________________</span>
                        </small>

                        <form action="DispatchServlet" method="POST">
                            <div class="form-group">
                                <label for="inputUsername"><b>Username <span class="required-field">*</span></b></label>
                                <input type="text" class="form-control" id="inputUsername" placeholder="Enter username"
                                       name="txtUsername" required>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword"><b>Password <span class="required-field">*</span></b></label>
                                <input type="password" class="form-control" id="inputPassword" required
                                       placeholder="Enter password" name="txtPassword">
                            </div>
                            <div>
                                <p class="text-danger">${requestScope.DELETED_ACCOUNT}</p>
                                <p class="text-danger">${sessionScope.DELETED_ACCOUNT}</p>
                                <p class="text-danger">${requestScope.WRONG_USER_LOGIN}</p>
                                <p class="text-danger">${sessionScope.WRONG_USER_LOGIN}</p>
                                <c:remove var="WRONG_USER_LOGIN"></c:remove>
                                <c:remove var="DELETED_ACCOUNT"></c:remove>
                            </div>
                            <button class="btn btn-login" type="submit" style="font-size: 1rem !important;"
                                    value="Login" name="btAction">Log in
                            </button>
                        </form>
                        <div class="copyright">
                            <small>© 2021 LMSU All rights reserved</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 login-half-bg flex-column align-items-center justify-content-center">
                    <img src="images/LIBRARY LOGO LOGIN.svg" class="logo">
                    <img src="images/login-illustration.svg" class="illustration">
                    <p class="quotation">
                        “Bad libraries build collections,<br> good libraries build services,<br> great libraries build
                        communities.”
                    </p>
                    <small class="author">– R. David Lankes – </small>
                </div>
            </div>
        </div>
        <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
</body>
</html>
