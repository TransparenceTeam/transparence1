import $ from 'jquery';

const progress = document.querySelector('.progress-done');
const data = document.querySelector('.progress-done');
const value = document.querySelector('.visualized-value');
const result = (gon.posts * 100) / 50;


console.log(document.querySelector('.progress-done'));
console.log(progress.getAttribute('data-done'));


console.log(result)

data.setAttribute('data-done', result);
value.innerHTML = `${result}%`;



setTimeout(() => {
  progress.style.width = progress.getAttribute('data-done') + '%';
  progress.style.opacity = 1;
}, 500)


export { progress };
