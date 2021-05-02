# Developer Guide

This document has been prepared to help develepers to understand the `Jitas`
infrastructure and to participate to the development process easily.

#### About

`Jitas` is a cloud-based virtual desktop environment that assists the presenter
to share high quality materials in the `Jitsi` session. `Jitas` is not only an
application. It is an environment which contains system services, virtual
devices, customized desktop environment, free and open source softwares,
developed tools/scripts/applications and highly customized configurations.

All components of `Jitas` are free and open source.

#### Similarities with Jibri

Technically `Jitas` is very similar to `Jibri` (_Jitsi Broadcasting
Infrastructure_).

- `Jitas` has a virtual desktop environment like `Jibri`
- `Jitas` has virtual audio devices like `Jibri`
- `Jitas` has virtual video devices like `Jibri`
- `Jitas` connects to the meeting room using a customized `Chromium` instance
  like `Jibri`

But `Jitas` does completely the opposite task.

- `Jibri` pulls audio and video from the `Jitsi` meeting room.
- `Jitas` pushes audio and video to the `Jitsi` meeting room.

#### Main components

`Jitas` includes many free and open source software components to create its own
environment.

##### Debian GNU/Linux

`Jitas` is not only an application. `Jitas` needs a highly customized
environment. `Debian 10 Buster` is the officially supported distro and support
will continue in future Debian releases (_I hope_)

##### MATE Desktop Environment

`MATE` is selected as the first supported desktop environment. It's lightweight,
easy to use for many users and works well in a VNC session.

##### x11vnc

`x11vnc` is the VNC server used to access to the `Jitas` desktop remotely.

##### noVNC and websockify

`noVNC` is both an HTML VNC client JavaScript library and an application built
on top of that library.

`Websockify` is a part of `noVNC` project. It`s a webSocket to TCP proxy/bridge.

`noVNC` and `websockify` allow users to connect to the `x11vnc` session using
web browsers. In this way, users can connect to `Jitas` desktop without the need
for a special client application.

#### References

- [Debain](https://www.debian.org/)
- [MATE Desktop Environment](https://mate-desktop.org/)
- [x11vnc](https://github.com/LibVNC/x11vnc)
- [noVNC](https://github.com/novnc/noVNC)
- [websockify](https://github.com/novnc/websockify)
- [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/)
- [ALSA](https://www.alsa-project.org/wiki/Main_Page)
- [YAD](https://github.com/v1cont/yad)
- [Chromium flags](https://peter.sh/experiments/chromium-command-line-switches/)
