### StorageClass
- `kubectl get sc`
- `kubectl describe sc standard`
- AllowVolumeExpansion: `kubectl patch sc standard -p '{"metadata":{"AllowVolumeExpansion":true}}'`

### Delete PVC & PV

First find the pvs: kubectl get pv -n {namespace}
Then delete the pv in order set status to Terminating
kubectl delete pv {PV_NAME}
Then patch it to set the status of pvc to Lost: kubectl patch pv {PV_NAME} -p '{"metadata":{"finalizers":null}}'
Then get pvc volumes: kubectl get pvc -n storage
Then you can delete the pvc: kubectl delete pvc {PVC_NAME} -n {namespace}

