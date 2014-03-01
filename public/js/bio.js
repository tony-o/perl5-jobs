(function(){
  var latestreq = "";
  var cskilllist = { };

  var rebind = function(){
    $("#skillsuggestions > div").click(function(){
      var t = $(this).text();
      $("#skilllist").append($("<div></div>").text(t));
      $("#skillinfo").val($("#skillinfo").val() + "\"" + t + "\",");
      $("#skillsuggestions").children().remove();
    });
  };

  $("#peterpiper").keydown(function(e){ if(e.keyCode == 13){ e.preventDefault(); } });
  $("#peterpiper").keyup(function(e){
    e.preventDefault();
    e.stopPropagation();
    var val = $(this).val();
    if(e.keyCode == 13 || e.keyCode == 10){
      $("#skilllist").append($("<div></div>").text(val));
      $("#skillinfo").val($("#skillinfo").val() + "\"" + val + "\",");
      return false;
    }
    latestreq = val;
    if(val.length > 3){
      $.get('/jobseeker/skills/' + val, function(data){
        if(val != latestreq){ return; }
        var d = data.split("\n");
        $("#skillsuggestions").children().remove();
        for(var i in d){
          var j = d[i].split(",", 2);
          cskilllist[j[0]] = j[1];
          $("#skillsuggestions").append($("<div></div>").text(j[1]));
        }
        rebind();
      });
    };
  }); 
})();
