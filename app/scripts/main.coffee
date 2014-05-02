$(document).on "click", ".review-column", ->
  if $(this).hasClass("selected")
    $(this).removeClass "selected"
  else
    $(this).addClass "selected"

  $(document).trigger("startPractice")

$(document).on "startPractice", ->
  if $(".review-column.selected").length > 0
    $("#start-button").show()
  else
    $("#start-button").hide()

$(document).on "click", "#start-button", ->
  $("#choose-panel,#start-button").hide()
  $("#game-panel").show()

  window.hiragana_english =
    "first":
      "12354": "a"
      "12356": "i"
      "12358": "u"
      "12360": "e"
      "12362": "o"
    "second":
      "12363": "ka"
      "12365": "ki"
      "12367": "ku"
      "12369": "ke"
      "12371": "ko"

  window.selected_words = _.shuffle(Object.keys(window.hiragana_english["first"]))
  window.selected = window.selected_words.pop()

  $("#hiragana-letter").html("&#" + window.selected);

$(document).on "keypress", (e) ->
  if e.which == 13
    answer = $("#hiragana-answer").val()
    if window.hiragana_english["first"][window.selected] == answer
      alert("You won")
    else
      alert "You lost"
