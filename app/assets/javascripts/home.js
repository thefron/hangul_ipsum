//= require jquery
//= require jquery_ujs

window.dataLayer = window.dataLayer || [];

const selectText = (element) => {
  const t = $(element)[0];

  if (document.body.createTextRange) {
    range = document.body.createTextRange();
    range.moveToElementText(t);
    range.select();
  } else if (window.getSelection) {
    selection = window.getSelection();
    range = document.createRange();
    range.selectNodeContents(t);
    selection.removeAllRanges();
    selection.addRange(range);
  }
};

$(document).ready(function () {
  $("#generate_ipsum").on("ajax:success", function (e, xhr) {
    $(".ipsum_result_container").fadeIn();
    $("#ipsum_result").html(xhr.ipsum.replace(/(?:\r\n|\r|\n)/g, "<br />"));

    window.dataLayer.push({
      event: "click",
      value: "generate",
    });
  });

  $("#ipsum_result").click(function () {
    selectText(this);
  });
});
