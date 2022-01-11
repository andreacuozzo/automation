# automation

**Don't use it, seriously, it's just my garbage repository**

Infrastructure
- Netbox:   source of truth
- Syspass:  password manager
- Gitea:    version control
- Jenkins:  orchestrator
- Grafana:  presentation

Ready made powershell modules I use and I can't thank enough for
- powerbox:              https://github.com/BatmanAMA/powerbox
- gitea:                 https://github.com/Callidus2000/PSGitea
- PS.CredentialManager:  https://github.com/graememeyer/PS.CredentialManager

Functions
- functions\functions_sqlserver.ps1
- functions\functions_syspass.ps1

Flow
- use Jenkins as powershell scripts gui
- load functions directly from gitea
- get implementation data from Netbox
- get credentials from Syspass
- do wathca wanna do on targets (vpshere, veeam, anything manageable)
- update db backend of grafana dashboard

In the next life
 - ready made ovas/scripts to build the whole infrastructure (Netbox, Syspass, etc.)







