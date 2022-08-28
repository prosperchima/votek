<%@page import="bean.User"%>
<%@page import="bean.Candidate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="engine.MyConnect"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
  <link href="css/vote.css" rel="stylesheet">
</head>

<body class="bg-gradient-white">
    <form id="candidate-form" action="" method="post">
        <input id="form-set-1" type="hidden" />
        <input id="form-set-2" type="hidden"/>
    </form>
  <header>
      <div class=" d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-info border-bottom shadow-sm">
          <h5 class="my-0 mr-md-auto font-weight-normal"><i class="fas fa-laugh-wink fa-2x"></i>VoteK</h5>
          <!-- <img class="photo my-0 mr-md-auto font-weight-normal" src="images/omney1.png"> -->
          <!-- <nav class="my-2 my-md-0 mr-md-3">
            <a class="p-2 text-dark" href="index.html">Home</a>
            <a class="p-2 text-dark" href="#">About Us</a>
            <a class="p-2 text-dark" href="#">Contact Us</a>
          </nav> -->
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
    <section id="form1"> 
        <div class="container ">
            <h4 class="text-dark">PRESIDENT</h4>
            <p class=" mb-5 text-dark">Vote a candidate of your choice for presidency</p>
            <div class="row">
                <%
//                    User user = (User) request.getAttribute("user");
                    User user = (User) request.getAttribute("user");
                    ArrayList<Candidate> candids = MyConnect.fetchCandidates();
                    for(int i=0; i<candids.size(); i++){
                %> 
                        
                    <div class="col-md-4">
                    <div class="card design" style="width: 100%;">
                        <center><img class="card-img-top cardpix mt-3" src="img/<%=candids.get(i).getFirstname() %>.jpg"></center>
                       <div class="card-body mylink">
                           <center><h6 class="text-dark card-title"><%=candids.get(i).getFirstname() %> </h6>
                               <h5 class="card-text"></h5>
<!--                               <button  class="btn btn-info text-white" href="javascript:{}" onclick="sendVote('<%=user.getIdnumber()%>', '<%=candids.get(i).getCandidateid()%>', 'president')" id="vote">VOTE</button>-->
                               <button class="btn text-white  butt vote-btn  mt- mb-" onclick="sendVote(this,'<%=user.getIdnumber()%>', '<%=candids.get(i).getCandidateid()%>', 'president')">VOTE</button></center>
                       </div>

                        </div>
                    </div>
                <% 
                    }
                %>
                                        
                    <div class="btn-toolbar mt-5 mb-3" role="toolbar" aria-label="Toolbar with button groups">
                    <div class="btn-group mr-2" role="group" aria-label="First group">
                      <label class="form-check-label mr-2 text-dark" for="gridCheck">
                        Proceed to the next page to continue voting
                      </label>
                      <a onclick="show1()" class="btn btn-primary text-white">1</a>
                      <a onclick="show2()" class="btn btn-primary text-white">2</a>
<!--                                  <a onclick="show3()" class="btn btn-primary text-white">3</a>-->
                    </div>
                  </div>

            </div>
        </div>
    </section>
    <section id="form2"> 
        <div class="container ">
            <h4 class="text-dark">SECRETARY</h4>
            <p class=" mb-5 text-dark">Vote a candidate of your choice for Secretary</p>
            <div class="row">
                
                         <% 
                            User sec_user = (User) request.getAttribute("sec_user");
                            ArrayList<Candidate> secretary = MyConnect.fetchCandidatesec();
                            for(int i=0; i<secretary.size(); i++){
                         %>
                                          <div class="col-md-4">
                                          <div class="card design" style="width: 100%;">
                                              <center><img class="card-img-top cardpix mt-3" src="img/<%=secretary.get(i).getFirstname() %>.jpg"></center>
                                             <div class="card-body mylink">
                                                 <center><h6 class="card-title text-dark"><%= secretary.get(i).getFirstname() %></h6>
                                                     <h5 class="card-text"></h5>
<!--                                                     <a class="btn vote-btn btn-info text-white" href="javascript:{}" onclick="sendVote('<%=user.getIdnumber()%>', '<%=candids.get(i).getCandidateid()%>', 'secretary')" id="vote">VOTE</a>-->
                                                 <button href="#" class="btn text-white butt vote-btn2 vote-cat2-btn" onclick="sendVote2(this,'<%=user.getIdnumber()%>', '<%=secretary.get(i).getCandidateid()%>', 'secretary')">VOTE</button></center>
                                             </div>
                                             
                                             </div>
                                          </div>
                        <%
                           }
                        %>                         
                                          
                               <div class="btn-toolbar mt-5 mb-3" role="toolbar" aria-label="Toolbar with button groups">
                                <div class="btn-group mr-2" role="group" aria-label="First group">
                                  <label class="form-check-label mr-2 text-dark" for="gridCheck">
                                    Proceed to the next page to continue voting or you submit your vote
                                  </label>
                                  <a onclick="show1()" class="btn btn-primary text-white">1</a>
                                  <a onclick="show2()" class="btn btn-primary text-white">2</a>
<!--                                  <a onclick="show3()" class="btn btn-primary text-white">3</a>-->
                                  <button onclick="relo()" type="submit" class="btn btn-primary text-white">Submit</button>
                                </div>
                              </div>
                               
            </div>
        </div>
    </section>
  
<script>
$(document).ready(function(){
   $("#one").click(function(){
       $("#one").prop('disabled',true);
   }); 
});

</script>
  <script> 
      function relo(){
          window.location.href="index.jsp";
      }
    function sendVote(e,userId, candID, position){
            
        $.ajax({
            type: "POST",
            url: "ajax",
            data: {uId : userId, cId : candID, positn : position},
            cache: false,

            success: function(){
                
                var cntr = document.getElementsByClassName("vote-btn");
                for(var i = 0; i < cntr.length; i++)
                {
                    cntr[i].disabled = true;

                }
                e.disabled = false;
//                location.reload(true);
            }
            
        });
    }
    
    function sendVote2(e,userId, candID, position){
        
        $.ajax({
            type:"POST",
            url:"ajax",
            data:{uId : userId, cId : candID, positn : position},
            cache: false,
            
            success: function(){
                var secre = document.getElementsByClassName("vote-btn2");
                for(var i = 0; i<secre.length; i++){
                    secre[i].disabled =true;
                }
                e.disabled = false;
            }
        });
    }
  </script>  
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="js/function.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="js/manageuser.js"></script>

</body>

</html>
