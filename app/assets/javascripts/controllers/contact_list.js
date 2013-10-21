'use strict';

angular.module('addressApp')
  .controller('ContactListCtrl', function($scope, Contact) {

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
    }

    $scope.cancel = function() {
      $scope.adding = false;
    }

    $scope.saveContact = function() {
      //use a callback to know when it the request finished on the backend
      Contact.save($scope.addedContact, function(jsonContact) {
        $scope.adding = false;
        $scope.contacts.push(jsonContact);

      });
    }

    $scope.deleteContact = function(contact) {

      var index = $scope.contacts.indexOf(contact);
      // delete on the Backend
      contact.$delete();

      $scope.contacts.splice(index, 1);
    }
  });

