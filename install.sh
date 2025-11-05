#!/bin/bash
          set -e

          REPO="aivm-chaingpt/aivmd"
          BINARY_NAME="aivmd"

          # Detect OS/Arch
          OS=$(uname -s | tr '[:upper:]' '[:lower:]')
          ARCH=$(uname -m)
          case "$ARCH" in
              "x86_64") ARCH="amd64" ;;
              "aarch64"|"arm64") ARCH="arm64" ;;
              *) echo "❌ Unsupported architecture: $ARCH"; exit 1 ;;
          esac

          if [[ "$OS" != "linux" && "$OS" != "darwin" ]]; then
              echo "❌ Unsupported OS: $OS"
              exit 1
          fi

          # Get latest release
          echo "→ Fetching latest release..."
          API_URL="https://api.github.com/repos/$REPO/releases/latest"
          TAG=$(curl -sSLf "$API_URL" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
          [ -z "$TAG" ] && { echo "❌ Failed to get release tag"; exit 1; }

          # Download
          URL="https://github.com/$REPO/releases/download/$TAG/${BINARY_NAME}_${OS}_${ARCH}"
          echo "→ Downloading $URL..."
          TMP_FILE=$(mktemp)
          curl -sSLf "$URL" -o "$TMP_FILE" || {
              echo "❌ Download failed! Check if release exists:"
              echo "   https://github.com/$REPO/releases"
              exit 1
          }

          # Install
          INSTALL_DIR="/usr/local/bin"
          echo "→ Installing to $INSTALL_DIR/$BINARY_NAME..."
          sudo mkdir -p "$INSTALL_DIR"
          sudo mv "$TMP_FILE" "$INSTALL_DIR/$BINARY_NAME"
          sudo chmod +x "$INSTALL_DIR/$BINARY_NAME"

          echo "✓ Successfully installed $($INSTALL_DIR/$BINARY_NAME --version 2>/dev/null || echo "$BINARY_NAME")"
