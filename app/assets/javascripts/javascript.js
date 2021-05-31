
//document.getElementById('add-form-btn').onsubmit = function() {
  //document.getElementById('output').textContent = '<%= member.label :name %><%= member.text_field :name %>';
//}
$(function(){
  // jQueryプログラムの内容
  $('.add-form-btn').on('click',function(){
    var n =n+1
    var content = $('.formA').children().first().clone();
    $('.formA').append(content);
    $('#band_members_attributes_0_role').attr('name').replace("0", "${n}");
    $('#band_members_attributes_0_role').attr('id').replace("0", "${n}");
    $('#band_members_attributes_0_name').attr('name').replace("0", "${n}");
    $('#band_members_attributes_0_name').attr('id').replace("0", "${n}");
  });
});

//<label for="band_members_attributes_0_role">Role</label>
//<input class="form-control" type="text" name="band[members_attributes][0][role]" id="band_members_attributes_0_role">
//<label for="band_members_attributes_0_name">Name</label>