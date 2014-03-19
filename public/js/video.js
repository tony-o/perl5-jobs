(function(){
  //detect video capabilities;
  var mobile = (window.orientation == undefined) ? 0 : 1;

  if(mobile){
    //use input type=camcorder
    $("#mobile").show();
  }else{
    //use some flash crap
  }
})();
