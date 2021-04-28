# jitas - Jitsi Assistant

`Jitas` is a cloud-based virtual desktop environment that assists the presenter
to share high quality materials in the Jitsi session.

[This project](https://platform-euhack21.bemyapp.com/#/projects/607dea7c972ccc0019009868)
started developing on April 26th at
[Winning over the classroom with Jitsi](https://euhack21.bemyapp.com/)
Hackathon.

#### Prerequisites

Check the following steps before starting installation.

##### Machine features

At least 4 cores and 8 GB RAM are recommended.

##### Distribution

`Jitas` currently supports only `Debian 10 Buster`. Please create or install a
`Debian 10 Buster` server and don't install a desktop environment, only the
standard packages...

##### Public ports

If the server is behind a firewall, open the following ports:

- `TCP/80`
- `TCP/443`
- `TCP/6080`
- `TCP/6090`

#### Installation

Run the following commands as `root`

```bash
wget -O debian-buster-mate https://raw.githubusercontent.com/jitsi-contrib/jitas/main/installer/debian-buster-mate
bash debian-buster-mate
```

#### Let's Encrypt support

To set the Let's Encrypt certificate, run the following commands as `root`:

```bash
set-letsencrypt-cert "your-host-fqdn"
```
