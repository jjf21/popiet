(function() {
  $(".bar1, .bar2,.bar3, .bar4, .bar5, .bar6, .bar7, .bar8").draggable({
    containment: "parent"
  });
  $(".bar1, .bar2,.bar3, .bar4, .bar5, .bar6, .bar7, .bar8").resizable({
    containment: "parent",
    grid: 72,
    minWidth:72
  });
    $(".bar1, .bar2,.bar3, .bar4, .bar5, .bar6, .bar7, .bar8").on("mouseenter", function() {
      $(this).find(".toolbox").slideDown(200);
    });
      $(".bar1, .bar2,.bar3, .bar4, .bar5, .bar6, .bar7, .bar8").on("mouseleave", function() {
      $(this).find(".toolbox").slideUp(200);
    });
})();
