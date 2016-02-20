$(document).ready(function () {
  // var sessionValue = '@Request.RequestContext.HttpContext.Session["user_id"]';
  // if(sessionValue == false) {
  //   $('.vote-wrapper').hide();
  // }

  $('.vote a.up-vote').on('click', function(e) {
    e.preventDefault();
    var thisClass = $(this).attr('class');
    var post = thisClass.split(' ')[0];
    var identifier = $(this).attr('id').split('-')[2];
    var vote = $(this).parent().siblings('p').text();
    var num = (parseInt(vote) + 1)
    $(this).parent().siblings('p').text(num);
    voteClick(post, 1, identifier);

  })


});

function voteClick(postType, voteValue, postId) {
    var elem = this;
    console.log(elem)

  $.ajax({
          method: "POST",
          url: "/votes/new",
          data: {post: postType, value: voteValue, postId: postId}
          // dataType: 'json'
  })
    .done(function(response) {
      var vote = response['votes'];
    })
    .fail(function(response) {
      console.log('fail!')
    })
}