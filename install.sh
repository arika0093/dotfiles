:<<"HTMLEND"
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dotfiles Install</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:ital,wght@0,100..800;1,100..800&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: "JetBrains Mono", Consolas, monospace;
      margin: 0;
      padding: 20px;
      background: #0a0a0a;
      color: #f0f6fc;
      height: 100vh;
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      align-items: center;
      overflow: hidden;
      position: relative;
    }
    .container {
      max-width: 800px;
      width: 100%;
      padding: 4ex;
      margin-top: 20vh;
      background: rgba(255, 255, 255, 0.05);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      border-radius: 20px;
      border: 1px solid rgba(255, 255, 255, 0.1);
      box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
    }
    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 40px;
    }
    .header h1 {
      margin: 0;
    }
    .code-container {
      position: relative;
      margin: 20px 0;
    }
    .code-block {
      background: #0d1117;
      border-radius: 6px;
      overflow: hidden;
      border: 1px solid #444;
      border-radius: 10px;
    }
    .copy-btn {
      position: absolute;
      top: 15px;
      right: 12px;
      background: #21262d;
      border: 1px solid #999b9d;
      color: #f0f6fc;
      padding: 6px 12px;
      border-radius: 6px;
      cursor: pointer;
      z-index: 1;
    }
    .copy-btn:hover {
      background: #30363d;
    }
    .copy-btn.copied {
      background: #238636;
      border-color: #238636;
    }
    pre {
      margin: 0;
      padding: 20px 16px;
      overflow-x: auto;
    }
    code {
      font-family: "JetBrains Mono", Consolas, monospace;
      color: #f0f6fc;
    }
    code::before {
      content: '$ ';
    }
    .github-link {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      background: #21262d;
      color: #f0f6fc;
      text-decoration: none;
      padding: 8px 16px;
      border-radius: 6px;
      border: 1px solid #30363d;
      transition: background-color 0.2s;
    }
    .github-link:hover {
      background: #30363d;
      color: #f0f6fc;
    }
    .github-icon {
      width: 16px;
      height: 16px;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="header">
      <h1>⚙️dotfiles</h1>
      <a href="https://github.com/arika0093/dotfiles" class="github-link" target="_blank">
        <svg class="github-icon" viewBox="0 0 16 16" fill="currentColor">
          <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"/>
        </svg>
        View on GitHub
      </a>
    </div>

    <div class="install-section">
      <div class="code-container">
        <button class="copy-btn" onclick="copyCode(this)">Copy</button>
        <div class="code-block">
          <pre><code class="language-bash">curl -sSL dotfile.eclairs.cc | bash</code></pre>
        </div>
      </div>
    </div>
  </div>

  <script>
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
  </script>
</body>
</html>
HTMLEND

#!/bin/bash
TARGET_BRANCH=${1:-'master'}
# based repository
DOTFILE_REPOSITORY="https://github.com/arika0093/dotfiles.git"
# tar.gz location
TARBALL_LOCATION="https://github.com/arika0093/dotfiles/archive/${TARGET_BRANCH}.tar.gz"

# ---------------------------------------------------------------
DOT_DIR="$HOME/dotfiles"

has() {
  type "$1" > /dev/null 2>&1
}

if [ ! -d ${DOT_DIR} ]; then
  # install this repository
  if has "git"; then
    git clone -b ${TARGET_BRANCH} ${DOTFILE_REPOSITORY} ${DOT_DIR}
  elif has "curl" || has "wget"; then
    if has "curl"; then
      curl -L ${TARBALL_LOCATION} -o master.tar.gz
    else
      wget ${TARBALL_LOCATION}
    fi
    tar -zxvf master.tar.gz
    rm -f master.tar.gz
    mv -f dotfiles-master "${DOT_DIR}"
  else
    echo "curl or wget or git required"
    exit 1
  fi

  # ... and install!
  bash ${DOT_DIR}/init.sh ${DOT_DIR}
else
  # if not exist `~/.config/dotfiles-installed`; then not installed yet.
  # for example, vscode will be downloaded and execute install.sh only.
  if [ ! -f ${HOME}/.config/dotfiles-installed ]; then
    bash ${DOT_DIR}/init.sh ${DOT_DIR}
  else
    echo "dotfiles already exists and installed."
    exit 0  
  fi
fi