$(document).on('ready page:load', function() {
  var latest = "";

  if($('.data')){
    console.log('yes');
//    poll();
  }

  function poll() {
    setTimeout(function() {
      $.ajax({
        url: "/entries?from=" + latest,
        type: "GET",
        dataType: 'json',
        error: function(e) {
          console.log(e);
        },
        success: function(data) {
          if (data == null) {
                         // do something if no data is returned, perhaps display static info, reset some arrays or display an error message
            console.log('null');
          } else { 
               console.log('not null');
               $.each(data, function(index, element) {
                   console.log(element);
                   latest = element.id;
              });
          }
        },
        complete: poll,
        timeout: 2000
      });
    }, 5000);
  }

});
