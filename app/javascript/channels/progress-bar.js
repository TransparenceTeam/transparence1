import $ from 'jquery';


const progressBar = () => {
  const progress = document.querySelector('.progress-done');
  const data = document.querySelector('.progress-done');
  const value = document.querySelector('.visualized-value');
  const result = (gon.posts * 100) / 50;

  data.setAttribute('data-done', result);
  value.innerHTML = `${result}%`;

  setTimeout(() => {
    progress.style.width = progress.getAttribute('data-done') + '%';
    progress.style.opacity = 1;
  }, 500)

}

window.onload = progressBar();
