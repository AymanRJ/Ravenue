import Typed from 'typed.js';

const initTyped = () => {
  if (document.querySelector('#home-page-title')) {
    new Typed('#home-page-title', {
      strings: ['<strong><em> AWAITS </em></strong>',
                '<strong><em> IN A ^200 FLAT </em></strong>',
                '<strong><em> IN A ^200 GARDEN</em></strong>',
                '<strong><em> IN A ^200 WAREHOUSE </em></strong>',
                '<strong><em> WHEREVER </em></strong>',
                '<strong><em> WHENEVER </em></strong>'],
      loop: true,
      startDelay: 500,
      typeSpeed: 50,
      smartBackspace: true,
      backSpeed: 50,
      showCursor: false
    });
  }   
}

export { initTyped };