#!/usr/bin/env bash

bazel build \
  --incompatible_disable_deprecated_attr_params=false \
  --incompatible_string_join_requires_strings=false \
  --incompatible_new_actions_api=false \
  --incompatible_require_ctx_in_configure_features=false \
  --incompatible_depset_is_not_iterable=false \
  --incompatible_no_support_tools_in_action_inputs=false \
  --host_force_python=PY2 \
  ...
