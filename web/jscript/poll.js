/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    refresh();
});


function refresh()
{
    getJson("poll.jsp",function(data, status){
        if(status === "done")
        {
            var d = JSON.parse(data);
            
            if(d.status === "success")
            {
                alert(d.data);
                setTimeout(function(){refresh();}, 3000);
            }
            else
            {
                setTimeout(function(){refresh();}, 3000);
            }
        }
        else
        {
            setTimeout(function(){refresh();}, 3000);
        }
    });
}