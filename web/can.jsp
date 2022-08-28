<%-- 
    Document   : can
    Created on : Dec 15, 2019, 10:17:01 AM
    Author     : USER
--%>

<%@page import="engine.MyConnect"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Candidate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Votek | Chart</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <link href="css/vote.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">VoteK</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">
      <div class="sidebar-heading">
        Addons
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-folder"></i>
            <span>Pages</span>
          </a>
          <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <h6 class="collapse-header">Check out:</h6>
              <a class="collapse-item" href="index.jsp">Home</a>
              <a class="collapse-item" href="addCandidate.jsp">Add Candidate</a>
              <a class="collapse-item" href="candidate.jsp">View Candidate</a>
             
            </div>
          </div>
        </li>
  

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="charts.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Live-Charts</span></a>
      </li>

      <!-- Nav Item - Tables -->
      
      <hr class="sidebar-divider">
      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Components</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <!-- input links that will be seen when you click on component -->
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>Utilities</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
             <!-- input links that will be seen when you click on Utilities -->
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-info" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-info" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <!-- <span class="badge badge-danger badge-counter">3+</span> -->
              </a>
              <!-- Dropdown - Alerts -->
              
            </li>

            <!-- Nav Item - Messages -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <!-- <span class="badge badge-danger badge-counter">7</span> -->
              </a>
              <!-- Dropdown - Messages -->
               <!-- input links that will be seen when you click on Messages -->
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Setings/Logout</span>
                <img class="img-profile rounded-circle" src="">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
       
 <section class="mt-5 pt-5"></section>
 </section> 
 <section id="form1"> 
        <div class="container ">
            <h4 class="">PRESIDENT</h4>
            <p class=" mb-5">Vote a candidate of your choice for presidency</p>
            <div class="row">
                <% 
                    ArrayList<Candidate> presCan = MyConnect.getCandidates();
                   for(int i = 0; i < presCan.size(); i++){
                       
                %>
                <div class="col-md-4">
                  <div class="card design mb-5" style="width: 100%;">
                      <center><img class="card-img-top cardpix mt-3" src="img/<%=presCan.get(i).getFirstname()%>.jpg"></center>
                     <div class="card-body">
                         <center><h6 class="card-title">Name: <%=presCan.get(i).getFirstname()%>  <%=presCan.get(i).getLastname()%> </h6>
                             <h5 class="card-text">Party</h5>
                             <h4 class="card-text">ID:<%=presCan.get(i).getCandidateid()%> </h4>
                             <button class="btn delete-btn "  onclick="process('<%=presCan.get(i).getCandidateid()%>','President')">Delete</button>
                        <button class="btn btn-info suspend-btn" onclick="run()">Suspend</button></center>
                        
                        </div>

                      </div>
                </div>
                <%
                   }
                %>
                 
                  <div class="btn-toolbar mt-5 mb-3" role="toolbar" aria-label="Toolbar with button groups">
                     <div class="btn-group mr-2" role="group" aria-label="First group">
                        <a onclick="show1()" class="btn btn-primary text-white">1</a>
                        <a onclick="show2()" class="btn btn-primary text-white">2</a>
    <!--                <a onclick="show3()" class="btn btn-primary text-white">3</a>-->
                     </div>
                  </div>
        </div>
        </div>
    </section>
    <section id="form2"> 
        <div class="container ">
            <h4 class="">SECRETARY</h4>
            <p class=" mb-5">Vote a candidate of your choice for Secretary</p>
            <div class="row">
                
                         
                        <div class="col-md-4">
                        <div class="card design" style="width: 100%;">
                            <center><img class="card-img-top cardpix mt-3" src="img/.jpg"></center>
                           <div class="card-body">
                               <center><h6 class="card-title">NAME:  </h6>
                                   <h5 class="card-text">PARTY</h5>
                                   <h4 class="card-text">ID:  </h4>
                                <a class="btn btn-info" href="javascript:{}" onclick="manageUser()" >Delete</a>
                              <button class="btn btn-info" type="submit">Suspend</button></center>
                           </div>

                            </div>
                        </div>
               
                                       
                                <div class="btn-toolbar mt-5 mb-3" role="toolbar" aria-label="Toolbar with button groups">
                                <div class="btn-group mr-2" role="group" aria-label="First group">
                                  <a onclick="show1()" class="btn btn-primary text-white">1</a>
                                  <a onclick="show2()" class="btn btn-primary text-white">2</a>
<!--                                  <a onclick="show3()" class="btn btn-primary text-white">3</a>-->
                                </div>
                              </div>
        </div>
        </div>
    </section>
     <script>
                            
                            function process(canId,positn){
//                               alert("nice 1");
                               $.ajax({
                                   type:"POST",
                                   url:"Ajax2",
                                   data:{canID : canId, position : positn},
                                   cache:false,
                                   
                                   success: function(){
                                       window.location.reload();
                                   }
                               });
                           }
    </script>
                        </script>
    <script src="js/function.js"></script>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/chart-area-demo.js"></script>
  <script src="js/demo/chart-pie-demo.js"></script>
  <script src="js/demo/chart-bar-demo.js"></script>
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="js/manageuser.js"></script>
    </body>
</html>
