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
  <link rel="stylesheet" href="assets/styles.css">
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
      <div class="install-caption">&gt;&gt; Install</div>
      <div class="code-container">
        <button class="copy-btn" onclick="copyCode(this)">Copy</button>
        <div class="code-block">
          <pre><code class="language-bash">curl -sSL dotfile.eclairs.cc | bash</code></pre>
        </div>
      </div>
    </div>
  </div>

  <script src="assets/script.js"></script>
</body>
</html>
HTMLEND

# ---------------------------------------------------------------

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