# CICD
Continuoud Integration & Delivery - GoCD

-----------------------------------------------------------------------------------------------------------------------------------------
| Server Names                 | Zone/ Capacity         | IP v4          |                | Comments                                    |
|------------------------------|------------------------|----------------|----------------|---------------------------------------------|
| Server Names                 | Region Hosted          | Public IP      | Private IP     |                                             |
| gocdagent-01                 | BLR1 / 1GB / 25GB Disk | xx.xx.xx.252   | 10.139.56.65   | ssh allowd from with in goserver            |
| gocdagent-02                 | BLR1 / 1GB / 25GB Disk | xx.xx.xx.13    | 10.139.184.134 | ssh allowd from with in goserver            |
| gocdserver                   | BLR1 / 2GB / 60GB Disk | xx.xx.xx.31    | 10.139.40.18   | Open anywhere; with ssh keys                |
| http://gateway.inthub.dev/go | UI with reverse proxy  | 68.183.244.209 | NA             | ONLY http/https (http auto routed to https) |
-----------------------------------------------------------------------------------------------------------------------------------------


<img src="images/GoCD-Architecture.png">
<hr>
<img src="images/GoCD-Terminology.png">
<hr>
<img src="images/CICD-Workflow.png" width="1200" height="1000">
