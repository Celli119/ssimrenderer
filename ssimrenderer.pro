#-------------------------------------------------
#
# Qt project file
#
# SSIMRenderer library and examples
#
#-------------------------------------------------

TEMPLATE = subdirs

SUBDIRS = \
    ./ssimrenderer_library.pro \
    ./ssimrenderer_examples.pro \

CONFIG += ordered
# QMAKE_CXXFLAGS = -I/usr/include/hdf5/serial