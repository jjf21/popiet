//= require jquery_ujs
//= require underscore
//= require gmaps/google
//= require_tree .
$(".sticky-content").stick_in_parent({
  parent: "body", // note: we must now manually provide the parent
});
