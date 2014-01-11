var index = 0;
$("div[role='graph']").each(function(){
  var fix = function(arg){
    var g = [];
    for(var s in arg){
      g.push(new Array(arg.length+1).join("0").split("").map(parseFloat));
      g[g.length-1][s] = arg[s];
    }
    return g;
  };
  var fin = function () {
                if ((this.bar.value || "0") === "0") {
                  return;
                }
                this.flag = r.popup(this.bar.x, this.bar.y, this.bar.value || "0").insertBefore(this);
                this.bar.animate({transform:"s1,1.35"},400,"elastic");
                var d = $("div[zz='" + this.bar[0].zzindex + "']");
                $(d).css("font-weight","bold");
            },
            fout = function () {
                if ((this.bar.value || "0") === "0") {
                  return;
                }
                this.flag.animate({opacity: 0}, 300, function () {this.remove();});
                this.bar.animate({transform:"s1,1.15"},400,"elastic");
                var d = $("div[zz='" + this.bar[0].zzindex + "']");
                $(d).css("font-weight","normal");
            };
  var type = $(this).attr("type");
  var custom_colors =[
    "#096975",
    "#7DB31B",
    "#CFCF0C",
    "#EA552D",
    "#DB2556"
  ];
  var r,svg,data;
  if (type == "jp") {
    r = Raphael($(this).attr("id"));
    r.setViewBox(0,0,100,100,true);
    svg = document.querySelector("svg");
    svg.removeAttribute("width");
    svg.removeAttribute("height");
    r.setViewBox(0,0,320,180,true);
    data = [[55,20,13,32,5,1]];
    var rg = r.hbarchart(0, 20, 300, 150, data).hover(fin,fout).transform("s1,1.15");
    //set colors manually
    var colorize2 = function(){ $(this).css("color", custom_colors[index++ % custom_colors.length]); };
    for(var i in rg[1]){
      try{
        rg[1][i].bar[0].zzindex = i;
        i = rg[1][i].bar[0];
        $(i).attr("fill", custom_colors[index % custom_colors.length]);
        var d = $("#" + $(this).attr("id") + "legend > div:nth-child(" + (1+index) + ")")[0];
        $(d).css("color", custom_colors[index++ % custom_colors.length]);
        $(d).attr("zz", index-1);
      }catch(e){ }
    }
  };
});

