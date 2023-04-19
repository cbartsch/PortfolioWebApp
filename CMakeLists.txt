cmake_minimum_required(VERSION 3.16)

project(PortfolioWebApp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Felgo REQUIRED)

set(PRODUCT_IDENTIFIER "at.cb.PortfolioWebApp")
set(PRODUCT_VERSION_NAME "1.0")
set(PRODUCT_VERSION_CODE 1)
#set(PRODUCT_LICENSE_KEY "")
set(PRODUCT_STAGE test)

set(FELGO_PLUGINS admob amplitude flurry gamecenter soomla)

# Find all QML/JS files for the QML compiler:
file(GLOB_RECURSE QmlFiles RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} qml/*.qml qml/*.js)

# Find all non-QML/JS files in the qml and assets folder to add as resources:
file(GLOB_RECURSE AssetsFiles RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} assets/* qml/*)
list(REMOVE_ITEM AssetsFiles ${QmlFiles})

qt_add_executable(appPortfolioWebApp main.cpp ${QmlFiles} ${AssetsFiles})

felgo_configure_executable(appPortfolioWebApp)

# Deploy resources to build folder/package directly - comment for publishing
#deploy_resources("${QmlFiles};${AssetsFiles}")

# Add QML files and resources to QML module to included them via QRC automatically:
qt_add_qml_module(appPortfolioWebApp URI at.impossibru.PortfolioWebApp VERSION 1.0
# uncomment for publishing:
    #QML_FILES ${QmlFiles}
    RESOURCES ${AssetsFiles} ${QmlFiles}
NO_RESOURCE_TARGET_PATH
)

if(EMSCRIPTEN)
    # copy wasm shell
    file(GLOB_RECURSE WasmFiles RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} wasm/*)
    target_sources(appPortfolioWebApp PRIVATE ${WasmFiles})

    foreach(FILE ${WasmFiles})
        # Get the relative path to the file.
        get_filename_component(FILE_NAME ${FILE} NAME)

        configure_file(${FILE} "${CMAKE_CURRENT_BINARY_DIR}/${FILE_NAME}" COPYONLY)
    endforeach()
endif()

target_compile_definitions(appPortfolioWebApp PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(appPortfolioWebApp PRIVATE Felgo)
