$("a[href=#edit]").click(function(){
  var edu = delicious[$(this).attr("__eid")];
  $("input[name='employer']").val(edu.employer);
  $("input[name='jobtitle']").val(edu.jobtitle);
  $("input[name='city']").val(edu.city);
  $("select[name='state']").val(edu.state);
  $("select[name='jobclass']").val(edu.jobclass);
  $("input[name='startdt']").val(edu.startdt.substr(0, edu.startdt.indexOf(" ") > -1 ? edu.startdt.indexOf(" ") : edu.startdt.length));
  $("input[name='enddt']").val(!edu.enddt ? '' : edu.enddt.substr(0, edu.enddt && edu.enddt.indexOf(" ") > -1 ? edu.enddt.indexOf(" ") : edu.enddt.length));
  $("input[name='phonenumber']").val(edu.phonenumber);
  $("input[name='contactok']").prop('checked', edu.contactok ? true : false);
  $("input[name='eid']").val(edu.eid);
  $("#msg").removeClass("hidden");
  $("#clearform").removeClass("hidden");
});


$("a[href=#delete]").click(function(){
  var edu = delicious[$(this).attr("__eid")];
  var del = "/jobseeker/employers?delete=" + edu.eid;
  $("h4.modal-title").text("Delete - " + edu.employer + "?"); 
  $("a#deletebutton").attr("href", del);
});

var resetform = function(){
  $("form")[0].reset();
  $("input[name=eid]").val("");
  $("#msg").addClass("hidden");
  $("#clearform").addClass("hidden");
};
