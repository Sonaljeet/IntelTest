   var chartwidth = 1000;
    $(".sidebar-dropdown > a").click(function() {
      $(".sidebar-submenu").slideUp(200);
      if (
        $(this)
          .parent()
          .hasClass("active")
      ) {
        $(".sidebar-dropdown").removeClass("active");
        $(this)
          .parent()
          .removeClass("active");
      } else {
        $(".sidebar-dropdown").removeClass("active");
        $(this)
          .next(".sidebar-submenu")
          .slideDown(200);
        $(this)
          .parent()
          .addClass("active");
      }
    });

    $("#close-sidebar").click(function() {
      $(".page-wrapper").removeClass("toggled");
      chartwidth = $('#calendar_chart').width();
      console.log(chartwidth);
    });
    $("#show-sidebar").click(function() {
      $(".page-wrapper").addClass("toggled");
    });

    const button = document.querySelector('.button');
const submit = document.querySelector('.submit');

function toggleClass() {
    var clicks = $(this).data('clicks');
  if (clicks) {
    this.classList.remove('finished');
    this.classList.remove('active');
     
  } else {
     this.classList.toggle('active');
  }
  $(this).data("clicks", !clicks);
}

function addClass() {
  this.classList.add('finished');
}

function rmvClass() {
  this.classList.remove('finished');
}

function addDone() {
  this.classList.add('done');
}

button.addEventListener('click', toggleClass);
button.addEventListener('transitionend', toggleClass);
button.addEventListener('transitionend', addClass);
button.addEventListener('transitionend', rmvClass);