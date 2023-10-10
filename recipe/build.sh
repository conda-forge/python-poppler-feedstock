meson setup _build ${MESON_ARGS} -Dpython_version=$PYTHON
meson compile -C _build
meson install -C _build --no-rebuild
