FROM marketplace.gcr.io/google/bazel:1.0.0 AS build-env

# ZetaSQL requires c++17
# see https://github.com/google/zetasql/blob/2020.04.1/.bazelrc#L17-L22
RUN add-apt-repository ppa:ubuntu-toolchain-r/test \
  && apt update \
  && apt-get install --no-install-recommends --yes build-essential \
  && apt install --no-install-recommends --yes g++-9 \
  && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 10 \
  && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 10 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
ENV CC gcc-9
ENV CXX g++-9
WORKDIR /work

COPY CROSSTOOL WORKSPACE BUILD formatsql.cc formatsql.h main.go /work/

RUN bazel build \
  --incompatible_disable_deprecated_attr_params=false \
  --incompatible_string_join_requires_strings=false \
  --incompatible_new_actions_api=false \
  --incompatible_require_ctx_in_configure_features=false \
  --incompatible_depset_is_not_iterable=false \
  --incompatible_no_support_tools_in_action_inputs=false \
  --host_force_python=PY2 \
  ...

FROM gcr.io/distroless/cc
COPY --from=build-env /work/bazel-bin/linux_amd64_stripped/zetasql-server ./
ENTRYPOINT ["./zetasql-server"]
