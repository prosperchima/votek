function show2(){
    var form1 = document.getElementById("form1");
    var form2 = document.getElementById("form2");
    var form3 = document.getElementById("form3");
    form2.style.display ="block";
    form1.style.display ="none";
    form3.style.display ="none";
  }

  function show1(){
    var form1 = document.getElementById("form1");
    var form2 = document.getElementById("form2");
    var form3 = document.getElementById("form3");
    form1.style.display ="block";
    form2.style.display ="none";
    form3.style.display ="none";
  }


  function show3(){
    var form1 = document.getElementById("form1");
    var form2 = document.getElementById("form2");
    var form3 = document.getElementById("form3");
    form1.style.display ="none";
    form2.style.display ="none";
    form3.style.display ="block";
  }


function voteSelected(e)
{

    var cntr = document.getElementsByClassName("vote-btn");
    for(var i = 0; i < cntr.length; i++)
    {
        cntr[i].disabled = true;
       
    }
    e.disabled = false;
       
}


function voteCat2Selected(e)
{
    var cntr = document.getElementsByClassName("vote-btn2");
    
    for(var i = 0; i < cntr.length; i++)
    {
        cntr[i].disabled = true;
    }
    e.disabled = false;
   
}


