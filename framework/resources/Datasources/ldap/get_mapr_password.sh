set -x

kubectl get secret system-user-secrets -n hpe-secure -o yaml | grep MAPR_PASSWORD | head -1 | awk '{print $2}' | base64 --decode
