document.addEventListener('DOMContentLoaded', () => {
  // Remove bash script content
  document.querySelectorAll('*').forEach(el => {
    [...el.childNodes].filter(n => n.nodeType === 3 && 
      (n.textContent.includes('HTMLEND') || n.textContent.includes('#!/bin/bash')))
      .forEach(n => n.remove());
  });
});

function copyCode(btn) {
  const code = btn.nextElementSibling.querySelector('code').textContent;
  navigator.clipboard.writeText(code).then(() => {
    btn.textContent = 'Copied!';
    btn.classList.add('copied');
    setTimeout(() => {
      btn.textContent = 'Copy';
      btn.classList.remove('copied');
    }, 2000);
  });
}

document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('code').forEach(codeElement => {
    codeElement.addEventListener('click', () => {
      const range = document.createRange();
      const selection = window.getSelection();
      range.selectNodeContents(codeElement);
      selection.removeAllRanges();
      selection.addRange(range);
    });
  });
});