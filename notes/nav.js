
// ===== Shared sidebar navigation for all notes pages =====
// To add a new page later: just add one line to the PAGES array below.
// file = exact filename in the notes/ folder. title = label shown in the menu.
 
var PAGES = [
  { file: "notes.html",                          title: "Home" },
  { file: "statistics-notes.html",                title: "Statistics — All Topics" },
  { file: "hypothesis_testing_complete_guide.html", title: "Hypothesis Testing" },
  { file: "hypothesis_interview_qa.html",         title: "Hypothesis Q&A" },
  { file: "outlier_complete_guide.html",          title: "Outliers" },
  { file: "ml_complete_interview_guide.html",     title: "ML — Complete Guide" },
  { file: "ml_fundamentals_interview_qa.html",    title: "ML Fundamentals Q&A" },
  { file: "python_datascience_interview_qa.html", title: "Python for Data Science" },
  { file: "sql_interview_complete_guide.html",    title: "SQL" }
];
 
function currentFileName(){
  var path = window.location.pathname;
  var name = path.substring(path.lastIndexOf('/') + 1);
  return name === '' ? 'notes.html' : name;
}
 
function buildNav(){
  if (document.getElementById('site-nav')) return; // avoid duplicates
 
  var current = currentFileName();
 
  var nav = document.createElement('div');
  nav.id = 'site-nav';
 
  var label = document.createElement('div');
  label.className = 'nav-title';
  label.textContent = 'Notes';
  nav.appendChild(label);
 
  PAGES.forEach(function(p){
    var a = document.createElement('a');
    a.href = p.file;
    a.textContent = p.title;
    if (p.file === current) a.classList.add('active');
    nav.appendChild(a);
  });
 
  document.body.insertBefore(nav, document.body.firstChild);
 
  // Hamburger toggle for narrow screens
  var toggle = document.createElement('button');
  toggle.id = 'nav-toggle';
  toggle.setAttribute('aria-label', 'Open notes menu');
  toggle.textContent = '\u2630'; // ☰
  toggle.onclick = function(){
    nav.classList.toggle('open');
  };
  document.body.insertBefore(toggle, document.body.firstChild);
}
 
buildNav();