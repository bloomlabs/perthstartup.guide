  // $(document).ready(function(){
  //   var json = [
  //     {"cat": "cat1", "infowindow": "cat1", "lat":"-34.6624876","lng":"-58.6048213"},
  //     {"cat": "cat2", "infowindow": "cat2", "lat":"-32.9124234","lng":"-60.7318057"}
  //   ];
    
  //   var handler;
  //   var markers = [];
  
  //   function buildMap(){
  //     handler = Gmaps.build('Google');
  //     handler.buildMap({ internal: {id: 'map'}}, function(){
  //       markers = handler.addMarkers(json);
  //       _.each(json, function(elt, index){
  //         _.extend(markers[index], elt);
  //       });
  //       handler.bounds.extendWith(markers);
  //       handler.fitMapToBounds();      
  //    });
  //   }

    function showCategories(categories){
      var shownMakers = []
      _.each(markers, function(marker){
        if (_.contains(categories, marker.cat)){
          marker.show(); 
          shownMakers.push(marker);
        }
        else
          marker.hide();
      })
      handler.resetBounds();
      handler.bounds.extendWith(shownMakers);
      handler.fitMapToBounds();
    }
    
  //   $("input[type='checkbox']").on('click', function(evt, foo){
  //     var checkedCategories = [];
  //     $("input:checked").each(function(index, elt){
  //       checkedCategories.push($(elt).attr('name'));
  //     });
  //     showCategories(checkedCategories);
  //   });
    
  //   buildMap();
  // });