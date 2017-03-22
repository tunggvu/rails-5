var ready = function(){
  $(".btn-enrollment").click(function(){
    console.log(this.getAttribute("data-id"))

    var courseID = this.getAttribute("data-id");

    $.ajax({
      url: 'courses/' + courseID + "/enroll",
      dataType: "script",
      method: "post",
      data: {course_id: courseID},
    })
    .done(function() {
      console.log("successful");
    })
    .fail(function() {
      console.log("error");
    });

  })
};

$(document).on("turbolinks:load", ready);
