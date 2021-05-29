
//document.getElementById('add-form-btn').onsubmit = function() {
  //document.getElementById('output').textContent = '<%= member.label :name %><%= member.text_field :name %>';
//}
$(function(){
  // jQueryプログラムの内容
  $('.add-form-btn').on('click',function(){
    var inputCount =
    console.log("test")
    $('#output').html("<%= member.label :name %><%= member.text_field :name %>");
  });
});

