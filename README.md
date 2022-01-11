# automation

# don't use it, seriously, I'm as sloppy as it gets programming the simplest script

Infrastructure
- Netbox:   source of truth
- Syspass:  password manager
- Gitea:    version control
- Jenkins:  orchestrator
- Grafana:  presentation

Ready made powershell modules I use and I can't thank enough for
- powerbox: https://github.com/BatmanAMA/powerbox
- gitea:    https://github.com/Callidus2000/PSGitea

Flow
- use Jenkins as powershell scripts gui
- load powershell functions directly from gitea
- get implementation data from Netbox
- get credentials from Syspass
- do wathca wanna do on targets (vpshere, veeam, anything manageable)
- update db backend of grafana dashboard







