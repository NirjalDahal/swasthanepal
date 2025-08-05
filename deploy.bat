@echo off
REM Swastha Nepal - Deployment Script for Windows
REM This script helps you build and deploy the app for mobile and web

setlocal enabledelayedexpansion

REM Colors for output (Windows compatible)
set "RED=[91m"
set "GREEN=[92m"
set "YELLOW=[93m"
set "BLUE=[94m"
set "NC=[0m"

REM Function to print colored output
:print_status
echo %BLUE%[INFO]%NC% %~1
goto :eof

:print_success
echo %GREEN%[SUCCESS]%NC% %~1
goto :eof

:print_warning
echo %YELLOW%[WARNING]%NC% %~1
goto :eof

:print_error
echo %RED%[ERROR]%NC% %~1
goto :eof

REM Check if Flutter is installed
:check_flutter
flutter --version >nul 2>&1
if errorlevel 1 (
    call :print_error "Flutter is not installed or not in PATH"
    call :print_status "Please install Flutter from https://flutter.dev/docs/get-started/install"
    exit /b 1
)
call :print_success "Flutter is installed"
goto :eof

REM Enable web support
:enable_web
call :print_status "Enabling web support..."
flutter config --enable-web
call :print_success "Web support enabled"
goto :eof

REM Get dependencies
:get_dependencies
call :print_status "Getting dependencies..."
flutter pub get
call :print_success "Dependencies installed"
goto :eof

REM Build for Android
:build_android
call :print_status "Building Android APK..."
flutter build apk --release
call :print_success "Android APK built successfully"

call :print_status "Building Android App Bundle..."
flutter build appbundle --release
call :print_success "Android App Bundle built successfully"
goto :eof

REM Build for iOS
:build_ios
call :print_status "Building for iOS..."
flutter build ios --release --no-codesign
call :print_success "iOS build completed"
goto :eof

REM Build for web
:build_web
call :print_status "Building for web..."
flutter build web --release
call :print_success "Web build completed"
goto :eof

REM Deploy to Firebase
:deploy_firebase
firebase --version >nul 2>&1
if errorlevel 1 (
    call :print_warning "Firebase CLI not found. Installing..."
    npm install -g firebase-tools
)

call :print_status "Deploying to Firebase..."
firebase deploy
call :print_success "Deployed to Firebase successfully"
goto :eof

REM Run tests
:run_tests
call :print_status "Running tests..."
flutter test
call :print_success "Tests completed"
goto :eof

REM Analyze code
:analyze_code
call :print_status "Analyzing code..."
flutter analyze
call :print_success "Code analysis completed"
goto :eof

REM Clean build
:clean_build
call :print_status "Cleaning build..."
flutter clean
flutter pub get
call :print_success "Build cleaned"
goto :eof

REM Show help
:show_help
echo Swastha Nepal - Deployment Script
echo.
echo Usage: %0 [OPTION]
echo.
echo Options:
echo   android     Build Android APK and App Bundle
echo   ios         Build for iOS
echo   web         Build for web
echo   all         Build for all platforms
echo   deploy      Build and deploy web to Firebase
echo   test        Run tests
echo   analyze     Analyze code
echo   clean       Clean build
echo   help        Show this help message
echo.
echo Examples:
echo   %0 android    # Build Android app
echo   %0 web        # Build web app
echo   %0 deploy     # Build and deploy web
echo   %0 all        # Build for all platforms
goto :eof

REM Main script
:main
call :print_status "Starting Swastha Nepal deployment..."

REM Check Flutter installation
call :check_flutter
if errorlevel 1 exit /b 1

REM Enable web support
call :enable_web

REM Get dependencies
call :get_dependencies

REM Process command line arguments
if "%1"=="" goto :show_help
if "%1"=="android" goto :build_android
if "%1"=="ios" goto :build_ios
if "%1"=="web" goto :build_web
if "%1"=="all" (
    call :build_android
    call :build_ios
    call :build_web
    goto :end
)
if "%1"=="deploy" (
    call :build_web
    call :deploy_firebase
    goto :end
)
if "%1"=="test" goto :run_tests
if "%1"=="analyze" goto :analyze_code
if "%1"=="clean" goto :clean_build
if "%1"=="help" goto :show_help
goto :show_help

:end
call :print_success "Deployment script completed!"
exit /b 0 