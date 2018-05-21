
//Jquery function
(function ($) {
    var id = getUrlVars()["id"];
    var page = getUrlVars()["page"];
    
    if (!isNaN(page)) {
        var count = $('#hidCount').val();
        
        var row = parseInt(page);
        if(count > 10 && row > 6){
            if(row+4 > count){
                row = 6 + (row+4-count);
            } else {
                row = 6; // >6 olanda hemishe 6-ci yerde olur, ashagidaki istisnadan bashqa..
            }
        }
        row = row+2; //ilk 2 li tagina gore
       
        $('#pagination2 > li:nth-child(' + row + ')').addClass("active");

        if(page === count){
            $('#next').addClass("disabled");
            $('#pagination2 > li:last-child').addClass("disabled");
        }
        if(page === '1'){
            $('#prev').addClass("disabled");
            $('#pagination2 > li:first-child').addClass("disabled");
        }
    } else {
        $('#pagination2 > li:nth-child(3)').addClass("active");
        $('#pagination2 > li:nth-child(1)').addClass("disabled");
        $('#prev').addClass("disabled");
    }

})(jQuery);


function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (m, key, value) {
        vars[key] = value;
    });
    return vars;
}

function getPagination(id, number, home) {
    $.get(home + "/ajax/pagination?id=" + id + "&page=" + number, function (data, status) {
        console.log(data);
        $("#main-content").html(data);
        var row = parseInt(number) + 1;
        $('#pagination1 > li:nth-child(' + row + ')').addClass("active");
    });
}


function setContent(id, home) {
    $.get(home + "/jobDetailAjax?id=" + id, function (data, status) {
        $("#modal2").html(data);
    });
    getContentAsJson(id, home);
}


function getContentAsJson(id, home) {

//        var search = {}
//        search["username"] = $("#username").val();
//        search["email"] = $("#email").val();

    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: home + "/ajax/jobDetailJson",
        data: JSON.stringify(id),
        dataType: 'json',
        timeout: 100000,
        success: function (data) {
            console.log("SUCCESS: ", data);
            display(data, home);
        },
        error: function (e) {
            console.log("ERROR: ", e);
            displayError(e);
        },
        done: function (e) {
            console.log("DONE");
        }
    });
}


function display(data, home) {
    var job = data.result;
    var id = job.id;
    var company = job.company.replace(/ /g, '-').split('/').join('-');
    var jobTitle = job.jobTitle.replace(/ /g, '-').split('/').join('-');
    var jobSource = job.link;
    $("#jobId").attr("href", home + "/job/" + id + "/" + company + "-" + jobTitle);
    $("#jobSource").attr("href", jobSource);
}


function displayError(data) {
    var json = "<h4>Ajax Response</h4><pre>" + JSON.stringify(data, null, 4) + "</pre>";
    $('#modal2').html(json);
}


