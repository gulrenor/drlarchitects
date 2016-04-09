var app = angular.module('website', ['ngAnimate', 'ngRoute']);

//Create factory object to store the images
app.factory('getImages', function($http) {
  var getImages = {
    async: function() {
      var promise = $http.get('../php/splash-slide.ajax.php')
        .then (function (response) {
          return response.data
        });
        return promise;
    }
  };
  return getImages;
});



// Navigation control and template injection
app.config(function($routeProvider) {
  $routeProvider
    .when('/', {
      templateUrl : 'splash.html'
    })
    .when('/company', {
      templateUrl : 'company.html'
    })
    .when('/projects', {
      templateUrl : 'projects.html'
    })
    .when('/contact', {
      templateUrl : 'contact.html'
    });
});

app.controller('mainController', function($scope, getImages) {
});

function injectImages(getImages) {
  console.log(getImages.length);
}


app.controller('slideImgCtrl', function(getImages, $scope, $interval) {
  getImages.async() // If the images were successfully retrieved...
    .then(function getImagesSucess(d) {
      $scope.data = d;
      return $scope.data;
  });

  $scope.curIndex = 0;
  $scope.advanceDelay = 5000;

  $interval(function(getImagesSuccess) { // Pass scope
    // Ternary: if true (end of array) then reset to 0, otherwise increment.
    $scope.curIndex = ($scope.curIndex > $scope.data.length-2) ? 0 : ++$scope.curIndex;
  }, $scope.advanceDelay);

  $scope.checkIndex = function(index) {
    // Is the ng-repeat counter equal to the array index?
    return $scope.curIndex === index;
  };

  function setIndex(index) {
    $scope.curIndex = index;
  };

});

// ### Image Gallery ###

// Get the images
app.factory('getImgGallery', function($http) {
  var getImgGallery = {
    async: function() {
      var promise = $http.get('../php/splash-slide.ajax.php')
        .then (function (response) {
          return response.data
        });
        return promise;
    }
  };
  return getImgGallery;
});

app.controller('imageGalleryCtrl', function(getImgGallery, $scope, $interval) {
  getImgGallery.async() // If the images were successfully retrieved...
    .then(function getImagesSucess(d) {
      $scope.data = d;
      return $scope.data;
  });

  $scope.hover = function(projectName, $scope) {
    return projectName.showProjectName = ! projectName.showProjectName;
  };
});
