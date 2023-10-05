#!/bin/sh

# get podname AND update html file to display it
INDEX="/usr/share/nginx/html/index.html"
PODNAME=$(hostname)
sed -i "s/pod_ph/${PODNAME}/" "${INDEX}"

# get the unique portion of the pod name
DEP_NAME="podname-deploy"
POD_PART="$(grep ${DEP_NAME} ${INDEX} | tail -1 | awk -F "$DEP_NAME-|</p>" '{print $2}')"

# format deployment name
DEP_CLR="SlateBlue"
sSPAN="\<span style\=\"color\:${DEP_CLR}\;font-weight\:bold\"\>"
eSPAN="\<\/span\>"
sed -i "s/$DEP_NAME/${sSPAN}${DEP_NAME}${eSPAN}/" "${INDEX}"

# format pod name
POD_CLR="DodgerBlue"
sSPAN="\<span style\=\"color\:${POD_CLR}\;font-weight\:bold\"\>"
eSPAN="\<\/span\>"
sed -i "s/${POD_PART}/${sSPAN}${POD_PART}${eSPAN}/" "${INDEX}"