#!/bin/bash

# Swastha Nepal - Deployment Script
# This script helps you build and deploy the app for mobile and web

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Flutter is installed
check_flutter() {
    if ! command -v flutter &> /dev/null; then
        print_error "Flutter is not installed or not in PATH"
        print_status "Please install Flutter from https://flutter.dev/docs/get-started/install"
        exit 1
    fi
    print_success "Flutter is installed"
}

# Enable web support
enable_web() {
    print_status "Enabling web support..."
    flutter config --enable-web
    print_success "Web support enabled"
}

# Get dependencies
get_dependencies() {
    print_status "Getting dependencies..."
    flutter pub get
    print_success "Dependencies installed"
}

# Build for Android
build_android() {
    print_status "Building Android APK..."
    flutter build apk --release
    print_success "Android APK built successfully"
    
    print_status "Building Android App Bundle..."
    flutter build appbundle --release
    print_success "Android App Bundle built successfully"
}

# Build for iOS
build_ios() {
    print_status "Building for iOS..."
    flutter build ios --release --no-codesign
    print_success "iOS build completed"
}

# Build for web
build_web() {
    print_status "Building for web..."
    flutter build web --release
    print_success "Web build completed"
}

# Deploy to Firebase
deploy_firebase() {
    if ! command -v firebase &> /dev/null; then
        print_warning "Firebase CLI not found. Installing..."
        npm install -g firebase-tools
    fi
    
    print_status "Deploying to Firebase..."
    firebase deploy
    print_success "Deployed to Firebase successfully"
}

# Deploy to GitHub Pages
deploy_github_pages() {
    print_status "Deploying to GitHub Pages..."
    # This would typically be done through GitHub Actions
    print_warning "GitHub Pages deployment should be configured through GitHub Actions"
}

# Run tests
run_tests() {
    print_status "Running tests..."
    flutter test
    print_success "Tests completed"
}

# Analyze code
analyze_code() {
    print_status "Analyzing code..."
    flutter analyze
    print_success "Code analysis completed"
}

# Clean build
clean_build() {
    print_status "Cleaning build..."
    flutter clean
    flutter pub get
    print_success "Build cleaned"
}

# Show help
show_help() {
    echo "Swastha Nepal - Deployment Script"
    echo ""
    echo "Usage: $0 [OPTION]"
    echo ""
    echo "Options:"
    echo "  android     Build Android APK and App Bundle"
    echo "  ios         Build for iOS"
    echo "  web         Build for web"
    echo "  all         Build for all platforms"
    echo "  deploy      Build and deploy web to Firebase"
    echo "  test        Run tests"
    echo "  analyze     Analyze code"
    echo "  clean       Clean build"
    echo "  help        Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 android    # Build Android app"
    echo "  $0 web        # Build web app"
    echo "  $0 deploy     # Build and deploy web"
    echo "  $0 all        # Build for all platforms"
}

# Main script
main() {
    print_status "Starting Swastha Nepal deployment..."
    
    # Check Flutter installation
    check_flutter
    
    # Enable web support
    enable_web
    
    # Get dependencies
    get_dependencies
    
    case "${1:-help}" in
        "android")
            build_android
            ;;
        "ios")
            build_ios
            ;;
        "web")
            build_web
            ;;
        "all")
            build_android
            build_ios
            build_web
            ;;
        "deploy")
            build_web
            deploy_firebase
            ;;
        "test")
            run_tests
            ;;
        "analyze")
            analyze_code
            ;;
        "clean")
            clean_build
            ;;
        "help"|*)
            show_help
            ;;
    esac
    
    print_success "Deployment script completed!"
}

# Run main function with all arguments
main "$@" 