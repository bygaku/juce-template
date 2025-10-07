cmake_minimum_required(VERSION 3.22)

#====================================================#
set(PROJECT_NAME "JUCETemplate")
set(PRODUCT_NAME "JUCETemplate")
set(COMPANY_NAME "bygaku")
set(COMPANY_CODE "byga")
set(PLUGIN_CODE "JUCE")
set(BUNDLE_ID "com.bygaku.JUCETemplate")
#====================================================#

project(${PROJECT_NAME} VERSION 0.1.0 LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if(MSVC)
    add_compile_options(/utf-8 /TP)
endif()

#====================================================#

add_subdirectory(libs/JUCE)
add_subdirectory(src)

#====================================================#