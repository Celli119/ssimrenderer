#-------------------------------------------------
#
# Qt project file
#
# SSIMRenderer library examples
#
#-------------------------------------------------

TEMPLATE = subdirs

SUBDIRS += \
    SimpleStatismoModel \
    IntensityShapeModel \
    ImageMetrics

CONFIG += ordered
QMAKE_CFLAGS += -I/usr/include/hdf5/serial -Iinclude -I. -I.. -I../..
QMAKE_CXXFLAGS += -I/usr/include/hdf5/serial -Iinclude -I. -I.. -I../..