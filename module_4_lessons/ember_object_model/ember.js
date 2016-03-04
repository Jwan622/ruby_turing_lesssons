Ember.Object.create();

var Person = Ember.Object.extend({
  firstName: null,
  lastName: null,

  fullName: function() {
    return this.get("firstName") + this.get("lastName");
  }.property("firstName", "lastName")
});

var emily = Person.create({
  firstName: "Emily",
  lastName: "MB:"
})


/* property is an Ember Thing that watches firstName and lastName. It caches it and memoizes it until those two change,
fullName is set.
*/

/* get and set trigger the corrct events to fire. get watches these properties. 
get is an ember method. so is set. That's why we start with Ember.Object. We wnat to inherit those
methods. */
