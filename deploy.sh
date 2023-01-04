#!/usr/bin/env bash

# Login to Kubernetes Cluster.
UPDATE_KUBECONFIG_COMMAND="aws eks --region ${AWS_REGION} update-kubeconfig --name ${CLUSTER_NAME}"

if [ -n "$CLUSTER_ROLE_ARN" ]; then
    UPDATE_KUBECONFIG_COMMAND="${UPDATE_KUBECONFIG_COMMAND} --role-arn=${CLUSTER_ROLE_ARN}"
fi
${UPDATE_KUBECONFIG_COMMAND}

# Helm Deployment
UNINSTALL_COMMAND="helm uninstall --wait --timeout ${TIMEOUT}"
if [ -n "$DEPLOY_NAMESPACE" ]; then
    UNINSTALL_COMMAND="${UNINSTALL_COMMAND} -n ${DEPLOY_NAMESPACE}"
fi
if [ "$DEBUG" = true ]; then
    UNINSTALL_COMMAND="${UNINSTALL_COMMAND} --debug"
fi
if [ "$DRY_RUN" = true ]; then
    UNINSTALL_COMMAND="${UNINSTALL_COMMAND} --dry-run"
fi
UNINSTALL_COMMAND="${UNINSTALL_COMMAND} ${DEPLOY_NAME}"
echo "Executing: ${UNINSTALL_COMMAND}"
${UNINSTALL_COMMAND}
