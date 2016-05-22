$(function() {
  $('#create').submit(function () {
      var data = $(this).serialize();
      $.ajax({
      url: '/createPosts/create',
      type: 'POST',
      data: data,
      dataType: 'json',
      success: function (data) {
        alert('Votre Article à bien été créé');
      }

    });

  return false;
  });


  $('.delete').submit(function (){
    if(confirm('Voulez-vous vraiment supprimer cet Article ?')){
      var data = $(this).serialize();
      $.ajax({
        url: '/Post/delete',
        type: 'POST',
        data: data,
        dataType: 'json',
        success: function (data) {
          alert('Votre Article à bien été supprimé !');
          var selector = '#'+data.id;
          $(selector).remove();
        }
      });
    }

  return false;
  });

  $('.createComment').submit(function (){
      var data = $(this).serialize();
      $.ajax({
        url: '/Comments/Create',
        type: 'POST',
        data: data,
        dataType: 'json',
        success: function (data) {

          $('.Comments').append(
            '<div id="'+data.id+'">'+
            data.user+'<br><br>'+
            data.content+'<br><br>'+
            '<form class="deleteComment" method="post">'+
              '<input type="hidden" name="id" value="'+data.id+'">'+
              '<input type="submit" name="delete" value="Supprimer">'+
            '</form>'+
            '</div>'
          );
        }
      });

  return false;
  });


  $('.deleteComment').submit(function (){
      var data = $(this).serialize();
      $.ajax({
        url: '/Comments/Delete',
        type: 'POST',
        data: data,
        dataType: 'json',
        success: function (data) {
          var selector = '#'+data.id;
          $(selector).remove();
        }
      });

  return false;
  });


});
