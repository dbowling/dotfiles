

rancher-enable-traefik-dashboard(){
    kubectl port-forward -n kube-system $(kubectl -n kube-system get pods --selector "app.kubernetes.io/name=traefik" --output=name) 9000:9000

    echo "Visit http://127.0.0.1:9000/dashboard/ to view the dashboard"
}
