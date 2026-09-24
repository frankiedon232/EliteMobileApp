$(document).ready(function() {
    // START: Swipe gestures for menues: right to left swipe gestures. //////////////////
    var myElement = document.getElementById('trigger_menu');

    myElement.addEventListener("touchstart", startTouch, true);
    myElement.addEventListener("touchmove", moveTouch, true);

    // Swipe Up / Down / Left / Right
    var initialX = null;
    var initialY = null;

    function startTouch(e) {
        initialX = e.touches[0].clientX;
        initialY = e.touches[0].clientY;
    };

    function moveTouch(e) {
        if (initialX === null) {
            return;
        }

        if (initialY === null) {
            return;
        }

        var currentX = e.touches[0].clientX;
        var currentY = e.touches[0].clientY;

        var diffX = initialX - currentX;
        var diffY = initialY - currentY;

        if (Math.abs(diffX) > Math.abs(diffY)) {
            // sliding horizontally
            if (diffX > 0) {
                // swiped left
                // console.log("swiped left");
            } else {
                // swiped right and trigger menu.

                $('body').addClass('menu-left-open');
                $('body .wrapper').append('<div class="backdrop"></div>');
                $('.backdrop').on('click', function() {
                    $('body').removeClass('menu-left-open');
                    $('.backdrop').fadeOut().remove();
                });

                // console.log("swiped right");
            }
        } else {
            // sliding vertically
            if (diffY > 0) {
                // swiped up
                // console.log("swiped up");
            } else {
                // swiped down
                // console.log("swiped down");
            }
        }

        initialX = null;
        initialY = null;

        e.preventDefault();
    }

    // START: Swipe gestures for menues: right to left swipe gestures. //////////////////
})