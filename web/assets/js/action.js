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

          $('.comments').append(
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


  $('.deleteUser').submit(function (){
    if(confirm('Voulez-vous vraiment supprimer cet utilisateur ?')){
      var data = $(this).serialize();
      $.ajax({
        url: '/Users/delete',
        type: 'POST',
        data: data,
        dataType: 'json',
        success: function (data) {
          alert('L\'utilisateur à bien été supprimé !');
          var selector = '#'+data.id;
          $(selector).remove();
        }
      });
    }

  return false;
  });

  /********************* SMOOTH SCROLL ***************************/

  $('a[href*="#"]:not([href="#"])').click(function () {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            if (target.length) {
                $('html, body').animate({
                    scrollTop: target.offset().top
                }, 1000);
                return false;
            }
        }
    });

    function smoothScroll(page) {
        $('html, body').animate({
            scrollTop: $(page).offset().top
        }, 750);

        event.preventDefault();
    }


});
