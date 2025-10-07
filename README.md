# JUCE CMake Plug-in Template
A lightweight JUCE plug-in starter template powered by CMake.

## 🚩 Flow
```
1. Clone the template repository and initialize submodules
git clone --recurse-submodules https://github.com/bygaku/juce-template.git DIRECTORYNAME

2. Move into the directory
cd ./juce-template

3. Run setup.ps1
.\bin\setup.ps1 -ProjectName "SuperDelay" -CompanyName "My Audio Labs"

4. Build
cmake -S . -B build
```

## ⚙️ Setup
```
1. Minimal usage
.\bin\setup.ps1 -ProjectName "SuperDelay"

2. Specify a company name
.\bin\setup.ps1 -ProjectName "SuperDelay" -CompanyName "My Audio Labs"

3. Alternate shorthand pattern
.\bin\setup.ps1 -P "SuperDelay" -C "My Audio Labs"
```

## 💡 Show help
```
1. Show help for setup.ps1
.\bin\setup.ps1 -Help

2. Show help for build.ps1
.\bin\build.ps1 -Help
```
