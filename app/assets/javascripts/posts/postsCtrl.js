FlapperNews.controller('PostsCtrl', [
  '$scope', '$stateParams', 'posts',
  function($scope, $stateParams, posts){
    $scope.post = posts.posts[$stateParams.id];
    $scope.addComment = function(){

      if($scope.body === '') { return; }
      if(!$scope.post.comments){
        $scope.post.comments = [];
      }
        $scope.post.comments.push({
          body: $scope.body,
          author: 'user',
          upvotes: 0
        });

      $scope.body = '';
    };
}]);
