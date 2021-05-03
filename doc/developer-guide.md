# Developer Guide

This document is to help developers to understand the `Jitas` infrastructure and
to participate to the development process easily.

- [1. About](#1-about)
- [2. Similarities with Jibri](#2-similarities-with-jibri)
- [3. Main components](#3-main-components)
  - [3.1 Debian GNU/Linux](#31-debian-gnulinux)
  - [3.2 MATE Desktop Environment](#32-mate-desktop-environment)
  - [3.3-x11vnc](#33-x11vnc)
  - [3.4 noVNC and websockify](#34-novnc-and-websockify)
  - [3.5 v4l2loopback](#35-v4l2loopback)
  - [3.6 PulseAudio](#36-pulseaudio)
  - [3.7 FFmpeg](#37-ffmpeg)
  - [3.8 dconf](#38-dconf)
  - [3.9 YAD](#39-yad)
  - [3.10 wmctrl](#310-wmctrl)
  - [3.11 Chromium](#311-chromium)
  - [3.12 systemd](#312-systemd)
  - [3.13 nginx](#313-nginx)
- [4. Processes and methods](#4-processes-and-methods)
  - [4.1 Deployment](#41-deployment)
  - [4.2 Auto login](#42-auto-login)
  - [4.3 Autostarted user services](#43-autostarted-user-services)
  - [4.4 User scripts](#44-user-scripts)
  - [4.5 Virtual webcam](#45-virtual-webcam)
  - [4.6 Virtual microphone](#46-virtual-microphone)
  - [4.7 Desktop capturing](#47-desktop-capturing)
  - [4.8 Private Chromium instance](#48-private-chromium-instance)
  - [4.9 Customized connection to the Jitsi meeting
    room](#49-customized-connection-to-the-jitsi-meeting-room)
  - [4.10 Pre-configured meetings](#410-pre-configured-meetings)
  - [4.11 Public and private files folder](#411-public-and-private-files-folder)
- [References](#references)

---

#### 1. About

`Jitas` is a cloud-based virtual desktop environment that assists the presenter
to share high quality materials in the `Jitsi` session. `Jitas` is not only an
application. It is an environment which contains system services, virtual
devices, customized desktop environment, free and open source softwares,
developed tools/scripts/applications and highly customized configurations.

All components of `Jitas` are free and open source.

---

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

---

#### 3. Main components

`Jitas` includes many free and open source software components to create its own
environment.

##### 3.1 Debian GNU/Linux

`Jitas` is not only an application. `Jitas` needs a highly customized
environment. `Debian 10 Buster` is the officially supported distro and support
will continue in future Debian releases (_I hope_)

##### 3.2 MATE desktop environment

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

##### 3.5 v4l2loopback

This is a kernel module. It allows us to create "_virtual video devices_".

##### 3.6 PulseAudio

`PulseAudio` is a sound system for POSIX OSes. It's used in this project to
create virtual audio devices and to manage them.

##### 3.7 FFmpeg

`FFmpeg` is the leading multimedia framework, able to decode, encode, transcode,
mux, demux, stream, filter and play pretty much anything. It's used in this
project to capture the screen as a stream and to bind it to the virtual webcam.

##### 3.8 dconf

`dconf` is a low-level configuration system for GNOME and GNOME-based desktop
environment. It's used to customize the desktop environment.

##### 3.9 YAD

`YAD` allows us to display GTK+ dialog boxes from command line or shell scripts.
It's used to create the GUI of the developed tools.

##### 3.10 wmctrl

`wmctrl` is a tool that can be used to interact with X Window manager. It's used
to customize the window behaviours of some applications.

##### 3.11 Chromium

A customized instance of `Chromium` is used when connecting to the `Jitsi`
meeting room.

##### 3.12 systemd

`systemd` is used to convert the developed scripts to system services.

##### 3.13 nginx

`nginx` is the web server used in this project.

---

#### 4. Processes and methods

This part describes processes and methods used in `Jitas`

##### 4.1 Deployment

`Jitas` environment is created using a
[deployment script](../installer/debian-buster-mate). It installs all needed
packages and tools, configures the environment and starts the system.

All developed scripts, customized configuration and used files are found in the
[templates](../templates/debian-buster-mate) folder according to their
destination locations.

`Debian 10 Buster` is officially supported. Don't install any desktop
environment to this server, only the standard packages...

##### 4.2 Auto login

`Jitas` starts the desktop using a customized `systemd` config.

See
[getty override](../templates/debian-buster-mate/etc/systemd/system/getty@tty1.service.d/override.conf)

##### 4.3 Autostarted user services

All user services are started when the desktop is started and stopped when the
desktop is closed.

See
[user systemd](../templates/debian-buster-mate/etc/skel/.config/systemd/user)
for more details.

##### 4.4 User scripts

All user scripts are in
[/usr/local/bin](../templates/debian-buster-mate/usr/local/bin) folder.

##### 4.5 Virtual webcam

The virtual webcam device is created using `v4l2loopback` module.

See
[jitas-camera](../templates/debian-buster-mate/etc/modprobe.d/jitas-camera.conf)

##### 4.6 Virtual microphone

The virtual microphone and playback devices are created using `PulseAudio`. All
real sound cards are disabled if any...

See [audio-start](../templates/debian-buster-mate/usr/local/bin/audio-start)

##### 4.7 Desktop capturing

[video-start](../templates/debian-buster-mate/usr/local/bin/video-start)
captures the desktop screen. It only run when connecting to a meeting and stops
when all meeting are finished. The desktop capturing is a very CPU intensive
process and therefore it's not a good idea to run it all the time.

##### 4.8 Private Chromium instance

A private Chromium instance is used when connecting to the meetings. This
instance uses a seperate config folder to avoid user errors.

See
[chromium-app-start](../templates/debian-buster-mate/usr/local/bin/chromium-app-start)
and
[chromium-app-instance](../templates/debian-buster-mate/usr/local/bin/chromium-app-instance)

##### 4.9 Customized connection to the Jitsi meeting room

[connect-meeting](../templates/debian-buster-mate/usr/local/bin/connect-meeting)
is used when connecting to a `Jitsi` meeting room.
[connect-meeting](../templates/debian-buster-mate/usr/local/bin/connect-meeting)
customizes heavily the connection URL.

##### 4.10 Pre-configured meetings

[.config/jitas/pre-configured-meetings](../templates/debian-buster-mate/etc/skel/.config/jitas/pre-configured-meetings)
contains the list of pre-configured meetings. The user can connect to these
meeting room without typing the full address.

##### 4.11 Public and private files folder

Users can share files publicly or privately by putting them in the related
folders.

See
[Public README](../templates/debian-buster-mate/home/jitas-shares/public/README.txt)
and
[Private README](../templates/debian-buster-mate/home/jitas-shares/private/README.txt)

---

#### References

- [Debian](https://www.debian.org/)
- [MATE Desktop Environment](https://mate-desktop.org/)
- [x11vnc](https://github.com/LibVNC/x11vnc)
- [noVNC](https://github.com/novnc/noVNC)
- [websockify](https://github.com/novnc/websockify)
- [v4l2loopback](https://github.com/umlaeute/v4l2loopback)
- [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/)
- [FFmpeg](https://ffmpeg.org/)
- [dconf](https://wiki.gnome.org/Projects/dconf)
- [YAD](https://github.com/v1cont/yad)
- [wmctrl](http://tripie.sweb.cz/utils/wmctrl/)
- [Chromium](http://www.chromium.org/)
- [systemd](https://systemd.io/)
- [nginx](https://nginx.org/en/)
