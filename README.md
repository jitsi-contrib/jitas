# jitas - Jitsi Assistant

### Table of contents

- [1. About](#1-about)
- [2. Prerequisites](#2-prerequisites)
  - [2.1 Machine Features](#21-machine-features)
  - [2.2 Distribution](#22-distribution)
  - [2.3 Standard Linux Kernel](#23-standard-linux-kernel)
  - [2.4 Public Ports](#24-public-ports)
- [3. Installation](#3-installation)
- [4. Let's Encrypt support](#4-lets-encrypt-support)
- [5. Usage](#5-usage)
  - [5.1 Connect to the meeting room](#51-connect-to-the-meeting-room)
  - [5.2 Connect to Jitas server](#52-connect-to-jitas-server)
  - [5.3 Connect Jitas to the meeting](#53-connect-jitas-to-the-meeting)
  - [5.4 Play any media](#54-play-any-media)
  - [5.5 Watch from the meeting](#55-watch-from-the-meeting)
- [6. Use cases](#6-use-cases)
  - [6.1 Private courses](#61-private-courses)
  - [6.2 Watching movies together](#62-watching-movies-together)
  - [6.3 Team work](#63-team-work)
  - [6.4 Lecturing to a large number of remote
    students](#64-lecturing-to-a-large-number-of-remote-students)
  - [6.5 Two teachers and one shared desktop](#65-two-teachers-and-one-shared-desktop)
  - [6.6 No need to stay connected](#66-no-need-to-stay-connected)

#### 1. About

`Jitas` is a cloud-based virtual desktop environment that assists the presenter
to share high quality materials in the Jitsi session.

Technically it's very similar to `Jibri` (_Jitsi Broadcasting Infrastructure_).

- `Jitas` has a virtual desktop environment like `Jibri`
- `Jitas` has virtual audio devices like `Jibri`
- `Jitas` has virtual video devices like `Jibri`
- `Jitas` connects to the meeting room using a customized `Chrome` instance like
  `Jibri`
- But `Jitas` does completely the opposite task.
  - `Jibri` pulls audio and video from the `Jitsi` meeting room.
  - `Jitas` pushes audio and video to the `Jitsi` meeting room.

[This project](https://platform-euhack21.bemyapp.com/#/projects/607dea7c972ccc0019009868)
started developing on April 26th at
[Winning over the classroom with Jitsi](https://euhack21.bemyapp.com/)
Hackathon.

#### 2. Prerequisites

Check the following steps before starting installation.

##### 2.1 Machine Features

At least 4 cores and 8 GB RAM are recommended.

##### 2.2 Distribution

`Jitas` currently supports only `Debian 10 Buster`. Please create or install a
`Debian 10 Buster` server and don't install a desktop environment, only the
standard packages...

##### 2.3 Standard Linux Kernel

Some cloud computers use a customized kernel which has no support for some
kernel modules. If this is the case then install the standart Linux kernel and
reboot with it.

Run the following command to check the module support

```bash
modprobe v4l2loopback
```

If there is a warning then you need to install the standard kernel. Probably the
following commands will work but be carefull!

```bash
apt-get update
apt-get install linux-image-amd64
apt-get purge "linux-image*cloud*"
# say 'no' to abort request
reboot
```

##### 2.4 Public Ports

If the server is behind a firewall, open the following ports:

- `TCP/80`
- `TCP/443`
- `TCP/6080`
- `TCP/6090`

#### 3. Installation

Run the following commands as `root`

```bash
wget -O debian-buster-mate https://raw.githubusercontent.com/jitsi-contrib/jitas/main/installer/debian-buster-mate
bash debian-buster-mate
```

#### 4. Let's Encrypt Support

To set the Let's Encrypt certificate, run the following commands as `root`:

```bash
set-letsencrypt-cert "your-host-fqdn"
```

#### 5. Usage

##### 5.1 Connect to the meeting room

Connect to a meeting room as usual. For example click this:
[https://meet.jit.si/jitas](https://meet.jit.si/jitas)

##### 5.2 Connect to Jitas server

Open a second tab in your browser and connect to `Jitas` server. Each server has
its own password created during the installation. Check the `README-JITAS.txt`
file in your `/root` folder to learn the `Jitas` URL.

The format of `URL`:

`https://HOST-ADDRESS/novnc/?host=HOST-ADDRESS&port=6090&encrypt=1&resize=scale&password=VNC-PASSWD`

![Jitas noVNC connect](images/jitas-novnc-connect.png)

##### 5.3 Connect Jitas to the meeting

Click `Connect Meeting`, write the meeting URL or select one from the
pre-configured list and click `connect`.

![Jitas meeting connect](images/jitas-connect-meeting.png)

##### 5.4 Play any media

Play any media using any player:

- local audio file (mp3, wav etc)
- local video file (mp4, avi etc)
- livestream
- media from any site (Youtube. Peertube, Vimeo, Netflix etc)
- media using any player (VLC, smplayer, mpv etc)

![Jitas play](images/jitas-play.png)

##### 5.5 Watch from the meeting

Watch it while talking with friends.

![Jitas watch](images/jitas-watch.png)

#### 6. Use cases

Possible use cases

##### 6.1 Private courses

Let's say you have a yoga or dance class and want to share high quality music
during the lesson.

[![Video](images/icon-video.png)](https://youtu.be/lM-f2mdBvj0)]

##### 6.2 Watching movies together

When you want to watch movies with your distant friends while talking.

##### 6.3 Team work

When you want to work in a remote team while using the same desktop at the same
time. `Jitas` desktop is shareable and it can be used by many users at the same
time.

##### 6.4 Lecturing to a large number of remote students

Let's say you have hundreds of students and you want to teach all of them at the
same time. Then connect `Jitas` to many meeting rooms and start sharing the same
lesson with all classes at the same time.

##### 6.5 Two teachers and one shared desktop

Let's say a lesson is taught by two teachers at the same time, alternately. Then
the teachers can connect to the same `Jitas` server and can use the desktop
alternately.

##### 6.6 No need to stay connected

Let's say there is a long movie you want to stream. You don't need to stay
connected. Connect `Jitas`, start to play the movie and disconnect.
