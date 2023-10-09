set +e
set -x
meson setup _build ${MESON_ARGS}
meson compile -C _build
meson install -C _build --no-rebuild


cat _build/meson-logs/meson-log.txt
