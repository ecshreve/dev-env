#!/usr/bin/env bash

set -e

# adapted from:
# https://github.com/devcontainers/features/blob/main/src/go/install.sh
GO_TOOLS="\
    golang.org/x/tools/gopls@latest \
    honnef.co/go/tools/cmd/staticcheck@latest \
    golang.org/x/lint/golint@latest \
    github.com/mgechev/revive@latest \
    github.com/go-delve/delve/cmd/dlv@latest \
    github.com/go-task/task/v3/cmd/task@latest \
    github.com/princjef/gomarkdoc/cmd/gomarkdoc@latest"

echo "Installing common Go tools..."
export PATH=/usr/local/go/bin:${PATH}

mkdir -p /tmp/gotools /usr/local/etc/vscode-dev-containers 
cd /tmp/gotools
export GOPATH=/tmp/gotools
export GOCACHE=/tmp/gotools/cache

(echo "${GO_TOOLS}" | xargs -n 1 go install -v )2>&1 | tee -a /usr/local/etc/vscode-dev-containers/go.log

# Move Go tools into path and clean up
if [ -d /tmp/gotools/bin ]; then
    mv /tmp/gotools/bin/* /usr/local/go/bin/
    rm -rf /tmp/gotools
fi

# Install golangci-lint from precompiled binares
echo "Installing golangci-lint latest..."
curl -fsSL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | \
    sh -s -- -b "/usr/local/go/bin"