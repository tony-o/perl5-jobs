var setform = function(){
  $("#" + arguments[0]).val(arguments[1]);
  var li  = $("a[__val='" + arguments[1] + "']");
  var btn = $(li).parentsUntil(".form-group").last().find("button").first();
  $(btn).text($(li).text());
};
