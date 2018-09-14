#!/usr/bin/env bash

set -e

function usage() {
    echo "Usage:"
    echo "        ./terraform.sh -p <profile> -d <working directory> -c <command>"
    echo ""
    echo "    -p, --profile        profile"
    echo "    -d, --directory      Relative path to the working directory"
    echo "    -c, --command        Command to be executed <plan|apply|destroy>"
    echo "    -o, --options        (Optional) Options for Terraform command"
    echo "    -h, --help           Help list"
    echo ""
}

function validate_variable() {
    if [ -z "${profile}" ]; then
        echo "Profile is missing"
        exit 1
    fi

    if [ -z "${directory}" ]; then
        echo "Working directory is missing"
        exit 1
    fi

    if [ -z "${command}" ]; then
        echo "command is missing"
        exit 1
    fi
}

function init() {
    echo "Running terraform init."
    terraform init
}

function exec_terraform() {
    case ${command} in
        plan )
            cd "${directory}"
            init
            terraform plan ${options}
            ;;
        apply )
            cd "${directory}"
            init
            terraform apply ${options}
            ;;
        destroy )
            cd "${directory}"
            init
            terraform destroy ${options}
            ;;
    esac
}

function main() {
    validate_variable
    exec_terraform
}

while [ "$1" != "" ]; do
    case $1 in
        -p | --profile )
            shift
            profile=$1
            ;;
        -d | --directory )
            shift
            directory=$1
            ;;
        -c | --command )
            shift
            command=$1
            ;;
        -o | --options )
            shift
            options=$1
            ;;
        -h | --help )
            usage
            exit 1
            ;;
    esac
    shift
done

main
