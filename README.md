# template for JUCE-Framework bygaku.
A minimal JUCE plug-in template with CMake.

### setup flow.
```bash
#  clone from template repository and init submodule
git clone --recurse-submodules https://github.com/bygaku/juce-template.git

cd juce-template

# execution setup.exe
.\bin\setup.ps1 -ProjectName "SuperDelay" -CompanyName "My Audio Labs"

# build
.\bin\build.ps1

# execution
.\bin\build.ps1 -Run

### way to setup.
```bash
# minimal specification.
.\bin\setup.ps1 -ProjectName "SuperDelay"

# specify company name.
.\bin\setup.ps1 -ProjectName "SuperDelay" -CompanyName "My Audio Labs"

# show help.
.\bin\setup.ps1 -Help

# another specify pattern.
.\bin\setup.ps1 -P "SuperDelay" -C "My Audio Labs"