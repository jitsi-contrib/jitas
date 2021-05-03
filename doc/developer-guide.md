# Developer Guide

This document is to help develepers to understand the `Jitas` infrastructure and
to participate to the development process easily.

- [1. About](#1-about)
- [2. Similarities with Jibri](#2-similarities-with-jibri)
- [3. Main components](#3-main-components)
  - [3.1 Debian GNU/Linux](#31-debian-gnu-linux)
  - [3.2 MATE Desktop Environment](#32-mate-desktop-environment)
  - [3.3-x11vnc](#33-x11vnc)
  - [3.4 noVNC and websockify](#34-novnc-and-websockify)

#### 1. About

`Jitas` is a cloud-based virtual desktop environment that assists the presenter
to share high quality materials in the `Jitsi` session. `Jitas` is not only an
application. It is an environment which contains system services, virtual
devices, customized desktop environment, free and open source softwares,
developed tools/scripts/applications and highly customized configurations.

All components of `Jitas` are free and open source.

#### 2. Similarities with Jibri

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

#### 3. Main components

`Jitas` includes many free and open source software components to create its own
environment.

##### 3.1 Debian GNU/Linux

`Jitas` is not only an application. `Jitas` needs a highly customized
environment. `Debian 10 Buster` is the officially supported distro and support
will continue in future Debian releases (_I hope_)

##### 3.2 MATE Desktop Environment

`MATE` is selected as the first supported desktop environment. It's lightweight,
easy to use for many users and works well in a VNC session.

##### 3.3 x11vnc

`x11vnc` is the VNC server used to access to the `Jitas` desktop remotely.

##### 3.4 noVNC and websockify

`noVNC` is both an HTML VNC client JavaScript library and an application built
on top of that library.

`Websockify` is a part of `noVNC` project. It`s a websocket to TCP proxy/bridge.

`noVNC` and `websockify` allow users to connect to the `x11vnc` session using
web browsers. In this way, users can connect to `Jitas` desktop without the need
for a special client application.

#### References

- [Debian](https://www.debian.org/)
- [MATE Desktop Environment](https://mate-desktop.org/)
- [x11vnc](https://github.com/LibVNC/x11vnc)
- [noVNC](https://github.com/novnc/noVNC)
- [websockify](https://github.com/novnc/websockify)
- [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/)
- [ALSA](https://www.alsa-project.org/wiki/Main_Page)
- [YAD](https://github.com/v1cont/yad)
- [Chromium flags](https://peter.sh/experiments/chromium-command-line-switches/)
