'use strict';

angular.module('addressApp')
  .controller('ContactListCtrl', function($scope, Contact, $http) {
    var editing = false;

    //initial state of adding an element
    $scope.adding = false;

    //this holds the currently selected contact
    $scope.selectedContact = {};

    // query all contacts from the JSON API
    $scope.contacts = Contact.query(function() {
      //success callback
      if ($scope.contacts) {
        $scope.selectedContact = $scope.contacts[0];
      }
    });

    //method to set the current Contact
    $scope.select = function(contact) {
      $scope.selectedContact = contact;
    }

    $scope.newContact = function() {
      $scope.adding = true;
      $scope.addedContact = {};
    }

    $scope.cancel = function() {
      $scope.adding = false;
      editing = false;
    }

    $scope.editContact = function(contact) {
      $scope.adding = true;
      editing = true;
      $scope.addedContact = contact;
    }

    $scope.saveContact = function() {
      if (editing) {
        $scope.addedContact.$update(function() {
          $scope.adding = false;
        });
      } else {
        //use a callback to know when it the request finished on the backend
        Contact.save($scope.addedContact, function(jsonContact) {
          $scope.adding = false;
          $scope.contacts.push(jsonContact);

        });
      }
    }

    $scope.deleteContact = function(contact) {

      if (contact.id == $scope.selectedContact.id) {
        $scope.selectedContact == {};
      }
      var index = $scope.contacts.indexOf(contact);
      // delete on the Backend
      contact.$delete();

      $scope.contacts.splice(index, 1);

    }

    $scope.sendFile = function(files) {
      var fd = new FormData();
      //Take the first selected file
      fd.append("contact[picture]", files[0]);

      var id = $scope.selectedContact.id;
      $http.put('/contacts/' + id + '.json', fd, {
        headers: {'Content-Type': undefined },
        withCredentials: true,
        transformRequest: angular.identity
      }).success(function(updatedContact) {
        $scope.selectedContact = updatedContact;
      });

    }

    $scope.uploadPicture = function() {
      $('#hiddenupload').trigger('click');
    }

  });

