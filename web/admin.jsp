<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>VoteK | Admin</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
  <link href="css/login.css" rel="stylesheet">
  <link href="css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-gradient-white">
  <header>
      <div class=" d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-info border-bottom shadow-sm">
          <h5 class="my-0 mr-md-auto font-weight-normal"><i class="fas fa-laugh-wink fa-2x"></i>VoteK</h5>
          <nav class="my-2 my-md-0 mr-md-3">
            <a class="p-2 text-dark" href="index.html">Home</a>
            <a class="p-2 text-dark" href="#">About Us</a>
            <a class="p-2 text-dark" href="#">Contact Us</a>
          </nav>
          <a class="btn btn-outline-light" href="charts.jsp">LiveResult</a>
        </div>
  
    <section class="top-m ">
            <div class="container ">
                <div class="row pt-">
                    <div class="col-md-3"></div>
                    <div class="col-lg-6 col-md-6 col-xs-12 cover">
                        <div class="cover-2">
                            <!-- <img class="img-logo pb-2" src="images/Subtract (1).png"> -->
                            <h3 class="text-info pb-2">Admin Login</h3>
                            <p class="p-proceed pb-2">Proceed to admin dashboard</p>
                        </div>    
                        <div class="container">
                            <form action="Router" method="post" id="myForm" novalidate>
                                <div class="col-md- mb-3">
                                    <div class="input-group">
                                      <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend"><i class="fas fa-user"></i></span>
                                      </div>
                                      <input type="text" name="username" class="form-control"  id="admin-name" aria-describedby="emailHelp" placeholder="Admin username" onfocusout = "validateNumber()">
                                    </div>
                                </div>
                                <div class="col-md- mb-3">
                                    <div class="input-group">
                                      <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend"><i class="fas fa-unlock-alt"></i></span>
                                      </div>
                                      <input type="password" name="password" class="form-control"  id="pwd" placeholder="Password"> 
                                    </div>
                                </div>
                                <button class="btn page-font mb-2"style="background-color:rgb(14, 240, 116)">Login </button>
                                <input type="text" name="signal" value="login" hidden>
                            </form>                 
                        </div>
                    </div>
                    <div class="col-3"></div>
                </div>
            </div>    
      </section>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
  
  </body>
  
  </html>
  
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

</body>

</html>
