
//document.getElementById('add-form-btn').onsubmit = function() {
  //document.getElementById('output').textContent = '<%= member.label :name %><%= member.text_field :name %>';
//}
$(function(){
  // jQueryプログラムの内容
  var n = 0;
  $('.add-form-btn').on('click',function(){
    n =n+1
    var content = $('.formB').children().first().clone();
    console.log(content);
    console.log(content.html());
    content.html(content.html().replaceAll("[0]",`[${n}]`));
    content.html(content.html().replaceAll("_0_",`_${n}_`));
    $('.formB').append(content);
  });
});

//<label for="band_members_attributes_0_role">Role</label>
//<input class="form-control" type="text" name="band[members_attributes][0][role]" id="band_members_attributes_0_role">
//<label for="band_members_attributes_0_name">Name</label>