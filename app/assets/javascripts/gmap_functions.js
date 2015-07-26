function gmap_show(hash)
{
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers(hash);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
}