// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui
//= require nifty.min
//= require bootstrap-sprockets
//= require viewportSize.min
//= require pace/pace
//= require turbolinks
//= require autocomplete-rails
//= require_tree .
$(document).ready(function () {
    $(".mainnav-toggle").click(function () {
        if ($("#container").hasClass("mainnav-lg")) {
            $("#container").addClass("mainnav-sm").removeClass("mainnav-lg");

        } else if ($("#container").hasClass("mainnav-sm")) {
            $("#container").addClass("mainnav-lg").removeClass("mainnav-sm");
        }

    });

    $( "#phoneSearch" ).autocomplete( "option", "appendTo", "#add_new_task_modal" );


    $('#phoneSearch').bind('railsAutocomplete.select', function(event, data){
        //$('#search-form').submit()
        console.log("DATA"+data.item.id);
        alert("SHIATe!");

    });
});