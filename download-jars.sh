#!/usr/bin/env sh
set -eu
mkdir -p lib
download() {
  url="$1"
  out="$2"
  if command -v curl >/dev/null 2>&1; then
    curl -fL "$url" -o "$out"
  elif command -v wget >/dev/null 2>&1; then
    wget -O "$out" "$url"
  else
    echo "Please install curl or wget first." >&2
    exit 1
  fi
}
download "https://repo.maven.apache.org/maven2/com/formdev/flatlaf/3.7.2/flatlaf-3.7.2.jar" "lib/flatlaf-3.7.2.jar"
download "https://repo.maven.apache.org/maven2/com/formdev/flatlaf-intellij-themes/3.7.2/flatlaf-intellij-themes-3.7.2.jar" "lib/flatlaf-intellij-themes-3.7.2.jar"
download "https://repo.maven.apache.org/maven2/com/mysql/mysql-connector-j/9.5.0/mysql-connector-j-9.5.0.jar" "lib/mysql-connector-j-9.5.0.jar"
echo "Done. JAR files are in the lib folder."
