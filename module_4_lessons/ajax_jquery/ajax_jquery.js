$.getJSON("/api/v1/posts", function(data) {
  $("<p>${data.body}<p>").appendto($posts);
} function() {
  alert("Something went horribly, horribly, wrong.");
});

// The above is one way to do this

// HEre's another with a deferred:

$.getJSON("/api/v1/posts")
  .then(function() { console.log("It was successful.") })
  .fail(function() { console.log("Oh crap!")})
  .always(function () { console.log("I will run no matter what.")})

$(".sendEmailButton").on("click", function() {
  var data = StuffWeScrapeDFromTheDom;
  $.post("/api/v1/emails", data)
    .then()
    .fail()
    .always()
});

// posts route

export default Ember.route.extend({
  model: function () {
    return Ember.$.getJSON('/api/v1/posts');
  }
});

setInterval(function () {
  $.getJSON("/api/v1/wahtever")
    .then();
}, 5000);
