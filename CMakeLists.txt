project(capnp-test)
cmake_minimum_required(VERSION 3.8.0)

# set(CMAKE_COMMON_FLAGS "-dead_strip")

set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)

set(CMAKE_CXX_STANDARD 14)

set(CMAKE_CXX_FLAGS " -fno-rtti -fno-exceptions  -DCAPNP_LITE=1 -flto ")

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -dead_strip -flto -ffunction-sections")

set(CMAKE_BUILD_TYPE Release)

set(CMAKE_CXX_FLAGS_RELEASE "-Os")

# set(EXTERNAL_CAPNP /usr/local/bin/capnp)
# set(CapnProto_DIR /Users/proffan/Projects/Development/Robotics/capnp-test/local/lib/cmake/CapnProto)

find_package(CapnProto
CONFIG
REQUIRED)

capnp_generate_cpp(addressbookSources addressbookHeaders addressbook.capnp)
capnp_generate_cpp(msgSources msgHeaders test.capnp)

add_executable(test_capnp main.cpp ${addressbookSources} ${msgSources})

target_link_libraries(test_capnp PRIVATE CapnProto::capnp -flto)
target_include_directories(test_capnp PRIVATE ${CMAKE_CURRENT_BINARY_DIR})