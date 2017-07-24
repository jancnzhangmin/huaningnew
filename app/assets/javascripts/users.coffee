# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ -> $("[data-validate]").blur -> $this = $(this) $.get($this.data("validate"), name: $this.val() ).success(-> $("#divName_info").empty() $("#divName_info").append ""+"can" return ).error -> $("#divName_info").empty() $("#divName_info").append ""+"exist" return return return