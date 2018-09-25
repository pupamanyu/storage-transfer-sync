# storage-transfer-sync

Important IAM config for successful execution of the Job:

To get the service account name used by Storage Transfer Service, please refer:

https://cloud.google.com/storage-transfer/docs/reference/rest/v1/googleServiceAccounts/get#try-it

The Service account will be in the format as shown below: 

```
{
  "accountEmail": "project-<project number>@storage-transfer-service.iam.gserviceaccount.com"
}
```
  
To obtain the list of IAM permissions needed by this account for Storage Transfer Service, please refer :

https://cloud.google.com/storage-transfer/docs/iam-transfer
