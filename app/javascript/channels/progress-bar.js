const progress = document.querySelector('.progress-done');
const data = document.querySelector('.progress-done');
const value = document.querySelector('.visualized-value');

console.log(document.querySelector('.progress-done'));
console.log(progress.getAttribute('data-done'));

data.setAttribute('data-done', 90);
value.innerHTML = 'hey';

fetch("score_user")
  .then(response => response.json())
  .then((data) => {
    console.log(data);
});



setTimeout(() => {
  progress.style.width = progress.getAttribute('data-done') + '%';
  progress.style.opacity = 1;
}, 500)



export { progress };
