## Copyright (c) 2012 Aldebaran Robotics. All rights reserved.
## Use of this source code is governed by a BSD-style license that can be
## found in the COPYING file.

clean(LIBEVENT)

fpath(LIBEVENT event2/event.h)
if (WIN32)
  flib(LIBEVENT DEBUG     NAMES event_core_d)
  flib(LIBEVENT DEBUG     NAMES event_d)
  flib(LIBEVENT OPTIMIZED NAMES event_core)
  flib(LIBEVENT OPTIMIZED NAMES event)
else()
  flib(LIBEVENT NAMES event)
  flib(LIBEVENT NAMES event_core)
  flib(LIBEVENT NAMES event_pthreads)
  if(APPLE)
    qi_set_global(LIBEVENT_DEPENDS PTHREAD)
  else()
    qi_set_global(LIBEVENT_DEPENDS PTHREAD RT)
  endif()
endif()
export_lib(LIBEVENT)
