set -x

# kubectl get secret system-user-secrets -n hpe-secure -o yaml | grep MAPR_PASSWORD | head -1 | awk '{print $2}' | base64 --decode
kubectl get secret system -n dataplatform -o yaml | grep MAPR_PASSWORD | head -1 | awk '{print $2}' | base64 --decode
