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

});
