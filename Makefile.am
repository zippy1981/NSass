AUTOMAKE_OPTIONS = subdir-objects
ACLOCAL_AMFLAGS = -I m4
SUBDIRS = .
lib_LTLIBRARIES = libsass.la

libsass_la_sources = context.cpp \
                                       document.cpp \
                                       document_parser.cpp \
                                       eval_apply.cpp \
                                       functions.cpp \
                                       node.cpp \
                                       node_emitters.cpp \
                                       node_factory.cpp \
                                       prelexer.cpp \
                                       sass_interface.cpp

libsass_la_LDFLAGS = -no-undefined -version-info 0:1:0

include_HEADERS = sass_interface.h
