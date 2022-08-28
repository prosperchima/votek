function manageUser(action, phone){
     var cntr = document.getElementsByClassName("vote-btn");
    for(var i = 0; i < cntr.length; i++)
    {
        cntr[i].disabled = true;
    }
    e.disabled = false;
    
    $.ajax({
        type: "POST",
        url: "ajax",
        data: {data1 : action, data2 : phone, signal : "manageuser"},
        cache: false,

        success: function(result){
            location.reload(true);
        }
    });
}