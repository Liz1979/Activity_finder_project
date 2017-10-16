# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  window.initMap = ->
     if $('#map').size() > 0
      map = new google.maps.Map(document.getElementById('map-canvas'), {
            center: {lat: $('p.latitude').text(), lng: $('p.longitude').text()},
            zoom: 8})

