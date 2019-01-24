var dataResult = '';
let searchBox = $(".search");
let resultBox = $(".search-list");
let filteredData;


$(document).ready(function(){
    getData();

    searchBox.keyup(function(){
        console.clear();
        filteredData = filterData(searchBox.val(),dataResult);
        resultBox.empty();
        resultBox.html(filteredData);
    });
});

function getData(){
    $.ajax({
        url : "https://musicdemons.com/api/v1/artist",
        type: "GET",
        dataType : "json",
        success : function(data) {
            storeData(data);
        }
    });
}

function storeData(data){
    dataResult = data;
    //console.log(dataResult)
}

function filterData(input, data){
    let filteredData = "";

    console.log(input);

    for (i = 0; i < data.length; i++) {
        if(data[i]['name'].indexOf(input) >= 0)
        filteredData += "<li>" + data[i]['name'] + "</li>";
    }
    //console.log(filteredData);
    return filteredData;
}