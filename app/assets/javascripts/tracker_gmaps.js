$(document).ready(function () {
    //Tracker map
    trackerMap();



    function trackerMap() {
        var markerMap = new GMaps({
            el: '#maps',
            lat: 37.336095,
            lng: -121.8885431
        });
        markerMap.addMarker({
            lat: 37.336095,
            lng: -121.8885431,
            title: 'Location',
            click: function (e) {
                $.niftyNoty({
                    type: "info",
                    icon: "fa fa-info",
                    message: "You clicked in the marker",
                    container: 'floating',
                    timer: 3500
                });
            },
            infoWindow: {
                content: '<div>HTML Content</div>'
            }
        });

        var mywidth = viewportSize.getWidth() - 640;

        var div = document.getElementById('maps')

        div.style.height = '93vh';
        div.style.position = 'fixed';
        div.style.overflow = 'hidden';
        div.style.width = '' + mywidth + 'px';
        div.style.margin = '50px -320px 0px 320px';
    }

    $("add_task_button").click(function(){
        $('#add_new_task_modal').modal('toggle');
    });

    $("#add_new_task_modal").on('shown.bs.modal', function (e) {
        taskGeoCodeMap();
    });

    //Geocoding map
    function taskGeoCodeMap() {


       var geomap = new GMaps({
            div: '#modal-map',
            lat: 37.336095,
            lng: -121.8885431,
            zoom:13
        });

        var div = document.getElementById('modal-map')
        div.style.height = '400px';
        div.style.position = 'inherit';
        div.style.overflow = 'hidden';
        div.style.width = 'auto';
        //alert("Execute");

        geomap.refresh();
        GMaps.geocode({
            //address: $('#modal-map').val().trim(),
            address: "New Delhi",
            callback: function (results, status) {
                if (status == 'OK') {
                    var latlng = results[0].geometry.location;
                    geomap.setCenter(latlng.lat(), latlng.lng(),function(){

                    });
                    geomap.addMarker({
                        lat: latlng.lat(),
                        lng: latlng.lng()
                    })
                }
            }
        });



    }



});


