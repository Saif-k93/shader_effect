cmake_minimum_required(VERSION 3.16)

project(shader_effect VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# we have to add ShaderTools package to use qsb tool to compile the .vert and .frag file to binary with extension of .qsb
find_package(Qt6 6.5 REQUIRED COMPONENTS Quick ShaderTools)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(shader_effect
    main.cpp

)

qt_add_qml_module(shader_effect
    URI shader_effect
    VERSION 1.0
    QML_FILES
    Main.qml

    RESOURCES
    res.qrc
)

qt6_add_shaders(shader_effect "shader_effect_shaders"
    PREFIX
    "/"
    FILES
    "shaders/black_white.vert"
    "shaders/black_white.frag"
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(shader_effect PROPERTIES
    #    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.shader_effect
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(shader_effect
    PRIVATE
    Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS shader_effect
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

