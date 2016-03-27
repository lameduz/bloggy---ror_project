/**
 * Created by LAMEDUZ on 27/03/2016.
 */

$('document').ready(function(e)
{
    $('.like_button').click(function()
    {
        $.ajax({
            method:'post',
            url: "/posts/id/likes"
        }).done(function(data) {
            console.log(data);
        });
    })
})