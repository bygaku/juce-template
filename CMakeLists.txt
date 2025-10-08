cmake_minimum_required(VERSION 3.22)

#====================================================#
set(PROJECT_NAME "Template")
set(PRODUCT_NAME "Template")
set(COMPANY_NAME "bygaku")
set(COMPANY_CODE "byga")
set(PLUGIN_CODE "TEMP")
set(BUNDLE_ID "com.bygaku.Template")
#====================================================#

project(${PROJECT_NAME} VERSION 0.0.0 LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

if(MSVC)
    add_compile_options(/utf-8 /TP)
endif()

#====================================================#

add_subdirectory(libs/JUCE)
add_subdirectory(src)

#====================================================#