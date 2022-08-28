<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>VoteK | Vote</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
</head>

<body class="bg-gradient-white">
  <header>
      <div class=" d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-info border-bottom shadow-sm">
          <h5 class="my-0 mr-md-auto font-weight-normal"><i class="fas fa-laugh-wink fa-2x"></i>VoteK</h5>
          <!-- <img class="photo my-0 mr-md-auto font-weight-normal" src="images/omney1.png"> -->
          <nav class="my-2 my-md-0 mr-md-3">
            <a class="p-2 text-dark" href="index.html">Home</a>
            <a class="p-2 text-dark" href="#">About Us</a>
            <a class="p-2 text-dark" href="#">Contact Us</a>
          </nav>
          <a class="btn btn-outline-light" href="liveResult.jsp">LiveResult</a>
        </div>
  </header>
  <section>
    <div class="container">
      <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
          <marquee><h4 class="text-info mt-5">Welcome to VoteK, a voting platform of Transparency</h4></marquee>
        </div>
        <div class="col-md-2"></div>
      </div>
    </div>
  </section>    
  <section>
      <div class="container-fluid top-margin ">
        <div class="row">
          <div class="col-lg-1 md-12"></div>
          <div class="col-lg-5 md-12 mr-5 ml-3 con">
            <form name="loginform" action="Router" method="POST" class="mt-4">
                <h1 class="ugomma">You can make the diffrence,<br />With just a little comitment.</h1>
                <p class="page-font ">VoteK is a voting platform that gives you the best voting Experience.<br />We are Particular about the Future and we stand for Intergrity. <br /><br />Your vote is your best Weapon.<br />Be a part for a better Future.</p><br /> 
                <div class="col-md- mb-3">
                    <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text" id="inputGroupPrepend"><i class="fas fa-unlock-alt"></i></span>
                        </div>
                        <input type="text" name="id" placeholder="Enter ID" required=""> 
                    </div>
                </div>
                <h6 style="color:${color}">${info}</h6>
                <button type="submit" class="btn page-font"style="background-color:rgb(14, 240, 116); ">Login to Vote</button> 
                <input type="text" name="signal" value="loginvote" hidden>

            </form>
        </div>
          <div class="col-lg-2 md-12"> </div>
          <div class="col-lg-3 md-12">
            <img class="image1" src="img/img1.png">
          </div>
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
