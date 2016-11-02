INCLUDEPATH += \
    /usr/include/hdf5/serial \
    $$PWD/include \
    $$PWD \

LIBS += -L/usr/local/lib \
	-L/home/girinon/ssimrenderer -lssimrenderer \
    -L/usr/lib/x86_64-linux-gnu/hdf5/serial -lhdf5 \
    -L/usr/local/lib/ -lmesh6 \
    -lrply \
    -lmatio \
    -lz


contains(OPENCL, true) {
    include("$$PWD/../opencl.pri")
}
