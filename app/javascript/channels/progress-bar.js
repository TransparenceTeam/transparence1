import $ from 'jquery';

const progress = document.querySelector('.progress-done');
const data = document.querySelector('.progress-done');
const value = document.querySelector('.visualized-value');
const result = (gon.posts * 100) / 50;

if (data) {
  data.setAttribute('data-done', result);
  value.innerHTML = `${result}%`;

  setTimeout(() => {
    progress.style.width = progress.getAttribute('data-done') + '%';
    progress.style.opacity = 1;
  }, 500)

}




export { progress };
