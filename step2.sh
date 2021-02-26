# 从本镜像下载安装脚本，修改其中被硬编码的仓库源（改为从环境变量读入）并安装 Homebrew / Linuxbrew
git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git brew-install
/bin/bash -c "$(
    cat brew-install/install.sh |
    sed -E 's|^(\s*HOMEBREW_BREW_GIT_REMOTE=)(.*)$|\1"${HOMEBREW_BREW_GIT_REMOTE:-\2}"|g' |
    sed -E 's|^(\s*HOMEBREW_CORE_GIT_REMOTE=)(.*)$|\1"${HOMEBREW_CORE_GIT_REMOTE:-\2}"|g'
)"
rm -rf brew-install

# 也可从 GitHub 获取官方安装脚本，修改其中被硬编码的仓库源，运行以安装 Homebrew / Linuxbrew
/bin/bash -c "$(
    curl -fsSL https://github.com/Homebrew/install/raw/master/install.sh |
    sed -E 's|^(\s*HOMEBREW_BREW_GIT_REMOTE=)(.*)$|\1"${HOMEBREW_BREW_GIT_REMOTE:-\2}"|g' |
    sed -E 's|^(\s*HOMEBREW_CORE_GIT_REMOTE=)(.*)$|\1"${HOMEBREW_CORE_GIT_REMOTE:-\2}"|g'
)"