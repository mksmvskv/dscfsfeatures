configuration FILESERVER {
    
    Import-DSCResource -ModuleName PSDesiredStateConfiguration
    
    node "123" {
        
        WindowsFeature FSFileServer {
            Name = "FS-FileServer"
            Ensure = "Present"
        }
        WindowsFeature DFSNamespace {
            Name = "FS-DFS-Namespace"
            Ensure = "Present"
        }
        WindowsFeature Replication {
            Name = "FS-DFS-Replication"
            Ensure = "Present"
        }
        WindowsFeature ResourceManager {
            Name = "FS-Resource-Manager"
            Ensure = "Present"
        }
         WindowsFeature SNMPService {
            Name = "SNMP-Service"
            Ensure = "Present"
        }
        WindowsFeature RSATSNMP {
            Name = "RSAT-SNMP"
            Ensure = "Present"
        }
        WindowsFeature RSATFSRMMgmt {
            Name = "RSAT-FSRM-Mgmt"
            Ensure = "Present"
        }
        WindowsFeature RSATDFSMgmtCon  {
            Name = "RSAT-DFS-Mgmt-Con"
            Ensure = "Present"
            DependsOn = "[WindowsFeature]RSATFSRMMgmt"
        }
        WindowsFeature ServerGuiMgmtInfra  {
            Name = "Server-Gui-Mgmt-Infra"
            Ensure = "Present"
        }
        WindowsFeature ServerGuiShell  {
            Name = "Server-Gui-Shell"
            Ensure = "Present"
        }
    }
}

































































































