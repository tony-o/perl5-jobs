$("a[href=#edit]").click(function(){
  var edu = delicious[$(this).attr("__eid")];
  $("input[name='institution']").val(edu.institution);
  $("input[name='jobtitle']").val(edu.degree);
  $("input[name='city']").val(edu.city);
  $("select[name='state']").val(edu.state);
  $("select[name='jobclass']").val(edu.degreetype);
  $("input[name='dtobtained']").val(edu.degdt.substr(0, edu.degdt.indexOf(" ")));
  $("input[name='eid']").val(edu.eid);
  $("#msg").removeClass("hidden");
  $("#clearform").removeClass("hidden");
});


$("a[href=#delete]").click(function(){
  var edu = delicious[$(this).attr("__eid")];
  var del = "/jobseeker/education?delete=" + edu.eid;
  $("h4.modal-title").text("Delete - " + edu.institution + "?"); 
  $("a#deletebutton").attr("href", del);
});

var resetform = function(){
  $("form")[0].reset();
  $("input[name=eid]").val("");
  $("#msg").addClass("hidden");
  $("#clearform").addClass("hidden");
};
