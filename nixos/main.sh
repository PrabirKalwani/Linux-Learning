#!/bin/bash

# For Flutter: ./setup_workspace.sh flutter
# For Rust: ./setup_workspace.sh rust
# For Node.js install: ./setup_workspace.sh node-install
# For Node.js start: ./setup_workspace.sh node-start
# For Flask setup: ./setup_workspace.sh flask
# Function to build Flutter project
build_flutter() {
    cd /home/user/myapp/android || exit
    ./gradlew --parallel \
        -Pverbose=true \
        -Ptarget-platform=android-x86 \
        -Ptarget=/home/user/myapp/lib/main.dart \
        -Pbase-application-name=android.app.Application \
        -Pdart-defines=RkxVVFRFUl9XRUJfQ0FOVkFTS0lUX1VSTD1odHRwczovL3d3dy5nc3RhdGljLmNvbS9mbHV0dGVyLWNhbnZhc2tpdC85NzU1MDkwN2I3MGY0ZjNiMzI4YjZjMTYwMGRmMjFmYWMxYTE4ODlhLw== \
        -Pdart-obfuscation=false \
        -Ptrack-widget-creation=true \
        -Ptree-shake-icons=false \
        -Pfilesystem-scheme=org-dartlang-root \
        assembleDebug
    
    adb -s localhost:5555 wait-for-device
}

# Function to set up Rust environment
setup_rust() {
    # Open the default Rust file
    xdg-open src/main.rs
}

# Function to install Node.js dependencies
install_node() {
    npm ci --no-audit --prefer-offline --no-progress --timing
}

# Function to start Node.js server
start_node() {
    npm run dev
}

# Function to create Flask virtual environment
setup_flask() {
    python -m venv .venv
    source .venv/bin/activate
    pip install -r requirements.txt
    # Open default Flask files
    xdg-open web/index.html
    xdg-open main.py
}

# Main execution based on the provided workspace settings
case "$1" in
    flutter)
        echo "Building Flutter project..."
        build_flutter
        ;;
    rust)
        echo "Setting up Rust environment..."
        setup_rust
        ;;
    node-install)
        echo "Installing Node.js dependencies..."
        install_node
        ;;
    node-start)
        echo "Starting Node.js server..."
        start_node
        ;;
    flask)
        echo "Setting up Flask environment..."
        setup_flask
        ;;
    *)
        echo "Usage: $0 {flutter|rust|node-install|node-start|flask}"
        exit 1
        ;;
esac



