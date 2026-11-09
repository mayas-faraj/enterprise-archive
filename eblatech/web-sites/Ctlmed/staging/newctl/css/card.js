const cards = document.querySelectorAll('.card');

function transition() {
  if (this.classList.contains('active')) {
    this.classList.remove('card-active')
  } else {
    this.classList.add('card-active');
  }
}

cards.forEach(card => card.addEventListener('click', transition));
 
