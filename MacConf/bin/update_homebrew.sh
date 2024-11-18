echo "<-------- Update homebrew START -------->"

if command -v brew >/dev/null 2>&1; then
    echo ">> Homebrew is already installed"
    echo ">> Updating..."
    brew update && brew upgrade
    echo ">> Homebrew has been updated!"
else
    echo ">> Homebrew is not installed"
    echo ">> Installing now..."
    # 使用循环来尝试安装 Homebrew，直到成功为止
    until brew install; do
        /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        if command -v brew >/dev/null 2>&1; then
            echo ">> Homebrew installation completed!"
            break
        else
            echo ">> Homebrew installation failed, retrying..."
            echo "<-------- Update homebrew RESTART -------->"
        fi
    done
fi

if command -v brew >/dev/null 2>&1; then
    echo ">> Homebrew is ready to use."
else
    echo "ERROR: Homebrew setup failed after multiple attempts. Please check manually."
    exit 1
fi

echo "<-------- Update homebrew END -------->"
