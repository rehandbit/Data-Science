
// ===== Shared theme toggle for all notes pages =====
// Loaded with `defer`, so DOM is ready by the time this runs.
 
function setTheme(name){
  document.documentElement.setAttribute('data-theme', name);
  try{ localStorage.setItem('notes-theme', name); }catch(e){}
  document.querySelectorAll('#theme-toggle button').forEach(function(b){
    b.classList.toggle('active', b.dataset.t === name);
  });
}
 
function injectThemeToggle(){
  if (document.getElementById('theme-toggle')) return; // already present
  var wrap = document.createElement('div');
  wrap.id = 'theme-toggle';
  wrap.title = 'Change background';
  ['light','sepia','slate','dark'].forEach(function(t){
    var btn = document.createElement('button');
    btn.dataset.t = t;
    btn.setAttribute('aria-label', t + ' background');
    btn.onclick = function(){ setTheme(t); };
    wrap.appendChild(btn);
  });
  document.body.insertBefore(wrap, document.body.firstChild);
}
 
(function init(){
  injectThemeToggle();
  var saved = 'light';
  try{ saved = localStorage.getItem('notes-theme') || 'light'; }catch(e){}
  setTheme(saved);
})();
 