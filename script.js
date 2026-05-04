const menuToggle = document.getElementById('menuToggle');
const navMenu = document.getElementById('navMenu');

menuToggle.addEventListener('click', () => {
  navMenu.classList.toggle('open');
});

window.addEventListener('resize', () => {
  if (window.innerWidth > 720) {
    navMenu.classList.remove('open');
  }
});
