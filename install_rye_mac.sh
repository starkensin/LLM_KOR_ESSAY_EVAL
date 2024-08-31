#!/bin/bash

set -e
error_exit() {
    echo "Error: $1" >&2
    exit 1
}

echo "Rye 설치를 시작합니다..."

if ! command -v curl &> /dev/null; then
    error_exit "curl이 설치되어 있지 않습니다. Homebrew를 통해 설치해 주세요: brew install curl"
fi

echo "Rye를 다운로드하고 설치합니다..."
curl -sSf https://rye.astral.sh/get | bash || error_exit "Rye 설치 중 오류가 발생했습니다."

echo "환경 변수를 설정합니다..."
RYE_HOME="$HOME/.rye"
SHELL_CONFIG_FILE=""

if [ -n "$ZSH_VERSION" ]; then
    SHELL_CONFIG_FILE="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_CONFIG_FILE="$HOME/.bashrc"
else
    error_exit "지원되지 않는 셸입니다. zsh 또는 bash를 사용해주세요."
fi

grep -qxF 'export PATH="$HOME/.rye/shims:$PATH"' "$SHELL_CONFIG_FILE" || echo 'export PATH="$HOME/.rye/shims:$PATH"' >> "$SHELL_CONFIG_FILE"
grep -qxF 'eval "$(rye self completion)"' "$SHELL_CONFIG_FILE" || echo 'eval "$(rye self completion)"' >> "$SHELL_CONFIG_FILE"

export PATH="$HOME/.rye/shims:$PATH"
if [ -f "$RYE_HOME/shims/rye" ]; then
    eval "$("$RYE_HOME/shims/rye" self completion)"
fi

echo "Rye 설치를 확인합니다..."
if [ -f "$RYE_HOME/shims/rye" ]; then
    echo "Rye가 성공적으로 설치되었습니다!"
    "$RYE_HOME/shims/rye" --version
else
    error_exit "Rye 설치가 완료되었지만, 실행 파일을 찾을 수 없습니다. 수동으로 설치를 확인해주세요."
fi