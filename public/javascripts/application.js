// Common JavaScript code across your application goes here.

function load_trips() {
  
}

$(document).ready( function() {
  $("#from").autocomplete("/stops.js", {
    formatItem: function(row){return row[0].split(",")[1]},
    formatResult: function(row){return row[0].split(",")[1]}
  });
  $("#from").result(function(event, data, formatted) {$("#trip_start_stop_id").val(data[0].split(",")[0]);});
  $("#to").autocomplete("/stops.js", {
    formatItem: function(row){return row[0].split(",")[1]},
    formatResult: function(row){return row[0].split(",")[1]}
  });
  $("#to").result(function(event, data, formatted) {
    $("#trip_end_stop_id").attr("value",data[0].split(",")[0]);
    load_trips();
  });
});

