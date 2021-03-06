window.contact_map_populate = ->
  latlng = new google.maps.LatLng(-37.823735, 144.991075)

  myOptions = {
    zoom: 12,
    center: latlng,
    scrollwheel: true,
    scaleControl: false,
    disableDefaultUI: false,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }

  map = new google.maps.Map(document.getElementById("contact-map-header"), myOptions)

  marker = new google.maps.Marker {
    map: map,
    icon: $('#contact-map-header').data('map-pin-image'),
    position: map.getCenter()
  }

  listener = ->
    infowindow = new google.maps.InfoWindow { content: $('#contact-map-header').data('office-location') }
    infowindow.open(map, marker)

  google.maps.event.addListener marker, "click", listener

load_script = ->
  script = document.createElement('script')
  script.type = 'text/javascript'
  script.src = 'https://maps.googleapis.com/maps/api/js?v=2&sensor=false&callback=contact_map_populate'
  document.body.appendChild(script)

$(document).on 'ready page:load', load_script
