$(function () {
    $("nav ul li").hover(
    function () {
        $(this).find('#my_new_nav li').stop().animate({
            height: '100%'
        }, {
            duration: 700,
            specialEasing: {
                height: 'easeOutQuint'
            }
        });
        $(this).find('div.dropdown_nav').slideDown();
    },

    function () {
        $(this).find('#my_new_nav li').stop().animate({
            height: '10px'
        }, 700);
        $(this).find('div.dropdown_nav').stop().slideUp();
    });
});



