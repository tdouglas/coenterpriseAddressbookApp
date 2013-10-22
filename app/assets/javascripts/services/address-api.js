angular.module('addressApp')
.factory('Contact', function($resource) {
  return $resource('/contacts/:contactId.json', {contactId: '@id'}, {
    update: {
      method: 'PUT'
    }
  })
});