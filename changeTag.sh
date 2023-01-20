#!/bin/bash
sed "s/tagVersion/$1/g" node-deployment.yml > node-deployment.yml
