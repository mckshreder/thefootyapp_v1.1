// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require jquery.turbolinks
//= require cloudinary
//= require jquery.min
//= require jquery.ui.widget
//= require jquery.iframe-transport
//= require jquery.fileupload
//= require jquery.cloudinary
//= require jquery-ui
//= require_tree .





// this is for the dropdowns
$('div').on('click', function(){
$(this).toggleClass('show-description');
});
// this is for userprofile  nav bar on posts screen
function mainmenu(){
$(' #topright_nav ul ').css({display: 'none'});
$(' #topright_nav li').hover(function(){
$(this).find('ul:first').css({visibility: 'visible',display: 'none'}).show(400);
},function(){
$(this).find('ul:first').css({visibility: 'hidden'});
});
}
// this is for the image uploader form
$('.cloudinary-fileupload').bind('cloudinarydone', function(e, data) {  
  $('.preview').html(
    $.cloudinary.image(data.result.public_id, 
      { format: data.result.format, version: data.result.version, 
        crop: 'fill', width: 150, height: 100 })
  );    
  $('.image_public_id').val(data.result.public_id);    
  return true;
  $('.progress_bar').css('width', Math.round((data.loaded * 100.0) / data.total) + '%'); 
});


// onload
$(document).ready(function(){
mainmenu();

$(document).ready(function() {
  $('.cloudinary-fileupload').fileupload({
    disableImageResize: false,
    maxFileSize: 20000000, // 20MB
    loadImageMaxFileSize: 20000000 // default limit is 10MB
  });
});

});


// this code is what creates the dropdowns for the main nav bar tabs
$(function () {
    $("nav ul li").hover(
    function () {
        $(this).find('#my_new_nav li').stop().animate({
            height: '100%'
        }, {
            duration: 700,
            specialEasing: {
                height: 'easeOutQuint'
            }
        });
        $(this).find('div.dropdown_nav').slideDown();
    },

    function () {
        $(this).find('#my_new_nav li').stop().animate({
            height: '10px'
        }, 700);
        $(this).find('div.dropdown_nav').stop().slideUp();
    });
});




// this is the javascript code for the google maps api


// function loadScript() {
//   var script = document.createElement('script');
//   script.type = 'text/javascript';
//   script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
//       '&signed_in=true&callback=initialize';
//   document.body.appendChild(script);
// }

// call function when user clocks submit post


// $("#post_submit").submit(function (e){
//   e.preventDefault();
//   alert("function called");
//   var lat;
//   var lng;

//   navigator.geolocation.getCurrentPosition(function(position) {
//     var pos = new google.maps.LatLng(position.coords.latitude,
//                                        position.coords.longitude);
//     lat = pos.lat
//     lng = pos.lng
//     var title = document.getElementsByName("title");
//     var body = document.getElementsByName("body");
//     var youtube_url = document.getElementsByName("youtube_url");
//     var image_url = document.getElementsByName("image_url");
//     console.log("lat:" + lat);
//     console.log("lng:" + lng);
//        });
//       data = {
//           title: title,
//           body: body,
//           youtube_url: youtube_url,
//           image_url: image_url,
//           lat: lat,
//           lng: lng,
//           location: pos
//       }
//       console.log(data);

//        $.ajax({ url: '/create',
//           type: 'POST',
//           // beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
//           data: data
//     });
  
// });


 

      