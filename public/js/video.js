(function(){
  //detect video capabilities;
  var mobile = (window.orientation == undefined || window.orientation == "") ? 0 : 1;

    console.log(mobile);
  if(mobile || 1==1){
    //use input type=camcorder
    $("#mobile").show();
  }else{
    //use some flash crap
    $("#startop").show();
  }
})();
