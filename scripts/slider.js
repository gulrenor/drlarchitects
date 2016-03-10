angular.module('sliderApp', ['ngAnimate'])
  .controller('slideShowCtrl', function($scope) {
    $scope.slides = [
      {image: 'images/0002_001.jpg', description: 'image 01'},
      {image: 'images/0002_002.jpg', description: 'image 01'}
    ];

    $scope.currentIndex = 0;

    $scope.setCurrentSlideIndex = function (index) {
      $scope.currentIndex = index;
    };

    $scope.isCurrentSlideIndex = function (index) {
      return $scope.currentIndex === index;
    };

    $scope.prevSlide = function() {
      $scope.currentIndex = ($scope.currentIndex < $scope.slides.length - 1) ? ++$scope.currentIndex : 0;
    };

    $scope.nextSlide = function() {
      $scope.currentIndex = ($scope.currentIndex > 0) ?  --$scope.currentIndex : $scope.slides.length - 1;
    };
    
  });
