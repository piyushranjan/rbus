// Common JavaScript code across your application goes here.

function refresh_trips() {
  jQuery.get("/trips.js",{from: $('#from').attr("value"), to: $('#to').attr("value")}, function(data) {
	       if ($("table#trips").length > 0) {
		 x = $("<tbody></tbody>");
		 cls = "odd";
		 jQuery.each(data, function() {
			       cls = cls == "even" ? "odd" : "even";
			       x.append("<tr class='" + cls + "'><td colspan=\"5\">" + this.from + "</td><td>" );
			     });
		 $($("table#trips")[0]).find("tbody").remove();
		 $($("table#trips")[0]).append(x);
	       }
	     }, "json");
}

$(document).ready(function() {
	$("#from").autocomplete("/stops.js", {
		formatItem: function(row){return row[0].split(",")[1]},
		    formatResult: function(row){if(row){return row[0].split(",")[1]}},
		    autofill: false,
		    minChars: 3
		    });
	$("#from").result(function(event, data, formatted) {
	  if(data){
	      $("#trip_start_stop_id").val(data[0].split(",")[0]);
	      refresh_trips();
	  }
      });
  $("#to").autocomplete("/stops.js", {
	  formatItem: function(row){return row[0].split(",")[1]},
	      formatResult: function(row){if(row){return row[0].split(",")[1]}},
	      autofill: false,
	      minChars: 3
  });
  $("#to").result(function(event, data, formatted) {
	  if(data){
	      $("#trip_end_stop_id").attr("value",data[0].split(",")[0]);
	      refresh_trips();
	  }
      });
    });

