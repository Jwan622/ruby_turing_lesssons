var app = angular.module('turing', [ ]);
app.controller('UserController', function($scope){
  $scope.todoList = []
  $scope.currentTodo = ""
  $scope.addTodo = function() {
    if($scope.currentTodo != "") {
      todoObject = {
        name:$scope.currentTodo,
        finished:false
      }
      $scope.todoList.push(todoObject)
    }
  }
  $scope.deleteTodo = function(index) {
    $scope.todoList.splice(index,1)
  }
});

app.directive("todoList", function() {
  return {
    restrict:"E",
    templateUrl:"todoList.html"
  }
})

app.directive("todoItem", function() {
  return {
    // actual element
    restrict: 'E',
    templateUrl: 'todoItem.html'
  };
})
